@echo off

set WSID=211811884

echo Please Confirm. Is everything ready?

pause
"../../../bin/gmad" create -folder . -out packaged.gma
"../../../bin/gmpublish" update -addon packaged.gma -id %WSID% -icon icon.jpg
del packaged.gma
pause