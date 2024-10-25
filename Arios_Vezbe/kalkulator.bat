@echo off
setlocal EnableDelayedExpansion

:listaOpcija
echo /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\
echo Izaberite opciju
echo [1] Izracunati novi izraz
echo [2] Otvoriti prethodno sacuvane podatke
echo [3] Izbrisati prethodno sacuvane podatkee
echo [4] Exit

set izraz=
set rez=
set /p opcija=
if %opcija% == 1 (
		echo Unesite izraz:
		set /P izraz=
		set /A "rez=!izraz!"
		echo !rez! >> rezultat.txt
		time /T >> rezultat.txt
) else if %opcija% == 2 (
		if exist rezultat.txt (
				type rezultat.txt
		) else (
				echo Fajl nije kreiran!
		)
) else if %opcija% == 3 (
		if exist rezultat.txt (
				type nul > rezultat.txt
		) else (
				echo Fajl ne postoji!
		)
)else if %opcija% == 4 (
		GOTO :krajbrale
) else (echo Uneli ste nepostojecu opciju!)
GOTO :listaOpcija
:krajbrale
endlocal
pause >nul