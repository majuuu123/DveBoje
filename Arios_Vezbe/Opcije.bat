@echo off 

setlocal EnableDelayedExpansion
cd  vezba

:pocetak

echo Odaberite jednu od opcija: 
echo [1] Kreiraj novi fajl Studenti.txt
echo [2] Kreiraj novi fajl Indeksi.txt
echo [3] Obrisi sadrzaj Indeksi.txt
echo [4] Obrisi sadrzaj direktorijuma vezba 
echo [5] Upisi novog studenta 
echo [6] Upisi novi broj indeksa 
echo [7] Pretrazi
echo [8] Izlaz
echo *****************

set opcija=
set /p opcija=

if %opcija% == 1 (
	if not exist Studenti.txt (
		type nul>Studenti.txt
	) else (
		echo Postoji fajl
	)
) else if %opcija% == 2 (
	if not exist Indeksi.txt (
		type nul>Indeksi.txt
	) else (
		echo Fajl postoji
	)
) else if %opcija% == 3 (
	type nul>Indeksi.txt
	echo Sadrzaj fajla uspesno obrisan
) else if %opcija% == 4 (
	if exist Studenti.txt (
		del Studenti.txt
	)
	if exist Indeksi.txt (
		del Indeksi.txt
	)
) else if %opcija% == 5 (
	echo Unesite ime studenta: 
	set name=
	set /p name=
	echo Unesite prezime studenta:
	set surname=
	set /p surname=
	echo !name! !surname! >> Studenti.txt 
) else if %opcija% == 6 (
	set br_index=
	echo Unesite broj indeksa:
	set /p br_index=
	echo !br_index! >> Indeksi.txt
) else if %opcija% == 7 (
	echo Unesi prezime za pretragu: 
	set search=
	set /p search=
	set rbr=1
	for /f "tokens=2" %%i in ('findstr /i "!search!" Studenti.txt')	do (
		echo !rbr!. %%i %date% %time%>>brojstudenata.txt 
		set /a "rbr=!rbr!+1"
	)
	
	
) else if %opcija% == 8 (
	goto :kraj
) else (
	echo Greska
)
goto :pocetak


:kraj



endlocal
pause >nul