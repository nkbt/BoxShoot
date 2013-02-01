#Include <Constants.au3>

$hotkeyShoot = IniRead(@ScriptDir & "./config.ini", "config", "hotkeyShoot", "{PRINTSCREEN}")
$hotkey_ShootAndEdit = IniRead(@ScriptDir & "./config.ini", "config", "hotkey_ShootAndEdit", "^{PRINTSCREEN}")
$dropboxDir = IniRead(@ScriptDir & "./config.ini", "config", "dropboxDir", "NotFound")
$dropboxUrl = IniRead(@ScriptDir & "./config.ini", "config", "dropboxUrl", "NotFound")
$capExe = IniRead(@ScriptDir & "./config.ini", "config", "capExe", "MiniCap.exe")
$capParams = IniRead(@ScriptDir & "./config.ini", "config", "capParams", "-captureregselect -exit -compress 7 -noaero -save")
$editorExe = IniRead(@ScriptDir & "./config.ini", "config", "editorExe", "mspaint")

If @error Then
    MsgBox(4096, "", "Error occurred, probably no INI file.")
	_Close()
;Else
	;ConsoleWrite("$hotkeyShoot " & $hotkeyShoot & @CRLF)
	;ConsoleWrite("$dropboxDir " & $dropboxDir & @CRLF)
	;ConsoleWrite("$dropboxUrl " & $dropboxUrl & @CRLF)
	;ConsoleWrite("$capExe " & $capExe & @CRLF)
	;ConsoleWrite("$capParams " & $capParams & @CRLF)
EndIf

; Create hotkeys
HotKeySet ( $hotkeyShoot, "_Shoot" )
HotKeySet ( $hotkey_ShootAndEdit, "_ShootAndEdit" )


; Create tray menu
TraySetToolTip("BoxShoot")
Opt("TrayMenuMode", 1)
Opt("TrayOnEventMode",1)

; Create tray menu items
$trayItemShoot = TrayCreateItem("Shoot")
$trayItem_ShootAndEdit = TrayCreateItem("Shoot and edit")
TrayCreateItem("")
$trayItemExit = TrayCreateItem("Exit")
TraySetState(1)

; Create tray menu event handlers
TrayItemSetOnEvent($trayItemShoot, "_Shoot")
TrayItemSetOnEvent($trayItem_ShootAndEdit, "_ShootAndEdit")
TrayItemSetOnEvent($trayItemExit, "_Close")

; Don't exit program, wait for actions
While 1
    Sleep(10)
WEnd

Func _Shoot()
	_UncheckMenu()
	$filepath = _SaveFile()
EndFunc

Func _ShootAndEdit()
	_UncheckMenu()
	$filepath = _SaveFile()
	Run($editorExe & ' "' & $filePath & '"', $dropboxDir, @SW_MAXIMIZE)
EndFunc

Func _SaveFile()
	$fileSubdir = @YEAR & "-" & @MON
	If FileExists($dropboxDir & $fileSubdir) = 0 Then
		DirCreate ($dropboxDir & $fileSubdir)
	EndIf

	$fileName = @YEAR & @MON & @MDAY & "-" & @HOUR & @MIN & @SEC & ".png"
	$filePath = $dropboxDir & $fileSubdir & "\" & $fileName
	;ConsoleWrite("$filePath " & $filePath & @CRLF);

	RunWait($capExe & " " & $capParams & ' "' & $filePath & '"' , "", @SW_MINIMIZE)
	ClipPut($dropboxUrl & $fileSubdir & "/" & $fileName)

	Return $filePath
EndFunc

Func _UncheckMenu()
	TrayItemSetState($trayItemShoot, $TRAY_UNCHECKED)
	TrayItemSetState($trayItem_ShootAndEdit, $TRAY_UNCHECKED)
EndFunc

Func _Close()
	Exit 0
EndFunc