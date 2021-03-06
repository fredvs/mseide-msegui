{ MSEtools Copyright (c) 1999-2019 by Martin Schreiber
   
    This program is free software; you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation; either version 2 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program; if not, write to the Free Software
    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
}
unit main;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface
uses
 {$ifdef unix}unix,{$endif}mseforms,msefiledialog,msestat,msestatfile,
 msesimplewidgets,msegrids,msewidgetgrid,msegraphics,msegraphutils,
 mselistbrowser,msedataedits,typinfo,msedatanodes,msegraphedits,msestream,
 mseglob,msemenus,classes,mclasses,msetypes,msestrings,msethreadcomp,mseguiglob,
 msegui,mseresourceparser,msedialog,msememodialog,mseobjecttext,mseifiglob,
 msesysenv,msemacros,msestringcontainer,mseclasses,mseskin,msebitmap,msejson,
 msewidgets,msedispwidgets,mserichstring,msetimer,mseificomp,mseificompglob,
 msescrollbar;

const
 msei18nversiontext = mseguiversiontext;
 drcext = '_DRC.rc';
 rstext = '_rst';
 variantshift = 5;
 

type
 resfilekindty = (rfk_module,rfk_unit,rfk_resource,rfk_resstrings);
 
 tmainfo = class(tmseform)
   mainstatfile: tstatfile;
   clear: tbutton;
   grid: twidgetgrid;
   convexx: tfacecomp;
   convexy: tfacecomp;
   concavex: tfacecomp;
   concavey: tfacecomp;
   tgroupbox1: tgroupbox;
   tree: ttreeitemedit;
   threadcomp: tthreadcomp;
   typedisp: tenumtypeedit;
   donottranslate: tbooleanedit;
   comment: tmemodialogedit;
   value: tmemodialogedit;
   scan: tbutton;
   mainmenu1: tmainmenu;
   projectfiledialog: tfiledialog;
   sysenv: tsysenvmanager;
   c: tstringcontainer;
   tskincontroller1: tskincontroller;
   iconbmp: tbitmapcomp;
   menuitemframe: tframecomp;
   trowcount: tstringdisp;
   statusdisp: tstringdisp;
   ttimer1: ttimer;
   ttimer2: ttimer;
   workpan: tstringdisp;
   flat: tbooleanedit;
   nostring: tbooleanedit;
   stringonly: tbooleanedit;
   nont: tbooleanedit;
   ntonly: tbooleanedit;
   coloron: tbooleanedit;
   procedure onprojectopen(const sender: tobject);
   procedure onprojectsave(const sender: tobject);
   procedure onprojectedit(const sender: tobject);
 //  procedure readonexecute(const sender: tobject);
 //  procedure writeonexecute(const sender: tobject);
   procedure exportonexecute(const sender: tobject);
   procedure importonexecute(const sender: tobject);
   procedure clearonexecute(const sender: tobject);
   procedure edoninit(const sender: tenumtypeedit);
   procedure typedisponinit(const sender: tenumtypeedit);
   procedure treeonupdaterowvalues(const sender: tobject; const aindex: integer;
                    const aitem: tlistitem);
   procedure tmainfooncreate(const sender: tobject);
   procedure tmainfoonloaded(const sender: tobject);
   procedure tmainfoondestroy(const sender: tobject);
   procedure formatchanged(const sender: tobject);
   procedure nontonsetvalue(const sender: tobject; var avalue: boolean;
                              var accept: boolean);
   procedure ntonlyonsetvalue(const sender: tobject; var avalue: boolean;
                              var accept: boolean);
   procedure donottranslateonsetvalue(const sender: tobject; var avalue: boolean;
                    var accept: boolean);
   procedure commentonsetvalue(const sender: tobject; var avalue: msestring;
                               var accept: boolean);
   procedure variantonsetvalue(const sender: tobject; var avalue: msestring;
                                   var accept: boolean);
 
