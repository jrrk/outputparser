using System;
using System.IO;
using System.Diagnostics;
using System.Runtime.InteropServices;
using KiwiSystem;
using uint64_t = System.UInt64;
using uint32_t = System.UInt32;
using posreal = System.Single;
using __off64_t = System.Int64;
using __mode_t = System.UInt32;
using float64 = System.UInt64;

public class w128_t {
  public ulong[] pair;
	public w128_t()
	{
		pair = new ulong[2];
	}
}

public class dsfmt_t
     {
     public w128_t[] status;
     public int idx;
	 public dsfmt_t()
		{
		status = new w128_t[192];
		for (int i = 0; i < status.Length; i++)
			{
			status[i] = new w128_t();
			}
		}
     }

class main
    {
  static bool verbose = true; // djg
static dsfmt_t dsfmt;

/* From test56  - Adding the FastBitConvert attribute make Kiwi
ignore the bodies of functions such as these and replaces the body
with its own fast-path identity code based only on the signatures of
the functions. */

[Kiwi.FastBitConvert()]
static double to_double(float64 farg)
  {
    byte [] asbytes = BitConverter.GetBytes(farg);
    double rr = BitConverter.ToDouble(asbytes, 0);
    return rr;
  }

[Kiwi.FastBitConvert()]
static float64 from_double(double darg)
  {
    byte [] asbytes = BitConverter.GetBytes(darg);
    return BitConverter.ToUInt64(asbytes, 0);
  }

static void copy(byte[] src, byte[] dest, int idx)
{
for (int i = 0; i < src.Length; i++)
    {
    dest[idx+i] = src[i];
    }
// Array.Copy(src, 0, dest, idx, src.Length);
}

static double get_double(w128_t[] w, int idx)
{
ulong tmp2 = w[idx / 2].pair[idx % 2];
double tmp = to_double(tmp2);
if (verbose) Console.WriteLine("get_double {0:X16}", tmp2);
return tmp;
}

static void put_double(w128_t[] w, int idx, double arg)
{
ulong tmp = from_double (arg);
if (verbose) Console.WriteLine ("put_double {0:X16}", tmp);
w[idx/2].pair[idx%2] = tmp;
}

static ulong get_ulong(w128_t[] w, int idx)
{
ulong tmp = w[idx/2].pair[idx%2];
if (verbose) Console.WriteLine ("get_ulong {0:X16}", tmp);
return tmp;
}

static void put_ulong(w128_t[] w, int idx, ulong arg)
{
if (verbose) Console.WriteLine ("put_ulong {0:X16}", arg);
w[idx/2].pair[idx%2] = arg;
}

  static uint getpsfmt32(ref dsfmt_t dsfmt, int idx)
{
ulong tmp2 = dsfmt.status[idx/4].pair[(idx/2)%2];
uint tmp = ((idx & 1) == 1) ? (uint)(tmp2 >> 32) : (uint)(tmp2 & 0xFFFFFFFF);
if (verbose) Console.WriteLine ("getpsfmt32 {0} {1:X8}", idx, tmp);
return tmp;
}

  static void putpsfmt32(ref dsfmt_t dsfmt, int idx, uint arg)
{    
if (verbose) Console.WriteLine ("putpsfmt32 {0} {1:X8}", idx, arg);
if ((idx & 1) == 1)
    dsfmt.status[idx/4].pair[(idx/2)%2] = (dsfmt.status[idx/4].pair[(idx/2)%2]&0xFFFFFFFFUL)|(((ulong)arg)<<32);
else
    dsfmt.status[idx/4].pair[(idx/2)%2] = (dsfmt.status[idx/4].pair[(idx/2)%2]&0xFFFFFFFF00000000UL)|arg;
}

  static void do_recursion(ref w128_t[] r, int roff, ref w128_t[] a, int aoff, ref w128_t[] b, int boff, ref w128_t[] lung)
{
	uint64_t  t0;
	uint64_t  t1;
	uint64_t  L0;
	uint64_t  L1;
t0 = get_ulong(a,aoff*2); 
t1 = get_ulong(a,aoff*2+1); 
L0 = get_ulong(lung,0); 
L1 = get_ulong(lung,1); 
put_ulong(lung, 0, (t0 << 19) ^ (L1 >> 32) ^ (L1 << 32) ^ get_ulong(b,boff*2)); 
put_ulong(lung, 1, (t1 << 19) ^ (L0 >> 32) ^ (L0 << 32) ^ get_ulong(b,boff*2+1)); 
put_ulong(r, roff*2, (get_ulong(lung, 0) >> 12) ^ (get_ulong(lung, 0) & 0x000ffafffffffb3fUL) ^ t0); 
put_ulong(r, roff*2+1, (get_ulong(lung, 1) >> 12) ^ (get_ulong(lung, 1) & 0x000ffdfffc90fffdUL) ^ t1);
if (verbose) Console.WriteLine("r->u[0], r->u[1] = {0},{1}", get_ulong(r,roff*2), get_ulong(r,roff*2+1));
}

  static void convert_o0o1(ref w128_t[] w, int woff)
{
if (verbose) Console.WriteLine("w->u[0], w->u[1] = {0:X16},{1:X16}", get_ulong(w,woff*2), get_ulong(w,woff*2+1));
put_ulong(w, woff*2, get_ulong(w, woff*2) | 1); 
put_ulong(w, woff*2+1, get_ulong(w, woff*2+1) | 1); 
put_double(w, woff*2, get_double(w, woff*2) - 1.0);
put_double(w, woff*2+1, get_double(w, woff*2+1) - 1.0);
ulong tmp0 = get_ulong (w, woff*2);
ulong tmp1 = get_ulong (w, woff*2+1);
if (verbose) Console.WriteLine("w'->u[0], w'->u[1] = {0:X16},{1:X16}", tmp0, tmp1);
}

public enum rsize { rsize = ((19937-128)/104+1)*2 };

  static double[] rarray = new double[(int)rsize.rsize];
  
  static void gen_rand_array_o0o1(ref dsfmt_t dsfmt, ref w128_t[] array, int size)
{
int i;
int j;
    w128_t[] lung = new w128_t[1];
    lung [0] = new w128_t ();
if (verbose) Console.WriteLine("gen_rand_array_o0o1");
put_ulong(lung, 0, get_ulong(dsfmt.status,((19937-128)/104+1)*2)); 
put_ulong(lung, 1, get_ulong(dsfmt.status,((19937-128)/104+1)*2+1)); 
    do_recursion(ref array, 0, ref dsfmt.status, 0, ref dsfmt.status, 117, ref lung); 
for ( i = 1; i < ((19937-128)/104+1)-117; i++)
	{
        do_recursion(ref array, i, ref dsfmt.status, i, ref dsfmt.status, i+117, ref lung); 
	}

for ( ; i < ((19937-128)/104+1); i++)
	{
        do_recursion(ref array, i, ref dsfmt.status, i, ref array, i+117-((19937-128)/104+1), ref lung);
	}

for ( ; i < size-((19937-128)/104+1); i++)
	{
        do_recursion(ref array, i, ref array, i-((19937-128)/104+1), ref array, i+117-((19937-128)/104+1), ref lung);
        convert_o0o1(ref array, (i-((19937-128)/104+1)));
	}

for ( j = 0; j < 2*((19937-128)/104+1)-size; j++)
	{
	put_ulong(dsfmt.status, j*2, get_ulong(array,(j+size-((19937-128)/104+1))*2)); 
	put_ulong(dsfmt.status, j*2+1, get_ulong(array,(j+size-((19937-128)/104+1))*2+1)); 
	}

for ( ; i < size; i++, j++)
	{
        do_recursion(ref array, i, ref array, i-((19937-128)/104+1), ref array, i+117-((19937-128)/104+1), ref lung);
	put_ulong(dsfmt.status, j*2, get_ulong(array,i*2));
	put_ulong(dsfmt.status, j*2+1, get_ulong(array,i*2+1));
        convert_o0o1(ref array, (i-((19937-128)/104+1)));
	}

for ( i = size-((19937-128)/104+1); i < size; i++)
	{
        convert_o0o1(ref array, i); 
	}
put_ulong(dsfmt.status, ((19937-128)/104+1)*2, get_ulong(lung,0)); 
put_ulong(dsfmt.status, ((19937-128)/104+1)*2+1, get_ulong(lung,1)); 
}

static int dsfmt_mexp=19937;
  static int rptr=0;

  static void initial_mask(ref dsfmt_t dsfmt)
{
int i;
for ( i = 0; i < ((19937-128)/104+1)*2; i++)
	{
	put_ulong(dsfmt.status, i, (get_ulong(dsfmt.status, i) & 0x000FFFFFFFFFFFFFUL) | 0x3FF0000000000000UL); 
	}
}

  static void period_certification(ref dsfmt_t dsfmt)
{
    uint64_t[] pcv = new uint64_t[] {0x3d84e1ac0dc82880UL, 0x0000000000000001UL};
    uint64_t[] tmp = new uint64_t[2];
uint64_t  inner;
int i;
tmp[0] = get_ulong(dsfmt.status, ((19937-128)/104+1)*2) ^ 0x90014964b32f4329UL; 
tmp[1] = get_ulong(dsfmt.status, ((19937-128)/104+1)*2+1) ^ 0x3b8d12ac548a7c7aUL; 
inner = tmp[0] & pcv[0]; 
inner ^= tmp[1] & pcv[1]; 
for ( i = 32; i>0; i >>= 1)
	{ 
	{
	inner ^= inner >> i; 
	if (verbose) Console.WriteLine ("inner={0}", inner);
	}
 }

inner&=1; 
if (inner==1) 
	{
	return;
	}

put_ulong(dsfmt.status, ((19937-128)/104+1)*2+1, get_ulong(dsfmt.status, ((19937-128)/104+1)*2+1) ^ 1UL); 
return;
}

static void __assert_fail(string __assertion, string __file, uint __line, string __function)
{
if (verbose) Console.WriteLine(__assertion + __file + __line + __function);
Environment.Exit(1);
}

  static void dsfmt_fill_array_open_open(ref dsfmt_t dsfmt, double[] array, int size)
{
    w128_t [] warray = new w128_t [size/2];
    for (int i = 0; i < warray.Length; i++) warray[i] = new w128_t();
    gen_rand_array_o0o1(ref dsfmt, ref warray, size/2);
    for (int i = 0; i < size; i++)
      {
        array [i] = get_double(warray, i);
      }
}

static void exit(int __status)
{
Environment.Exit(__status);
}

static int idxof(int i)
{
return i;
}

static int [] T1 = new int []
    {
      0,        1024,   3062,   5746,   9193,   13348,  18162,  23592,
      29598,    36145,  43202,  50740,  58733,  67158,  75992,  85215,
      83599,    71378,  60428,  50647,  41945,  34246,  27478,  21581,
      16499,    12183,  8588,   5674,   3403,   1742,   661,    130
    };

public static double sqrt(double arg)
  {
    if (arg<=0.0) return 0.0;
    return TTsqrt.Sqrt(arg);
    byte[] b0 = BitConverter.GetBytes(arg);
    ulong u0 = BitConverter.ToUInt64(b0, 0);
    ulong k = (u0>>1) +(0x1ff8L << 48);
    ulong y0 = k - ((ulong)T1[31 & (k>>(15+32))] << 32);
    byte[] b1 = BitConverter.GetBytes(y0);
    double pp = BitConverter.ToDouble(b1, 0);

    for (int qit=0;qit<3; qit++) pp = (pp + arg/pp) * 0.5; // Need 3 iterations for DP
    return pp;
}

  static void dsfmt_chk_init_gen_rand(ref dsfmt_t dsfmt, uint32_t seed, int mexp)
{
int i;
    if (mexp!=dsfmt_mexp) 
            {
              Console.WriteLine("DSFMT_MEXP doesn't match with dSFMT.c\n"); 
              exit(1); 
            }
    
    putpsfmt32(ref dsfmt, idxof(0), seed); 
for (i = 1; i < (((19937-128)/104+1)+1)*4; i++)
	{ 
        uint prev = getpsfmt32 (ref dsfmt, idxof (i - 1));
	uint tmp = 1812433253U*(prev^ (prev >> 30))+(uint)i;
	if (verbose) Console.WriteLine ("prev = {0}, loop[{1}] = {2}", prev, i, tmp);
        putpsfmt32(ref dsfmt, idxof(i), tmp);
	}

    initial_mask(ref dsfmt); 
    period_certification(ref dsfmt); 
    dsfmt.idx = (((19937-128)/104+1)*2); }

static void nextUniformRandom()
{
    dsfmt_fill_array_open_open(ref dsfmt, rarray, (int)rsize.rsize); 
rptr = 0;
  }
  
  static void dsfmt_init_gen_rand(ref dsfmt_t dsfmt, uint32_t seed)
  {
    dsfmt_chk_init_gen_rand(ref dsfmt, seed, 19937); 
}

static double gaussianRand(double dSigma)
{double d = 0;
int nRands = 12;
if (rptr>((int)rsize.rsize-nRands)) 
	{
	nextUniformRandom(); 
	}

for (int i = 0; i < nRands; i++) 
	{
	double tmp = rarray [rptr];
	if (verbose) Console.WriteLine ("rarray[{0}] = {1}", rptr, tmp);
	d += tmp;
	rptr++; 
	}

d-=nRands/2.0; 
d*=dSigma/sqrt(nRands/12.0); 
return d; }

static double fmin(double __x, double __y)
{
if ( __x < __y) return __x; else return __y;
}

static double fmax(double __x, double __y)
{
if ( __x > __y) return __x; else return __y;
}

static int fchmod(int __fd, __mode_t __mode)
{
return 0;
}

static void testGaussian()
{
    double t = 5;
double dSq = 0;
double dAv = 0;
int N = 1000000;
int[] bin = new int[(int) (t*10+1)];
    dsfmt_init_gen_rand(ref dsfmt, 7); 
nextUniformRandom(); 
   
for (int ibin = 0; ibin<=t*10; ibin++) 
	{
	bin[ibin] = 0; 
	}

for (int i = 0; i < N; i++) 
	{
	double d = gaussianRand(t);
dSq+=d*d; 
dAv+=d; 
bin[(int) (fmax(fmin(d+5*t, 10*t), 0))]++; 
	}
Console.WriteLine("{0} {1}", dAv/N, sqrt(dSq/N-(dAv/N)*(dAv/N))); 
for (int i = 0; i<=t*10; i++) Console.WriteLine("{0}\t{1}", i-5*t, bin[i]); 
}
  
  
  [Kiwi.HardwareEntryPoint()]
        static void Main()
        {
    Console.WriteLine("Starting");
    dsfmt = new dsfmt_t ();
    Kiwi.Pause();
	    testGaussian();
    Console.WriteLine("Ending");
        }
    }

// eof
