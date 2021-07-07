Set objWinHttp = CreateObject("WinHttp.WinHttpRequest.5.1")
'check for github update
URL = "https://raw.githubusercontent.com/greisenmeisen/SU-UPDATE/main/update.vbs"
objWinHttp.open "GET", URL, False
objWinHttp.send ""
SaveBinaryData "update.vbs",objWinHttp.responseBody
WScript.Sleep 500
Function SaveBinaryData(FileName, Data)
Const adTypeText = 1
Const adSaveCreateOverWrite = 2
Dim BinaryStream
Set BinaryStream = CreateObject("ADODB.Stream")
BinaryStream.Type = adTypeText
BinaryStream.Open
BinaryStream.Write Data
BinaryStream.SaveToFile FileName, adSaveCreateOverWrite
End Function
