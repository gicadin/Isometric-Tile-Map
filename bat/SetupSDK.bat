:user_configuration

:: Path to Flex SDK
set FLEX_SDK=C:\Users\Dragoola\AppData\Local\FlashDevelop\Apps\flexsdk\4.6.0
set AIR_SDK=C:\Users\Dragoola\AppData\Local\FlashDevelop\Apps\ascsdk\16.0.0

set AUTO_INSTALL_IOS=yes

:: Path to Android SDK
set ANDROID_SDK=C:\Program Files (x86)\FlashDevelop\Tools\android

:validation
if not exist "%FLEX_SDK%\bin" goto flexsdk
if not exist "%ANDROID_SDK%\platform-tools" goto androidsdk
goto succeed

:flexsdk
echo.
echo ERROR: incorrect path to Flex SDK in 'bat\SetupSDK.bat'
echo.
echo Looking for: %FLEX_SDK%\bin
echo.
if %PAUSE_ERRORS%==1 pause
exit

:androidsdk
echo.
echo ERROR: incorrect path to Android SDK in 'bat\SetupSDK.bat'
echo.
echo Looking for: %ANDROID_SDK%\platform-tools
echo.
if %PAUSE_ERRORS%==1 pause
exit

:succeed
set PATH=%PATH%;%AIR_SDK%\bin;%FLEX_SDK%\bin
set PATH=%PATH%;%ANDROID_SDK%\platform-tools

