{ MSEgui Copyright (c) 2007-2012 by Martin Schreiber

    See the file COPYING.MSE, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}
unit msessl;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}
interface
uses
 classes,msecryptio,mseopenssl,msestrings,msesystypes,msecryptohandler,
 msestream;
type
 
 essl = class(ecryptoio)
 end;
  
 ssldataty = record
  ssl: pssl;
  mutex: mutexty;  
 end;

 sslinfoty = record
  case integer of
   0: (d: ssldataty);
   1: (_bufferspace: cryptodataty);
 end;
 {$if sizeof(ssldataty) > sizeof(cryptodataty)}
  {$error 'buffer overflow'}
 {$endif}
 
 sslprotocolty = (ssp_sslv2,ssp_sslv3,ssp_tlsv1);
 sslprotocolsty = set of sslprotocolty;
const
 defaultsslprotocols = [ssp_sslv2,ssp_sslv3,ssp_tlsv1];
 defaultcipherlist = 'DEFAULT';
 
type

 tssl = class(tcryptoio)
  private
   fctx: pssl_ctx;
   fprotocols: sslprotocolsty;
   fcipherlist: tstringlist;
   fcertfile: filenamety;
   fprivkeyfile: filenamety;
   procedure ctxchanged;
   procedure setcipherlist(const avalue: tstringlist);
  protected
   class procedure internalunlink(var ainfo: cryptoioinfoty); override;
   class procedure internalthreadterminate; override;
   class procedure connect(var ainfo: cryptoioinfoty; const atimeoutms: integer);  override;
   class procedure accept(var ainfo: cryptoioinfoty; const atimeoutms: integer);  override;
   class function write(var ainfo: cryptoioinfoty; const buffer: pointer;
           const count: integer; const atimeoutms: integer): integer; override;
   class function read(var ainfo: cryptoioinfoty; const buffer: pointer; const count: integer; 
                  const atimeoutms: integer): integer; override;
  public
   constructor create(aowner: tcomponent); override;
   destructor destroy; override;
   procedure link(const arxfd,atxfd: integer; out ainfo: cryptoioinfoty); override;
  published
   property protocols: sslprotocolsty read fprotocols write fprotocols default
                                   defaultsslprotocols;
   property cipherlist: tstringlist read fcipherlist write setcipherlist;
   property certfile: filenamety read fcertfile write fcertfile;
   property privkeyfile: filenamety read fprivkeyfile write fprivkeyfile;
 end;

 sslhandlerdatadty = record
  bio: pbio;
 end;
 psslhandlerdataty = ^sslhandlerdataty;
 {$if sizeof(sslhandlerdatadty) > sizeof(cryptohandlerdataty)} 
  {$error 'buffer overflow'}
 {$endif}
 sslhandlerdataty = record
  case integer of
   0: (d: sslhandlerdatadty;);
   1: (_bufferspace: cryptohandlerdataty;);
 end;
 
 tsslcryptohandler = class(tbasecryptohandler)
  protected
   procedure checkerror;
   procedure clearerror; inline;
   procedure open(var aclient: cryptoclientinfoty); override;
   procedure close(var aclient: cryptoclientinfoty);  override;
   function read(var aclient: cryptoclientinfoty;
                   var buffer; count: longint): longint; override;
   function write(var aclient: cryptoclientinfoty;
                   const buffer; count: longint): longint; override;
   function seek(var aclient: cryptoclientinfoty;
                   const offset: int64; origin: tseekorigin): int64; override;
 end;
 
function waitforio(const aerror: integer; var ainfo: cryptoioinfoty; 
              const atimeoutms: integer; const resultpo: pinteger = nil): boolean;
 
implementation
uses
 sysutils,msesysintf1,msefileutils,msesocketintf,msesys,mseopensslbio;
 
procedure raiseerror(errco : integer);
var
 buf: array [0..255] of char;
 str1: string;
begin
 str1:= 'SSL error.';
 repeat
  err_error_string_n(errco,@buf,sizeof(buf));
  str1:= str1 + lineend + buf;
  errco:= err_get_error();
 until errco = 0;
 raise essl.create(str1);
end;

