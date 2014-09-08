cd C:\Users\Mannir\git\ToyinTicket\target\phonegap-build
@ECHO OFF
SET /p ip=Enter Client IP Address:
CALL adb disconnect %ip%
CALL adb connect %ip%
CALL adb -s %ip%:5555 shell am force-stop com.toyin.ticket
CALL adb -s %ip%:5555 shell pm uninstall -k com.toyin.ticket
CALL adb -s %ip%:5555 install ToyinTicket.apk
ECHO Finished Install
TIMEOUT /t 5
CALL adb -s %ip%:5555 shell am start -a android.intent.action.MAIN -n com.toyin.ticket/.Main