//   procedure scanonexecute(const sender: tobject);
   procedure makeonexecute(const sender: tobject);
   procedure mainupdatestat(const sender: TObject; const filer: tstatfiler);
   procedure configureonexecute(const sender: TObject);
   procedure makeexecute(const sender: tthreadcomp);
   procedure maketerminate(const sender: tthreadcomp);
   procedure mainclosequery(const sender: tcustommseform; 
                               var amodalresult: modalresultty);
   procedure saveasexecute(const sender: TObject);
   procedure newprojectexe(const sender: TObject);
   procedure mainmenuupdate(const sender: tcustommenu);
   procedure aboutexe(const sender: TObject);
   procedure exitexe(const sender: TObject);
   procedure beforelangdrawcell(const sender: tcol; const canvas: tcanvas;
                   var cellinfo: cellinfoty; var processed: Boolean);
   procedure showcolordataentered(const sender: TObject);
   procedure loadedexe(const sender: TObject);
   procedure onsetstringonly(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure onsetnosting(const sender: TObject; var avalue: Boolean;
                   var accept: Boolean);
   procedure ontimerup(const sender: TObject);
   procedure onreset(const sender: TObject);
   procedure showworkpan;
   procedure numrow(const Sender: TObject);
   procedure ondefhead(const sender: TObject);
   procedure oncreated(const sender: TObject);
   private
   datastream: ttextdatastream;
//   alang: integer;
   fdatachanged: boolean;
   procedure datachanged;
   procedure updatecaption;
   procedure updatedata;
   procedure refreshnodedata;
   procedure writerecord(const sender: ttreenode);
   procedure writeexprecord(const sender: ttreenode);
   procedure checkitem(const sender: ttreelistitem; var delete: boolean);
   function filternode(const anode: ttreenode): boolean;
   function readunit(const  stream: tmsefilestream): msestring;
   function readstringresource(const  stream: tmsefilestream;
                                      const fpcformat: boolean): msestring;
   function readmodule(const  stream: tmsefilestream): msestring;
   procedure doread(stream: ttextdatastream; aencoding: charencodingty);
   procedure dowrite(stream: ttextdatastream; aencoding: charencodingty);
   procedure doimport(stream: ttextdatastream; aencoding: charencodingty);
   procedure doexport(stream: ttextdatastream; aencoding: charencodingty);
   function getcolumnheaders: msestringarty;
   function checksave(cancelonly: boolean = false): boolean;
   
  public
   procedure loadproject;
   procedure readprojectdata;
   procedure writeprojectdata;
 end;

var
 defaultheaderpo: tmsememodialogfo;
 mainfo: tmainfo;
 rootnode: tpropinfonode;
 valuearray : Array of utf8String;
 rootvaluearray : Array of utf8String;
 isloaded : boolean = false;
 projloaded : boolean = false;
 doreset : boolean = false;
 importtype: integer = -1;
 ispocontext : boolean = false;
 
 implementation
uses
 main_mfm,msefileutils,msesystypes,msesys,sysutils,mselist,project,
 rtlconsts,mseprocutils,msestockobjects, headerform,
 mseparser,mseformdatatools,mseresourcetools, LazUTF8,
 msearrayutils,msesettings,messagesform,mseeditglob,mseformatstr;
type
 strinconsts = (
  sc_name,               //0
  sc_type,               //1
  sc_notranslate,        //2
  sc_comment,            //3
  sc_value,              //4
  sc_noproject,          //5
  sc_cannotreadmodule,   //6
  sc_newtranslateproject,//7
  sc_execerror,          //8
  sc_making,             //9
  sc_overwritesitself,   //10
  sc_error,              //11
  sc_finishedok,         //12
  sc_configuremsei18n,   //13
  sc_datahaschanged,     //14
  sc_doyouwishtosave,    //15
  sc_confirmation,       //16
  sc_closeerror,         //17
  sc_totrows,            //18
  sc_totranslate,        //19
  sc_tonottranslate,     //20
  sc_yettranslated,      //21
  sc_notyettranslated,    //22
  sc_doyouwanttoreset,    //23
  sc_dataexchangefiles,   //24
  sc_templatesfiles,   //25
  sc_translationfiles, //26
  sc_context,   //27
  sc_nocontext,   //28
  sc_txtfiles    //29
    );
  
//const
// translateext = 'trans';
// exportext = 'csv';

type
 envvarty = (env_macrodef);
const
 sysenvvalues: array[envvarty] of argumentdefty =
  ((kind: ak_pararg; name: '-macrodef'; anames: nil; flags: []; initvalue: '')
  );

type
 ttreenode1 = class(ttreenode);
 tpropinfonode1 = class(tpropinfonode);

{ tmainfo }

const
 sn_header = 'header';
 sn_prop = '.prop';
 svn_compclass = 'compclass';
 svn_compname = 'compname';
 svn_name = 'name';
 svn_type = 'type';
 svn_value = 'value';

procedure tmainfo.tmainfooncreate(const sender: tobject);
var
 wstr1: msestring;
begin
 stockobjects.mseicon.assign(iconbmp.bitmap);
 iconchanged(nil);
// iconbmp.free;
 sysenv.init(sysenvvalues);
 wstr1:= filepath(statdirname);
 if not finddir(wstr1) then begin
  createdir(wstr1);
 end;
 {$ifdef mswindows}
 mainstatfile.filename:= 'msei18nwi.sta';
 {$endif}
 {$ifdef linux}
 mainstatfile.filename:= 'msei18nli.sta';
 {$endif}
 {$ifdef openbsd}
 mainstatfile.filename:= 'msei18nobsd.sta';
 {$endif}
 {$ifdef bsd}
 mainstatfile.filename:= 'msei18nbsd.sta';
 {$endif}
 rootnode:= tpropinfonode.Create;
 application.createform(tprojectfo, projectfo);
 updatecaption;
  
end;

procedure tmainfo.tmainfoonloaded(const sender: tobject);
begin
 mainstatfile.readstat;
 if (stringonly.value = false) and (nont.value = true) then
 formatchanged(sender); 
  application.processmessages;
  show; 
  application.processmessages;
end;

procedure tmainfo.tmainfoondestroy(const sender: tobject);
begin
 freeandnil(rootnode);
end;

procedure tmainfo.edoninit(const sender: tenumtypeedit);
begin
 sender.typeinfopo:= typeinfo(tvaluetype);
end;

procedure tmainfo.typedisponinit(const sender: tenumtypeedit);
begin
 sender.typeinfopo:= typeinfo(tvaluetype);
end;

procedure tmainfo.treeonupdaterowvalues(const sender: tobject;
  const aindex: integer; const aitem: tlistitem);
var
 hasfound, hasfoundtext, hasvirg, isstring : boolean;
int1, x : integer;
str2, str3, rstr, acomp, anont, anonttemp, acom, acomtmp, astro,astrt, astrtemp, nodo, asdo : utf8String;
astrtraw : RawByteString;

begin

 with tpropinfoitem(aitem) do begin
  if node <> nil then begin
   with node do begin  
   
    comment[aindex]:= info.comment;
    typedisp[aindex]:= ord(info.valuetype);
    value[aindex]:= valuetext;
    donottranslate[aindex]:= info.donottranslate;
   
      if (doreset = false) and (isloaded = false) then begin
       x := 0;   
       hasfound := false;
       hasfoundtext := false;
       astrtemp := '';
       anonttemp := '';
       acomtmp := '';
       anont := '';
       hasvirg := false;
       
     if ((info.valuetype=valstring) or (info.valuetype=vastring)) and (trim(valuetext) <> '') then
     begin           
       
      if importtype < 1 then begin 
        while (x < length(valuearray)) and (hasfound = false) do
         begin
         str2 := (valuearray[x]);
          isstring := false;  
          acomp := str2;
            
        If system.pos('vaString',str2) >0 then begin
          str2 := (utf8copy(str2,utf8pos('vaString',str2)+9,
                     utf8length(str2)-utf8pos('vaString',str2)-8)) ;
         end else
         If system.pos('vaLString',str2) >0 then begin 
          str2 := (utf8copy(str2,utf8pos('vaLString',str2)+10,
                     utf8length(str2)-utf8pos('vaLString',str2)-9)) ;
         end;
            
         anont := (utf8copy(str2,1,1));
         str2 := (utf8copy(str2,utf8pos(',',str2)+1,utf8length(str2)-utf8pos(',',str2))) ;
         acom := (utf8copy(str2,1,utf8pos(',',str2)-1));
         str2 := (utf8copy(str2,utf8pos(',',str2)+1,utf8length(str2)-utf8pos(',',str2))) ;
       
        if utf8copy(str2,1,1) = '"' then 
         begin
         str2 :=  (utf8copy(str2,1,utf8length(str2)-1)) ;
         astro := (utf8copy(str2,2,utf8pos('",',str2)-2)) ;
         astrt := (utf8copy(str2,utf8pos('",',str2)+3,utf8length(str2)-2-utf8pos('",',str2))) ; 
         hasvirg := true;
         end else
         begin 
         astro := (utf8copy(str2,1,utf8pos(',',str2)-1));
         astrt := (utf8copy(str2,utf8pos(',',str2)+1,utf8length(str2)-utf8pos(',',str2))) ;       
         end;
          
         if  (hasvirg = true)  then
         begin
          nodo := utf8StringReplace(valuetext, #10, '', [rfReplaceAll]);
          nodo := utf8StringReplace(nodo, #13, '', [rfReplaceAll]);
          asdo := utf8StringReplace(astro, #10, '', [rfReplaceAll]);
          asdo := utf8StringReplace(asdo, #13, '', [rfReplaceAll]);
                   
          if (trim(valuetext) <> '') and 
          (trim((nodo)) = trim((asdo))) and  
          (utf8pos(copy(rootstring(','), 1 ,utf8length(rootstring(','))-12),acomp) > 1) and
          (trim((valuetext)) <> trim((astrt))) then 
          begin
           hasfoundtext := true;
        
           astrtemp := astrt;
           anonttemp := anont;
           acomtmp := acom;
           // writeln('+++++++++++ value found equal ++++++++++++++' );
           // writeln(rootstring(','));
           // writeln(acomp);
                      
           if utf8pos(rootstring(','),acomp) > 0 then begin
           astrtemp := astrt;
           anonttemp := anont;
           acomtmp := acom;
           hasfound := true; 
           // writeln('$$$$$$$$$$$$$$$ name found equal ++++++++++++++' );
           // writeln(rootstring(','));
            // writeln(acomp);
             //exit;
            end; 
           end; 
      
         end else 
         begin
          if (trim(valuetext) <> '') and 
          (trim((valuetext)) = trim((astro))) and 
          (utf8pos(copy(rootstring(','), 1 ,length(rootstring(','))-12),acomp) > 1)and
          (trim((valuetext)) <> trim((astrt))) then
          begin 
           hasfoundtext := true;
           astrtemp := astrt;
           anonttemp := anont;
           acomtmp := acom;
            
           if system.pos(rootstring(','),acomp) > 0 then
           begin
           anonttemp := anont;
           acomtmp := acom;
           astrtemp := astrt;
           hasfound := true; 
            //writeln(rootstring(',') + ' name ' + info.name);
             //exit;
            end;
            end;  
         end;      
        inc(x); 
        
        end; 
  
     if ((hasfoundtext = true) or (hasfound = true)) then
       begin
         astrt := astrtemp;
         anont := anonttemp;
         acom := acomtmp;
     //    astrt := utf8trim(astrt);
         astrt := utf8StringReplace(astrt, '""', '|', [rfReplaceAll]);
         astrt := utf8StringReplace(astrt, '"', '', [rfReplaceAll]);
         astrt := utf8StringReplace(astrt, '|', '"', [rfReplaceAll]);
         
         info.comment := acom;  
         comment[aindex]:= acom; 
      
         if anont = 'T' then begin
         info.donottranslate := true;
         donottranslate[aindex]:= true;
         end else
         begin
         info.donottranslate := false;
         donottranslate[aindex]:= false;
         end;
        end; 
        
     //  if utf8copy(valuetext,1,2) = '" ' then writeln('valuetext: ' + valuetext); 
     //  if utf8copy(astrt,1,2) = '" ' then writeln('astrt: ' + astrt); 
                     
      if (trim(valuetext) = '')  then
      begin    
      info.donottranslate := true;
      donottranslate[aindex]:= true;
      end;  
    end; 
       
          ////////////////
  if importtype = 2 then begin 
        while (x < length(valuearray)) and (hasfound = false) do
         begin
         str2 := (valuearray[x]);
         acomp := str2;
         
         astrt := trim(utf8copy(str2,system.pos('|',str2)+1,length(str2)-system.pos('|',str2)+1)) ; 
         
         acomtmp := rootstring(',');
         lowercase(acomtmp);
         acomtmp := utf8StringReplace(acomtmp, '.', '', [rfReplaceAll]);
         acomtmp := utf8StringReplace(acomtmp, ',', '', [rfReplaceAll]);
         acomtmp := utf8StringReplace(acomtmp, ':', '', [rfReplaceAll]);
         acomtmp := utf8StringReplace(acomtmp, '_', '', [rfReplaceAll]);
         
         if system.pos(acomtmp,acomp) > 0 then
           begin
              hasfound := true; 
           // writeln('------------------');
           // writeln(acomtmp);
           // writeln(astrt);
            end;
           inc(x); 
        end; 
  
     if (hasfoundtext = true) then
       begin
            
       //  astrt := utf8trim(astrt);
         astrt := utf8StringReplace(astrt, '""', '"', [rfReplaceAll]);
         astrt := utf8trim(astrt); 
                            
      if (trim(valuetext) = '') and (typedisp[aindex] = 6) then
      begin    
      info.donottranslate := true;
      donottranslate[aindex]:= true;
      end;  
     end; 
    end; 
   
        ////////////////
  
     if importtype = 1 then begin 
      
       while (x < length(valuearray)) and (hasfound = false) do
        begin
         astrt := '';
         str2 := '';
         
         str2 := (valuearray[x]);
    
         acomp :=  utf8copy(str2,1, system.pos(';',str2)-1) ;
       
         str2 := (utf8copy(str2,system.pos(';',str2)+1,length(str2)-system.pos(';',str2)+1)) ;
         astro := (utf8copy(str2,1,system.pos(';',str2)-1)) ;  
         astro := utf8StringReplace(astro,  '\"', '"', [rfReplaceAll]);  
       
         str2 := (utf8copy(str2,system.pos(';',str2)+1,length(str2)-system.pos(';',str2)+1)) ;
         astrt := utf8copy(str2,1,length(str2)) ;  
         astrt := utf8StringReplace(astrt,  '\"', '"', [rfReplaceAll]);  
       
          nodo := utf8StringReplace(valuetext, #10, '', [rfReplaceAll]);
          nodo := utf8StringReplace(nodo,#13, '', [rfReplaceAll]);
          nodo := utf8StringReplace(nodo, ' ', '', [rfReplaceAll]);
          nodo := utf8StringReplace(nodo, '"', '', [rfReplaceAll]);
          
          asdo := utf8StringReplace(astro, #10, '', [rfReplaceAll]);
          asdo := utf8StringReplace(asdo, #13, '', [rfReplaceAll]);
          asdo := utf8StringReplace(asdo, ' ', '', [rfReplaceAll]);
          asdo := utf8StringReplace(asdo, '"', '', [rfReplaceAll]);
         
          int1 := length(rootstring(',')) -12;
        
             
             if (trim(valuetext) <> '') and (trim(nodo) = trim(asdo)) and  
               (trim(valuetext) <> trim(astrt))  then 
             begin
              if ispocontext and (copy(acomp, 1 ,int1) = copy(rootstring(','), 1 ,int1)) then
              begin
               hasfoundtext := true;
               astrtemp := astrt;
               anonttemp := anont;
                      
               if system.pos(acomp,rootstring(',')) > 0 then 
               begin
               astrtemp := astrt;
               anonttemp := anont;
               hasfound := true; 
               writeln('------has found equal------------');
               //  writeln(acomp);
               // writeln(astrt);
                // exit;
              end; 
             end else
             begin
             hasfoundtext := true;
             astrtemp := astrt;
             anonttemp := anont;
             end;
              
             end; 
        inc(x); 
      end;    
  
          if hasfoundtext or hasfound then
       begin
         astrt := astrtemp;
         anont := anonttemp;
         {
          writeln('------------------');
          writeln(acomp);
          writeln(astrt);
          writeln(anont);
          }
         // astrt := utf8trim(astrt);
         astrt := utf8StringReplace(astrt, '""', '"', [rfReplaceAll]);
         
          if (utf8copy(valuetext,1,2) <> '" ') and  (utf8copy(astrt,1,2) = '" ') 
         then astrt :=  utf8copy(astrt,3,length(astrt)-2);
         
         
         astrt := utf8StringReplace(astrt, ' "', '', [rfReplaceAll]);
           if (utf8copy(valuetext,length(valuetext)-1,2) = ' "') 
         then astrt := astrt + ' "';         
 
         if anont = 'T' then begin
         info.donottranslate := true;
         donottranslate[aindex]:= true;
         end else
         if anont = 'F' then begin
         info.donottranslate := false;
         donottranslate[aindex]:= false;
         end;
       
       end;
        if (trim(valuetext) = '') then
          begin    
          info.donottranslate := true;
          donottranslate[aindex]:= true;
          end;  
         
      end;
    end;
   end;
  
    for int1:= 0 to grid.datacols.count - variantshift - 1 do begin
     with tmemodialogedit(grid.datacols[int1+variantshift].editwidget) do begin
      if high(info.variants) >= int1 then begin
    
    if doreset = false then begin  
    if isloaded = false then begin
    
      if (utf8copy(valuetext,1,2) <> '" ')
         then if  (utf8copy(astrt,1,2) = '" ') then 
          astrt :=  utf8copy(astrt,3,length(astrt)-2) ;
          
    if (trim(astrt) = '"') then astrt := '';
    
     if hasfound or hasfoundtext then
     begin
       if (trim(astrt) <> '') and  (astrt <> valuetext) then
       begin
       gridvalue[aindex]:= (astrt);
       info.variants[int1] := (astrt);
       end else
       begin
       if  (info.variants[int1] <> '') then
       gridvalue[aindex]:= (info.variants[int1])
       else begin
       gridvalue[aindex]:=   valuetext;
       info.variants[int1] := valuetext;
       end;
      end;
      end else begin // not found
      begin
       //if (info.variants[int1] <> valuetext) and (info.variants[int1] <> '') then
       //gridvalue[aindex]:= (info.variants[int1])
       //else begin
       gridvalue[aindex]:=   valuetext;
       info.variants[int1] := valuetext;
      // end;
     end;
     
     if donottranslate[aindex] then
     begin
     gridvalue[aindex]:=    '';
     info.variants[int1] := '';
     end;
     
     end;
     end else begin
     gridvalue[aindex]:= (info.variants[int1])
     end;
     end else begin
     gridvalue[aindex]:=   valuetext;
     info.variants[int1] := valuetext;
     end;
      end
      else begin
     // gridvalue[aindex]:= '';
      gridvalue[aindex]:= valuetext;
      end;
     end;
     end; 
   end;
  end;
 end;
end;

function tmainfo.filternode(const anode: ttreenode): boolean;
begin
 result:= true;
 
 if stringonly.value then begin
  result:= tpropinfonode(anode).info.valuetype in
           [vastring,valstring,vawstring,vautf8string,
                   vanull,valist,vacollection];
 end;
 
 if nostring.value then begin
  result:= tpropinfonode(anode).info.valuetype in
           [vanull,valist,vacollection, vafalse,vatrue, vaInt8,vaint16,vaint32,
            vasingle,vacurrency, vadate, vaIdent, vaSet, vaExtended,vabinary];
 end;
 
 if result then begin
  if nont.value then begin
   result:= (not tpropinfonode(anode).info.donottranslate)
  or(tpropinfonode(anode).info.valuetype in [vanull,valist,vacollection])
   ;
  end
  else begin
   if ntonly.value then begin
    result:= tpropinfonode(anode).info.donottranslate or
          (tpropinfonode(anode).info.valuetype in [vanull,valist,vacollection]);
   end;
  end;
 end;
end;

procedure tmainfo.checkitem(const sender: ttreelistitem; var delete: boolean);
begin
 with tpropinfoitem(sender),node,info do begin
  delete:= (sender.count = 0) and (valuetype in [vanull,valist,vacollection]) and 
           (stringonly.value or ntonly.value and not donottranslate);
  if not delete and flat.value then begin
   sender.caption:= msestring(node.rootstring);
  end;
 end;
end;

function tmainfo.getcolumnheaders: msestringarty;
var
 int1: integer;
begin
 setlength(result,variantshift + projectfo.grid2.rowcount);
 result[0]:= c[ord(sc_name)];
 result[1]:= c[ord(sc_type)];
 result[2]:= c[ord(sc_notranslate)];
 result[3]:= c[ord(sc_comment)];
 result[4]:= c[ord(sc_value)];
 for int1:= 0 to projectfo.grid2.rowcount - 1 do begin
  result[int1 + variantshift]:= projectfo.lang[int1];
 end;
end;

procedure tmainfo.updatecaption;
var
 mstr1: msestring;
begin
 mstr1:= 'MSEi18n (';
 if fdatachanged then begin
  mstr1:= mstr1+'*';
 end;
 if projectfo.projectstat.filename = '' then begin
  mstr1:= mstr1+c[ord(sc_noproject)];
 end
 else begin
  mstr1:= mstr1+tosysfilepath(msefileutils.filepath(projectfo.projectstat.filename));
 end;
 caption:= mstr1 + ')';
end;

procedure tmainfo.datachanged;
begin
 fdatachanged:= true;
 updatecaption;
end;

procedure tmainfo.updatedata;
var
 int1: integer;
 item: ttreelistedititem;
 ar1: msestringarty;
 edit1: tmemodialogedit;
begin
 ar1:= getcolumnheaders;
// grid.datacols.count:= variantshift;
 grid.datacols.count:= length(ar1);
 grid.fixrows[-1].captions.count:= length(ar1);
 for int1:= variantshift to high(ar1) do begin
  grid.fixrows[-1].captions[int1].caption:= getcolumnheaders[int1];
  with grid.datacols[int1] do begin
   if editwidget = nil then begin
    edit1:= tmemodialogedit.create(self);
    edit1.initgridwidget;
    edit1.frame.button.width:= 13;
    edit1.onsetvalue:= {$ifdef FPC}@{$endif}variantonsetvalue;
    edit1.Tag:= int1 - variantshift;
    edit1.optionsedit:= (edit1.optionsedit - [oe_savevalue]) + 
                                                  [oe_hintclippedtext];
    grid.datacols[int1].editwidget:= edit1;
   end;
   onbeforedrawcell:= @beforelangdrawcell;
  end;
 end;
 for int1 := grid.datacols.count - projectfo.grid2.rowcount -1 to 
 grid.datacols.count - 1 do
 begin
 //grid.datacols[int1].width:= 200;
 grid.datacols[int1].widthmax:= 600;
 grid.datacols[int1].widthmin:= 150;
 end;
 grid.beginupdate;
 try
  item:= rootnode.converttotreelistitem(flat.value,false,
                  {$ifdef FPC}@{$endif}filternode);
  item.checkitems({$ifdef FPC}@{$endif}checkitem);
  tree.itemlist.assign(item);
 finally
  grid.endupdate;
 end;
end;

procedure tmainfo.refreshnodedata;
begin
 tree.itemlist.refreshitemvalues;
end;

function tmainfo.readunit(const  stream: tmsefilestream): msestring;
var
 scanner: tscanner;
 parser: tconstparser;
 ar1: constinfoarty;
 node,node1: tpropinfonode;
 int1: integer;
begin
 scanner:= nil;
 parser:= nil;
 try
  scanner:= tscanner.Create;
  scanner.source:= stream.readdatastring;
  parser:= tconstparser.Create;
  parser.scanner:= scanner;
  node:= tpropinfonode.Create;
  node.info.name:= parser.getconsts(ar1);
  result:= msestring(node.info.name);
  rootnode.add(node);
  for int1:= 0 to high(ar1) do begin
   with ar1[int1] do begin
    if resource then begin
     node1:= tpropinfonode.Create;
     node1.info.name:= name;
     node1.info.msestringvalue:= value;
     node1.info.valuetype:= valuetype;
     node1.info.coffset:= offset;
     node1.info.clen:= len;
     node.add(node1);
    end;
   end;
  end;
  updatedata;
 finally
  parser.Free;
  scanner.Free;
  stream.Free;
 end;
end;
 
function tmainfo.readstringresource(const stream: tmsefilestream; 
                    const fpcformat: boolean): msestring;
var
 scanner: tscanner;
 parser: tparser;
 ar1: constinfoarty;
 node,node1,node2: tpropinfonode;
 int1,int2: integer;
 str1: string;
// po1: pchar;
begin
 scanner:= nil;
 parser:= nil;
 try
  if fpcformat and (fileext(stream.filename) = 'rsj') then begin
   ar1:= rsjgetconsts(stream);
  end
  else begin
   if fpcformat then begin
    scanner:= tpascalscanner.Create;
    scanner.source:= stream.readdatastring;
    parser:= tfpcresstringparser.create(nil);
   end
   else begin
    scanner:= tcscanner.Create;
    scanner.source:= stream.readdatastring;
    parser:= tresstringlistparser.Create(nil);
   end;
   parser.scanner:= scanner;
   if fpcformat then begin
    tfpcresstringparser(parser).getconsts(ar1);
   end
   else begin
    tresstringlistparser(parser).getconsts(ar1);
   end;
  end;
  node:= tpropinfonode.Create;
  node.info.name:= ansistring(filename(stream.filename));
  result:= msestring(node.info.name);
  str1:= '';
  for int1:= 0 to high(ar1) do begin
   with ar1[int1] do begin
    if valuetype = vawstring then begin
     if fpcformat then begin
      int2:= msestrings.findchar(name,'.');
     end
     else begin
      int2:= msestrings.findchar(name,'_');
     end;
     if int2 > 0 then begin
      str1:= copy(name,1,int2-1);
      name:= copy(name,int2+1,bigint);
      node1:= nil;
      for int2:= 0 to node.count - 1 do begin
       if node[int2].info.name = str1 then begin
        node1:= node[int2];
        break;
       end;
      end;
      if node1 = nil then begin
       node1:= tpropinfonode.Create;
       node1.info.name:= str1;
       node.add(node1);
      end;
      node2:= tpropinfonode.Create;
      node2.info.name:= name;
      node2.info.msestringvalue:= value;
      node2.info.valuetype:= valuetype;
      node2.info.coffset:= offset;
      node2.info.clen:= len;
      node1.add(node2);
     end;
    end;
   end;
  end;
  rootnode.add(node);
//  updatedata;
 finally
  parser.Free;
  scanner.Free;
  stream.Free;
 end;
end;

function tmainfo.readmodule(const stream: tmsefilestream): msestring;
var
 memstream: tmemorystream;
 node: tpropinfonode;
// int1: integer;
begin
 memstream:= tmemorystream.Create;
 result:= '';
 try
  objecttexttobinarymse(stream,memstream);
  memstream.Position:= 0;
  node:= tpropinfonode.Create;
  readprops(memstream,node);
  result:= msestring(node.info.name);
  rootnode.add(node);
 except
  application.handleexception(self,c[ord(sc_cannotreadmodule)]+' '+stream.filename+':');
  projectfo.unitsdir.frame.colorclient := cl_ltyellow;
  projectfo.datafilename.frame.colorclient := cl_ltyellow;
  projectfo.dir.frame.colorclient := cl_ltyellow;
  onprojectedit(nil);
  projectfo.bringtofront;
  application.processmessages;
 end;
 memstream.Free;
 stream.Free;
end;

procedure tmainfo.writerecord(const sender: ttreenode);
var
 rec : varrecarty;
 str1,str2,str5 : string;
 mstr3, mstr4 : msestring;
 int1: integer;
 filind : integer;
 hasdouble : boolean;

begin
 rec:= nil; //compilerwarning
 
 if ttreenode1(sender).fparent <> nil then begin
  with tpropinfonode(sender),info do begin
   str1:= rootstring(',');
   str2:= ansistring(typedisp.enumname(ord(valuetype)));
   mstr3:= valuetext;
   
   //if donottranslate then str5 := 'T' else str5 := 'F';
   
   filind := projectfo.impexpfiledialog.controller.filterindex;
 
  case filind of
  // csv
  0: rec:= mergevarrec([str1,str2,donottranslate,comment,mstr3],[]);
  end;
  
  mstr4 := '';
  
    for int1:= 0 to high(variants) do begin
    rec:= mergevarrec(rec,[variants[int1]]);
    if int1 = 0 then mstr4 := variants[int1];
    end;
  
   if (filind = 0) then  datastream.writerecord(rec);
   
  if filind = 5 then
  begin
  str1 := '"' + lowercase(str1+str2);
  str1 := utf8StringReplace(str1, '.', '', [rfReplaceAll]);
  str1 := utf8StringReplace(str1, ',', '', [rfReplaceAll]);
  str1 := utf8StringReplace(str1, ':', '', [rfReplaceAll]);
  str1 := utf8StringReplace(str1, '_', '', [rfReplaceAll]);
  mstr3 := utf8StringReplace(mstr3, '"', '', [rfReplaceAll]);
  // Delete((mstr3),system.pos(sLineBreak,mstr3),1);
 
 //  if donottranslate then str5 := ',T,' else str5 := ',F,';
 
   datastream.writeln( str1 + ' | ' + mstr3  );
  end;  
 
  if  (filind > 0) and (filind < 5) then begin
  
  if (filind = 1) then // pot + ss context
  begin
    hasdouble := false;
   
    for int1 := 0 to length(rootvaluearray) - 1 do
    begin
    if mstr3 = rootvaluearray[int1] then hasdouble := true;
    end;
    
     setlength(rootvaluearray,length(rootvaluearray)+1);  
        rootvaluearray[length(rootvaluearray)-1] := mstr3; 
        
   if hasdouble = false then begin  
   
       mstr3 :=  
   utf8StringReplace(mstr3, '"', '\"', [rfReplaceAll]);
   
    if system.pos(sLineBreak,mstr3) > 0 then
   begin
    
    mstr3 :=  
   utf8StringReplace(mstr3, sLineBreak, '\n"' + sLineBreak + '"', [rfReplaceAll]);
     mstr3 :=  '""'+ #10#13 +  '"' +  mstr3;
     
     Delete((mstr3),system.pos(sLineBreak,mstr3),1);
     
      datastream.writeln('msgid ' + mstr3 + '"');
    end else
    begin
    datastream.writeln('msgid "' + mstr3 + '"');
    end;
    
    datastream.writeln( 'msgstr ""');
    datastream.writeln(''); 
    end;
    end;
  
  
 if (filind = 2) then // pot + context / mix
  begin
   datastream.writeln('msgctxt "' + str1 +'"');
   
     mstr3 :=  
   utf8StringReplace(mstr3, '"', '\"', [rfReplaceAll]);
 
   if system.pos(sLineBreak,mstr3) > 0 then
   begin
    mstr3 :=  
   utf8StringReplace(mstr3, sLineBreak, '\n"' + sLineBreak + '"', [rfReplaceAll]);
     mstr3 :=  '""'+ #10#13 +  '"' +  mstr3;
     
     Delete((mstr3),system.pos(sLineBreak,mstr3),1);
     
      datastream.writeln('msgid ' + mstr3 + '"');
    end else
    begin
    datastream.writeln('msgid "' + mstr3 + '"');
    end;
    
    datastream.writeln( 'msgstr ""');
    datastream.writeln('');
   end;
   
    if (filind = 3) then
  begin
  
    hasdouble := false;
   
    for int1 := 0 to length(rootvaluearray) - 1 do
    begin
    if mstr3 = rootvaluearray[int1] then hasdouble := true;
    end;
    
     setlength(rootvaluearray,length(rootvaluearray)+1);  
        rootvaluearray[length(rootvaluearray)-1] := mstr3; 
  
     mstr3 :=  
   utf8StringReplace(mstr3, '"', '\"', [rfReplaceAll]);
      
        
   if hasdouble = false then begin       
    if system.pos(sLineBreak,mstr3) > 0 then
   begin  
   
    mstr3 :=  
   utf8StringReplace(mstr3, sLineBreak, '\n"' + sLineBreak + '"', [rfReplaceAll]);
     mstr3 :=  '""'+ #10#13 +  '"' +  mstr3;
     
     Delete((mstr3),system.pos(sLineBreak,mstr3),1);
     
      datastream.writeln('msgid ' + mstr3 + '"');
    end else
    begin
    datastream.writeln('msgid "' + mstr3 + '"');
    end;
    
    mstr4 :=  
   utf8StringReplace(mstr4, '"', '\"', [rfReplaceAll]);
       
  if system.pos(sLineBreak,mstr4) > 0 then 
  begin
    mstr4 := 
   utf8StringReplace(mstr4, sLineBreak, '\n"' + sLineBreak + '"', [rfReplaceAll]); 
   mstr4 :=  '""'+  #10#13  + '"' + mstr4;
   Delete(mstr4,system.pos(sLineBreak,mstr4),1);
   datastream.writeln( 'msgstr ' + mstr4 + '"') end
   else  datastream.writeln( 'msgstr "' + mstr4 + '"') ;
   
   datastream.writeln('');
  end;
  end;

 if (filind = 4) then
  begin
  datastream.writeln('msgctxt "' + str1 +'"');
  
   mstr3 :=  
   utf8StringReplace(mstr3, '"', '\"', [rfReplaceAll]);  

   if system.pos(sLineBreak,mstr3) > 0 then
   begin
    mstr3 :=  
   utf8StringReplace(mstr3, sLineBreak, '\n"' + sLineBreak + '"', [rfReplaceAll]);
     mstr3 :=  '""'+ #10#13 +  '"' +  mstr3;
     
     Delete((mstr3),system.pos(sLineBreak,mstr3),1);
     
      datastream.writeln('msgid ' + mstr3 + '"');
    end else
    begin
    datastream.writeln('msgid "' + mstr3 + '"');
    end;
    
  mstr4 :=  
   utf8StringReplace(mstr4, '"', '\"', [rfReplaceAll]);     
    
  if system.pos(sLineBreak,mstr4) > 0 then 
  begin
    mstr4 := 
   utf8StringReplace(mstr4, sLineBreak, '\n"' + sLineBreak + '"', [rfReplaceAll]); 
   mstr4 :=  '""'+  #10#13  + '"' + mstr4;
   Delete(mstr4,system.pos(sLineBreak,mstr4),1);
   datastream.writeln( 'msgstr ' + mstr4 + '"') end
   else  datastream.writeln( 'msgstr "' + mstr4 + '"') ;
   
   datastream.writeln('');
  end;
  end;
 end;
end;
end;

procedure tmainfo.donottranslateonsetvalue(const sender: tobject;
  var avalue, accept: boolean);
begin
tpropinfoitem(tree.item).node.info.donottranslate:= avalue;
datachanged;
 // updatedata;
grid.invalidaterow(grid.row);

end;

procedure tmainfo.commentonsetvalue(const sender: tobject;
  var avalue: msestring; var accept: boolean);
begin
 tpropinfoitem(tree.item).node.info.comment:= avalue;
 datachanged;
end;

procedure tmainfo.variantonsetvalue(const sender: tobject;
             var avalue: msestring; var accept: boolean);
begin
 with tpropinfoitem(tree.item).node.info,twidget(sender) do begin
  if high(variants) < tag then begin
   setlength(variants,tag+1);
  end;
  variants[tag]:= avalue;
 end;
 datachanged;
end;

procedure tmainfo.numrow(const Sender: TObject);
var
x, nt, tt, nc, rc: integer;
begin

 rc := grid.rowCount;
 nc := grid.datacols.count-1;
 grid.fixcols[-1].captions.count:= rc;
 
 trowcount.value := inttostr(rc);
 nt := 0;
 tt := 0;
 
 for x := 0 to grid.rowCount - 1 do 
   begin
   
  if tstringedit(grid.datacols[grid.datacols.count-1].editwidget)[x] = ''
      then   tstringedit(grid.datacols[grid.datacols.count-1].editwidget)[x] :=
  tstringedit(grid.datacols[4].editwidget)[x];    
 
    if (stringonly.value = false) and (nont.value = true) then
    begin
      if (donottranslate[x]) then 
       grid.rowcolorstate[x]:= 2 else
        grid.rowcolorstate[x]:= 0;
     end else grid.rowcolorstate[x]:= 0; 
   
      grid.fixcols[-1].captions[x] := inttostr(x+1);
        if (donottranslate[x]) then inc(nt)
       else
      if (tstringedit(grid.datacols[4].editwidget)[x] =
         tstringedit(grid.datacols[nc].editwidget)[x])
         or (tstringedit(grid.datacols[nc].editwidget)[x] = '')
       then inc(tt);
    
 statusdisp.value := '  ' + c[ord(sc_totrows)]+ ' ' + inttostr(rc) + '   ' +
                     c[ord(sc_totranslate)]+ ' ' + inttostr(rc-nt) + '   ' +
                     c[ord(sc_tonottranslate)]+ ' ' + inttostr(nt) + '   ' +
                     c[ord(sc_yettranslated)]+ ' ' + inttostr(rc-nt-tt) + '   ' +
                     c[ord(sc_notyettranslated)]+ ' ' + inttostr(tt);
  end;
 end; 
procedure tmainfo.formatchanged(const sender: tobject);
begin
 showworkpan;
 application.processmessages;
 updatedata;
 numrow(sender);
 application.processmessages;
 workpan.visible := false;
end;

procedure tmainfo.doread(stream: ttextdatastream; aencoding: charencodingty);
var
 aname: string;
 notranslate: boolean;
 acomment: msestring; 
 node: tpropinfonode;
 str1 : msestring;
 str2, str3, str4, strtemp : utf8String;
 ar1: stringarty;
 avariants: msestringarty;
 pointers: pointerarty;
 int1 : integer;
 isstring : boolean = false;
 isid : boolean = false;
 iscontext : boolean = false;
 ispocontext : boolean = false;
begin
isloaded := false;
ispocontext := false;
showworkpan;
grid.datacols[0].color := cl_white;
grid.clear;
application.processmessages;

 try
   stream.encoding:= aencoding;
 
   setlength(valuearray,0); 
   
    stream.readln(str1); 
    
    str3 := '';
    str2 := '';
    str4 := '';
    
    if (system.pos('name,type,notranslate,comment,value',str1) > 0) then
    importtype := 0 else if (system.pos('¿¡',str1) > 0) then
    importtype := 2 else importtype := 1;
    // if copy(str1,1,1) = '#' then importtype := 1;
    
   while not stream.eof do begin
   str1 := '';
    stream.readln(str1); 
     strtemp := '';  
      
  if  importtype = 0 then begin  // trd mse format
     if (copy(str1,1,1) = '"') and (isstring = true) then
       begin
        setlength(valuearray,length(valuearray)+1);  
        valuearray[length(valuearray)-1] := str2;
        str2 := str1;    
        // writeln(((valuearray[length(valuearray)-1])));
        isstring := false;
       end else if isstring = true then str2 := str2 +sLineBreak+ str1;
 
     if (system.pos('vaString',str1) > 0) or (system.pos('vaLString',str1) > 0) then 
     begin
     isstring := true;
     str2 := str1;
     end;
     
     end;
     
     ///////////////
     
     if  importtype = 2 then begin  // from google translate format
          if (copy(str1,1,1) = '"') and (isstring = true) then
       begin
        setlength(valuearray,length(valuearray)+1);  
        valuearray[length(valuearray)-1] := str2;
        str2 := str1;    
        // writeln(((valuearray[length(valuearray)-1])));
        isstring := false;
       end else if isstring = true then str2 := str2 +sLineBreak+ str1;
 
     if (system.pos('vastring',str1) > 0) or (system.pos('valstring',str1) > 0) then 
     begin
     isstring := true;
     str2 := str1;
     end;
     
     end;
     
    ////////////
     
  if importtype = 1 then begin   // po files
  
   if (trim(str1) <> '') and (utf8copy(str1,1,1) <> '#') then begin
  
   if (utf8copy(str1,1,7) = 'msgctxt') then 
     begin
        ispocontext := true;
       
        setlength(valuearray,length(valuearray)+1);  
         str2 := str4 + utf8String(';') + str2 + utf8String(';') + str3 ; 
          // writeln(str2);
         str2 := utf8StringReplace(str2, '\n', '', [rfReplaceAll]); 
         str2 := utf8StringReplace(str2, '\', '', [rfReplaceAll]);
         valuearray[length(valuearray)-1] := str2;
        str3 := '';
        str4 := '';
        str4 := (utf8copy(str1,10,length(str1)-10)) ;
        iscontext := true;
        isid := false;
        isstring := false;
      end     
       else   
       if (copy(str1,1,5) = 'msgid') then
        begin
        if ispocontext = false then begin
         setlength(valuearray,length(valuearray)+1);  
         str2 := str4 + utf8String(';') + str2 + utf8String(';') + str3 ; 
          // writeln(str2);
         str2 := utf8StringReplace(str2, '\n', '', [rfReplaceAll]); 
         str2 := utf8StringReplace(str2, '\', '', [rfReplaceAll]);
         valuearray[length(valuearray)-1] := str2;
          str3 := '';
         str4 := '';
         end;
         str2 := utf8copy(str1,8,length(str1)-8) ;
         iscontext := false;
         isid := true;
         isstring := false;
         end
         else
          if (utf8copy(str1,1,6) = 'msgstr') then begin 
          str3 := (utf8copy(str1,9,length(str1)-9)) ;
          str3 := utf8StringReplace(str3, '\n', '', [rfReplaceAll]);
          iscontext := false;
          isid := false;
          isstring := true;
         end 
         else 
      if iscontext then
       begin
        strtemp := utf8copy(str1,2,length(str1)-2);
        if  (system.pos('\n',strtemp) > 0) then begin
        strtemp := utf8StringReplace(strtemp, '\n', '', [rfReplaceAll]);
        str4 := str4 + strtemp  + utf8String(sLineBreak) ;
        end else str4 := str4 + strtemp;
        end else
        if isid then
       begin
        strtemp := utf8copy(str1,2,length(str1)-2);
        if  (system.pos('\n',strtemp) > 0) then begin
        strtemp := utf8StringReplace(strtemp, '\n', '', [rfReplaceAll]);
        str2 := str2 + strtemp  + utf8String(sLineBreak) ;
        end else str2 := str2 + strtemp;
        end
        else 
       if isstring then 
       begin
        strtemp := utf8copy(str1,2,length(str1)-2);
        if  (system.pos('\n',strtemp) > 0) then begin   
         strtemp := utf8StringReplace(strtemp, '\n', '', [rfReplaceAll]); 
        str3 := (str3 + strtemp  + utf8String(sLineBreak)) ;
        end else str3 := str3 + strtemp;
        end;
       end;  
    
    end;
 end;
 
 /////////////////
     if importtype = 0 then begin
        setlength(valuearray,length(valuearray)+1);  
       
        valuearray[length(valuearray)-1] := str2;
       // writeln(((valuearray[length(valuearray)-1])));
       end else  if importtype = 1 then begin
        setlength(valuearray,length(valuearray)+1);  
         str2 := str4 + ';' + str2 + ';' + str3 ; 
         valuearray[length(valuearray)-1] := str2;
       //  writeln(((valuearray[length(valuearray)-1])));
        end else if importtype = 2 then begin
         setlength(valuearray,length(valuearray)+1);  
         valuearray[length(valuearray)-1] := str2;
        end;
 
  // {
   Stream.Seek(0,soFromBeginning); 
 
  stream.readln(str1); //header
  splitstringquoted(str1,ar1,'"',',');
  int1:= length(ar1);
  if int1 < variantshift then begin
   int1:= variantshift;
  end;
  setlength(pointers,int1);
  str1:= 's bSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSS';
  setlength(str1,length(pointers));
  pointers[0]:= @aname;
  pointers[2]:= @notranslate;
  pointers[3]:= @acomment;
   
  while not stream.eof do begin
   aname:= '';
   notranslate:= false;
   setlength(avariants,length(pointers) - variantshift);
   for int1:= 0 to high(avariants) do begin
    avariants[int1]:= '';
    pointers[int1 + variantshift]:= @avariants[int1];
   end;
 
   if stream.readrecord(pointers,str1) then begin
   if importtype < 1 then
   node:= rootnode.findsubnode(','+aname)
    else  node := nil;
    
   if node <> nil then begin
     with node.info do begin
      comment:= acomment;
      variants:= avariants; 
      donottranslate:= notranslate;
    end;  
   end;
  end else begin
    //todo: errormesage
  end;
  end;
 // }
 finally
  stream.Free;
 end;
// refreshnodedata;
// updatedata;
  projectfo.unitsdir.frame.colorclient := cl_default;
  projectfo.datafilename.frame.colorclient := cl_default;
  projectfo.dir.frame.colorclient := cl_default;
 application.processmessages;
 isloaded := false;
 if ttimer2.Enabled then
 ttimer2.restart // to reset
 else ttimer2.Enabled := True;
end;

procedure tmainfo.doimport(stream: ttextdatastream; aencoding: charencodingty);
begin
 doread(stream,aencoding);
 fdatachanged:= true;
 updatecaption;
end;

procedure tmainfo.importonexecute(const sender: tobject);
var
 stream: ttextdatastream;
 str1: filenamety;
 filterlista : msestringarty;
 filterlistb : msestringarty;
begin
if projloaded then begin
if isloaded = true then begin

setlength(filterlista,4);
setlength(filterlistb,4);

 filterlista[0]:= c[ord(sc_dataexchangefiles)];
 filterlistb[0]:= '*.csv';
 
 filterlista[1]:= 'POT ' + c[ord(sc_templatesfiles)];
 filterlistb[1]:= '*.pot';
 
 filterlista[2]:= 'PO ' + c[ord(sc_translationfiles)];
 filterlistb[2]:= '*.po';
 
 filterlista[3]:= 'TXT ' + c[ord(sc_txtfiles)] + ' ' + c[ord(sc_context)] ;
 filterlistb[3]:= '*.txt';
 
  with projectfo.impexpfiledialog.controller.filterlist do begin
    asarraya:= filterlista;
    asarrayb:= filterlistb;
    end;

   if checksave then if 
      projectfo.impexpfiledialog.controller.execute(str1,fdk_open) then begin
    stream:= ttextdatastream.create(str1,fm_read);
    doimport(stream,charencodingty(projectfo.impexpencoding.value));
    // updatedata;
    formatchanged(sender);
    importtype:=-1;
 end; 
 end; 
 end;
 projectfo.impexpfiledialog.controller.filterindex := 0;
end;

procedure tmainfo.writeexprecord(const sender: ttreenode);
var
 bo1,bo2: boolean;
 int1: integer;
begin
 with tpropinfonode1(sender) do begin
 
   if nont.value then bo2:= not info.donottranslate
   else if ntonly.value then bo2:= info.donottranslate
   else bo2:= true;
  
  if fparent <> nil then begin
   if stringonly.value then
   bo1:=  (info.valuetype in
            [vastring,valstring,vawstring,vautf8string])
    else bo1 := true;        
  
   if bo1 and bo2 then begin
    writerecord(sender);
    end;
  end;
    
   if bo2 then begin
   for int1:= 0 to fcount -1 do begin
    writeexprecord(fitems[int1]);
   end;
   end;
 end;
end;

procedure tmainfo.doexport(stream: ttextdatastream; aencoding: charencodingty);
var
filind: integer;
begin
 stream.encoding:= aencoding;
 datastream:= stream;
 try
  filind := projectfo.impexpfiledialog.controller.filterindex;
 
  case filind of
  // csv
  0: begin
     datastream.writerecord(getcolumnheaders);
     end;
   // pot
  1: begin
     datastream.writeln(projectfo.memopotheader.value);
     datastream.writeln();
     end;
  2: begin
    datastream.writeln(projectfo.memopotheader.value);
     datastream.writeln();
     end;
   // po  
  3: begin
     datastream.writeln(projectfo.memopoheader.value);
     datastream.writeln();
     end;
  4: begin
     datastream.writeln(projectfo.memopoheader.value);
     datastream.writeln();
     end;
    // txt 
  5: begin
     datastream.writeln('¿¡');
     end;
   end;
      
  writeexprecord(rootnode);
 finally
  datastream.Free;
 end;
end;

procedure tmainfo.exportonexecute(const sender: tobject);
var
 stream: ttextdatastream;
 str1: filenamety;
 filterlista : msestringarty;
 filterlistb : msestringarty;
begin
//if (nostring.value) or ((nostring.value = false) and (stringonly.value = false)) then
//showmessage('Only exportation of strings is allowed.') else
//   begin 
if projloaded then begin
setlength(filterlista,6);
setlength(filterlistb,6);

 filterlista[0]:= c[ord(sc_dataexchangefiles)];
 filterlistb[0]:= '*.csv';
 
 filterlista[1]:= 'POT ' + c[ord(sc_templatesfiles)] + ' ' + c[ord(sc_nocontext)] ;
 filterlistb[1]:= '*.pot';
 
 filterlista[2]:= 'POT ' + c[ord(sc_templatesfiles)] + ' ' + c[ord(sc_context)] ;
 filterlistb[2]:= '*.pot';
 
 filterlista[3]:= 'PO ' + c[ord(sc_translationfiles)] + ' ' + c[ord(sc_nocontext)] ;
 filterlistb[3]:= '*.po';
 
 filterlista[4]:= 'PO ' + c[ord(sc_translationfiles)] + ' ' + c[ord(sc_context)] ;
 filterlistb[4]:= '*.po';
 
 filterlista[5]:= 'TXT ' + c[ord(sc_txtfiles)] + ' ' + c[ord(sc_context)] ;
 filterlistb[5]:= '*.txt';
 
   with projectfo.impexpfiledialog.controller.filterlist do begin
    asarraya:= filterlista;
    asarrayb:= filterlistb;
    end;
 
if projectfo.impexpfiledialog.controller.execute(str1,fdk_save) then begin
    showworkpan;
    application.processmessages;
    stream:= ttextdatastream.create(str1,fm_create);
    setlength(rootvaluearray,0); 
    doexport(stream,charencodingty(projectfo.impexpencoding.value));
    formatchanged(sender);
    workpan.visible := false;
  //  end;
   projectfo.impexpfiledialog.controller.filterindex := 0; 
 end;
 
 end;   
end;

procedure tmainfo.clearonexecute(const sender: tobject);
begin
 rootnode.clear;
 updatedata;
end;

procedure tmainfo.loadproject;
var
 int1: integer;
 file1: tmsefilestream;
 mstr1: msestring;
begin
 if isloaded  = true then begin
 grid.visible := true;
 statusdisp.visible := true;
 tgroupbox1.visible := true;
 application.processmessages;
 
 rootnode.clear;
 try
  for int1:= 0 to projectfo.grid.rowcount - 1 do begin
   file1:= tmsefilestream.create(tosysfilepath(projectfo.unitsdir.value+projectfo.filename[int1]));
  // writeln(projectfo.unitsdir.value+projectfo.filename[int1]);
   case resfilekindty(projectfo.filekind[int1]) of
    rfk_module: begin
     mstr1:= readmodule(file1);
    end;
    rfk_unit: begin
     mstr1:= readunit(file1);
    end;
    rfk_resstrings: begin
     mstr1:= readstringresource(file1,true);
    end;
    rfk_resource: begin
     mstr1:= readstringresource(file1,false);
    end;
   end;
   projectfo.rootname[int1]:= mstr1;
  end;
  rootnode.initlang(projectfo.grid2.rowcount);
  readprojectdata;
  formatchanged(nil);
 finally
  updatecaption;
 end;
end;
end;

procedure tmainfo.readprojectdata;
begin
if projloaded then begin
 if projectfo.datafilename.value <> '' then begin
  try
   doread(ttextdatastream.Create(projectfo.datafilename.value),ce_utf8);
  except
  {projectfo.unitsdir.frame.colorclient := cl_ltyellow;
  projectfo.datafilename.frame.colorclient := cl_ltyellow;
  projectfo.dir.frame.colorclient := cl_ltyellow;
  projectfo.visible := true;
  application.processmessages;
  }
   application.handleexception(self);
  projectfo.unitsdir.frame.colorclient := cl_ltyellow;
  projectfo.datafilename.frame.colorclient := cl_ltyellow;
  projectfo.dir.frame.colorclient := cl_ltyellow;
  onprojectedit(nil);
  projectfo.bringtofront;
  application.processmessages;
     
  end;
 end;
end;
end;

procedure tmainfo.dowrite(stream: ttextdatastream; aencoding: charencodingty);
begin
if projloaded then begin
 stream.encoding:= aencoding;
 datastream:= stream;
 try
  datastream.writerecord(getcolumnheaders);
  rootnode.iterate({$ifdef FPC}@{$endif}writerecord);
 finally
  datastream.Free;
 end;
 end;
end;

procedure tmainfo.writeprojectdata;
var
 stream: ttextdatastream;
begin
if projloaded then begin
 stream:= ttextdatastream.Create(projectfo.datafilename.value,fm_create);
 dowrite(stream,ce_utf8);
 fdatachanged:= false;
 updatecaption;
end; 
end;

procedure tmainfo.onprojectopen(const sender: tobject);
begin
 if projectfiledialog.execute = mr_ok then begin
  projloaded := true;
  projectfo.projectstat.filename:= projectfiledialog.controller.filename;
  projectfo.projectstat.readstat;
  formatchanged(sender);
 end;
end; 

procedure tmainfo.onprojectsave(const sender: tobject);
begin
if projloaded then begin
 showworkpan;
 projectfo.impexpfiledialog.controller.filterindex := 0;
 application.processmessages;
 writeprojectdata;
 application.processmessages;
 workpan.visible := false;
 end;
end;
 
procedure tmainfo.newprojectexe(const sender: TObject);
begin
 if checksave and (projectfiledialog.controller.execute(fdk_save,
                       c[ord(sc_newtranslateproject)]) = mr_ok) then begin
  projectfo.free;
  application.createform(tprojectfo, projectfo);
  clearonexecute(nil);
  with projectfo.projectstat do begin
   filename:= projectfiledialog.controller.filename;
   if not fileexists(filename) then begin
    projectfo.datafilename.value:= replacefileext(filename,'trd');
    projectfo.impexpfiledialog.controller.clear;
    projectfo.impexpfiledialog.controller.filename:= replacefileext(filename,'csv');
    writeprojectdata;
   end
   else begin
    writestat;
   end;
  end;
  updatecaption;
  projectfo.memopoheader.value := headerfo.memopoheader.value;
  projectfo.memopotheader.value := headerfo.memopotheader.value;
  numrow(sender);
  statusdisp.value := '';
 end;
end;

procedure tmainfo.saveasexecute(const sender: TObject);
begin
if projloaded then begin
 if projectfiledialog.controller.execute(fdk_save) = mr_ok then begin
  showworkpan;
  application.processmessages;
  projectfo.projectstat.filename:= projectfiledialog.controller.filename;
  projectfo.projectstat.writestat;
  writeprojectdata;
  application.processmessages;
  workpan.visible := false;
 end;
 end;
end;

procedure tmainfo.onprojectedit(const sender: tobject);
begin
if projloaded then begin
 projectfo.show(true);
 if projectfo.restype = 1 then begin
 projectfo.projectstat.writestat;
 projectfo.projectstat.readstat;
 formatchanged(sender);
 end;
 end;
end;

procedure tmainfo.makeexecute(const sender: tthreadcomp);

 procedure addmessage(const amessage: msestring);
 begin
  application.lock;
  messagesfo.messages.addchars(amessage);
  application.unlock;
 end;

var
 macroar: macroinfoarty;
 error: boolean;
 
 function doproc(const commandstr: msestring): boolean;
 var
  mstr1: msestring;
  int3: integer;
 begin
  result:= false;
  mstr1:= expandmacros(commandstr,macroar);
  int3:= messagesfo.messages.execprog(mstr1);
  if int3 = invalidprochandle then begin
   error:= true;
  end
  else begin
   int3:= messagesfo.messages.waitforprocess;
   if int3 <> 0 then begin
    addmessage(c[ord(sc_execerror)]+' '+inttostrmse(int3)+'.');
    error:= true;
   end
   else begin
    result:= true;
   end;
  end;
 end;
 
var
 int1,int2,int3: integer;
 stream,stream1: tmsefilestream;
 stream2: ttextstream;
 node: tpropinfonode;
 afilename: filenamety;
 modulenames,resourcenames: stringarty;
 str1: msestring;
 commandstring: msestring;
 mstr1: msestring;
// actdir: filenamety;
 dirbefore: filenamety;
 basename: filenamety;

begin
// basename:= filenamebase(projectfo.projectstat.filename);
 basename:= projectfo.destname.value;
 if basename = '' then begin
  basename:= filenamebase(projectfo.datafilename.value);
 end;
 if basename = '' then begin
  basename:= filenamebase(projectfo.projectstat.filename);
 end;
 commandstring:= expandmacros(projectfo.makecommand.value,
             sysenv.getcommandlinemacros(ord(env_macrodef),-1,-1,
                                              getsyssettingsmacros));
 setlength(macroar,2);
 macroar[0].name:= 'LIBFILE';
 macroar[1].name:= 'LIBFILEBASE';
 dirbefore:= getcurrentdirmse;
 error:= false;
 for int1:= 0 to projectfo.grid2.rowcount - 1 do begin
  if error then break;
  rootnode.transferlang(int1);
  try
   addmessage(c[ord(sc_making)]+' "'+tosysfilepath(projectfo.dir[int1])+'".'+lineend);
   modulenames:= nil;
   resourcenames:= nil;
   for int2:= 0 to projectfo.grid.rowcount - 1 do begin
    if error then break;
    node:= nil;
    afilename:= tosysfilepath(filepath(projectfo.dir[int1],msefileutils.filename(projectfo.filename[int2])));
    if issamefilename(afilename,tosysfilepath(filepath(projectfo.filename[int2]))) then begin
     addmessage(afilename+' '+c[ord(sc_overwritesitself)]+'.');
     error:= true;
     break;
    end;
    for int3:= 0 to rootnode.count - 1 do begin
     if rootnode[int3].info.name = 
                       ansistring(projectfo.rootname[int2]) then begin
      node:= rootnode[int3];
      break;
     end;
    end;
    if node <> nil then begin
     case resfilekindty(projectfo.filekind[int2]) of
      rfk_resource: begin
       stream:= tmsefilestream.Create(tosysfilepath(projectfo.filename[int2]),fm_read);
       try
        stream1:= tmsefilestream.Create(removefileext(afilename)+drcext,fm_create);
        try
         writeresources(stream,stream1,node);
        finally
         stream1.Free;
        end;
       finally
        stream.Free;
       end;
      end;
      rfk_resstrings: begin
       stream2:= ttextstream.Create(afilename,fm_create);
       try
        writefpcresourcestrings(stream2,node);
       finally
        stream2.Free;
       end;
       str1:= ansistring(filenamebase(afilename))+rstext;
       resourcetexttoresourcesource(afilename,str1,true);
       additem(resourcenames,str1);
      end;
      rfk_unit: begin
       stream:= tmsefilestream.Create(tosysfilepath(projectfo.filename[int2]),fm_read);
       try
        stream1:= tmsefilestream.Create(afilename,fm_create);
        try
         writeconsts(stream,stream1,node);
        finally
         stream1.Free;
        end;
       finally
        stream.Free;
       end;
      end;
      rfk_module: begin
       stream:= tmsefilestream.Create; //memory
       try
        writeprops(stream,node);
        stream.Position:= 0;
        stream1:= tmsefilestream.Create(afilename,fm_create);
        try
         objectbinarytotextmse(stream,stream1);
        finally
         stream1.Free;
        end;
       finally
        stream.Free;
       end;
       formtexttoobjsource(afilename,'','',of_default,true);
       additem(modulenames,ansistring(filenamebase(afilename)));
      end;
     end;
    end;
   end;
   if (modulenames <> nil) or (resourcenames <> nil) then begin
    with projectfo do begin
     macroar[0].value:= basename+'_'+lang[int1]+'.pas';
     macroar[1].value:= filenamebase(macroar[0].value);
     createlanglib(dir[int1]+macroar[0].value,modulenames,resourcenames);
     if makeon.value then begin
      try
       setcurrentdirmse(dir[int1]);
       if beforemake.value <> '' then begin
        if not doproc(beforemake.value) then begin
         break;
        end;
       end;
       if doproc(commandstring) then begin
        if aftermake.value <> '' then begin
         doproc(aftermake.value);
        end
        else begin
         mstr1:= macroar[1].value;
         {$ifdef mswindows}
         mstr1:= mstr1+'.dll';
         {$else}
         mstr1:= 'lib'+mstr1+'.so';
         {$endif}
         {$ifdef mswindows}
          // copyfile(mstr1,'..\'+mstr1,true);
         {$else}
         fpsystem('chmod 777 '+mstr1);
         // fpsystem('cp -f '+mstr1+' '+'../'+mstr1);
         {$endif}
        end;
       end;
      finally
       setcurrentdirmse(dirbefore);
      end;
     end;
    end;
   end;
  except
   on e: exception do begin
    addmessage(msestring(e.message+lineend));
    error:= true;
   end;
   else begin
    error:= true;
   end;
  end;
 end;
 if error then begin
  addmessage('**** '+c[ord(sc_error)]+' ****'+lineend);
 end
 else begin
  addmessage(c[ord(sc_finishedok)]+lineend);
 end;
 application.lock;
 messagesfo.running:= false;
 application.unlock;
end;

procedure tmainfo.showworkpan;
begin
    workpan.left := 0;
    workpan.top := 0;
    workpan.width := width-4;
    workpan.height := height-statusdisp.height-10;
    workpan.font.color := cl_white;
    workpan.visible := true;
end;

procedure tmainfo.makeonexecute(const sender: tobject);
begin
if projloaded then begin
 if checksave(true) then begin
  messagesfo.messages.clear;
  messagesfo.running:= true;
  messagesfo.show; //winid must exist
  threadcomp.run; 
  messagesfo.show(true);
  loadproject;
  formatchanged(sender);
  // workpan.visible := false;
 end;
 end;
end;

procedure tmainfo.maketerminate(const sender: tthreadcomp);
begin
 messagesfo.running:= false;
end;

procedure tmainfo.nontonsetvalue(const sender: tobject; var avalue,
  accept: boolean);
begin
 if avalue then begin
  ntonly.value:= false;
 end;
end;

procedure tmainfo.ntonlyonsetvalue(const sender: tobject; var avalue,
  accept: boolean);
begin
 if avalue then begin
  nont.value:= false;
 end;
end;

procedure tmainfo.mainupdatestat(const sender: TObject; const filer: tstatfiler);
var
 mstr1: msestring;
begin
  updatesettings(filer);
 mstr1:= projectfo.projectstat.filename;
 filer.updatevalue('projectfile',mstr1);
 projectfo.projectstat.filename:= mstr1;
  if not projloaded then mstr1 := '' ;
 if mstr1 <> '' then begin
  try
   setcurrentdirmse(filedir(mstr1));
  except
  application.handleexception(nil);
   projectfo.unitsdir.frame.colorclient := cl_ltyellow;
  projectfo.datafilename.frame.colorclient := cl_ltyellow;
  projectfo.dir.frame.colorclient := cl_ltyellow;
  onprojectedit(sender);
  projectfo.bringtofront;
  application.processmessages;
  end;
 end;
 if filer.iswriter then begin
  projectfo.projectstat.writestat;
 end
 else begin
  projectfo.projectstat.readstat;
 end;
end;

procedure tmainfo.configureonexecute(const sender: TObject);
begin
 editsettings(c[ord(sc_configuremsei18n)]);
end;

function tmainfo.checksave(cancelonly: boolean = false): boolean;
var
 mstr1: msestring;
begin
 result:= true;
 if fdatachanged then begin
  mstr1:= c[ord(sc_datahaschanged)]+'.'+lineend+c[ord(sc_doyouwishtosave)]+'?';
  if cancelonly then begin
   if askok(mstr1,c[ord(sc_confirmation)]) then begin
    writeprojectdata;
   end
   else begin
    result:= false;
   end;
  end
  else begin
   case askyesnocancel(mstr1,c[ord(sc_confirmation)]) of
    mr_no: begin end;
    mr_yes: begin
     writeprojectdata;
    end;
    else begin
     result:= false;
    end;
   end;
  end;
 end;
end;

procedure tmainfo.mainclosequery(const sender: tcustommseform;
                                             var amodalresult: modalresultty);
begin
if projloaded then begin
 if not checksave then begin
  amodalresult:= mr_none;
 end
 else begin
  try
   mainstatfile.writestat;
  except
   on e: exception do begin
    if showmessage(c[ord(sc_closeerror)]+lineend+msestring(e.message),
          c[ord(sc_error)],[mr_ignore,mr_cancel]) <> mr_ignore then begin
     amodalresult:= mr_none;
    end;
   end;
  end;
 end;
 end;
end;

procedure tmainfo.mainmenuupdate(const sender: tcustommenu);
var
 bo1: boolean;
begin
 if (projectfo.projectstat.filename <> '') and (projloaded = true) then
 bo1 := true else bo1 := false;
 with mainmenu.menu do begin
  itembyname('save').visible:= bo1;
  itembyname('saveas').visible:= bo1;
  itembyname('edit').visible:= bo1;
  itembyname('import').visible:= bo1;
  itembyname('export').visible:= bo1;
  itembyname('make').visible:= bo1;
  itembyname('reset').visible:= bo1;
  itembyname('refresh').visible:= bo1;
 end;
end;

procedure tmainfo.aboutexe(const sender: TObject);
begin
 showmessage('MSEgui version: '+mseguiversiontext+lineend+
         'MSEi18n version: ' + msei18nversiontext,'About MSEi18n');
end;

procedure tmainfo.exitexe(const sender: TObject);
begin
 close;
end;

procedure tmainfo.beforelangdrawcell(const sender: tcol; const canvas: tcanvas;
               var cellinfo: cellinfoty; var processed: Boolean);
var
 int1: integer;
 str1, str2 : utf8string;
 
begin
 if coloron.value then begin
  with cellinfo.cell do begin
    int1:= typedisp[row];
   if ((int1 = ord(vastring)) or (int1 = ord(vawstring)) or (int1 = ord(valstring))   ) and 
          not donottranslate[row]
     then begin
//     if (system.pos('>',value[row]) > 1) or
//       (system.pos('>',tstringedit(grid.datacols[col].editwidget)[row]) > 1) or
//     (system.pos('<',value[row]) > 1) or
//       (system.pos('<',tstringedit(grid.datacols[col].editwidget)[row]) > 1) then
//        cellinfo.color:= cl_ltyellow else
     str1 := tstringedit(grid.datacols[col].editwidget)[row];
     str1 := utf8StringReplace(str1, #10, '', [rfReplaceAll]);
     str1 := utf8StringReplace(str1,#13, '', [rfReplaceAll]);
   
     str2 := value[row];
     str2 := utf8StringReplace(str2, #10, '', [rfReplaceAll]);
     str2 := utf8StringReplace(str2,#13, '', [rfReplaceAll]);
   
     if (str1 = str2) or (str1 = '')        
       then begin
         cellinfo.color:= cl_ltred;
        end
      else cellinfo.color:= cl_ltgreen;
      end;
     //  else 
     // if ((int1 = ord(vastring)) or (int1 = ord(vawstring))) and 
       //    donottranslate[row] then value[row] := '';
   end;
    
 end;
end;

procedure tmainfo.showcolordataentered(const sender: TObject);
begin
 grid.invalidate;
end;

procedure tmainfo.loadedexe(const sender: TObject);
begin
 iconbmp.free;
end;

procedure tmainfo.onsetstringonly(const sender: TObject; var avalue: Boolean;
               var accept: Boolean);
begin
 if avalue then begin
  nostring.value:= false;
 end;
end;

procedure tmainfo.onsetnosting(const sender: TObject; var avalue: Boolean;
               var accept: Boolean);
begin
 if avalue then begin
  stringonly.value:= false;
 end;
end;

procedure tmainfo.ontimerup(const sender: TObject);
begin
 workpan.visible := false;
 isloaded := true;
 importtype := -1;
 //mainmenu1.menu.itembyname('save').enabled := false;
 //application.processmessages;
end;

procedure tmainfo.onreset(const sender: TObject);
var
mstr1 : string;
begin
if projloaded then begin
mstr1 := c[ord(sc_doyouwanttoreset)];

if askconfirmation(mstr1) then begin
     doreset := true;
     fdatachanged:= true;
     datachanged;
     updatedata;
     numrow(sender);
     doreset := false;
    end;
  end;  
end;

procedure tmainfo.ondefhead(const sender: TObject);
begin
headerfo.visible := true;

end;

procedure tmainfo.oncreated(const sender: TObject);
var
defaultresult : array of msestring;
x : integer;
begin
projectfo.impexpfiledialog.controller.filterindex := 0;
end;



end.
