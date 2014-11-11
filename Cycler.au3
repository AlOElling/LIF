#cs
 Cycler - Life is Feudal Helper
 F4 Mousepositioning Setter
 F5 Simple E
  -> Num 1 to 9 Cycles different speeds
 F7 Stop
 F8 Exit

 TODO:
 F6 Pullout/Recycle
  -> Num 1 to 9 Entries choice
  -> + Set Entrypoint

 #ce
 Global $stateC = false ; Cycle
 Global $stateP = false ; Pullout

 Global $stateMousePositioning = False ; is positioning happening?
 Global $mousePos1
 Global $mouseConfirm

 Global $g_bPaused = False

 HotKeySet("{F5}", "Cycle")
 HotKeySet("{F8}", "Terminate")
 HotKeySet("{F7}", "Stop")
 HotKeySet("{F6}", "F6")
 HotKeySet("{F4}", "setMousePos")

 #include <Misc.au3>
 $dll = DllOpen("user32.dll")

While 1
   While $stateC
	  Send("e")
	  Sleep(2500)
   WEnd
   While $stateP
	  Send("e") ; default Pullout Init
	  Sleep(10) ; wait for open window
	  MouseClick("left",$mousePos1[0],$mousePos1[1]) ; pick entry
	  MouseClick("left",$mouseConfirm[0],$mouseConfirm[1]) ; confirm to start process
	  Sleep(10000) ; wait for end of process
   WEnd
WEnd

Func Terminate()
   Exit
EndFunc

Func Stop()
   $stateC = False
   #cs
   ToolTip('Script is Stoped', $ttposx, $ttposy)
   Sleep(1300)
   ToolTip("")
   #ce
 EndFunc

Func Cycle()
   If($stateC) Then
    $stateC = False
   Else
    $stateC = True
   EndIf
EndFunc

Func F6()
    If($stateP) Then
    $stateP = False
   Else
    $statePe = True
   EndIf
EndFunc

Func TogglePause()
    $g_bPaused = Not $g_bPaused
    While $g_bPaused
        Sleep(100)
        ;ToolTip('Script is "Paused"', 0, 0)
    WEnd
    ;ToolTip("")
 EndFunc

Func setMousePos()
   If($stateMousePositioning) Then
    $mouseConfirm = MouseGetPos()
	$stateMousePositioning = False
   Else
    $mousePos1 = MouseGetPos()
	$stateMousePositioning = True
   EndIf
EndFunc

 DllClose($dll)