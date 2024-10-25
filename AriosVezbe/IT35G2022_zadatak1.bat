@echo off
setlocal EnableDelayedExpansion

:pocetak
echo ***************************************
echo [1] Kreiraj tekstualni fajl Avioni.txt
echo [2] Upisi avione sa njihovim pilotom i kopilotom
echo [3] Broji ponavljanje imena
echo [4] Upisi
echo [5] Pretrazi
echo [6] Sortiraj
echo [7] Exit
echo ***************************************

set unos=
set /p unos=

if %unos% == 1 (
	if not exist Avioni.txt (
		echo Avioni aviokompanije>Avioni.txt
	) else (
		echo Fajl vec postoji!
	)
) else if %unos% == 2 (
	if exist Avioni.txt (
		for /l %%i in (0 1 1) do (
			echo Unesite sifru aviona
			set sifra=
			set /p sifra=
			echo Unesite ime i prezime pilota
			set imePrPilot=
			set /p imePrPilot=
			echo Unesite ime i prezime kopilota
			set imePrKoPilot=
			set /p imePrKoPilot=
			echo !sifra! - pilotira: !imePrPilot!, a kopilotira: !imePrKoPilot!>>Avioni.txt
		)
	) else (
		echo Fajl ne postoji!
	)
) else if %unos% == 3 (
	if exist Avioni.txt (
		echo Unesite ime za proveru
		set prov=
		set /p prov=
		set brojac=0
		for /f "tokens=4,8*" %%i in ('findstr /i "\<!prov!\>" Avioni.txt') do (
			if %%i == !prov! (
				set /a "brojac=brojac+1"
			)
			if %%j == !prov! (
				set /a "brojac=brojac+1"
			)
		)
		echo Ime se ponavlja !brojac! puta.
	) else (
		echo Fajl ne postoji!
	)
) else if %unos% == 4 (
	if exist Avioni.txt (
		set brojac=1
		for /f "tokens=1 skip=1" %%i in (Avioni.txt) do (
			echo !brojac!. Avion sa sifrom: %%i. >>SifreAviona.txt
			set /a "brojac=brojac+1"
		)
	) else (
		echo Fajl ne postoji!
	)
) else if %unos% == 5 (
	if exist Avioni.txt (
		echo Provera postojanja reci na slovo P
		for /f "tokens=4,5,8,9* skip=1" %%i in (Avioni.txt) do (
			if "!%%i:~0!" == "P" (
				echo Postoji
			) else if "!%%j:~0!" == "P" (
				echo Postoji
			) else if "!%%k:~0!" == "P" (
				echo Postoji
			) else if "!%%z:~0!" == "P" (
				echo Postoji
			) else (
				echo Ne postoji
			)
		)
	) else (
		echo Fajl ne postoji!
	)
) else if %unos% == 6 (
	sort Avioni.txt >> Sortiranje.txt
	echo  !date!>>Sortiranje.txt
) else if %unos% == 7 (
	goto :kraj
)
goto :pocetak
:kraj
endlocal
