#cs
 Autoclicker
 F1 Start
 F2 Stop
 #ce
 Global $state = false
 Global $g_bPaused = False

 HotKeySet("{F5}", "Cycle")
 HotKeySet("{F8}", "Terminate")
 HotKeySet("{F7}", "Stop")
 HotKeySet("{F6}", "F6")

 #include <Misc.au3>
 $dll = DllOpen("user32.dll")




While 1
   While $state
	  Send("e")
	  Sleep(250)
   WEnd
WEnd

Func Terminate()
   Exit
EndFunc

 Func Cycle()

   If($state) Then
    $state = False
   Else
    $state = True
   EndIf
 EndFunc

   Func F6()

   EndFunc

Func Stop()
   $state = False
   #cs
   ToolTip('Script is Stoped', $ttposx, $ttposy)
   Sleep(1300)
   ToolTip("")
   #ce
 EndFunc

  Func TogglePause()
    $g_bPaused = Not $g_bPaused
    While $g_bPaused
        Sleep(100)
        ;ToolTip('Script is "Paused"', 0, 0)
    WEnd
    ;ToolTip("")
 EndFunc   ;==>TogglePause

 DllClose($dll)