procedure sslerror(const aerror: integer);
begin
 if aerror <> 1 then begin
  raiseerror(err_get_error());
 end;
end;

{ tssl }

constructor tssl.create(aowner: tcomponent);
begin
 fprotocols:= defaultsslprotocols;
 fcipherlist:= tstringlist.create;
 fcipherlist.text:= defaultcipherlist;
 inherited;
end;

destructor tssl.destroy;
begin
 inherited;
 if fctx <> nil then begin
  ssl_ctx_free(fctx);
  fctx:= nil;
 end;
 fcipherlist.free;
end;

procedure tssl.ctxchanged;
begin
 if fctx <> nil then begin
  
 end;
end;

procedure tssl.link(const arxfd,atxfd: integer; out ainfo: cryptoioinfoty);
var
 int1: integer;
 str1: string;
begin
 inherited;
 if fctx = nil then begin
  initsslinterface;
  fctx:= ssl_ctx_new(sslv23_method());
  if fctx = nil then begin
   sslerror(0);
  end;
  ctxchanged;
 end;
 with ainfo,sslinfoty(cryptodata).d do begin
  ssl:= ssl_new(fctx);
  if ssl = nil then begin
   sslerror(0);
  end;
  sys_mutexcreate(mutex);
  int1:= 0;
  if not (ssp_sslv2 in fprotocols) then begin
   int1:= int1 or ssl_op_no_sslv2;
  end;
  if not (ssp_sslv3 in fprotocols) then begin
   int1:= int1 or ssl_op_no_sslv3;
  end;
  if not (ssp_tlsv1 in fprotocols) then begin
   int1:= int1 or ssl_op_no_tlsv1;
  end;
  if int1 <> 0 then begin
   ssl_set_options(ssl,int1);
  end;
  str1:= '';
  for int1:= 0 to fcipherlist.count - 1 do begin
   str1:= str1 + fcipherlist[int1] + ':';
  end;
  setlength(str1,length(str1)-1);
  sslerror(ssl_set_cipher_list(ssl,pchar(str1)));
  if fcertfile <> '' then begin
   str1:= tosysfilepath(filepath(fcertfile));
   sslerror(ssl_use_certificate_file(ssl,pchar(str1),ssl_filetype_pem));
  end;
  if fprivkeyfile <> '' then begin
   str1:= tosysfilepath(filepath(fprivkeyfile));
   sslerror(ssl_use_privatekey_file(ssl,pchar(str1),ssl_filetype_pem));
  end;
  sslerror(ssl_set_rfd(ssl,rxfd));
  sslerror(ssl_set_wfd(ssl,txfd));
 end; 
end;

class procedure tssl.internalunlink(var ainfo: cryptoioinfoty);
begin //todo: shutdown
 with ainfo,sslinfoty(cryptodata).d do begin
  if ssl <> nil then begin
   ssl_free(ssl);
  end;
  sys_mutexdestroy(mutex);
 end;
 inherited;
end;

class procedure tssl.internalthreadterminate;
begin
 err_remove_state(0);
 inherited;
end;

function {tssl.}waitforio(const aerror: integer; var ainfo: cryptoioinfoty; 
       const atimeoutms: integer; const resultpo: pinteger = nil): boolean;
var
 int1: integer;
 err1: syserrorty;
 pollres: pollkindsty;
begin
 with ainfo,sslinfoty(cryptodata).d do begin
  sys_mutexunlock(mutex);
  result:= (aerror > 0);
  if not result then begin
   if aerror < 0 then begin
    err1:= sye_ok;
    int1:= ssl_get_error(ssl,aerror);
    if (int1 = ssl_error_want_read) then begin
     if atimeoutms >= 0 then begin
      err1:= soc_poll(rxfd,[poka_read],atimeoutms,pollres);
     end;
    end
    else begin
     if (int1 = ssl_error_want_write) then begin
      if atimeoutms >= 0 then begin
       err1:= soc_poll(txfd,[poka_write],atimeoutms,pollres);
      end;
     end
     else begin
      raiseerror(int1);
     end;
    end;
    if err1 <> sye_ok then begin
     syserror(err1);
    end;
   end
   else begin
    sslerror(aerror);
   end;
  end;
 end;
 if resultpo <> nil then begin
  if (atimeoutms < 0) and (aerror < 0) then begin
   resultpo^:= 0;
  end
  else begin
   resultpo^:= aerror;
  end;
 end;
