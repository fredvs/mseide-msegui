unit componentpaletteform_mfm;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface

implementation
uses
 mseclasses,componentpaletteform;

const
 objdata: record size: integer; data: array[0..3825] of byte end =
      (size: 3826; data: (
  84,80,70,48,19,116,99,111,109,112,111,110,101,110,116,112,97,108,101,116,
  116,101,102,111,18,99,111,109,112,111,110,101,110,116,112,97,108,101,116,116,
  101,102,111,13,111,112,116,105,111,110,115,119,105,100,103,101,116,11,13,111,
  119,95,97,114,114,111,119,102,111,99,117,115,11,111,119,95,115,117,98,102,
  111,99,117,115,17,111,119,95,100,101,115,116,114,111,121,119,105,100,103,101,
  116,115,9,111,119,95,104,105,110,116,111,110,12,111,119,95,97,117,116,111,
  115,99,97,108,101,0,8,98,111,117,110,100,115,95,120,3,131,0,8,98,
  111,117,110,100,115,95,121,3,33,1,9,98,111,117,110,100,115,95,99,120,
  3,226,2,9,98,111,117,110,100,115,95,99,121,2,69,15,102,114,97,109,
  101,46,103,114,105,112,95,115,105,122,101,2,10,18,102,114,97,109,101,46,
  103,114,105,112,95,111,112,116,105,111,110,115,11,14,103,111,95,99,108,111,
  115,101,98,117,116,116,111,110,16,103,111,95,102,105,120,115,105,122,101,98,
  117,116,116,111,110,12,103,111,95,116,111,112,98,117,116,116,111,110,0,11,
  102,114,97,109,101,46,100,117,109,109,121,2,0,8,116,97,98,111,114,100,
  101,114,2,1,7,118,105,115,105,98,108,101,8,23,99,111,110,116,97,105,
  110,101,114,46,111,112,116,105,111,110,115,119,105,100,103,101,116,11,13,111,
  119,95,109,111,117,115,101,102,111,99,117,115,11,111,119,95,116,97,98,102,
  111,99,117,115,13,111,119,95,97,114,114,111,119,102,111,99,117,115,11,111,
  119,95,115,117,98,102,111,99,117,115,19,111,119,95,109,111,117,115,101,116,
  114,97,110,115,112,97,114,101,110,116,17,111,119,95,100,101,115,116,114,111,
  121,119,105,100,103,101,116,115,12,111,119,95,97,117,116,111,115,99,97,108,
  101,0,18,99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,95,
  120,2,0,18,99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,115,
  95,121,2,0,19,99,111,110,116,97,105,110,101,114,46,98,111,117,110,100,
  115,95,99,120,3,216,2,19,99,111,110,116,97,105,110,101,114,46,98,111,
  117,110,100,115,95,99,121,2,69,21,99,111,110,116,97,105,110,101,114,46,
  102,114,97,109,101,46,100,117,109,109,121,2,0,23,99,111,110,116,97,105,
  110,101,114,46,111,110,99,104,105,108,100,115,99,97,108,101,100,7,27,99,
  111,109,112,111,110,101,110,116,103,114,111,117,112,111,110,99,104,105,108,100,
  115,99,97,108,101,100,17,100,114,97,103,100,111,99,107,46,116,97,98,95,
  115,105,122,101,2,0,16,100,114,97,103,100,111,99,107,46,99,97,112,116,
  105,111,110,6,17,67,111,109,112,111,110,101,110,116,32,80,97,108,101,116,
  116,101,20,100,114,97,103,100,111,99,107,46,111,112,116,105,111,110,115,100,
  111,99,107,11,10,111,100,95,115,97,118,101,112,111,115,13,111,100,95,115,
  97,118,101,122,111,114,100,101,114,10,111,100,95,99,97,110,109,111,118,101,
  11,111,100,95,99,97,110,102,108,111,97,116,10,111,100,95,99,97,110,100,
  111,99,107,15,111,100,95,112,114,111,112,111,114,116,105,111,110,97,108,11,
  111,100,95,112,114,111,112,115,105,122,101,0,7,111,112,116,105,111,110,115,
  11,10,102,111,95,115,97,118,101,112,111,115,13,102,111,95,115,97,118,101,
  122,111,114,100,101,114,12,102,111,95,115,97,118,101,115,116,97,116,101,0,
  8,115,116,97,116,102,105,108,101,7,22,109,97,105,110,102,111,46,112,114,
  111,106,101,99,116,115,116,97,116,102,105,108,101,21,105,99,111,110,46,116,
  114,97,110,115,112,97,114,101,110,116,99,111,108,111,114,4,6,0,0,128,
  12,105,99,111,110,46,111,112,116,105,111,110,115,11,10,98,109,111,95,109,
  97,115,107,101,100,0,10,105,99,111,110,46,105,109,97,103,101,10,248,7,
  0,0,0,0,0,0,2,0,0,0,24,0,0,0,24,0,0,0,100,7,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,
  0,0,0,0,0,0,0,0,0,0,0,0,0,0,208,208,208,10,255,255,
  255,10,208,208,208,4,255,255,255,11,208,208,208,1,183,183,183,1,198,198,
  198,1,202,202,202,1,200,200,200,1,208,208,208,3,133,133,133,1,208,208,
  208,4,255,255,255,1,186,186,186,1,175,175,175,1,193,193,193,1,208,208,
  208,5,133,133,133,1,255,255,255,1,172,172,172,1,135,135,135,1,141,141,
  141,1,148,148,148,1,129,129,129,1,208,208,208,3,133,133,133,1,208,208,
  208,4,255,255,255,1,157,157,157,1,141,141,141,1,138,138,138,1,148,148,
  148,1,137,137,137,1,208,208,208,3,133,133,133,1,255,255,255,1,197,197,
  197,1,196,196,196,1,189,189,189,1,185,185,185,1,181,181,181,1,208,208,
  208,3,133,133,133,1,208,208,208,4,255,255,255,1,192,192,192,1,179,179,
  179,1,189,189,189,1,188,188,188,1,179,179,179,1,208,208,208,3,133,133,
  133,15,245,245,245,1,243,243,243,1,242,242,242,1,232,238,238,1,238,238,
  238,1,237,237,237,1,235,235,235,1,234,234,234,1,232,232,232,1,230,230,
  230,1,229,229,229,1,227,227,227,1,226,226,226,1,224,224,224,1,223,223,
  223,1,221,221,221,1,219,219,219,1,218,218,218,1,216,216,216,1,215,215,
  215,1,213,213,213,1,211,211,211,1,210,210,210,1,208,208,208,1,245,245,
  245,1,199,232,232,1,71,203,205,1,30,196,199,1,58,200,202,1,184,225,
  225,1,235,235,235,1,234,234,234,1,232,232,232,1,230,230,230,1,229,229,
  229,1,227,227,227,1,226,226,226,1,206,220,220,1,100,203,204,1,29,191,
  193,1,90,200,201,1,197,215,215,1,216,216,216,1,215,215,215,1,213,213,
  213,1,211,211,211,1,210,210,210,1,208,208,208,1,241,244,244,1,35,195,
  197,1,98,232,244,1,122,241,255,1,69,233,246,1,23,195,197,1,219,231,
  231,1,234,234,234,1,232,232,232,1,230,230,230,1,229,229,229,1,227,227,
  227,1,225,226,226,1,33,192,193,1,74,221,232,1,110,241,255,1,51,223,
  235,1,23,190,192,1,211,215,215,1,215,215,215,1,213,213,213,1,211,211,
  211,1,210,210,210,1,208,208,208,1,169,226,226,1,62,212,219,1,180,243,
  255,1,193,243,255,1,123,241,255,1,31,217,227,1,133,213,214,1,234,234,
  234,1,232,232,232,1,230,230,230,1,229,229,229,1,227,227,227,1,168,214,
  214,1,56,208,214,1,172,242,255,1,182,243,255,1,117,241,255,1,28,211,
  219,1,146,206,206,1,215,215,215,1,213,213,213,1,211,211,211,1,210,210,
  210,1,208,208,208,1,96,210,211,1,82,226,237,1,192,243,255,1,208,244,
  255,1,129,241,255,1,38,230,244,1,65,201,203,1,218,218,232,1,131,131,
  225,1,230,230,230,1,229,229,229,1,227,227,227,1,88,203,204,1,84,226,
  237,1,197,243,255,1,208,245,255,1,131,241,255,1,37,229,242,1,65,196,
  198,1,208,208,215,1,149,149,214,1,211,211,211,1,210,210,210,1,208,208,
  208,1,191,231,231,1,46,207,213,1,134,241,255,1,142,241,255,1,93,240,
  255,1,21,212,221,1,156,218,218,1,106,106,227,1,14,14,220,1,221,221,
  229,1,229,229,229,1,227,227,227,1,160,214,214,1,49,209,216,1,145,242,
  255,1,153,242,255,1,100,240,255,1,21,213,222,1,136,205,205,1,115,115,
  217,1,21,21,219,1,209,209,211,1,210,210,210,1,208,208,208,1,245,245,
  245,1,41,196,198,1,45,218,228,1,65,237,253,1,27,220,231,1,27,193,
  194,1,219,224,233,1,25,25,223,1,8,8,240,1,119,119,225,1,229,229,
  229,1,227,227,227,1,223,225,225,1,28,193,194,1,59,227,240,1,79,240,
  255,1,36,228,242,1,22,193,194,1,205,211,214,1,28,28,221,1,12,12,
  235,1,135,135,214,1,210,210,210,1,208,208,208,1,245,245,245,1,233,241,
  241,1,131,216,217,1,37,196,197,1,115,212,213,1,223,234,234,1,122,122,
  228,1,8,8,239,1,4,4,255,1,29,29,223,1,225,225,229,1,227,227,
  227,1,226,226,226,1,191,217,217,1,74,199,200,1,24,193,195,1,66,196,
  198,1,181,212,212,1,131,131,217,1,11,11,237,1,4,4,253,1,32,32,
  220,1,210,210,210,1,208,208,208,1,245,245,245,1,243,243,243,1,242,242,
  242,1,240,240,240,1,238,238,238,1,232,232,236,1,26,26,223,1,4,4,
  254,1,4,4,255,1,10,10,238,1,134,134,225,1,227,227,227,1,226,226,
  226,1,224,224,224,1,223,223,223,1,219,220,220,1,219,219,219,1,217,217,
  218,1,31,31,221,1,4,4,254,1,4,4,255,1,14,14,233,1,145,145,
  212,1,208,208,208,1,245,245,245,1,243,243,243,1,242,242,242,1,240,240,
  240,1,238,238,238,1,138,138,230,1,10,10,237,1,4,4,255,2,4,4,
  254,1,32,32,223,1,225,225,227,1,226,226,226,1,224,224,224,1,223,223,
  223,1,221,221,221,1,219,219,219,1,147,147,218,1,14,14,234,1,4,4,
  255,2,4,4,252,1,35,35,219,1,208,208,208,1,245,245,245,1,194,33,
  31,1,201,29,31,1,200,28,30,1,199,28,31,1,38,5,182,1,25,5,
  200,1,32,32,225,3,21,21,221,1,164,164,224,1,226,226,226,1,196,51,
  49,1,197,37,37,3,33,6,188,1,18,6,211,1,23,23,226,3,10,10,
  218,1,157,157,210,1,245,245,245,1,203,38,40,1,255,0,32,4,202,39,
  41,1,234,234,234,1,232,232,232,1,230,230,230,1,229,229,229,1,227,227,
  227,1,226,226,226,1,201,36,38,1,255,0,32,3,239,0,44,1,187,34,
  49,1,202,202,215,1,200,200,213,1,198,198,211,1,197,197,210,1,202,202,
  208,1,245,245,245,1,203,38,40,1,255,0,32,4,202,39,41,1,234,234,
  234,1,232,232,232,1,230,230,230,1,229,229,229,1,227,227,227,1,226,226,
  226,1,201,36,38,1,255,0,32,4,199,36,38,1,215,215,215,1,213,213,
  213,1,211,211,211,1,210,210,210,1,208,208,208,1,245,245,245,1,203,38,
  40,1,255,0,32,4,202,39,41,1,234,234,234,1,232,232,232,1,230,230,
  230,1,229,229,229,1,227,227,227,1,226,226,226,1,201,36,38,1,255,0,
  32,4,199,36,38,1,215,215,215,1,213,213,213,1,211,211,211,1,210,210,
  210,1,208,208,208,1,245,245,245,1,203,38,40,1,255,0,32,4,202,39,
  41,1,234,234,234,1,232,232,232,1,230,230,230,1,229,229,229,1,227,227,
  227,1,226,226,226,1,201,36,38,1,255,0,32,4,199,36,38,1,215,215,
  215,1,213,213,213,1,211,211,211,1,210,210,210,1,208,208,208,1,245,245,
  245,1,200,55,54,1,203,40,42,2,202,39,41,2,200,57,56,1,234,234,
  234,1,232,232,232,1,230,230,230,1,229,229,229,1,227,227,227,1,226,226,
  226,1,191,30,28,1,202,27,31,1,201,26,30,3,192,34,32,1,215,215,
  215,1,213,213,213,1,211,211,211,1,210,210,210,1,208,208,208,1,245,245,
  245,1,243,243,243,1,242,242,242,1,240,240,240,1,238,238,238,1,237,237,
  237,1,235,235,235,1,234,234,234,1,232,232,232,1,230,230,230,1,229,229,
  229,1,227,227,227,1,226,226,226,1,224,224,224,1,223,223,223,1,221,221,
  221,1,219,219,219,1,218,218,218,1,216,216,216,1,215,215,215,1,213,213,
  213,1,211,211,211,1,210,210,210,1,208,208,208,1,245,245,245,1,243,243,
  243,1,242,242,242,1,240,240,240,1,238,238,238,1,237,237,237,1,235,235,
  235,1,234,234,234,1,232,232,232,1,230,230,230,1,229,229,229,1,227,227,
  227,1,226,226,226,1,224,224,224,1,223,223,223,1,221,221,221,1,219,219,
  219,1,218,218,218,1,216,216,216,1,215,215,215,1,213,213,213,1,211,211,
  211,1,210,210,210,1,208,208,208,1,245,245,245,1,243,243,243,1,242,242,
  242,1,240,240,240,1,238,238,238,1,237,237,237,1,235,235,235,1,234,234,
  234,1,232,232,232,1,230,230,230,1,229,229,229,1,227,227,227,1,226,226,
  226,1,224,224,224,1,223,223,223,1,221,221,221,1,219,219,219,1,218,218,
  218,1,216,216,216,1,215,215,215,1,213,213,213,1,211,211,211,1,210,210,
  210,1,208,208,208,1,255,255,255,8,255,255,255,8,255,255,255,191,255,255,
  255,8,255,255,255,0,255,255,255,8,255,255,255,3,255,255,255,192,255,255,
  255,0,255,255,255,10,255,255,255,0,255,255,255,8,255,255,255,8,255,255,
  255,8,255,255,255,191,255,255,255,8,255,255,255,0,255,255,255,3,255,255,
  255,8,255,255,255,0,255,255,255,0,255,255,255,191,255,255,255,0,255,255,
  255,8,10,111,110,115,116,97,116,114,101,97,100,7,12,102,111,111,110,114,
  101,97,100,115,116,97,116,13,111,110,99,104,105,108,100,115,99,97,108,101,
  100,7,27,99,111,109,112,111,110,101,110,116,103,114,111,117,112,111,110,99,
  104,105,108,100,115,99,97,108,101,100,15,109,111,100,117,108,101,99,108,97,
  115,115,110,97,109,101,6,9,116,100,111,99,107,102,111,114,109,0,8,116,
  116,111,111,108,98,97,114,16,99,111,109,112,111,110,101,110,116,112,97,108,
  101,116,116,101,13,111,112,116,105,111,110,115,119,105,100,103,101,116,11,13,
  111,119,95,109,111,117,115,101,102,111,99,117,115,11,111,119,95,116,97,98,
  102,111,99,117,115,13,111,119,95,97,114,114,111,119,102,111,99,117,115,17,
  111,119,95,100,101,115,116,114,111,121,119,105,100,103,101,116,115,9,111,119,
  95,104,105,110,116,111,110,0,11,111,112,116,105,111,110,115,115,107,105,110,
  11,13,111,115,107,95,99,111,110,116,97,105,110,101,114,0,8,98,111,117,
  110,100,115,95,120,2,0,8,98,111,117,110,100,115,95,121,2,26,9,98,
  111,117,110,100,115,95,99,120,3,216,2,9,98,111,117,110,100,115,95,99,
  121,2,30,11,102,114,97,109,101,46,100,117,109,109,121,2,0,7,97,110,
  99,104,111,114,115,11,6,97,110,95,116,111,112,9,97,110,95,98,111,116,
  116,111,109,0,8,116,97,98,111,114,100,101,114,2,1,13,98,117,116,116,
  111,110,115,46,119,105,100,116,104,2,26,14,98,117,116,116,111,110,115,46,
  104,101,105,103,104,116,2,26,7,111,112,116,105,111,110,115,11,14,116,98,
  111,95,100,114,97,103,115,111,117,114,99,101,12,116,98,111,95,100,114,97,
  103,100,101,115,116,0,15,111,110,98,117,116,116,111,110,99,104,97,110,103,
  101,100,7,29,99,111,109,112,111,110,101,110,116,112,97,108,101,116,116,101,
  98,117,116,116,111,110,99,104,97,110,103,101,100,20,100,114,97,103,46,111,
  110,97,102,116,101,114,100,114,97,103,100,114,111,112,7,24,99,111,109,112,
  111,110,101,110,116,112,97,108,101,116,116,101,100,114,97,103,100,114,111,112,
  4,108,101,102,116,3,128,0,3,116,111,112,2,8,0,0,7,116,116,97,
  98,98,97,114,14,99,111,109,112,111,110,101,110,116,112,97,103,101,115,13,
  111,112,116,105,111,110,115,119,105,100,103,101,116,11,15,111,119,95,97,114,
  114,111,119,102,111,99,117,115,105,110,16,111,119,95,97,114,114,111,119,102,
  111,99,117,115,111,117,116,17,111,119,95,100,101,115,116,114,111,121,119,105,
  100,103,101,116,115,18,111,119,95,102,111,110,116,103,108,121,112,104,104,101,
  105,103,104,116,12,111,119,95,97,117,116,111,115,99,97,108,101,0,8,98,
  111,117,110,100,115,95,120,2,0,8,98,111,117,110,100,115,95,121,2,0,
  9,98,111,117,110,100,115,95,99,120,3,216,2,9,98,111,117,110,100,115,
  95,99,121,2,18,12,98,111,117,110,100,115,95,99,121,109,105,110,2,15,
  11,102,114,97,109,101,46,100,117,109,109,121,2,0,7,97,110,99,104,111,
  114,115,11,6,97,110,95,116,111,112,0,8,115,116,97,116,102,105,108,101,
  7,22,109,97,105,110,102,111,46,112,114,111,106,101,99,116,115,116,97,116,
  102,105,108,101,17,111,110,97,99,116,105,118,101,116,97,98,99,104,97,110,
  103,101,7,29,99,111,109,112,111,110,101,110,116,112,97,103,101,115,97,99,
  116,105,118,101,116,97,98,99,104,97,110,103,101,7,111,112,116,105,111,110,
  115,11,15,116,97,98,111,95,100,114,97,103,115,111,117,114,99,101,13,116,
  97,98,111,95,100,114,97,103,100,101,115,116,0,4,108,101,102,116,3,128,
  0,3,116,111,112,2,72,13,114,101,102,102,111,110,116,104,101,105,103,104,
  116,2,14,0,0,0)
 );

initialization
 registerobjectdata(@objdata,tcomponentpalettefo,'');
end.
