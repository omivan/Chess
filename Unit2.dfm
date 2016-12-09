object Form1: TForm1
  Left = 99
  Top = 146
  Width = 975
  Height = 650
  Caption = 'Form1'
  Color = clBtnFace
  Constraints.MaxHeight = 650
  Constraints.MaxWidth = 975
  Constraints.MinHeight = 650
  Constraints.MinWidth = 975
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnMouseDown = FormMouseDown
  OnMouseMove = FormMouseMove
  OnMouseUp = FormMouseUp
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 816
    Top = 536
    Width = 145
    Height = 57
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 12
      Height = 55
      Font.Charset = RUSSIAN_CHARSET
      Font.Color = clRed
      Font.Height = -48
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 800
    Top = 88
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 464
    Top = 72
  end
end
