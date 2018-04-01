object Form1: TForm1
  Left = 301
  Top = 112
  Width = 928
  Height = 480
  Caption = 'MainForm'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
object Label9: TLabel
    Left = 24
    Top = 584
    Width = 66
    Height = 13
    Caption = 'Value Cmd 6::'
  end
  object Label6: TLabel
    Left = 200
    Top = 128
    Width = 22
    Height = 13
    Caption = 'Kraft'
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 715
    Width = 1155
    Height = 19
    Panels = <>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 177
    Height = 715
    Align = alLeft
    Caption = 'Panel1'
    TabOrder = 1
    object GrpInterface: TGroupBox
      Left = 1
      Top = 1
      Width = 175
      Height = 96
      Align = alTop
      Caption = 'Motor Interface'
      TabOrder = 0
      object BtnOpen: TButton
        Left = 6
        Top = 40
        Width = 161
        Height = 25
        Caption = '&Open'
        TabOrder = 0
        OnClick = BtnOpenClick
      end
      object CbCOM: TComboBox
        Left = 6
        Top = 20
        Width = 161
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ItemIndex = 7
        TabOrder = 1
        Text = 'COM8'
        Items.Strings = (
          'COM1'
          'COM2'
          'COM3'
          'COM4'
          'COM5'
          'COM6'
          'COM7'
          'COM8'
          'COM9')
      end
      object BtnClose: TButton
        Left = 6
        Top = 64
        Width = 161
        Height = 25
        Caption = '&Close'
        Enabled = False
        TabOrder = 2
        OnClick = BtnCloseClick
      end
    end
    object GrpTMCL: TGroupBox
      Left = 1
      Top = 321
      Width = 175
      Height = 393
      Align = alClient
      Anchors = [akLeft, akTop, akBottom]
      Caption = ' TMCL Command '
      TabOrder = 1
      object GrpReply: TGroupBox
        Left = 2
        Top = 15
        Width = 171
        Height = 20
        Align = alClient
        Caption = ' TMCL Reply '
        TabOrder = 0
        object Label1: TLabel
          Left = 16
          Top = 24
          Width = 66
          Height = 13
          Caption = 'Host Address:'
        end
        object Label2: TLabel
          Left = 16
          Top = 48
          Width = 79
          Height = 13
          Caption = 'Module Address:'
        end
        object Label3: TLabel
          Left = 16
          Top = 72
          Width = 33
          Height = 13
          Caption = 'Status:'
        end
        object Label4: TLabel
          Left = 16
          Top = 120
          Width = 63
          Height = 13
          Caption = 'Value Cmd 6:'
        end
        object Label5: TLabel
          Left = 16
          Top = 96
          Width = 50
          Height = 13
          Caption = 'Command:'
        end
        object Label19: TLabel
          Left = 16
          Top = 144
          Width = 30
          Height = 13
          Caption = 'Value:'
        end
        object StaticHostAddr: TStaticText
          Left = 104
          Top = 24
          Width = 49
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 0
        end
        object StaticModAddr: TStaticText
          Left = 104
          Top = 48
          Width = 49
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 1
        end
        object StaticStatus: TStaticText
          Left = 104
          Top = 72
          Width = 49
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 2
        end
        object StaticValue: TStaticText
          Left = 104
          Top = 120
          Width = 49
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 3
        end
        object StaticCmd: TStaticText
          Left = 104
          Top = 96
          Width = 49
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 4
        end
        object StaticDefault: TStaticText
          Left = 104
          Top = 144
          Width = 49
          Height = 17
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 5
        end
      end
      object sgdTMCL: TStringGrid
        Left = 2
        Top = 35
        Width = 171
        Height = 356
        Align = alBottom
        BorderStyle = bsNone
        ColCount = 2
        DefaultColWidth = 50
        DefaultRowHeight = 18
        DragMode = dmAutomatic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        GridLineWidth = 0
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
        OnDrawCell = sgdDatenDrawCell
      end
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 97
      Width = 175
      Height = 224
      Align = alTop
      Caption = 'Board Interface'
      TabOrder = 2
      object Label12: TLabel
        Left = 10
        Top = 92
        Width = 15
        Height = 13
        Caption = '- - -'
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 16
        Width = 161
        Height = 41
        Caption = 'Card Address'
        TabOrder = 0
        object SK6: TCheckBox
          Left = 60
          Top = 16
          Width = 45
          Height = 21
          Caption = 'SK6'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object SK5: TCheckBox
          Left = 12
          Top = 20
          Width = 45
          Height = 13
          Caption = 'SK5'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object Button3: TButton
        Left = 8
        Top = 64
        Width = 161
        Height = 25
        Caption = 'Connect'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button3Click
      end
      object GroupBox7: TGroupBox
        Left = 8
        Top = 160
        Width = 161
        Height = 57
        Caption = 'DA2'
        TabOrder = 2
        object Label14: TLabel
          Left = 136
          Top = 24
          Width = 22
          Height = 13
          Caption = '255'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object TrackBar2: TTrackBar
          Left = 8
          Top = 16
          Width = 129
          Height = 33
          Max = 255
          Frequency = 20
          TabOrder = 0
          ThumbLength = 15
          TickMarks = tmTopLeft
          OnChange = TrackBar2Change
        end
      end
      object GroupBox9: TGroupBox
        Left = 8
        Top = 104
        Width = 161
        Height = 57
        Caption = 'AD2'
        TabOrder = 3
        object Label16: TLabel
          Left = 140
          Top = 24
          Width = 15
          Height = 13
          Caption = '00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ProgressBar2: TProgressBar
          Left = 16
          Top = 24
          Width = 113
          Height = 17
          Max = 255
          Smooth = True
          Step = 1
          TabOrder = 0
        end
      end
    end
  end
  object Panel2: TPanel
    Left = 177
    Top = 0
    Width = 978
    Height = 715
    Align = alClient
    Caption = 'Panel2'
    TabOrder = 2
    object JvChart1: TJvChart
      Left = 1
      Top = 540
      Width = 671
      Height = 174
      Align = alClient
      AutoSize = True
      Options.XAxisValuesPerDivision = 0
      Options.XAxisLabelAlignment = taLeftJustify
      Options.XAxisDateTimeMode = False
      Options.XOrigin = 0
      Options.YOrigin = 0
      Options.MarkerSize = 1
      Options.PrimaryYAxis.YMax = 10.000000000000000000
      Options.PrimaryYAxis.YLegendDecimalPlaces = 0
      Options.SecondaryYAxis.YMax = 10.000000000000000000
      Options.SecondaryYAxis.YLegendDecimalPlaces = 0
      Options.MouseEdit = False
      Options.MouseDragObjects = False
      Options.LegendRowCount = 0
      Options.AxisLineWidth = 1
      Options.HeaderFont.Charset = DEFAULT_CHARSET
      Options.HeaderFont.Color = clWindowText
      Options.HeaderFont.Height = -11
      Options.HeaderFont.Name = 'MS Sans Serif'
      Options.HeaderFont.Style = []
      Options.LegendFont.Charset = DEFAULT_CHARSET
      Options.LegendFont.Color = clWindowText
      Options.LegendFont.Height = -11
      Options.LegendFont.Name = 'MS Sans Serif'
      Options.LegendFont.Style = []
      Options.AxisFont.Charset = DEFAULT_CHARSET
      Options.AxisFont.Color = clWindowText
      Options.AxisFont.Height = -11
      Options.AxisFont.Name = 'MS Sans Serif'
      Options.AxisFont.Style = []
      Options.PaperColor = clWhite
      Options.AxisLineColor = clBlack
      Options.CursorColor = clBlack
      Options.CursorStyle = psSolid
    end
    object Splitter1: TSplitter
      Left = 1
      Top = 537
      Width = 976
      Height = 3
      Cursor = crVSplit
      Align = alTop
    end
    object Splitter2: TSplitter
      Left = 974
      Top = 540
      Height = 174
      Align = alRight
    end
    object GroupBox3: TGroupBox
      Left = 1
      Top = 1
      Width = 976
      Height = 432
      Align = alTop
      Caption = 'Parameter'
      TabOrder = 0
      DesignSize = (
        976
        432)
      object Label11: TLabel
        Left = 12
        Top = 332
        Width = 31
        Height = 13
        Caption = 'Speed'
      end
      object lblLinks: TLabel
        Left = 12
        Top = 311
        Width = 70
        Height = 13
        Caption = 'Endpunkt links'
      end
      object lblRechts: TLabel
        Left = 12
        Top = 290
        Width = 78
        Height = 13
        Caption = 'Endpunkt rechts'
      end
      object Label8: TLabel
        Left = 12
        Top = 268
        Width = 37
        Height = 13
        Caption = 'Counter'
      end
      object Label13: TLabel
        Left = 64
        Top = 24
        Width = 22
        Height = 13
        Caption = 'Feile'
      end
      object Label15: TLabel
        Left = 40
        Top = 48
        Width = 50
        Height = 13
        Caption = 'ISO Größe'
      end
      object Label17: TLabel
        Left = 56
        Top = 72
        Width = 30
        Height = 13
        Caption = 'Länge'
      end
      object lblMittelwert: TLabel
        Left = 308
        Top = 271
        Width = 45
        Height = 13
        Caption = 'Mittelwert'
      end
      object lblKraft: TLabel
        Left = 56
        Top = 96
        Width = 22
        Height = 13
        Caption = 'Kraft'
      end
      object lblSteri: TLabel
        Left = 24
        Top = 208
        Width = 103
        Height = 13
        Caption = 'Sterilisationsvorgänge'
      end
      object lblGrenzwert: TLabel
        Left = 308
        Top = 338
        Width = 48
        Height = 13
        Caption = 'Grenzwert'
      end
      object Image1: TImage
        Left = 864
        Top = 16
        Width = 105
        Height = 105
      end
      object lblPosition: TLabel
        Left = 308
        Top = 360
        Width = 50
        Height = 13
        Caption = 'Position [°]'
      end
      object Label10: TLabel
        Left = 308
        Top = 314
        Width = 78
        Height = 13
        Caption = 'Geschwindigkeit'
      end
      object Label18: TLabel
        Left = 308
        Top = 293
        Width = 51
        Height = 13
        Caption = 'Microsteps'
      end
      object Label7: TLabel
        Left = 24
        Top = 120
        Width = 69
        Height = 13
        Caption = 'Abscherwinkel'
      end
      object Label20: TLabel
        Left = 24
        Top = 152
        Width = 64
        Height = 13
        Caption = 'Einspanntiefe'
      end
      object Label21: TLabel
        Left = 24
        Top = 168
        Width = 54
        Height = 13
        Caption = 'Temperatur'
      end
      object counter: TStaticText
        Left = 161
        Top = 266
        Width = 10
        Height = 17
        BorderStyle = sbsSunken
        Caption = '0'
        TabOrder = 0
      end
      object ResetButton: TButton
        Left = 312
        Top = 122
        Width = 113
        Height = 21
        Caption = 'Reset Counter'
        Enabled = False
        TabOrder = 1
      end
      object Stop: TButton
        Left = 874
        Top = 330
        Width = 89
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Stop'
        TabOrder = 2
        OnClick = StopClick
      end
      object startButton: TButton
        Left = 778
        Top = 330
        Width = 89
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Start'
        TabOrder = 3
        OnClick = startButtonClick
      end
      object speed: TSpinEdit
        Left = 122
        Top = 330
        Width = 49
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 4
        Value = 0
      end
      object leftSpin: TSpinEdit
        Left = 122
        Top = 308
        Width = 49
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 5
        Value = 0
      end
      object rightSpin: TSpinEdit
        Left = 122
        Top = 287
        Width = 49
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 6
        Value = 0
      end
      object cbxFeile: TComboBox
        Left = 104
        Top = 16
        Width = 145
        Height = 21
        Enabled = False
        ItemHeight = 13
        TabOrder = 7
        Text = '---'
      end
      object btnFeileLaden: TButton
        Left = 312
        Top = 16
        Width = 65
        Height = 21
        Caption = 'laden ...'
        TabOrder = 8
        OnClick = btnFeileLadenClick
      end
      object btnFeileBearbeiten: TButton
        Left = 384
        Top = 16
        Width = 81
        Height = 21
        Caption = 'bearbeiten ...'
        Enabled = False
        TabOrder = 9
        OnClick = btnFeileBearbeitenClick
      end
      object btnFeileNeu: TButton
        Left = 256
        Top = 16
        Width = 49
        Height = 21
        Caption = 'neu ...'
        TabOrder = 10
        OnClick = btnFeileNeuClick
      end
      object cbxISO: TComboBox
        Left = 104
        Top = 40
        Width = 145
        Height = 21
        ItemHeight = 13
        TabOrder = 11
        Text = '---'
        Items.Strings = (
          '6'
          '8'
          '10'
          '15'
          '20'
          '25'
          '30'
          '35'
          '40'
          '45'
          '50'
          '55'
          '60'
          '70'
          '80'
          '90'
          '100')
      end
      object medtLaenge: TMaskEdit
        Left = 104
        Top = 64
        Width = 143
        Height = 21
        EditMask = '990.99;1;_'
        MaxLength = 6
        TabOrder = 12
        Text = '000.00'
      end
      object stxtMW: TStaticText
        Left = 457
        Top = 266
        Width = 10
        Height = 17
        BorderStyle = sbsSunken
        Caption = '0'
        TabOrder = 13
      end
      object btnWerteSpeichern: TButton
        Left = 776
        Top = 360
        Width = 187
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'Werte in Tabelle übernehmen'
        TabOrder = 14
        OnClick = btnWerteSpeichernClick
      end
      object stxtMSteps: TStaticText
        Left = 457
        Top = 287
        Width = 10
        Height = 17
        BorderStyle = sbsSunken
        Caption = '0'
        TabOrder = 15
      end
      object stxtVelocity: TStaticText
        Left = 457
        Top = 309
        Width = 10
        Height = 17
        BorderStyle = sbsSunken
        Caption = '0'
        TabOrder = 16
      end
      object medtKraft: TMaskEdit
        Left = 104
        Top = 88
        Width = 143
        Height = 21
        EditMask = '990.99;1;_'
        MaxLength = 6
        TabOrder = 17
        Text = '000.00'
      end
      object spinSteri: TSpinEdit
        Left = 168
        Top = 202
        Width = 49
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 18
        Value = 0
      end
      object sedtGrenzwert: TSpinEdit
        Left = 418
        Top = 335
        Width = 49
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 19
        Value = 50
      end
      object stxtPosition: TStaticText
        Left = 457
        Top = 357
        Width = 10
        Height = 17
        BorderStyle = sbsSunken
        Caption = '0'
        TabOrder = 20
      end
      object cbxRechts: TCheckBox
        Left = 176
        Top = 288
        Width = 97
        Height = 17
        Caption = 'Dauerlauf rechts'
        TabOrder = 21
        OnClick = cbxRechtsClick
      end
      object cbxLinks: TCheckBox
        Left = 176
        Top = 312
        Width = 97
        Height = 17
        Caption = 'Dauerlauf links'
        TabOrder = 22
        OnClick = cbxLinksClick
      end
      object MediaPlayer1: TMediaPlayer
        Left = 512
        Top = 384
        Width = 253
        Height = 30
        FileName = 
          'C:\Dokumente und Einstellungen\Yannick\Desktop\Feilentester\feil' +
          'ekaputt.wav'
        Visible = False
        TabOrder = 23
      end
      object btnLaser: TButton
        Left = 776
        Top = 392
        Width = 185
        Height = 25
        Anchors = [akRight, akBottom]
        Caption = 'LASER an'
        TabOrder = 24
        OnClick = btnLaserClick
      end
      object medtTiefe: TMaskEdit
        Left = 104
        Top = 144
        Width = 143
        Height = 21
        EditMask = '990.99;1;_'
        MaxLength = 6
        TabOrder = 25
        Text = '000.00'
      end
      object medtTemperatur: TMaskEdit
        Left = 104
        Top = 168
        Width = 143
        Height = 21
        EditMask = '990.99;1;_'
        MaxLength = 6
        TabOrder = 26
        Text = '000.00'
      end
      object cbxWarnton: TCheckBox
        Left = 776
        Top = 304
        Width = 185
        Height = 17
        Anchors = [akRight, akBottom]
        Caption = 'Warnton bei Feilenbruch'
        Checked = True
        State = cbChecked
        TabOrder = 27
      end
      object Button1: TButton
        Left = 688
        Top = 328
        Width = 75
        Height = 25
        Caption = 'Button1'
        TabOrder = 28
        OnClick = Button1Click
      end
    end
    object sgdDaten: TStringGrid
      Left = 1
      Top = 433
      Width = 976
      Height = 104
      Align = alTop
      BorderStyle = bsNone
      ColCount = 16
      DefaultRowHeight = 18
      FixedCols = 0
      RowCount = 2
      TabOrder = 1
      OnDrawCell = sgdDatenDrawCell
      ColWidths = (
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64
        64)
    end
    object Panel3: TPanel
      Left = 672
      Top = 540
      Width = 302
      Height = 174
      Align = alRight
      Caption = 'Panel3'
      TabOrder = 2
      object Memo1: TMemo
        Left = 1
        Top = 339
        Width = 300
        Height = 60
        Align = alClient
        BevelInner = bvNone
        BorderStyle = bsNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        Lines.Strings = (
          'Memo1')
        ParentFont = False
        TabOrder = 0
      end
      object sgdDetails: TStringGrid
        Left = 1
        Top = 1
        Width = 300
        Height = 338
        Align = alTop
        BorderStyle = bsNone
        ColCount = 7
        DefaultColWidth = 50
        DefaultRowHeight = 18
        DragMode = dmAutomatic
        FixedCols = 0
        RowCount = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        GridLineWidth = 0
        ParentFont = False
        ScrollBars = ssVertical
        TabOrder = 1
        OnDrawCell = sgdDatenDrawCell
      end
    end
  end
  object medtWinkel: TMaskEdit
    Left = 288
    Top = 120
    Width = 143
    Height = 21
    EditMask = '990.99;1;_'
    MaxLength = 6
    TabOrder = 3
    Text = '000.00'
  end
  object Comm32: TComm32
    DeviceName = 'COM2'
    MonitorEvents = [evRxChar]
    FlowControl = fcNone
    Options = []
    OnRxChar = Comm32RxChar
    Simple = False
    Left = 632
    Top = 384
  end
  object Timer3: TTimer
    Interval = 1
    OnTimer = Timer3Timer
    Left = 600
    Top = 388
  end
  object OpenDlgFeile: TOpenDialog
    Left = 546
    Top = 42
  end
  object MainMenu1: TMainMenu
    Left = 569
    Top = 384
    object Daten1: TMenuItem
      Caption = 'Daten'
      object ffnen1: TMenuItem
        Caption = 'Öffnen'
        OnClick = ffnen1Click
      end
      object mmDatenSpeichern: TMenuItem
        Caption = 'Speichern'
        Enabled = False
        OnClick = mmDatenSpeichernClick
      end
      object Spe1: TMenuItem
        Caption = 'Speichern unter'
        OnClick = Spe1Click
      end
    end
    object Programmbeenden1: TMenuItem
      Caption = 'Programm beenden'
      OnClick = Programmbeenden1Click
    end
  end
  object tmrMessung: TTimer
    Enabled = False
    Interval = 1
    OnTimer = tmrMessungTimer
    Left = 663
    Top = 385
  end
  object OpenDlgDaten: TOpenDialog
    Left = 138
    Top = 41
  end
  object SaveDlgDaten: TSaveDialog
    Left = 138
    Top = 65
  end
  object SaveDlgDetails: TSaveDialog
    Filter = 'Detailsdaten|*.ddt'
    Left = 538
    Top = 385
  end

end
