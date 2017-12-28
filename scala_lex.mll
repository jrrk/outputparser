(**************************************************************************)
(*                                                                        *)
(* OCaml template Copyright (C) 2004-2010                                 *)
(*  Sylvain Conchon, Jean-Christophe Filliatre and Julien Signoles        *)
(* Adapted to boolean logic by Jonathan Kimmitt                           *)
(*  Copyright 2016 University of Cambridge                                *)
(*                                                                        *)
(*  This software is free software; you can redistribute it and/or        *)
(*  modify it under the terms of the GNU Library General Public           *)
(*  License version 2.1, with the special exception on linking            *)
(*  described in file LICENSE.                                            *)
(*                                                                        *)
(*  This software is distributed in the hope that it will be useful,      *)
(*  but WITHOUT ANY WARRANTY; without even the implied warranty of        *)
(*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.                  *)
(*                                                                        *)
(**************************************************************************)

{
  open Lexing
  open Lef_file_edited

  let verbose = ref false
  let lincnt = ref 0

  let keyword =
    let h = Hashtbl.create 17 in
    List.iter 
      (fun (k,s) -> Hashtbl.add h s k)
      [
    K_ABUT, "ABUT";
    K_ABUTMENT, "ABUTMENT";
    K_ACTIVE, "ACTIVE";
    K_ANALOG, "ANALOG";
    K_ARRAY, "ARRAY";
    K_AREA, "AREA";
    K_BLOCK, "BLOCK";
    K_BOTTOMLEFT, "BOTTOMLEFT";
    K_BOTTOMRIGHT, "BOTTOMRIGHT";
    K_BY, "BY";
    K_CAPACITANCE, "CAPACITANCE";
    K_CAPMULTIPLIER, "CAPMULTIPLIER";
    K_CLASS, "CLASS";
    K_CLOCK, "CLOCK";
    K_CLOCKTYPE, "CLOCKTYPE";
    K_COLUMNMAJOR, "COLUMNMAJOR";
    K_DESIGNRULEWIDTH, "DESIGNRULEWIDTH";
    K_INFLUENCE, "INFLUENCE";
    K_CORE, "CORE";
    K_CORNER, "CORNER";
    K_COVER, "COVER";
    K_CPERSQDIST, "CPERSQDIST";
    K_CURRENT, "CURRENT";
    K_CURRENTSOURCE, "CURRENTSOURCE";
    K_CUT, "CUT";
    K_DEFAULT, "DEFAULT";
    K_DATABASE, "DATABASE";
    K_DATA, "DATA";
    K_DIELECTRIC, "DIELECTRIC";
    K_DIRECTION, "DIRECTION";
    K_DO, "DO";
    K_EDGECAPACITANCE, "EDGECAPACITANCE";
    K_EEQ, "EEQ";
    K_END, "END";
    K_ENDCAP, "ENDCAP";
    K_FALL, "FALL";
    K_FALLCS, "FALLCS";
    K_FALLT0, "FALLT0";
    K_FALLSATT1, "FALLSATT1";
    K_FALLRS, "FALLRS";
    K_FALLSATCUR, "FALLSATCUR";
    K_FALLTHRESH, "FALLTHRESH";
    K_FEEDTHRU, "FEEDTHRU";
    K_FIXED, "FIXED";
    K_FOREIGN, "FOREIGN";
    K_FROMPIN, "FROMPIN";
    K_GENERATE, "GENERATE";
    K_GENERATOR, "GENERATOR";
    K_GROUND, "GROUND";
    K_HEIGHT, "HEIGHT";
    K_HORIZONTAL, "HORIZONTAL";
    K_INOUT, "INOUT";
    K_INPUT, "INPUT";
    K_INPUTNOISEMARGIN, "INPUTNOISEMARGIN";
    K_COMPONENTPIN, "COMPONENTPIN";
    K_INTRINSIC, "INTRINSIC";
    K_INVERT, "INVERT";
    K_IRDROP, "IRDROP";
    K_ITERATE, "ITERATE";
    K_IV_TABLES, "IV_TABLES";
    K_LAYER, "LAYER";
    K_LEAKAGE, "LEAKAGE";
    K_LEQ, "LEQ";
    K_LIBRARY, "LIBRARY";
    K_MACRO, "MACRO";
    K_MATCH, "MATCH";
    K_MAXDELAY, "MAXDELAY";
    K_MAXLOAD, "MAXLOAD";
    K_METALOVERHANG, "METALOVERHANG";
    K_MILLIAMPS, "MILLIAMPS";
    K_MILLIWATTS, "MILLIWATTS";
    K_MINFEATURE, "MINFEATURE";
    K_MUSTJOIN, "MUSTJOIN";
    K_NAMESCASESENSITIVE, "NAMESCASESENSITIVE";
    K_NANOSECONDS, "NANOSECONDS";
    K_NETS, "NETS";
    K_NEW, "NEW";
    K_NONDEFAULTRULE, "NONDEFAULTRULE";
    K_NONINVERT, "NONINVERT";
    K_NONUNATE, "NONUNATE";
    K_OBS, "OBS";
    K_OHMS, "OHMS";
    K_OFFSET, "OFFSET";
    K_ORIENTATION, "ORIENTATION";
    K_ORIGIN, "ORIGIN";
    K_OUTPUT, "OUTPUT";
    K_OUTPUTNOISEMARGIN, "OUTPUTNOISEMARGIN";
    K_OVERHANG, "OVERHANG";
    K_OVERLAP, "OVERLAP";
    K_OFF, "OFF";
    K_ON, "ON";
    K_OVERLAPS, "OVERLAPS";
    K_PAD, "PAD";
    K_PATH, "PATH";
    K_PATTERN, "PATTERN";
    K_PICOFARADS, "PICOFARADS";
    K_PIN, "PIN";
    K_PITCH, "PITCH";
    K_PLACED, "PLACED";
    K_POLYGON, "POLYGON";
    K_PORT, "PORT";
    K_POST, "POST";
    K_POWER, "POWER";
    K_PRE, "PRE";
    K_PULLDOWNRES, "PULLDOWNRES";
    K_RECT, "RECT";
    K_RESISTANCE, "RESISTANCE";
    K_RESISTIVE, "RESISTIVE";
    K_RING, "RING";
    K_RISE, "RISE";
    K_RISECS, "RISECS";
    K_RISERS, "RISERS";
    K_RISESATCUR, "RISESATCUR";
    K_RISETHRESH, "RISETHRESH";
    K_RISESATT1, "RISESATT1";
    K_RISET0, "RISET0";
    K_RISEVOLTAGETHRESHOLD, "RISEVOLTAGETHRESHOLD";
    K_FALLVOLTAGETHRESHOLD, "FALLVOLTAGETHRESHOLD";
    K_ROUTING, "ROUTING";
    K_ROWMAJOR, "ROWMAJOR";
    K_RPERSQ, "RPERSQ";
    K_SAMENET, "SAMENET";
    K_SCANUSE, "SCANUSE";
    K_SHAPE, "SHAPE";
    K_SHRINKAGE, "SHRINKAGE";
    K_SIGNAL, "SIGNAL";
    K_SITE, "SITE";
    K_SIZE, "SIZE";
    K_SOURCE, "SOURCE";
    K_SPACER, "SPACER";
    K_SPACING, "SPACING";
    K_SPECIALNETS, "SPECIALNETS";
    K_STACK, "STACK";
    K_START, "START";
    K_STEP, "STEP";
    K_STOP, "STOP";
    K_STRUCTURE, "STRUCTURE";
    K_SYMMETRY, "SYMMETRY";
    K_TABLE, "TABLE";
    K_THICKNESS, "THICKNESS";
    K_TIEHIGH, "TIEHIGH";
    K_TIELOW, "TIELOW";
    K_TIEOFFR, "TIEOFFR";
    K_TIME, "TIME";
    K_TIMING, "TIMING";
    K_TO, "TO";
    K_TOPIN, "TOPIN";
    K_TOPLEFT, "TOPLEFT";
    K_TOPRIGHT, "TOPRIGHT";
    K_TOPOFSTACKONLY, "TOPOFSTACKONLY";
    K_TRISTATE, "TRISTATE";
    K_TYPE, "TYPE";
    K_UNATENESS, "UNATENESS";
    K_UNITS, "UNITS";
    K_USE, "USE";
    K_VARIABLE, "VARIABLE";
    K_VERTICAL, "VERTICAL";
    K_VHI, "VHI";
    K_VIA, "VIA";
    K_VIARULE, "VIARULE";
    K_VLO, "VLO";
    K_VOLTAGE, "VOLTAGE";
    K_VOLTS, "VOLTS";
    K_WIDTH, "WIDTH";
    K_X, "X";
    K_Y, "Y";
    K_N, "N";
    K_S, "S";
    K_E, "E";
    K_W, "W";
    K_FN, "FN";
    K_FS, "FS";
    K_FE, "FE";
    K_FW, "FW";
    K_R0, "R0";
    K_R90, "R90";
    K_R180, "R180";
    K_R270, "R270";
    K_MX, "MX";
    K_MY, "MY";
    K_MXR90, "MXR90";
    K_MYR90, "MYR90";
    K_USER, "USER";
    K_MASTERSLICE, "MASTERSLICE";
    K_ENDMACRO, "ENDMACRO";
    K_ENDMACROPIN, "ENDMACROPIN";
    K_ENDVIARULE, "ENDVIARULE";
    K_ENDVIA, "ENDVIA";
    K_ENDLAYER, "ENDLAYER";
    K_ENDSITE, "ENDSITE";
    K_CANPLACE, "CANPLACE";
    K_CANNOTOCCUPY, "CANNOTOCCUPY";
    K_TRACKS, "TRACKS";
    K_FLOORPLAN, "FLOORPLAN";
    K_GCELLGRID, "GCELLGRID";
    K_DEFAULTCAP, "DEFAULTCAP";
    K_MINPINS, "MINPINS";
    K_WIRECAP, "WIRECAP";
    K_STABLE, "STABLE";
    K_SETUP, "SETUP";
    K_HOLD, "HOLD";
    K_DEFINE, "DEFINE";
    K_DEFINES, "&DEFINES";
    K_DEFINEB, "DEFINEB";
    K_IF, "IF";
    K_THEN, "THEN";
    K_ELSE, "ELSE";
    K_FALSE, "FALSE";
    K_TRUE, "TRUE";
    K_EQ, "EQ";
    K_NE, "NE";
    K_LE, "LE";
    K_LT, "LT";
    K_GE, "GE";
    K_GT, "GT";
    K_OR, "OR";
    K_AND, "AND";
    K_NOT, "NOT";
    K_DELAY, "DELAY";
    K_TABLEDIMENSION, "TABLEDIMENSION";
    K_TABLEAXIS, "TABLEAXIS";
    K_TABLEENTRIES, "TABLEENTRIES";
    K_TRANSITIONTIME, "TRANSITIONTIME";
    K_EXTENSION, "EXTENSION";
    K_PROPDEF, "PROPERTYDEFINITIONS";
    K_STRING, "STRING";
    K_INTEGER, "INTEGER";
    K_REAL, "REAL";
    K_RANGE, "RANGE";
    K_PROPERTY, "PROPERTY";
    K_VIRTUAL, "VIRTUAL";
    K_BUSBITCHARS, "BUSBITCHARS";
    K_VERSION, "VERSION";
    K_BEGINEXT, "BEGINEXT";
    K_DATE, "DATE";
    K_CREATOR, "CREATOR";
    K_ENDEXT, "ENDEXT";
    K_UNIVERSALNOISEMARGIN, "UNIVERSALNOISEMARGIN";
    K_EDGERATETHRESHOLD1, "EDGERATETHRESHOLD1";
    K_CORRECTIONTABLE, "CORRECTIONTABLE";
    K_EDGERATESCALEFACTOR, "EDGERATESCALEFACTOR";
    K_EDGERATETHRESHOLD2, "EDGERATETHRESHOLD2";
    K_VICTIMNOISE, "VICTIMNOISE";
    K_NOISETABLE, "NOISETABLE";
    K_EDGERATE, "EDGERATE";
    K_OUTPUTRESISTANCE, "OUTPUTRESISTANCE";
    K_VICTIMLENGTH, "VICTIMLENGTH";
    K_CORRECTIONFACTOR, "CORRECTIONFACTOR";
    K_OUTPUTPINANTENNASIZE, "OUTPUTPINANTENNASIZE";
    K_INPUTPINANTENNASIZE, "INPUTPINANTENNASIZE";
    K_INOUTPINANTENNASIZE, "INOUTPINANTENNASIZE";
    K_CURRENTDEN, "CURRENTDEN";
    K_PWL, "PWL";
    K_ANTENNALENGTHFACTOR, "ANTENNALENGTHFACTOR";
    K_TAPERRULE, "TAPERRULE";
    K_DIVIDERCHAR, "DIVIDERCHAR";
    K_ANTENNASIZE, "ANTENNASIZE";
    K_ANTENNAMETALLENGTH, "ANTENNAMETALLENGTH";
    K_ANTENNAMETALAREA, "ANTENNAMETALAREA";
    K_RISESLEWLIMIT, "RISESLEWLIMIT";
    K_FALLSLEWLIMIT, "FALLSLEWLIMIT";
    K_FUNCTION, "FUNCTION";
    K_BUFFER, "BUFFER";
    K_INVERTER, "INVERTER";
    K_NAMEMAPSTRING, "NAMEMAPSTRING";
    K_NOWIREEXTENSIONATPIN, "NOWIREEXTENSIONATPIN";
    K_WIREEXTENSION, "WIREEXTENSION";
    K_MESSAGE, "MESSAGE";
    K_CREATEFILE, "CREATEFILE";
    K_OPENFILE, "OPENFILE";
    K_CLOSEFILE, "CLOSEFILE";
    K_WARNING, "WARNING";
    K_ERROR, "ERROR";
    K_FATALERROR, "FATALERROR";
    K_RECOVERY, "RECOVERY";
    K_SKEW, "SKEW";
    K_ANYEDGE, "ANYEDGE";
    K_POSEDGE, "POSEDGE";
    K_NEGEDGE, "NEGEDGE";
    K_SDFCONDSTART, "SDFCONDSTART";
    K_SDFCONDEND, "SDFCONDEND";
    K_SDFCOND, "SDFCOND";
    K_MPWH, "MPWH";
    K_MPWL, "MPWL";
    K_PERIOD, "PERIOD";
    K_ACCURRENTDENSITY, "ACCURRENTDENSITY";
    K_DCCURRENTDENSITY, "DCCURRENTDENSITY";
    K_AVERAGE, "AVERAGE";
    K_PEAK, "PEAK";
    K_RMS, "RMS";
    K_FREQUENCY, "FREQUENCY";
    K_CUTAREA, "CUTAREA";
    K_MEGAHERTZ, "MEGAHERTZ";
    K_USELENGTHTHRESHOLD, "USELENGTHTHRESHOLD";
    K_LENGTHTHRESHOLD, "LENGTHTHRESHOLD";
    K_ANTENNAINPUTGATEAREA, "ANTENNAINPUTGATEAREA";
    K_ANTENNAINOUTDIFFAREA, "ANTENNAINOUTDIFFAREA";
    K_ANTENNAOUTPUTDIFFAREA, "ANTENNAOUTPUTDIFFAREA";
    K_ANTENNAAREARATIO, "ANTENNAAREARATIO";
    K_ANTENNADIFFAREARATIO, "ANTENNADIFFAREARATIO";
    K_ANTENNACUMAREARATIO, "ANTENNACUMAREARATIO";
    K_ANTENNACUMDIFFAREARATIO, "ANTENNACUMDIFFAREARATIO";
    K_ANTENNAAREAFACTOR, "ANTENNAAREAFACTOR";
    K_ANTENNASIDEAREARATIO, "ANTENNASIDEAREARATIO";
    K_ANTENNADIFFSIDEAREARATIO, "ANTENNADIFFSIDEAREARATIO";
    K_ANTENNACUMSIDEAREARATIO, "ANTENNACUMSIDEAREARATIO";
    K_ANTENNACUMDIFFSIDEAREARATIO, "ANTENNACUMDIFFSIDEAREARATIO";
    K_ANTENNASIDEAREAFACTOR, "ANTENNASIDEAREAFACTOR";
    K_DIFFUSEONLY, "DIFFUSEONLY";
    K_MANUFACTURINGGRID, "MANUFACTURINGGRID";
    K_FIXEDMASK, "FIXEDMASK";
    K_ANTENNACELL, "ANTENNACELL";
    K_CLEARANCEMEASURE, "CLEARANCEMEASURE";
    K_EUCLIDEAN, "EUCLIDEAN";
    K_MAXXY, "MAXXY";
    K_USEMINSPACING, "USEMINSPACING";
    K_ROWMINSPACING, "ROWMINSPACING";
    K_ROWABUTSPACING, "ROWABUTSPACING";
    K_FLIP, "FLIP";
    K_NONE, "NONE";
    K_ANTENNAPARTIALMETALAREA, "ANTENNAPARTIALMETALAREA";
    K_ANTENNAPARTIALMETALSIDEAREA, "ANTENNAPARTIALMETALSIDEAREA";
    K_ANTENNAGATEAREA, "ANTENNAGATEAREA";
    K_ANTENNADIFFAREA, "ANTENNADIFFAREA";
    K_ANTENNAMAXAREACAR, "ANTENNAMAXAREACAR";
    K_ANTENNAMAXSIDEAREACAR, "ANTENNAMAXSIDEAREACAR";
    K_ANTENNAPARTIALCUTAREA, "ANTENNAPARTIALCUTAREA";
    K_ANTENNAMAXCUTCAR, "ANTENNAMAXCUTCAR";
    K_SLOTWIREWIDTH, "SLOTWIREWIDTH";
    K_SLOTWIRELENGTH, "SLOTWIRELENGTH";
    K_SLOTWIDTH, "SLOTWIDTH";
    K_SLOTLENGTH, "SLOTLENGTH";
    K_MAXADJACENTSLOTSPACING, "MAXADJACENTSLOTSPACING";
    K_MAXCOAXIALSLOTSPACING, "MAXCOAXIALSLOTSPACING";
    K_MAXEDGESLOTSPACING, "MAXEDGESLOTSPACING";
    K_SPLITWIREWIDTH, "SPLITWIREWIDTH";
    K_MINIMUMDENSITY, "MINIMUMDENSITY";
    K_MAXIMUMDENSITY, "MAXIMUMDENSITY";
    K_DENSITYCHECKWINDOW, "DENSITYCHECKWINDOW";
    K_DENSITYCHECKSTEP, "DENSITYCHECKSTEP";
    K_FILLACTIVESPACING, "FILLACTIVESPACING";
    K_MINIMUMCUT, "MINIMUMCUT";
    K_ADJACENTCUTS, "ADJACENTCUTS";
    K_ANTENNAMODEL, "ANTENNAMODEL";
    K_BUMP, "BUMP";
    K_ENCLOSURE, "ENCLOSURE";
    K_FROMABOVE, "FROMABOVE";
    K_FROMBELOW, "FROMBELOW";
    K_IMPLANT, "IMPLANT";
    K_LENGTH, "LENGTH";
    K_MAXVIASTACK, "MAXVIASTACK";
    K_AREAIO, "AREAIO";
    K_BLACKBOX, "BLACKBOX";
    K_MAXWIDTH, "MAXWIDTH";
    K_MINENCLOSEDAREA, "MINENCLOSEDAREA";
    K_MINSTEP, "MINSTEP";
    K_ORIENT, "ORIENT";
    K_OXIDE1, "OXIDE1";
    K_OXIDE2, "OXIDE2";
    K_OXIDE3, "OXIDE3";
    K_OXIDE4, "OXIDE4";
    K_PARALLELRUNLENGTH, "PARALLELRUNLENGTH";
    K_MINWIDTH, "MINWIDTH";
    K_PROTRUSIONWIDTH, "PROTRUSIONWIDTH";
    K_SPACINGTABLE, "SPACINGTABLE";
    K_WITHIN, "WITHIN";
    K_ABOVE, "ABOVE";
    K_BELOW, "BELOW";
    K_CENTERTOCENTER, "CENTERTOCENTER";
    K_CUTSIZE, "CUTSIZE";
    K_CUTSPACING, "CUTSPACING";
    K_DENSITY, "DENSITY";
    K_DIAG45, "DIAG45";
    K_DIAG135, "DIAG135";
    K_MASK, "MASK";
    K_DIAGMINEDGELENGTH, "DIAGMINEDGELENGTH";
    K_DIAGSPACING, "DIAGSPACING";
    K_DIAGPITCH, "DIAGPITCH";
    K_DIAGWIDTH, "DIAGWIDTH";
    K_GENERATED, "GENERATED";
    K_GROUNDSENSITIVITY, "GROUNDSENSITIVITY";
    K_HARDSPACING, "HARDSPACING";
    K_INSIDECORNER, "INSIDECORNER";
    K_LAYERS, "LAYERS";
    K_LENGTHSUM, "LENGTHSUM";
    K_MICRONS, "MICRONS";
    K_MINCUTS, "MINCUTS";
    K_MINSIZE, "MINSIZE";
    K_NETEXPR, "NETEXPR";
    K_OUTSIDECORNER, "OUTSIDECORNER";
    K_PREFERENCLOSURE, "PREFERENCLOSURE";
    K_ROWCOL, "ROWCOL";
    K_ROWPATTERN, "ROWPATTERN";
    K_SOFT, "SOFT";
    K_SUPPLYSENSITIVITY, "SUPPLYSENSITIVITY";
    K_USEVIA, "USEVIA";
    K_USEVIARULE, "USEVIARULE";
    K_WELLTAP, "WELLTAP";
    K_ARRAYCUTS, "ARRAYCUTS";
    K_ARRAYSPACING, "ARRAYSPACING";
    K_ANTENNAAREADIFFREDUCEPWL, "ANTENNAAREADIFFREDUCEPWL";
    K_ANTENNAAREAMINUSDIFF, "ANTENNAAREAMINUSDIFF";
    K_ANTENNACUMROUTINGPLUSCUT, "ANTENNACUMROUTINGPLUSCUT";
    K_ANTENNAGATEPLUSDIFF, "ANTENNAGATEPLUSDIFF";
    K_ENDOFLINE, "ENDOFLINE";
    K_ENDOFNOTCHWIDTH, "ENDOFNOTCHWIDTH";
    K_EXCEPTEXTRACUT, "EXCEPTEXTRACUT";
    K_EXCEPTSAMEPGNET, "EXCEPTSAMEPGNET";
    K_EXCEPTPGNET, "EXCEPTPGNET";
    K_LONGARRAY, "LONGARRAY";
    K_MAXEDGES, "MAXEDGES";
    K_NOTCHLENGTH, "NOTCHLENGTH";
    K_NOTCHSPACING, "NOTCHSPACING";
    K_ORTHOGONAL, "ORTHOGONAL";
    K_PARALLELEDGE, "PARALLELEDGE";
    K_PARALLELOVERLAP, "PARALLELOVERLAP";
    K_PGONLY, "PGONLY";
    K_PRL, "PRL";
    K_TWOEDGES, "TWOEDGES";
    K_TWOWIDTHS, "TWOWIDTHS"
      ];
    fun s -> Hashtbl.find h (String.uppercase s)

let tok arg = if !verbose then print_endline ( match arg with
  | QSTRING id -> id
  | NUMBER n -> string_of_float n
  | K_HISTORY id -> id
  | END  -> "END"
  | LINEFEED  -> "LINEFEED"
  | LPAREN  -> "LPAREN"
  | RPAREN  -> "RPAREN"
  | STAR  -> "STAR"
  | PLUS  -> "PLUS"
  | HYPHEN  -> "HYPHEN"
  | SLASH  -> "SLASH"
  | SEMICOLON  -> "SEMICOLON"
  | LESS  -> "LESS"
  | EQUALS  -> "EQUALS"
  | GREATER  -> "GREATER"
  | ERROR  -> "ERROR"
  | K_ABUT  -> "ABUT"
  | K_ABUTMENT  -> "ABUTMENT"
  | K_ACTIVE  -> "ACTIVE"
  | K_ANALOG  -> "ANALOG"
  | K_ARRAY  -> "ARRAY"
  | K_AREA  -> "AREA"
  | K_BLOCK  -> "BLOCK"
  | K_BOTTOMLEFT  -> "BOTTOMLEFT"
  | K_BOTTOMRIGHT  -> "BOTTOMRIGHT"
  | K_BY  -> "BY"
  | K_CAPACITANCE  -> "CAPACITANCE"
  | K_CAPMULTIPLIER  -> "CAPMULTIPLIER"
  | K_CLASS  -> "CLASS"
  | K_CLOCK  -> "CLOCK"
  | K_CLOCKTYPE  -> "CLOCKTYPE"
  | K_COLUMNMAJOR  -> "COLUMNMAJOR"
  | K_DESIGNRULEWIDTH  -> "DESIGNRULEWIDTH"
  | K_INFLUENCE  -> "INFLUENCE"
  | K_CORE  -> "CORE"
  | K_CORNER  -> "CORNER"
  | K_COVER  -> "COVER"
  | K_CPERSQDIST  -> "CPERSQDIST"
  | K_CURRENT  -> "CURRENT"
  | K_CURRENTSOURCE  -> "CURRENTSOURCE"
  | K_CUT  -> "CUT"
  | K_DEFAULT  -> "DEFAULT"
  | K_DATABASE  -> "DATABASE"
  | K_DATA  -> "DATA"
  | K_DIELECTRIC  -> "DIELECTRIC"
  | K_DIRECTION  -> "DIRECTION"
  | K_DO  -> "DO"
  | K_EDGECAPACITANCE  -> "EDGECAPACITANCE"
  | K_EEQ  -> "EEQ"
  | K_END  -> "END"
  | K_ENDCAP  -> "ENDCAP"
  | K_FALL  -> "FALL"
  | K_FALLCS  -> "FALLCS"
  | K_FALLT0  -> "FALLT0"
  | K_FALLSATT1  -> "FALLSATT1"
  | K_FALLRS  -> "FALLRS"
  | K_FALLSATCUR  -> "FALLSATCUR"
  | K_FALLTHRESH  -> "FALLTHRESH"
  | K_FEEDTHRU  -> "FEEDTHRU"
  | K_FIXED  -> "FIXED"
  | K_FOREIGN  -> "FOREIGN"
  | K_FROMPIN  -> "FROMPIN"
  | K_GENERATE  -> "GENERATE"
  | K_GENERATOR  -> "GENERATOR"
  | K_GROUND  -> "GROUND"
  | K_HEIGHT  -> "HEIGHT"
  | K_HORIZONTAL  -> "HORIZONTAL"
  | K_INOUT  -> "INOUT"
  | K_INPUT  -> "INPUT"
  | K_INPUTNOISEMARGIN  -> "INPUTNOISEMARGIN"
  | K_COMPONENTPIN  -> "COMPONENTPIN"
  | K_INTRINSIC  -> "INTRINSIC"
  | K_INVERT  -> "INVERT"
  | K_IRDROP  -> "IRDROP"
  | K_ITERATE  -> "ITERATE"
  | K_IV_TABLES  -> "IV_TABLES"
  | K_LAYER  -> "LAYER"
  | K_LEAKAGE  -> "LEAKAGE"
  | K_LEQ  -> "LEQ"
  | K_LIBRARY  -> "LIBRARY"
  | K_MACRO  -> "MACRO"
  | K_MATCH  -> "MATCH"
  | K_MAXDELAY  -> "MAXDELAY"
  | K_MAXLOAD  -> "MAXLOAD"
  | K_METALOVERHANG  -> "METALOVERHANG"
  | K_MILLIAMPS  -> "MILLIAMPS"
  | K_MILLIWATTS  -> "MILLIWATTS"
  | K_MINFEATURE  -> "MINFEATURE"
  | K_MUSTJOIN  -> "MUSTJOIN"
  | K_NAMESCASESENSITIVE  -> "NAMESCASESENSITIVE"
  | K_NANOSECONDS  -> "NANOSECONDS"
  | K_NETS  -> "NETS"
  | K_NEW  -> "NEW"
  | K_NONDEFAULTRULE  -> "NONDEFAULTRULE"
  | K_NONINVERT  -> "NONINVERT"
  | K_NONUNATE  -> "NONUNATE"
  | K_OBS  -> "OBS"
  | K_OHMS  -> "OHMS"
  | K_OFFSET  -> "OFFSET"
  | K_ORIENTATION  -> "ORIENTATION"
  | K_ORIGIN  -> "ORIGIN"
  | K_OUTPUT  -> "OUTPUT"
  | K_OUTPUTNOISEMARGIN  -> "OUTPUTNOISEMARGIN"
  | K_OVERHANG  -> "OVERHANG"
  | K_OVERLAP  -> "OVERLAP"
  | K_OFF  -> "OFF"
  | K_ON  -> "ON"
  | K_OVERLAPS  -> "OVERLAPS"
  | K_PAD  -> "PAD"
  | K_PATH  -> "PATH"
  | K_PATTERN  -> "PATTERN"
  | K_PICOFARADS  -> "PICOFARADS"
  | K_PIN  -> "PIN"
  | K_PITCH  -> "PITCH"
  | K_PLACED  -> "PLACED"
  | K_POLYGON  -> "POLYGON"
  | K_PORT  -> "PORT"
  | K_POST  -> "POST"
  | K_POWER  -> "POWER"
  | K_PRE  -> "PRE"
  | K_PULLDOWNRES  -> "PULLDOWNRES"
  | K_RECT  -> "RECT"
  | K_RESISTANCE  -> "RESISTANCE"
  | K_RESISTIVE  -> "RESISTIVE"
  | K_RING  -> "RING"
  | K_RISE  -> "RISE"
  | K_RISECS  -> "RISECS"
  | K_RISERS  -> "RISERS"
  | K_RISESATCUR  -> "RISESATCUR"
  | K_RISETHRESH  -> "RISETHRESH"
  | K_RISESATT1  -> "RISESATT1"
  | K_RISET0  -> "RISET0"
  | K_RISEVOLTAGETHRESHOLD  -> "RISEVOLTAGETHRESHOLD"
  | K_FALLVOLTAGETHRESHOLD  -> "FALLVOLTAGETHRESHOLD"
  | K_ROUTING  -> "ROUTING"
  | K_ROWMAJOR  -> "ROWMAJOR"
  | K_RPERSQ  -> "RPERSQ"
  | K_SAMENET  -> "SAMENET"
  | K_SCANUSE  -> "SCANUSE"
  | K_SHAPE  -> "SHAPE"
  | K_SHRINKAGE  -> "SHRINKAGE"
  | K_SIGNAL  -> "SIGNAL"
  | K_SITE  -> "SITE"
  | K_SIZE  -> "SIZE"
  | K_SOURCE  -> "SOURCE"
  | K_SPACER  -> "SPACER"
  | K_SPACING  -> "SPACING"
  | K_SPECIALNETS  -> "SPECIALNETS"
  | K_STACK  -> "STACK"
  | K_START  -> "START"
  | K_STEP  -> "STEP"
  | K_STOP  -> "STOP"
  | K_STRUCTURE  -> "STRUCTURE"
  | K_SYMMETRY  -> "SYMMETRY"
  | K_TABLE  -> "TABLE"
  | K_THICKNESS  -> "THICKNESS"
  | K_TIEHIGH  -> "TIEHIGH"
  | K_TIELOW  -> "TIELOW"
  | K_TIEOFFR  -> "TIEOFFR"
  | K_TIME  -> "TIME"
  | K_TIMING  -> "TIMING"
  | K_TO  -> "TO"
  | K_TOPIN  -> "TOPIN"
  | K_TOPLEFT  -> "TOPLEFT"
  | K_TOPRIGHT  -> "TOPRIGHT"
  | K_TOPOFSTACKONLY  -> "TOPOFSTACKONLY"
  | K_TRISTATE  -> "TRISTATE"
  | K_TYPE  -> "K_TYPE"
  | K_UNATENESS  -> "UNATENESS"
  | K_UNITS  -> "UNITS"
  | K_USE  -> "USE"
  | K_VARIABLE  -> "VARIABLE"
  | K_VERTICAL  -> "VERTICAL"
  | K_VHI  -> "VHI"
  | K_VIA  -> "VIA"
  | K_VIARULE  -> "VIARULE"
  | K_VLO  -> "VLO"
  | K_VOLTAGE  -> "VOLTAGE"
  | K_VOLTS  -> "VOLTS"
  | K_WIDTH  -> "WIDTH"
  | K_X  -> "X"
  | K_Y  -> "Y"
  | K_N  -> "N"
  | K_S  -> "S"
  | K_E  -> "E"
  | K_W  -> "W"
  | K_FN  -> "FN"
  | K_FS  -> "FS"
  | K_FE  -> "FE"
  | K_FW  -> "FW"
  | K_R0  -> "R0"
  | K_R90  -> "R90"
  | K_R180  -> "R180"
  | K_R270  -> "R270"
  | K_MX  -> "MX"
  | K_MY  -> "MY"
  | K_MXR90  -> "MXR90"
  | K_MYR90  -> "MYR90"
  | K_USER  -> "USER"
  | K_MASTERSLICE  -> "MASTERSLICE"
  | K_ENDMACRO  -> "ENDMACRO"
  | K_ENDMACROPIN  -> "ENDMACROPIN"
  | K_ENDVIARULE  -> "ENDVIARULE"
  | K_ENDVIA  -> "ENDVIA"
  | K_ENDLAYER  -> "ENDLAYER"
  | K_ENDSITE  -> "ENDSITE"
  | K_CANPLACE  -> "CANPLACE"
  | K_CANNOTOCCUPY  -> "CANNOTOCCUPY"
  | K_TRACKS  -> "TRACKS"
  | K_FLOORPLAN  -> "FLOORPLAN"
  | K_GCELLGRID  -> "GCELLGRID"
  | K_DEFAULTCAP  -> "DEFAULTCAP"
  | K_MINPINS  -> "MINPINS"
  | K_WIRECAP  -> "WIRECAP"
  | K_STABLE  -> "STABLE"
  | K_SETUP  -> "SETUP"
  | K_HOLD  -> "HOLD"
  | K_DEFINE  -> "DEFINE"
  | K_DEFINES  -> "DEFINES"
  | K_DEFINEB  -> "DEFINEB"
  | K_IF  -> "IF"
  | K_THEN  -> "THEN"
  | K_ELSE  -> "ELSE"
  | K_FALSE  -> "FALSE"
  | K_TRUE  -> "TRUE"
  | K_EQ  -> "EQ"
  | K_NE  -> "NE"
  | K_LE  -> "LE"
  | K_LT  -> "LT"
  | K_GE  -> "GE"
  | K_GT  -> "GT"
  | K_OR  -> "OR"
  | K_AND  -> "AND"
  | K_NOT  -> "NOT"
  | K_DELAY  -> "DELAY"
  | K_TABLEDIMENSION  -> "TABLEDIMENSION"
  | K_TABLEAXIS  -> "TABLEAXIS"
  | K_TABLEENTRIES  -> "TABLEENTRIES"
  | K_TRANSITIONTIME  -> "TRANSITIONTIME"
  | K_EXTENSION  -> "EXTENSION"
  | K_PROPDEF  -> "PROPDEF"
  | K_STRING  -> "STRING"
  | K_INTEGER  -> "INTEGER"
  | K_REAL  -> "REAL"
  | K_RANGE  -> "RANGE"
  | K_PROPERTY  -> "PROPERTY"
  | K_VIRTUAL  -> "VIRTUAL"
  | K_BUSBITCHARS  -> "BUSBITCHARS"
  | K_VERSION  -> "VERSION"
  | K_BEGINEXT  -> "BEGINEXT"
  | K_DATE -> "K_DATE"
  | K_CREATOR -> "K_CREATOR"
  | K_ENDEXT  -> "ENDEXT"
  | K_UNIVERSALNOISEMARGIN  -> "UNIVERSALNOISEMARGIN"
  | K_EDGERATETHRESHOLD1  -> "EDGERATETHRESHOLD1"
  | K_CORRECTIONTABLE  -> "CORRECTIONTABLE"
  | K_EDGERATESCALEFACTOR  -> "EDGERATESCALEFACTOR"
  | K_EDGERATETHRESHOLD2  -> "EDGERATETHRESHOLD2"
  | K_VICTIMNOISE  -> "VICTIMNOISE"
  | K_NOISETABLE  -> "NOISETABLE"
  | K_EDGERATE  -> "EDGERATE"
  | K_OUTPUTRESISTANCE  -> "OUTPUTRESISTANCE"
  | K_VICTIMLENGTH  -> "VICTIMLENGTH"
  | K_CORRECTIONFACTOR  -> "CORRECTIONFACTOR"
  | K_OUTPUTPINANTENNASIZE  -> "OUTPUTPINANTENNASIZE"
  | K_INPUTPINANTENNASIZE  -> "INPUTPINANTENNASIZE"
  | K_INOUTPINANTENNASIZE  -> "INOUTPINANTENNASIZE"
  | K_CURRENTDEN  -> "CURRENTDEN"
  | K_PWL  -> "PWL"
  | K_ANTENNALENGTHFACTOR  -> "ANTENNALENGTHFACTOR"
  | K_TAPERRULE  -> "TAPERRULE"
  | K_DIVIDERCHAR  -> "DIVIDERCHAR"
  | K_ANTENNASIZE  -> "ANTENNASIZE"
  | K_ANTENNAMETALLENGTH  -> "ANTENNAMETALLENGTH"
  | K_ANTENNAMETALAREA  -> "ANTENNAMETALAREA"
  | K_RISESLEWLIMIT  -> "RISESLEWLIMIT"
  | K_FALLSLEWLIMIT  -> "FALLSLEWLIMIT"
  | K_FUNCTION  -> "FUNCTION"
  | K_BUFFER  -> "BUFFER"
  | K_INVERTER  -> "INVERTER"
  | K_NAMEMAPSTRING  -> "NAMEMAPSTRING"
  | K_NOWIREEXTENSIONATPIN  -> "NOWIREEXTENSIONATPIN"
  | K_WIREEXTENSION  -> "WIREEXTENSION"
  | K_MESSAGE  -> "MESSAGE"
  | K_CREATEFILE  -> "CREATEFILE"
  | K_OPENFILE  -> "OPENFILE"
  | K_CLOSEFILE  -> "CLOSEFILE"
  | K_WARNING  -> "WARNING"
  | K_ERROR  -> "ERROR"
  | K_FATALERROR  -> "FATALERROR"
  | K_RECOVERY  -> "RECOVERY"
  | K_SKEW  -> "SKEW"
  | K_ANYEDGE  -> "ANYEDGE"
  | K_POSEDGE  -> "POSEDGE"
  | K_NEGEDGE  -> "NEGEDGE"
  | K_SDFCONDSTART  -> "SDFCONDSTART"
  | K_SDFCONDEND  -> "SDFCONDEND"
  | K_SDFCOND  -> "SDFCOND"
  | K_MPWH  -> "MPWH"
  | K_MPWL  -> "MPWL"
  | K_PERIOD  -> "PERIOD"
  | K_ACCURRENTDENSITY  -> "ACCURRENTDENSITY"
  | K_DCCURRENTDENSITY  -> "DCCURRENTDENSITY"
  | K_AVERAGE  -> "AVERAGE"
  | K_PEAK  -> "PEAK"
  | K_RMS  -> "RMS"
  | K_FREQUENCY  -> "FREQUENCY"
  | K_CUTAREA  -> "CUTAREA"
  | K_MEGAHERTZ  -> "MEGAHERTZ"
  | K_USELENGTHTHRESHOLD  -> "USELENGTHTHRESHOLD"
  | K_LENGTHTHRESHOLD  -> "LENGTHTHRESHOLD"
  | K_ANTENNAINPUTGATEAREA  -> "ANTENNAINPUTGATEAREA"
  | K_ANTENNAINOUTDIFFAREA  -> "ANTENNAINOUTDIFFAREA"
  | K_ANTENNAOUTPUTDIFFAREA  -> "ANTENNAOUTPUTDIFFAREA"
  | K_ANTENNAAREARATIO  -> "ANTENNAAREARATIO"
  | K_ANTENNADIFFAREARATIO  -> "ANTENNADIFFAREARATIO"
  | K_ANTENNACUMAREARATIO  -> "ANTENNACUMAREARATIO"
  | K_ANTENNACUMDIFFAREARATIO  -> "ANTENNACUMDIFFAREARATIO"
  | K_ANTENNAAREAFACTOR  -> "ANTENNAAREAFACTOR"
  | K_ANTENNASIDEAREARATIO  -> "ANTENNASIDEAREARATIO"
  | K_ANTENNADIFFSIDEAREARATIO  -> "ANTENNADIFFSIDEAREARATIO"
  | K_ANTENNACUMSIDEAREARATIO  -> "ANTENNACUMSIDEAREARATIO"
  | K_ANTENNACUMDIFFSIDEAREARATIO  -> "ANTENNACUMDIFFSIDEAREARATIO"
  | K_ANTENNASIDEAREAFACTOR  -> "ANTENNASIDEAREAFACTOR"
  | K_DIFFUSEONLY  -> "DIFFUSEONLY"
  | K_MANUFACTURINGGRID  -> "MANUFACTURINGGRID"
  | K_FIXEDMASK  -> "FIXEDMASK"
  | K_ANTENNACELL  -> "ANTENNACELL"
  | K_CLEARANCEMEASURE  -> "CLEARANCEMEASURE"
  | K_EUCLIDEAN  -> "EUCLIDEAN"
  | K_MAXXY  -> "MAXXY"
  | K_USEMINSPACING  -> "USEMINSPACING"
  | K_ROWMINSPACING  -> "ROWMINSPACING"
  | K_ROWABUTSPACING  -> "ROWABUTSPACING"
  | K_FLIP  -> "FLIP"
  | K_NONE  -> "NONE"
  | K_ANTENNAPARTIALMETALAREA  -> "ANTENNAPARTIALMETALAREA"
  | K_ANTENNAPARTIALMETALSIDEAREA  -> "ANTENNAPARTIALMETALSIDEAREA"
  | K_ANTENNAGATEAREA  -> "ANTENNAGATEAREA"
  | K_ANTENNADIFFAREA  -> "ANTENNADIFFAREA"
  | K_ANTENNAMAXAREACAR  -> "ANTENNAMAXAREACAR"
  | K_ANTENNAMAXSIDEAREACAR  -> "ANTENNAMAXSIDEAREACAR"
  | K_ANTENNAPARTIALCUTAREA  -> "ANTENNAPARTIALCUTAREA"
  | K_ANTENNAMAXCUTCAR  -> "ANTENNAMAXCUTCAR"
  | K_SLOTWIREWIDTH  -> "SLOTWIREWIDTH"
  | K_SLOTWIRELENGTH  -> "SLOTWIRELENGTH"
  | K_SLOTWIDTH  -> "SLOTWIDTH"
  | K_SLOTLENGTH  -> "SLOTLENGTH"
  | K_MAXADJACENTSLOTSPACING  -> "MAXADJACENTSLOTSPACING"
  | K_MAXCOAXIALSLOTSPACING  -> "MAXCOAXIALSLOTSPACING"
  | K_MAXEDGESLOTSPACING  -> "MAXEDGESLOTSPACING"
  | K_SPLITWIREWIDTH  -> "SPLITWIREWIDTH"
  | K_MINIMUMDENSITY  -> "MINIMUMDENSITY"
  | K_MAXIMUMDENSITY  -> "MAXIMUMDENSITY"
  | K_DENSITYCHECKWINDOW  -> "DENSITYCHECKWINDOW"
  | K_DENSITYCHECKSTEP  -> "DENSITYCHECKSTEP"
  | K_FILLACTIVESPACING  -> "FILLACTIVESPACING"
  | K_MINIMUMCUT  -> "MINIMUMCUT"
  | K_ADJACENTCUTS  -> "ADJACENTCUTS"
  | K_ANTENNAMODEL  -> "ANTENNAMODEL"
  | K_BUMP  -> "BUMP"
  | K_ENCLOSURE  -> "ENCLOSURE"
  | K_FROMABOVE  -> "FROMABOVE"
  | K_FROMBELOW  -> "FROMBELOW"
  | K_IMPLANT  -> "IMPLANT"
  | K_LENGTH  -> "LENGTH"
  | K_MAXVIASTACK  -> "MAXVIASTACK"
  | K_AREAIO  -> "AREAIO"
  | K_BLACKBOX  -> "BLACKBOX"
  | K_MAXWIDTH  -> "MAXWIDTH"
  | K_MINENCLOSEDAREA  -> "MINENCLOSEDAREA"
  | K_MINSTEP  -> "MINSTEP"
  | K_ORIENT  -> "ORIENT"
  | K_OXIDE1  -> "OXIDE1"
  | K_OXIDE2  -> "OXIDE2"
  | K_OXIDE3  -> "OXIDE3"
  | K_OXIDE4  -> "OXIDE4"
  | K_PARALLELRUNLENGTH  -> "PARALLELRUNLENGTH"
  | K_MINWIDTH  -> "MINWIDTH"
  | K_PROTRUSIONWIDTH  -> "PROTRUSIONWIDTH"
  | K_SPACINGTABLE  -> "SPACINGTABLE"
  | K_WITHIN  -> "WITHIN"
  | K_ABOVE  -> "ABOVE"
  | K_BELOW  -> "BELOW"
  | K_CENTERTOCENTER  -> "CENTERTOCENTER"
  | K_CUTSIZE  -> "CUTSIZE"
  | K_CUTSPACING  -> "CUTSPACING"
  | K_DENSITY  -> "DENSITY"
  | K_DIAG45  -> "DIAG45"
  | K_DIAG135  -> "DIAG135"
  | K_MASK  -> "MASK"
  | K_DIAGMINEDGELENGTH  -> "DIAGMINEDGELENGTH"
  | K_DIAGSPACING  -> "DIAGSPACING"
  | K_DIAGPITCH  -> "DIAGPITCH"
  | K_DIAGWIDTH  -> "DIAGWIDTH"
  | K_GENERATED  -> "GENERATED"
  | K_GROUNDSENSITIVITY  -> "GROUNDSENSITIVITY"
  | K_HARDSPACING  -> "HARDSPACING"
  | K_INSIDECORNER  -> "INSIDECORNER"
  | K_LAYERS  -> "LAYERS"
  | K_LENGTHSUM  -> "LENGTHSUM"
  | K_MICRONS  -> "MICRONS"
  | K_MINCUTS  -> "MINCUTS"
  | K_MINSIZE  -> "MINSIZE"
  | K_NETEXPR  -> "NETEXPR"
  | K_OUTSIDECORNER  -> "OUTSIDECORNER"
  | K_PREFERENCLOSURE  -> "PREFERENCLOSURE"
  | K_ROWCOL  -> "ROWCOL"
  | K_ROWPATTERN  -> "ROWPATTERN"
  | K_SOFT  -> "SOFT"
  | K_SUPPLYSENSITIVITY  -> "SUPPLYSENSITIVITY"
  | K_USEVIA  -> "USEVIA"
  | K_USEVIARULE  -> "USEVIARULE"
  | K_WELLTAP  -> "WELLTAP"
  | K_ARRAYCUTS  -> "ARRAYCUTS"
  | K_ARRAYSPACING  -> "ARRAYSPACING"
  | K_ANTENNAAREADIFFREDUCEPWL  -> "ANTENNAAREADIFFREDUCEPWL"
  | K_ANTENNAAREAMINUSDIFF  -> "ANTENNAAREAMINUSDIFF"
  | K_ANTENNACUMROUTINGPLUSCUT  -> "ANTENNACUMROUTINGPLUSCUT"
  | K_ANTENNAGATEPLUSDIFF  -> "ANTENNAGATEPLUSDIFF"
  | K_ENDOFLINE  -> "ENDOFLINE"
  | K_ENDOFNOTCHWIDTH  -> "ENDOFNOTCHWIDTH"
  | K_EXCEPTEXTRACUT  -> "EXCEPTEXTRACUT"
  | K_EXCEPTSAMEPGNET  -> "EXCEPTSAMEPGNET"
  | K_EXCEPTPGNET  -> "EXCEPTPGNET"
  | K_LONGARRAY  -> "LONGARRAY"
  | K_MAXEDGES  -> "MAXEDGES"
  | K_NOTCHLENGTH  -> "NOTCHLENGTH"
  | K_NOTCHSPACING  -> "NOTCHSPACING"
  | K_ORTHOGONAL  -> "ORTHOGONAL"
  | K_PARALLELEDGE  -> "PARALLELEDGE"
  | K_PARALLELOVERLAP  -> "PARALLELOVERLAP"
  | K_PGONLY  -> "PGONLY"
  | K_PRL  -> "PRL"
  | K_TWOEDGES  -> "TWOEDGES"
  | K_TWOWIDTHS  -> "TWOWIDTHS"
  | IF  -> "IF"
  | LNOT  -> "LNOT"
  | UMINUS  -> "UMINUS"
  | AMPERSAND -> "AMPERSAND"
  | AT -> "AT"
  | BACKQUOTE -> "BACKQUOTE"
  | BACKSLASH -> "BACKSLASH"
  | CARET -> "CARET"
  | COLON -> "COLON"
  | COMMA -> "COMMA"
  | DOLLAR -> "DOLLAR"
  | DOT -> "DOT"
  | DOUBLEQUOTE -> "DOUBLEQUOTE"
  | LBRACK -> "LBRACK"
  | PLING -> "PLING"
  | RBRACE -> "RBRACE"
  | RBRACK -> "RBRACK"
  | UNDERSCORE -> "UNDERSCORE"
  | VBAR -> "VBAR"
  | TILDE -> ("TILDE") 
  | QUERY -> ("QUERY") 
  | PERCENT -> ("PERCENT") 
  | LBRACE -> ("LBRACE") 
  | HASH -> ("HASH") 
  | TUPLE9 _ -> "TUPLE9"
  | TUPLE8 _ -> "TUPLE8"
  | TUPLE7 _ -> "TUPLE7"
  | TUPLE6 _ -> "TUPLE6"
  | TUPLE5 _ -> "TUPLE5"
  | TUPLE4 _ -> "TUPLE4"
  | TUPLE3 _ -> "TUPLE3"
  | TUPLE25 _ -> "TUPLE25"
  | TUPLE24 _ -> "TUPLE24"
  | TUPLE23 _ -> "TUPLE23"
  | TUPLE22 _ -> "TUPLE22"
  | TUPLE21 _ -> "TUPLE21"
  | TUPLE20 _ -> "TUPLE20"
  | TUPLE2 _ -> "TUPLE2"
  | TUPLE19 _ -> "TUPLE19"
  | TUPLE18 _ -> "TUPLE18"
  | TUPLE17 _ -> "TUPLE17"
  | TUPLE16 _ -> "TUPLE16"
  | TUPLE15 _ -> "TUPLE15"
  | TUPLE14 _ -> "TUPLE14"
  | TUPLE13 _ -> "TUPLE13"
  | TUPLE12 _ -> "TUPLE12"
  | TUPLE11 _ -> "TUPLE11"
  | TUPLE10 _ -> "TUPLE10"
  | TUPLE1 _ -> "TUPLE1"
  | TLIST _ -> "TLIST"
  | SLIST _ -> "SLIST"
  | QUOTE -> "QUOTE"
  | INT _ -> "INT"
  | ERROR_TOKEN -> raise Error
  | EMPTY_TOKEN -> "EMPTY_TOKEN"
  | EOF_TOKEN -> "EOF_TOKEN"
  | DEFAULT -> "DEFAULT"
  | ACCEPT -> "ACCEPT"
);
  arg
}

