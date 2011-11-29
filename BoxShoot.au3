#include  <Crypt.au3>

$hotkey 	= IniRead("config.ini", "MAIN", "shoot_key", "NotFound")
$DBOX_DIR 	= IniRead("config.ini", "MAIN", "DBOX_DIR", "NotFound")
$DBOX_URL 	= IniRead("config.ini", "MAIN", "DBOX_URL", "NotFound")
$CAP 		= IniRead("config.ini", "MAIN", "CAP", "NotFound")

HotKeySet ( $hotkey, "SHOOT" )

TraySetToolTip("BoxShoot")
Opt("TrayMenuMode", 1)
$exititem = TrayCreateItem("Exit")
TraySetState()

While 1
    $msg = TrayGetMsg()
    Select
        Case $msg = 0
            ContinueLoop
        Case $msg = $exititem
            CLOSE()
    EndSelect
WEnd

Func SHOOT()
	$CurTime = @YEAR & "_" & @MON & "_" & @MDAY & "_" & @HOUR & "_" & @MIN & "_" & @SEC
	$hash = _Crypt_HashData($CurTime, $CALG_MD5)
	
	$result = StringTrimLeft($hash, 2)
	$fname = $result & ".png"
	$fname = StringLower($fname) 

	Run($CAP & " -captureregselect -exit -compress 7 -bordershadow -noaero -save " & $DBOX_DIR & $fname , "", @SW_MINIMIZE)
	ClipPut($DBOX_URL & $fname)
EndFunc

Func CLOSE()
	Exit 0
EndFunc