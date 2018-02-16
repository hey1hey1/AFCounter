IfWinExist , Shadowverse
{
}
else
{
  MsgBox ,シャドウバースが検出されませんでした。シャドウバースを起動した状態で実行してください。アプリを終了します。
  ExitApp
}
CustomColor := cWhite	; Can be any RGB color (it will be made transparent below).
Gui, Color, %CustomColor%
Gui, Font, s13 Bold Q5 cRed
Gui, Add, Text, vEncText , A:エンシェントAF	x00	
Gui, Add, Text, vAnaText , W:アナライズAF	x00	
Gui, Add, Text, vMisText , E:ミスティックAF	x00
Gui, Add, Text, vLedText , F:レディアントAF	x00
Gui, Add, Text, vSumText , 残りAF：	00
Gui, Add, Text, ,Windowsキー + H:ヘルプ
Gui, +AlwaysOnTop +LastFound	; Make it always-on-top and make it the last found window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 200
Gui, -Caption		; Remove the borders. Due to a quirk in Windows, this must be done after transparency.


init()
MsgBox ,アナライズカウンタを起動します。終了する場合はWindowsキー+Escキー押してください。
IfWinExist ,Shadowverse
{
  WinActivate
}
Gui_show()

Return


;shadowverseのウインドウ内で適用されるホットキー
#IfWinActive ahk_exe Shadowverse.exe
;エンシェントアーティファクト
A::
countEnc := countEnc + 1
GuiControl,, EncText, A:エンシェントAF	x%countEnc%
countSum := countSum + 1
GuiControl,, SumText, 残りAF：	%countSum%
Return
Space & A::
countEnc := countEnc - 1
GuiControl,, EncText, A:エンシェントAF	x%countEnc%
countSum := countSum - 1
GuiControl,, SumText, 残りAF：	%countSum%
Return

;アナライズアーティファクト
W::
countAna := countAna + 1
GuiControl,, AnaText, W:アナライズAF	x%countAna%
countSum := countSum + 1
GuiControl,, SumText, 残りAF：	%countSum%
Return
Space & W::
countAna := countAna - 1
GuiControl,, AnaText, W:アナライズAF	x%countAna%
countSum := countSum - 1
GuiControl,, SumText, 残りAF：	%countSum%
Return
 
;ミスティックアーティファクト
E::
countMis := countMis + 1
GuiControl,, MisText, E:ミスティックAF	x%countMis%
countSum := countSum + 1
GuiControl,, SumText, 残りAF：	%countSum%
Return
Space & E::
countMis := countMis - 1
GuiControl,, MisText, E:ミスティックAF	x%countMis%
countSum := countSum - 1
GuiControl,, SumText, 残りAF：	%countSum%
Return

;レディアントアーティファクト
F::
countLed := countLed + 1
GuiControl,, LedText, F:レディアントAF	x%countLed%
countSum := countSum + 1
GuiControl,, SumText, 残りAF：	%countSum%
Return
Space & F::
countLed := countLed - 1
GuiControl,, LedText, F:レディアントAF	x%countLed%
countSum := countSum - 1
GuiControl,, SumText, 残りAF：	%countSum%
Return

Space & 0::
init()
Return

;Space&Jで非表示
Space & J::
Gui,Show,hide
return

;Jで表示
J::
Gui_show()
IfWinExist ,Shadowverse
{
  WinActivate
}
return



#IfWinActive 

LWin & H::
  helpmsg := "---------------------------------------------------------`n"
  helpmsg := helpmsg . "                   使い方`n"
  helpmsg := helpmsg . "このアプリの操作はすべてショートカットキーで行います。`n"
  helpmsg := helpmsg . "アプリ起動中のみ以下のショートカットキーが利用可能です。`n"
  helpmsg := helpmsg . "---------------------------------------------------------`n"
  helpmsg := helpmsg . "Windowsキー+S:起動中のシャドウバースにフォーカスする`n"
  helpmsg := helpmsg . "Windowsキー＋Esc:アプリの終了`n"
  helpmsg := helpmsg . "Windowsキー+H:ヘルプウィンドウの表示`n"
  helpmsg := helpmsg . "---------------------------------------------------------`n"
  helpmsg := helpmsg . "次はシャドウバースにフォーカスがあるときのみ有効なショートカット`n"
  helpmsg := helpmsg . "---------------------------------------------------------`n"
  helpmsg := helpmsg . "J:カウンタを表示＋位置調節`n"
  helpmsg := helpmsg . "Space+J:カウンタを非表示`n"
  helpmsg := helpmsg . "Space+0:カウンタをリセット`n"
  helpmsg := helpmsg . "A,W,E,F:カウンタの増加`n"
  helpmsg := helpmsg . "Space+ A,W,E,F:カウンタの減少`n"
  helpmsg := helpmsg . "---------------------------------------------------------`n"
  MsgBox ,%helpmsg%
return

LWin & S::
  IfWinExist ,Shadowverse
  {
    WinActivate
  }
return
RWin & S::
  IfWinExist ,Shadowverse
  {
    WinActivate
  }
return

RWin & Esc::
 MsgBox "カウンタを終了します。"
  ExitApp
return
LWin & Esc::
 MsgBox "カウンタを終了します。"
  ExitApp
return


init(){
global countEnc := 0
global countAna := 0
global countMis := 0
global countLed := 0
global countSum := 0
GuiControl,, EncText, A:エンシェントAF	x%countEnc%
GuiControl,, AnaText, W:アナライズAF	x%countAna%
GuiControl,, MisText, E:ミスティックAF	x%countAna%
GuiControl,, LedText, F:レディアントAF	x%countAna%
GuiControl,, SumText, 残りAF：	%countSum%
}

Gui_show(){
    myX := 1559.0
    myY := 877.0
    WinGetPos ,posx,posy,wid,hei
    relx := posx+Round(250.0*wid/myX)
    rely := posy+hei-Round(330.0*hei/myY)
    size := Round(13.0*wid/myX)
    Gui, Font, s%size%
    Gui,Show, x%relx% y%rely%
}