let ident = ['a'-'z' 'A'-'Z' ] ['a'-'z' 'A'-'Z' '_' '0'-'9']*
let fltnum = ['-' '+']*['0'-'9']*['.']*['0'-'9']*['E' '-' '+' '0'-'9']*
let number = ['-' '+']*['0'-'9']+
let percent = ['0'-'9']+'%'
let space = [' ' '\t' '\r']+
let newline = ['\n']
let qstring = '"'[^'"']*'"'
let ampident = '&'[^' ']*
let comment = '#'[^'\n']*
let pattern = ['0'-'9' 'A'-'R' 'a'-'f']+'_'['0'-'9' 'A'-'R' 'a'-'f' '_']*

rule token = parse
  | comment
      { token lexbuf }
  | space
      { token lexbuf }
  | newline
      { incr lincnt; token lexbuf }
  | pattern as s
      { tok ( QSTRING s ) }
  | percent as s
      { tok ( QSTRING s ) }
  | number as n
      { tok ( NUMBER (float_of_string n) ) }
  | fltnum as n
      { tok ( match n with "E" -> K_E | _ -> let f = float_of_string n in NUMBER f ) }
  | ident as s
      { tok ( try keyword s with Not_found -> QSTRING s ) }
  | ampident as s
      { tok ( try keyword s with Not_found -> QSTRING s ) }
  | qstring as s
      { tok ( QSTRING s ) }
  | eof
      { tok ( EOF_TOKEN ) }
