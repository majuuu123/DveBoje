@echo off

setlocal EnableDelayedExpansion

for /l %%i in (2 2 15) do (
	echo %%i 
)
:ispocetka
echo Odaberi opciju:
echo [1] Unos broja
echo [2] Unos sastojka
echo [3] Ispisi sastojke
echo [4] Ispisi sastojke (bez prva 4)
echo [5] Izmeni fajl
echo [6] Dodaj atribut 
echo [7] Skini atribut 
echo [8] Izlaz 

set opcija=
set /p opcija=

if %opcija%==1 (
	echo.
) else if %opcija%==2 (
	echo Unesi 10 sastojaka:
	for /l %%i in (10 -1 1) do (
		set sastojak=
		set /p sastojak=
		echo %%i. !sastojak!, >>Sastojci.txt
	)

) else if %opcija%==3 (
	for /f "tokens=2" %%j in (Sastojci.txt) do (
		set S=%%j
		echo !s:~0,-1! 
	)
) else if %opcija%==4 (
	for /f "tokens=2 skip=4" %%j in (Sastojci.txt) do (
		set S=%%j
		echo !s:~0,-1!
	)
) else if %opcija%==5 (
	Sastojci.txt edit
)else if %opcija%==6 (
	Echo odaberite simbol atributa za dodavanjeL
	echo R - Read-Only
	echo A - Archive
	echo H - Hidden
	set izbor=
	set /p izbor=
	
	attrib +!izbor! Sastojci.txt
	
) else if %opcija%==7 (
	Echo odaberite simbol atributa za dodavanjeL
	echo R - Read-Only
	echo A - Archive
	echo H - Hidden
	set izbor=
	set /p izbor=
	
	attrib -!izbor! Sastojci.txt
)  else if %opcija%==8 (
	goto :kraj
) else (
	echo Greska pri unosu
)
goto :ispocetka

:kraj





endlocal