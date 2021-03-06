{ MSEgui Copyright (c) 1999-2011 by Martin Schreiber

    See the file COPYING.MSE, included in this distribution,
    for details about the copyright.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
}
unit msenoguiintf;
{$ifdef FPC}{$mode objfpc}{$h+}{$endif}

interface
uses
 msesystypes;
 
{$include ../msenoguiintf.inc}

implementation
uses
 mselibc,mseevent,msesysintf1,mseapplication,msenogui,mseprocmonitor;
type
 tapplication1 = class(tnoguiapplication);
var
 sigtimerbefore: sighandler_t;
 sigtermbefore: sighandler_t;
 sigchldbefore: sighandler_t;
 timerevent: boolean;
 terminated: boolean;
 childevent: boolean;
 sempo: psemty;

procedure settimer1(us: longword);
               //send et_timer event after delay of us (micro seconds)
var
 timerval: itimerval;
begin
 fillchar(timerval,sizeof(timerval),0);
 timerval.it_value.tv_sec:= us div 1000000;
 timerval.it_value.tv_usec:= us mod 1000000;
 mselibc.setitimer(itimer_real,{$ifdef FPC}@{$endif}timerval,nil);
end;

procedure nogui_waitevent;
 procedure checkevents;
 begin
  if timerevent then  begin
   timerevent:= false;
   application.postevent(tmseevent.create(ek_timer));
  end;
  if terminated then  begin
   timerevent:= false;
   application.postevent(tmseevent.create(ek_terminate));
  end;
  if childevent then begin
   childevent:= false;
   handlesigchld;
  end;
 end;
 
begin
 with tapplication1(application) do begin
  include(fstate,aps_waiting);
  checkevents;
  while eventlist.count = 0 do begin
   with linuxsemty(sempo^) do begin
    unlock;
    sem_wait(d.sema);
    lock;
    checkevents;
   end;
  end;
  fstate:= fstate -[aps_waiting,aps_woken];
 end;
end;

procedure nogui_settimer(us: longword);
begin
 if us = 0 then begin
  us:= 1;
 end;
 settimer1(us);
end;

procedure sigtimer(SigNum: Integer); cdecl;
begin
 timerevent:= true;
 sem_post(linuxsemty(sempo^).d.sema);
end;

procedure sigterminate(SigNum: Integer); cdecl;
begin
 terminated:= true;
 sem_post(linuxsemty(sempo^).d.sema);
end;

procedure sigchild(SigNum: Integer); cdecl;
begin
 childevent:= true;
 mseprocmonitor.sigchildcallback();
 sem_post(linuxsemty(sempo^).d.sema);
end;

procedure nogui_init(const asempo: psemty);
var
 sigset1,sigset2: sigset_t;
begin
 sempo:= asempo;
 sigtimerbefore:= signal(sigalrm,{$ifdef FPC}@{$endif}sigtimer);
 sigtermbefore:= signal(sigterm,{$ifdef FPC}@{$endif}sigterminate);
 sigchldbefore:= signal(sigchld,{$ifdef FPC}@{$endif}sigchild);
 sigemptyset(sigset1);
 sigaddset(sigset1,sigchld);
 sigprocmask(sig_unblock,@sigset1,@sigset2); 
end;

procedure nogui_deinit;
begin
 terminated:= true;
 settimer1(0);
 signal(sigalrm,sigtimerbefore);
 signal(sigterm,sigtermbefore);
 signal(sigchld,sigchldbefore);
end;
 
end.
