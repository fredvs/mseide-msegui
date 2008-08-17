unit msestockobjects_mfm;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface

implementation
uses
 mseclasses,msestockobjects;

const
 objdata: record size: integer; data: array[0..5595] of byte end =
      (size: 5596; data: (
  84,80,70,48,10,116,115,116,111,99,107,100,97,116,97,9,115,116,111,99,
  107,100,97,116,97,4,108,101,102,116,2,125,3,116,111,112,3,11,1,15,
  109,111,100,117,108,101,99,108,97,115,115,110,97,109,101,6,14,116,109,115,
  101,100,97,116,97,109,111,100,117,108,101,4,115,105,122,101,1,3,188,0,
  2,85,0,0,10,116,105,109,97,103,101,108,105,115,116,6,103,108,121,112,
  104,115,10,109,111,110,111,99,104,114,111,109,101,9,5,119,105,100,116,104,
  2,15,6,104,101,105,103,104,116,2,15,5,99,111,117,110,116,2,41,4,
  108,101,102,116,2,32,3,116,111,112,2,40,5,105,109,97,103,101,10,84,
  13,0,0,0,0,0,0,3,0,0,0,105,0,0,0,105,0,0,0,144,
  6,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,200,118,8,0,0,0,0,0,0,0,0,0,0,0,128,0,
  82,96,8,0,0,0,0,0,0,255,129,255,192,127,128,1,186,100,8,0,
  0,24,3,0,0,1,129,128,64,64,128,3,78,96,8,0,0,184,3,112,
  0,1,129,128,64,68,128,7,52,93,8,0,0,240,1,248,0,1,129,128,
  64,68,128,15,2,0,0,0,0,224,0,248,0,1,129,190,64,95,128,31,
  2,0,0,0,0,240,1,248,0,1,129,128,64,68,128,15,2,0,0,0,
  0,184,3,112,0,1,129,128,64,68,128,7,2,0,0,0,0,24,3,0,
  0,1,129,128,64,64,128,3,2,0,0,0,0,0,0,0,0,255,129,255,
  192,127,128,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,
  2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
  2,0,0,0,0,128,1,0,0,0,0,0,0,0,0,0,2,0,0,128,
  0,192,1,0,0,0,0,4,0,0,0,4,2,0,0,192,1,224,1,255,
  7,0,0,12,0,4,0,6,2,0,0,224,3,240,1,254,3,17,1,28,
  0,14,0,7,2,0,0,240,7,248,1,252,129,187,3,60,0,31,128,7,
  2,0,0,248,15,240,1,248,0,17,1,28,128,63,0,7,2,0,0,252,
  31,224,1,112,0,0,0,12,0,0,0,6,2,0,0,0,0,192,1,32,
  0,0,0,4,0,0,0,4,0,2,0,0,0,128,1,0,0,0,0,0,
  0,0,0,0,0,6,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
  0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,252,135,1,0,0,0,0,0,
  0,0,0,0,0,0,0,0,252,139,1,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  70,28,8,0,0,0,0,0,0,0,0,0,0,0,0,0,252,151,1,0,
  0,136,0,16,1,0,64,128,0,32,64,0,0,0,0,0,0,200,0,48,
  1,0,64,224,0,56,192,1,70,28,8,240,7,232,0,112,1,0,64,248,
  0,62,192,7,0,0,0,224,3,248,0,240,1,182,65,254,128,63,192,31,
  228,255,255,192,1,232,0,112,1,182,65,248,0,62,192,7,0,0,0,128,
  0,200,0,48,1,0,64,224,0,56,192,1,172,217,191,0,0,136,0,16,
  1,0,64,128,0,32,64,0,66,32,8,0,0,0,0,0,0,0,0,0,
  0,0,0,0,228,255,255,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,255,255,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,202,203,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,202,203,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  194,147,183,0,0,224,0,0,0,0,0,128,193,96,128,35,252,187,183,8,
  16,224,0,0,0,0,0,192,193,113,224,47,50,148,183,56,16,224,0,0,
  0,24,0,224,128,59,96,60,2,32,64,248,16,252,7,255,3,60,0,112,
  0,31,48,56,168,148,183,248,19,252,7,255,3,126,192,56,0,14,48,62,
  252,187,183,248,16,252,7,255,3,255,192,29,0,31,48,0,0,149,2,56,
  16,224,0,0,128,255,129,15,128,59,32,0,252,187,183,8,16,224,0,0,
  0,0,0,7,192,113,96,0,4,118,183,0,0,224,0,0,0,0,0,2,
  192,96,192,0,252,187,183,0,0,0,0,0,0,0,0,0,0,0,0,1,
  50,148,183,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,166,148,183,0,0,0,0,0,
  0,0,0,0,0,0,0,0,252,187,183,0,0,8,0,0,1,0,0,0,
  0,0,0,0,0,0,0,0,0,28,0,128,195,255,7,30,0,14,128,0,
  0,0,0,0,0,56,0,192,129,1,3,63,0,10,128,1,254,255,255,0,
  0,112,0,224,0,131,129,97,0,10,128,3,28,186,8,252,31,224,0,112,
  0,198,192,192,0,10,128,7,0,0,0,252,31,192,1,56,0,108,192,192,
  0,10,128,15,194,147,183,0,0,192,0,48,0,40,192,192,0,10,128,31,
  252,187,183,0,0,96,6,102,0,40,192,192,0,27,128,15,50,148,183,252,
  31,48,3,204,0,40,128,97,128,49,128,7,20,186,8,252,31,152,1,152,
  1,40,0,255,192,96,128,3,168,148,183,0,0,204,0,48,3,40,0,222,
  97,192,128,1,130,14,8,0,0,96,0,96,0,56,0,128,243,255,129,0,
  196,145,183,0,0,48,0,192,0,0,0,0,1,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,224,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,248,0,0,0,0,48,3,0,0,0,0,0,0,0,0,0,252,245,
  0,0,0,192,0,0,0,0,0,0,0,0,0,0,252,232,0,0,0,192,
  0,0,0,0,0,0,0,127,0,0,0,230,1,0,0,192,0,144,0,0,
  0,0,0,8,0,0,0,255,1,0,0,192,0,96,0,32,0,24,0,28,
  128,63,252,0,170,217,191,192,0,248,1,112,0,24,0,62,0,31,252,255,
  80,28,8,192,0,96,0,32,0,0,0,127,0,14,252,0,66,32,8,192,
  0,144,0,0,0,0,0,0,0,4,252,216,44,201,71,192,0,0,0,0,
  0,0,0,0,128,63,144,0,218,27,8,192,0,0,0,0,0,0,0,0,
  0,0,248,0,158,21,8,48,3,0,0,0,0,0,0,0,0,0,0,0,
  27,0,0,0,0,0,0,0,0,0,0,0,0,0,140,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,228,0,0,0,0,0,0,0,255,255,
  0,0,0,0,0,10,255,237,142,30,8,160,255,100,139,255,255,0,255,255,
  141,97,255,158,58,9,8,0,0,255,255,0,255,255,0,240,255,14,0,140,
  1,0,0,255,192,0,255,255,0,0,0,255,255,0,0,255,143,30,8,255,
  255,0,255,255,0,255,255,0,0,255,255,0,57,9,8,255,255,141,97,255,
  158,0,255,255,0,0,255,255,126,21,8,255,0,255,255,147,96,255,157,0,
  0,0,0,0,0,0,0,0,0,0,0,255,255,0,139,255,98,98,255,150,
  0,0,0,0,184,255,35,0,255,255,0,0,0,211,251,41,143,30,8,16,
  124,255,255,0,255,255,0,1,75,255,197,0,133,7,8,0,0,0,0,0,
  0,255,255,0,0,0,0,0,1,0,192,230,255,61,114,255,255,0,97,255,
  255,255,61,0,142,30,8,57,255,192,0,255,255,0,0,0,37,255,176,0,
  208,8,8,0,0,0,255,255,0,0,195,247,64,92,255,142,0,0,0,23,
  198,238,104,255,255,0,255,255,91,235,199,23,142,30,8,0,0,0,0,0,
  0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,200,118,8,0,0,0,0,0,0,0,0,0,0,0,128,0,
  82,96,8,0,0,0,0,0,0,255,129,255,192,127,128,1,186,100,8,0,
  0,24,3,0,0,1,129,128,64,64,128,3,78,96,8,0,0,184,3,112,
  0,1,129,128,64,68,128,7,52,93,8,0,0,240,1,248,0,1,129,128,
  64,68,128,15,2,0,0,0,0,224,0,248,0,1,129,190,64,95,128,31,
  2,0,0,0,0,240,1,248,0,1,129,128,64,68,128,15,2,0,0,0,
  0,184,3,112,0,1,129,128,64,68,128,7,2,0,0,0,0,24,3,0,
  0,1,129,128,64,64,128,3,2,0,0,0,0,0,0,0,0,255,129,255,
  192,127,128,1,2,0,0,0,0,0,0,0,0,0,0,0,0,0,128,0,
  2,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,2,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
  2,0,0,0,0,128,1,0,0,0,0,0,0,0,0,0,2,0,0,128,
  0,192,1,0,0,0,0,4,0,0,0,4,2,0,0,192,1,224,1,255,
  7,0,0,12,0,4,0,6,2,0,0,224,3,240,1,254,3,17,1,28,
  0,14,0,7,2,0,0,240,7,248,1,252,129,187,3,60,0,31,128,7,
  2,0,0,248,15,240,1,248,0,17,1,28,128,63,0,7,2,0,0,252,
  31,224,1,112,0,0,0,12,0,0,0,6,2,0,0,0,0,192,1,32,
  0,0,0,4,0,0,0,4,0,2,0,0,0,128,1,0,0,0,0,0,
  0,0,0,0,0,6,0,0,0,0,1,0,0,0,0,0,0,0,0,0,
  0,10,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,14,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,252,135,1,0,0,0,0,0,
  0,0,0,0,0,0,0,0,252,139,1,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  70,28,8,0,0,0,0,0,0,0,0,0,0,0,0,0,252,151,1,0,
  0,136,0,16,1,0,64,128,0,32,64,0,0,0,0,0,0,200,0,48,
  1,0,64,224,0,56,192,1,70,28,8,240,7,232,0,112,1,0,64,248,
  0,62,192,7,0,0,0,224,3,248,0,240,1,182,65,254,128,63,192,31,
  228,255,255,192,1,232,0,112,1,182,65,248,0,62,192,7,0,0,0,128,
  0,200,0,48,1,0,64,224,0,56,192,1,172,217,191,0,0,136,0,16,
  1,0,64,128,0,32,64,0,66,32,8,0,0,0,0,0,0,0,0,0,
  0,0,0,0,228,255,255,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,255,255,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,202,203,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,202,203,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  194,147,183,0,0,224,0,0,0,0,0,128,193,96,128,35,252,187,183,8,
  16,224,0,0,0,0,0,192,193,113,224,47,50,148,183,56,16,224,0,0,
  0,24,0,224,128,59,96,60,2,32,64,248,16,252,7,255,3,60,0,112,
  0,31,48,56,168,148,183,248,19,252,7,255,3,126,192,56,0,14,48,62,
  252,187,183,248,16,252,7,255,3,255,192,29,0,31,48,0,0,149,2,56,
  16,224,0,0,128,255,129,15,128,59,32,0,252,187,183,8,16,224,0,0,
  0,0,0,7,192,113,96,0,4,118,183,0,0,224,0,0,0,0,0,2,
  192,96,192,0,252,187,183,0,0,0,0,0,0,0,0,0,0,0,0,1,
  50,148,183,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,166,148,183,0,0,0,0,0,
  0,0,0,0,0,0,0,0,252,187,183,0,0,8,0,0,1,0,0,0,
  0,0,0,0,0,0,0,0,0,28,0,128,195,255,7,30,0,14,128,0,
  0,0,0,0,0,56,0,192,129,1,3,63,0,10,128,1,254,255,255,0,
  0,112,0,224,0,131,129,97,0,10,128,3,28,186,8,252,31,224,0,112,
  0,198,192,192,0,10,128,7,0,0,0,252,31,192,1,56,0,108,192,192,
  0,10,128,15,194,147,183,0,0,192,0,48,0,40,192,192,0,10,128,31,
  252,187,183,0,0,96,6,102,0,40,192,192,0,27,128,15,50,148,183,252,
  31,48,3,204,0,40,128,97,128,49,128,7,20,186,8,252,31,152,1,152,
  1,40,0,255,192,96,128,3,168,148,183,0,0,204,0,48,3,40,0,222,
  97,192,128,1,130,14,8,0,0,96,0,96,0,56,0,128,243,255,129,0,
  196,145,183,0,0,48,0,192,0,0,0,0,1,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,252,255,1,0,0,0,0,0,0,0,0,0,0,0,
  0,0,252,255,1,0,0,48,3,0,0,0,0,0,0,0,0,0,252,255,
  1,0,0,192,0,0,0,0,0,0,0,0,0,0,252,255,1,0,0,192,
  0,0,0,0,0,0,0,127,0,0,252,255,1,0,0,192,0,144,0,0,
  0,0,0,8,0,0,252,255,1,0,0,192,0,96,0,32,0,24,0,28,
  128,63,252,255,171,217,191,192,0,248,1,112,0,24,0,62,0,31,252,255,
  81,28,8,192,0,96,0,32,0,0,0,127,0,14,252,255,67,32,8,192,
  0,144,0,0,0,0,0,0,0,4,252,255,45,201,71,192,0,0,0,0,
  0,0,0,0,128,63,252,255,219,27,8,192,0,0,0,0,0,0,0,0,
  0,0,252,255,159,21,8,48,3,0,0,0,0,0,0,0,0,0,252,255,
  27,0,0,0,0,0,0,0,0,0,0,0,0,0,252,255,1,0,0,0,
  0,0,0,0,0,0,0,0,0,0,252,255,1,0,0,255,255,255,255,255,
  255,255,255,255,255,255,255,255,143,30,8,255,255,255,255,255,255,255,255,255,
  255,255,255,255,59,9,8,255,255,255,255,255,255,255,255,255,255,255,255,255,
  1,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,143,30,8,255,
  255,255,255,255,255,255,255,255,255,255,255,255,57,9,8,255,255,255,255,255,
  255,255,255,255,255,255,255,255,127,21,8,255,255,255,255,255,255,255,255,255,
  255,255,255,255,1,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,
  1,0,0,255,255,255,255,255,255,255,255,255,255,255,255,255,143,30,8,255,
  255,255,255,255,255,255,255,255,255,255,255,255,133,7,8,255,255,255,255,255,
  255,255,255,255,255,255,255,255,1,0,192,255,255,255,255,255,255,255,255,255,
  255,255,255,255,143,30,8,255,255,255,255,255,255,255,255,255,255,255,255,255,
  209,8,8,255,255,255,255,255,255,255,255,255,255,255,255,255,1,0,0,255,
  255,255,255,255,255,255,255,255,255,255,255,255,143,30,8,0,0,11,116,98,
  105,116,109,97,112,99,111,109,112,7,109,115,101,105,99,111,110,23,98,105,
  116,109,97,112,46,116,114,97,110,115,112,97,114,101,110,116,99,111,108,111,
  114,4,6,0,0,128,14,98,105,116,109,97,112,46,111,112,116,105,111,110,
  115,11,10,98,109,111,95,109,97,115,107,101,100,0,12,98,105,116,109,97,
  112,46,105,109,97,103,101,10,116,7,0,0,0,0,0,0,2,0,0,0,
  24,0,0,0,24,0,0,0,224,6,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,5,207,53,11,2,210,66,27,1,209,60,20,1,
  207,53,11,4,209,60,19,1,218,100,68,1,208,55,14,1,207,53,11,2,
  0,0,0,10,207,53,11,2,204,41,0,1,230,147,124,1,231,151,129,1,
  202,34,0,1,207,50,8,1,207,52,10,1,204,41,0,1,215,90,56,1,
  255,255,255,1,209,63,23,1,206,47,4,1,207,53,11,3,0,0,0,7,
  207,53,11,3,203,35,0,1,232,161,142,1,255,255,255,1,211,66,27,1,
  204,38,0,1,205,45,2,1,204,40,0,1,236,175,158,1,255,255,255,1,
  218,98,63,1,205,42,0,1,207,52,10,1,207,52,11,1,207,53,11,2,
  0,0,0,5,207,53,11,1,207,51,9,1,206,47,4,1,205,45,2,1,
  201,28,0,1,228,145,121,1,255,255,255,1,249,230,224,1,212,68,30,1,
  201,28,0,1,222,113,84,1,255,255,255,2,217,101,68,1,203,34,0,1,
  206,49,5,1,206,48,5,1,207,50,8,1,206,47,3,1,205,45,2,1,
  0,0,0,3,207,53,11,2,207,50,7,1,210,64,25,1,228,141,118,1,
  207,51,9,1,224,126,98,1,255,255,255,2,228,145,121,1,198,15,0,1,
  250,231,225,1,255,255,255,2,216,95,62,1,229,149,128,1,224,126,99,1,
  202,33,0,1,206,46,2,1,211,67,28,1,218,98,67,1,215,82,45,1,
  0,0,0,1,207,53,11,1,207,52,10,1,207,53,11,1,207,50,7,1,
  210,71,33,1,253,247,244,1,243,208,198,1,214,78,42,1,237,178,162,1,
  255,255,255,1,250,233,228,1,205,44,0,1,255,255,255,3,217,95,61,1,
  253,248,247,1,225,130,104,1,208,58,17,1,237,180,163,1,255,255,255,2,
  228,141,116,1,0,0,0,1,211,68,28,1,207,51,10,1,207,53,11,1,
  207,51,9,1,204,38,0,1,211,71,31,1,255,255,255,1,251,238,233,1,
  217,100,68,1,228,141,119,1,252,238,235,1,223,120,93,1,246,215,207,1,
  255,255,255,2,206,44,2,1,213,71,35,1,229,145,123,1,255,255,255,3,
  217,91,57,1,202,35,0,1,207,53,11,1,208,57,15,1,207,51,10,1,
  207,52,11,2,207,49,7,1,199,18,0,1,255,255,255,3,232,159,138,1,
  225,127,100,1,226,101,71,1,228,105,74,1,255,219,211,1,255,255,255,1,
  207,52,9,1,238,184,169,1,255,255,255,3,242,199,187,1,202,27,0,1,
  206,49,6,1,207,53,11,2,207,52,11,1,205,43,0,1,202,33,0,1,
  199,22,0,1,195,1,0,1,250,230,224,1,255,255,255,3,238,144,121,1,
  210,53,11,1,0,252,255,1,208,104,72,1,243,129,101,1,222,62,23,1,
  255,239,236,1,255,255,255,3,219,102,69,1,202,33,0,1,206,48,5,1,
  207,53,11,3,204,40,0,1,250,232,230,1,255,255,255,1,252,239,236,1,
  215,87,52,1,247,226,218,1,255,255,255,2,248,165,145,1,0,252,255,3,
  204,48,4,1,96,150,131,1,175,88,55,1,252,199,189,1,247,220,214,1,
  218,101,68,1,208,54,13,1,211,67,29,1,210,64,26,1,208,59,18,1,
  207,53,11,2,204,40,0,1,219,101,69,1,245,215,207,1,255,255,255,1,
  232,157,136,1,223,117,90,1,247,207,197,1,250,193,181,1,231,93,60,1,
  169,88,53,1,0,252,255,1,192,85,50,1,176,102,72,1,0,252,255,2,
  228,85,49,1,223,120,91,1,235,175,158,1,252,244,239,1,255,255,255,1,
  250,235,231,1,217,95,62,1,207,53,11,1,206,49,7,1,205,43,0,1,
  201,28,0,1,201,32,0,1,209,59,19,1,207,51,8,1,197,11,0,1,
  208,22,0,1,0,252,255,1,222,109,78,1,166,97,66,1,222,109,78,1,
  206,193,182,1,225,80,43,1,68,225,220,1,0,252,255,1,244,154,132,1,
  255,255,255,4,235,173,157,1,212,73,36,1,208,56,14,1,207,54,12,1,
  209,62,22,1,213,82,45,1,230,148,125,1,255,255,255,3,0,252,255,3,
  222,109,78,1,0,252,255,2,218,132,106,1,209,55,15,1,228,65,24,1,
  247,176,158,1,250,234,230,1,249,234,227,1,234,168,150,1,202,29,0,1,
  202,31,0,1,207,53,11,1,215,88,53,1,247,219,211,1,254,247,246,1,
  255,255,254,1,255,255,255,3,242,202,190,1,226,106,75,1,0,252,255,1,
  222,109,78,1,188,76,41,1,213,99,69,1,220,140,117,1,208,85,50,1,
  19,255,255,1,0,252,255,1,226,83,46,1,225,129,102,1,212,79,43,1,
  202,32,0,1,204,41,0,1,207,52,10,1,207,53,11,1,213,81,44,1,
  244,212,202,1,255,255,255,4,246,214,205,1,216,86,51,1,239,183,169,1,
  255,241,237,1,238,115,84,1,183,80,44,1,0,252,255,1,154,112,84,1,
  156,129,103,1,0,255,255,1,0,252,255,1,243,159,139,1,255,255,255,1,
  245,214,205,1,216,88,51,1,203,35,0,1,207,51,9,1,207,53,11,2,
  202,29,0,1,200,20,0,1,200,22,0,1,203,33,0,1,204,37,0,1,
  208,60,18,1,247,224,216,1,255,255,255,2,249,198,186,1,0,252,255,3,
  234,47,2,1,228,73,34,1,232,65,25,1,255,241,237,1,255,255,255,3,
  206,51,7,1,205,45,1,1,207,53,11,2,207,52,11,1,207,52,10,1,
  207,51,9,1,206,50,8,1,202,33,0,1,226,132,108,1,255,255,255,3,
  236,155,134,1,223,67,28,1,0,252,255,1,218,117,90,1,255,220,212,1,
  232,150,128,1,209,61,21,1,227,135,110,1,239,190,178,1,252,245,243,1,
  255,255,255,1,233,159,138,1,205,45,2,1,207,53,11,5,207,52,10,1,
  201,26,0,1,239,187,174,1,255,255,255,2,247,219,209,1,221,105,74,1,
  252,227,221,1,214,61,20,1,255,236,231,1,255,255,255,1,242,196,185,1,
  228,143,119,1,232,158,138,1,203,32,0,1,211,74,36,1,231,157,136,1,
  236,178,161,1,207,56,15,1,207,53,11,1,0,0,0,1,207,53,11,3,
  206,48,5,1,201,29,0,1,255,255,255,2,248,228,223,1,203,39,0,1,
  236,177,160,1,255,255,255,1,210,66,27,1,252,246,243,1,255,255,255,1,
  247,223,216,1,215,81,45,1,218,93,61,1,204,41,0,1,205,43,0,1,
  204,37,0,1,204,39,0,1,206,45,2,1,0,0,0,2,207,53,11,2,
  207,52,10,1,204,40,0,1,218,102,71,1,255,255,255,1,246,212,203,1,
  215,80,44,1,203,35,0,1,242,199,187,1,255,255,255,1,214,85,51,1,
  230,151,129,1,255,255,255,2,219,106,76,1,202,35,0,1,206,49,6,1,
  207,53,11,3,0,0,0,4,207,53,11,1,207,52,10,1,206,49,6,1,
  242,195,182,1,249,226,220,1,213,73,36,1,203,37,0,1,204,44,1,1,
  242,200,187,1,255,255,255,1,214,81,45,1,206,47,6,1,237,178,161,1,
  255,255,255,1,241,199,188,1,205,45,1,1,206,48,5,1,207,53,11,3,
  0,0,0,5,207,52,10,1,207,48,6,1,212,74,36,1,202,33,0,1,
  205,41,0,1,206,49,6,1,203,37,0,1,236,174,157,1,255,255,255,1,
  202,28,0,1,204,39,0,1,200,20,0,1,246,216,208,1,255,255,255,1,
  220,102,71,1,205,42,0,1,207,53,11,2,0,0,0,8,207,51,9,2,
  207,53,11,1,207,52,11,1,204,39,0,1,228,143,118,1,255,250,249,1,
  201,26,0,1,207,52,10,1,204,39,0,1,215,88,52,1,255,252,249,1,
  231,152,132,1,204,38,0,1,0,0,0,11,207,53,11,4,213,80,44,1,
  217,95,62,1,207,53,11,3,208,58,17,1,223,121,93,1,224,127,101,1,
  0,0,0,6,224,255,3,9,240,255,15,8,248,255,31,191,252,255,63,8,
  254,255,127,0,255,255,127,9,255,255,255,3,255,255,255,192,255,255,255,0,
  255,255,255,9,255,255,255,191,255,255,255,8,255,255,255,9,255,255,255,9,
  255,255,255,191,255,255,255,8,255,255,255,0,255,255,255,3,254,255,127,64,
  254,255,63,0,252,255,63,0,248,255,31,191,224,255,7,0,192,255,3,8,
  4,108,101,102,116,2,40,3,116,111,112,2,8,0,0,0)
 );

initialization
 registerobjectdata(@objdata,tstockdata,'');
end.
