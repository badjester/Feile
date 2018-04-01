object frmCommands: TfrmCommands
  Left = 0
  Top = 0
  Width = 178
  Height = 424
  TabOrder = 0
  Visible = False
  object Memo1: TMemo
    Left = 0
    Top = 0
    Width = 178
    Height = 424
    Align = alClient
    Lines.Strings = (
      'COMMAND'
      ''
      '1 - Rotate Right'
      '2 - Rotate Left'
      '3 - Stop'
      '4 - Move to Position'
      '5 - Axis Parameter setzen'
      '6 - Axis Parameter auslesen'
      '----------------------------------------------'
      '-'
      ''
      'TYPE'
      ''
      '(bei Command 4 )'
      '0 - Absolut'
      '1 - Relativ'
      '2 - Coordinate'
      ' '
      '(bei Command 5 bzw. 6)'
      '0 - Target Position'
      '1 - Actual Position'
      '2 - Target Velocity'
      '3 - Actual Velocity'
      '4 - Max Positioning Velocity'
      '5 - Max Acceleration'
      ''
      '7 - Current at Standby'
      '8 - Final Position Reached'
      '... --> (s. PDF bei TMCM-100 '
      'Module)'
      '')
    TabOrder = 0
  end
end
