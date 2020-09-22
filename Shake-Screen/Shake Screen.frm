VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   0  'None
   Caption         =   "Form1"
   ClientHeight    =   3090
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   4680
   Icon            =   "Shake Screen.frx":0000
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   Begin VB.Timer Timer1 
      Interval        =   20
      Left            =   1800
      Top             =   1320
   End
   Begin VB.PictureBox Picture1 
      BorderStyle     =   0  'None
      Height          =   3135
      Left            =   0
      ScaleHeight     =   3135
      ScaleWidth      =   4695
      TabIndex        =   0
      ToolTipText     =   ";) Shake your Screen by amin"
      Top             =   0
      Width           =   4695
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Activate()
' Hide Task bar see Module 2
    Call HideTaskbar

' Set Picture1 Width & Hieght to Form Height & Width
    Picture1.Height = Form1.Height
    Picture1.Width = Form1.Width
End Sub
Private Sub Form_Load()
'Set Form Height & Width To Your Screen Height & Width
    Form1.Height = Screen.Height
    Form1.Width = Screen.Width

'set Capture picture to Picture Object see module 1
    Set Picture1.Picture = CaptureScreen()
End Sub

Private Sub Form_Terminate()
' Call Unhide function see module 2
    Call UnhideTaskbar
End Sub

Private Sub Form_Unload(Cancel As Integer)
' Call Unhide function see module 2
    Call UnhideTaskbar
'end this program normaly
    End
End Sub

Private Sub Picture1_DblClick()
' Call Unhide function see module 2
    Call UnhideTaskbar
'end this program normaly
    End
End Sub

Private Sub Timer1_Timer()
'Set Interval to 20 for better shake but can change to lower or higher

'Call Randomize with timer for better random selection
Randomize Timer

'set LFT Var ro random number between 1 to 12
Lft = Fix(Rnd * (12 - 1) + 1)

'set TPT Var ro random number between 1 to 12
TpT = Fix(Rnd * (12 - 1) + 1)

'set FLG Var ro random number for set Flag
flg = Fix(Rnd * (2 - 0) + 0)

'Condition by Flag for shaking
    If flg = 0 Then
        Form1.Top = Form1.Top + TpT
        Form1.Left = Form1.Left + Lft
    Else
        Form1.Top = Form1.Top - TpT
        Form1.Left = Form1.Left - Lft
    End If
End Sub