end;

class procedure tssl.connect(var ainfo: cryptoioinfoty;
                                              const atimeoutms: integer);
//var
// int1,int2: integer;
// err1: syserrorty;
begin
 with ainfo,sslinfoty(cryptodata).d do begin
  repeat
   sys_mutexlock(mutex);
  until waitforio(ssl_connect(ssl),ainfo,atimeoutms);
 end;
end;

class procedure tssl.accept(var ainfo: cryptoioinfoty;
                                                 const atimeoutms: integer);
//var
// int1{,int2}: integer;
// err1: syserrorty;
begin
 with ainfo,sslinfoty(cryptodata).d do begin
  repeat
   sys_mutexlock(mutex);
  until waitforio(ssl_accept(ssl),ainfo,atimeoutms);
 end;
end;

procedure tssl.setcipherlist(const avalue: tstringlist);
begin
 fcipherlist.assign(avalue);
end;

class function tssl.write(var ainfo: cryptoioinfoty; const buffer: pointer;
               const count: integer; const atimeoutms: integer): integer;
begin
 with ainfo,sslinfoty(cryptodata).d do begin
  try
   repeat
    sys_mutexlock(mutex);
   until waitforio(ssl_write(ssl,buffer,count),ainfo,atimeoutms,@result);
  except
   result:= -1;
  end;
 end;
end;

class function tssl.read(var ainfo: cryptoioinfoty; const buffer: pointer;
               const count: integer; const atimeoutms: integer): integer;
var
 pollres: pollkindsty;
begin
 result:= 0;
 with ainfo,sslinfoty(cryptodata).d do begin
  try
   if (atimeoutms < 0) or 
    (soc_poll(ainfo.rxfd,[poka_read],atimeoutms,pollres) = sye_ok) then begin
    repeat
     sys_mutexlock(mutex);
    until waitforio(ssl_read(ssl,buffer,count),ainfo,atimeoutms,@result) or 
            (atimeoutms < 0);
   end;
  except
   result:= -1;
  end;
 end;
end;

{ tsslcryptohandler }
var testvar: psslhandlerdataty;
procedure tsslcryptohandler.open(var aclient: cryptoclientinfoty);
begin
testvar:= @sslhandlerdataty(aclient.handlerdata).d;
 initsslinterface;
 with sslhandlerdataty(aclient.handlerdata).d do begin
  bio:= nil;
  bio:= bio_new_fd(aclient.stream.handle,0);
  if bio = nil then begin
   checkerror;
  end;
 end;
end;

procedure tsslcryptohandler.close(var aclient: cryptoclientinfoty);
begin
 with sslhandlerdataty(aclient.handlerdata).d do begin
  bio_free_all(bio);
 end;
end;

function tsslcryptohandler.read(var aclient: cryptoclientinfoty; var buffer;
               count: longint): longint;
begin
 inherited;
end;

function tsslcryptohandler.write(var aclient: cryptoclientinfoty; const buffer;
               count: longint): longint;
begin
 with sslhandlerdataty(aclient.handlerdata).d do begin
  result:= bio_write(bio,@buffer,count);
 end;
end;

function tsslcryptohandler.seek(var aclient: cryptoclientinfoty;
               const offset: int64; origin: tseekorigin): int64;
begin
 inherited;
end;

procedure tsslcryptohandler.checkerror;
const
 buffersize = 200;
var
 int1: integer;
 str1,str2: string;
begin
 str1:= '';
 setlength(str2,buffersize);
 while true do begin
  int1:= err_get_error();
  if int1 = 0 then begin
   break;
  end;
  err_error_string_n(int1,pointer(str2),buffersize);
  if str1 = '' then begin
   str1:= str1 + lineend;
  end;
  str1:= str1 + pchar(str2);
 end;
 if str1 <> '' then begin
  essl.create(str1);
 end;
end;

procedure tsslcryptohandler.clearerror;
begin
 err_clear_error();
end;

end.