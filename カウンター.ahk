IfWinExist , Shadowverse
{
}
else
{
  MsgBox ,�V���h�E�o�[�X�����o����܂���ł����B�V���h�E�o�[�X���N��������ԂŎ��s���Ă��������B�A�v�����I�����܂��B
  ExitApp
}
CustomColor := cWhite	; Can be any RGB color (it will be made transparent below).
Gui, Color, %CustomColor%
Gui, Font, s13 Bold Q5 cRed
Gui, Add, Text, vEncText , A:�G���V�F���gAF	x00	
Gui, Add, Text, vAnaText , W:�A�i���C�YAF	x00	
Gui, Add, Text, vMisText , E:�~�X�e�B�b�NAF	x00
Gui, Add, Text, vLedText , F:���f�B�A���gAF	x00
Gui, Add, Text, vSumText , �c��AF�F	00
Gui, Add, Text, ,Windows�L�[ + H:�w���v
Gui, +AlwaysOnTop +LastFound	; Make it always-on-top and make it the last found window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 200
Gui, -Caption		; Remove the borders. Due to a quirk in Windows, this must be done after transparency.


init()
MsgBox ,�A�i���C�Y�J�E���^���N�����܂��B�I������ꍇ��Windows�L�[+Esc�L�[�����Ă��������B
IfWinExist ,Shadowverse
{
  WinActivate
}
Gui_show()

Return


;shadowverse�̃E�C���h�E���œK�p�����z�b�g�L�[
#IfWinActive ahk_exe Shadowverse.exe
;�G���V�F���g�A�[�e�B�t�@�N�g
A::
countEnc := countEnc + 1
GuiControl,, EncText, A:�G���V�F���gAF	x%countEnc%
countSum := countSum + 1
GuiControl,, SumText, �c��AF�F	%countSum%
Return
Space & A::
countEnc := countEnc - 1
GuiControl,, EncText, A:�G���V�F���gAF	x%countEnc%
countSum := countSum - 1
GuiControl,, SumText, �c��AF�F	%countSum%
Return

;�A�i���C�Y�A�[�e�B�t�@�N�g
W::
countAna := countAna + 1
GuiControl,, AnaText, W:�A�i���C�YAF	x%countAna%
countSum := countSum + 1
GuiControl,, SumText, �c��AF�F	%countSum%
Return
Space & W::
countAna := countAna - 1
GuiControl,, AnaText, W:�A�i���C�YAF	x%countAna%
countSum := countSum - 1
GuiControl,, SumText, �c��AF�F	%countSum%
Return
 
;�~�X�e�B�b�N�A�[�e�B�t�@�N�g
E::
countMis := countMis + 1
GuiControl,, MisText, E:�~�X�e�B�b�NAF	x%countMis%
countSum := countSum + 1
GuiControl,, SumText, �c��AF�F	%countSum%
Return
Space & E::
countMis := countMis - 1
GuiControl,, MisText, E:�~�X�e�B�b�NAF	x%countMis%
countSum := countSum - 1
GuiControl,, SumText, �c��AF�F	%countSum%
Return

;���f�B�A���g�A�[�e�B�t�@�N�g
F::
countLed := countLed + 1
GuiControl,, LedText, F:���f�B�A���gAF	x%countLed%
countSum := countSum + 1
GuiControl,, SumText, �c��AF�F	%countSum%
Return
Space & F::
countLed := countLed - 1
GuiControl,, LedText, F:���f�B�A���gAF	x%countLed%
countSum := countSum - 1
GuiControl,, SumText, �c��AF�F	%countSum%
Return

Space & 0::
init()
Return

;Space&J�Ŕ�\��
Space & J::
Gui,Show,hide
return

;J�ŕ\��
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
  helpmsg := helpmsg . "                   �g����`n"
  helpmsg := helpmsg . "���̃A�v���̑���͂��ׂăV���[�g�J�b�g�L�[�ōs���܂��B`n"
  helpmsg := helpmsg . "�A�v���N�����݈̂ȉ��̃V���[�g�J�b�g�L�[�����p�\�ł��B`n"
  helpmsg := helpmsg . "---------------------------------------------------------`n"
  helpmsg := helpmsg . "Windows�L�[+S:�N�����̃V���h�E�o�[�X�Ƀt�H�[�J�X����`n"
  helpmsg := helpmsg . "Windows�L�[�{Esc:�A�v���̏I��`n"
  helpmsg := helpmsg . "Windows�L�[+H:�w���v�E�B���h�E�̕\��`n"
  helpmsg := helpmsg . "---------------------------------------------------------`n"
  helpmsg := helpmsg . "���̓V���h�E�o�[�X�Ƀt�H�[�J�X������Ƃ��̂ݗL���ȃV���[�g�J�b�g`n"
  helpmsg := helpmsg . "---------------------------------------------------------`n"
  helpmsg := helpmsg . "J:�J�E���^��\���{�ʒu����`n"
  helpmsg := helpmsg . "Space+J:�J�E���^���\��`n"
  helpmsg := helpmsg . "Space+0:�J�E���^�����Z�b�g`n"
  helpmsg := helpmsg . "A,W,E,F:�J�E���^�̑���`n"
  helpmsg := helpmsg . "Space+ A,W,E,F:�J�E���^�̌���`n"
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
 MsgBox "�J�E���^���I�����܂��B"
  ExitApp
return
LWin & Esc::
 MsgBox "�J�E���^���I�����܂��B"
  ExitApp
return


init(){
global countEnc := 0
global countAna := 0
global countMis := 0
global countLed := 0
global countSum := 0
GuiControl,, EncText, A:�G���V�F���gAF	x%countEnc%
GuiControl,, AnaText, W:�A�i���C�YAF	x%countAna%
GuiControl,, MisText, E:�~�X�e�B�b�NAF	x%countAna%
GuiControl,, LedText, F:���f�B�A���gAF	x%countAna%
GuiControl,, SumText, �c��AF�F	%countSum%
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
