@echo off

if exist vezba (
	echo poddirektorijum vec postoji
) else (
	mkdir vezba
)

call Opcije.bat