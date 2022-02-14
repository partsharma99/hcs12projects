@set serial_port0=COM4
@set buad_rate=9600
@set serial_settings=N,8,1

@echo off
echo ==========Start Compiling the Code==========

cd ..
REM make clean
REM make
cd bin

echo =========Configure the Serial Port==========

mode %serial_port0% %buad_rate%,%serial_settings%

echo =============Uploading the Code=============


echo load >%serial_port0%
type ..\000.s19 >%serial_port0%
echo g 2000 >%serial_port0%

echo ===============Finished======================
REM echo Press ENTER to continue ...
REM @pause>nul