| '!'
{ tok ( PLING ) }

| '"'
{ tok ( DOUBLEQUOTE ) }

| '#'
{ tok ( HASH ) }

| '$'
{ tok ( DOLLAR ) }

| '%'
{ tok ( PERCENT ) }

| '&'
{ tok ( AMPERSAND ) }

| '''
{ tok ( QUOTE ) }

| '('
{ tok ( LPAREN ) }

| '['
{ tok ( LBRACK ) }

| '{'
{ tok ( LBRACE ) }

| '<'
{ tok ( LESS ) }

| ')'
{ tok ( RPAREN ) }

| ']'
{ tok ( RBRACK ) }

| '}'
{ tok ( RBRACE ) }

| '>'
{ tok ( GREATER ) }

| '*'
{ tok ( STAR ) }

| '+'
{ tok ( PLUS ) }

| ','
{ tok ( COMMA ) }

| '-'
{ tok ( HYPHEN ) }

| '.'
{ tok ( DOT ) }

| '/'
{ tok ( SLASH ) }

| '\\'
{ tok ( BACKSLASH ) }

| ':'
{ tok ( COLON ) }

| ';'
{ tok ( SEMICOLON ) }

| '='
{ tok ( EQUALS ) }

| '?'
{ tok ( QUERY ) }

| '@'
{ tok ( AT ) }

| '^'
{ tok ( CARET ) }

| '_'
{ tok ( UNDERSCORE ) }

| '`'
{ tok ( BACKQUOTE ) }

| '|'
{ tok ( VBAR ) }

| '~'
{ tok ( TILDE ) }

| _ as oth
{ tok ( failwith ("lex_file_lex: "^String.make 1 oth) ) }
