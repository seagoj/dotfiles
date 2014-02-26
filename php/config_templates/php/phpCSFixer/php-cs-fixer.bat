SET PHPPATH=C:\wamp\bin\php\php5.3.4
SET WORKPath=C:\Users\JDS.SFC\Google Drive\workspace

"C:\wamp\bin\php\php5.3.4\php.exe" "C:\Users\JDS.SFC\Google Drive\workspace\Environment\php-cs-fixer.phar" fix "%WORKPATH%\%1\src"
"%PHPPATH%\php.exe" "%WORKPATH%\Environment\php-cs-fixer.phar" fix "%WORKPATH%\%1\lib"
"%PHPPATH%\php.exe" "%WORKPATH%\Environment\php-cs-fixer.phar" fix "%WORKPATH%\%1\tests"
