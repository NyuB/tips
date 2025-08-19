xclip allows managing clipboard content
notably, you can pipe stdout to your copy/paste buffer
  $ echo PasteThis | xclip -i -selection clipboard
  $ # PasteThis is now accessible with Ctrl-Shift-V
you can inspect paste buffer content
  $ xclip -o -selection clipboard
  PasteThis
