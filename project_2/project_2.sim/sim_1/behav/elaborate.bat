@echo off
set xv_path=D:\\Vivado\\vivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto eb87155fa22c44b8a72e2ec1709fccbb -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot sim_cpu_behav xil_defaultlib.sim_cpu xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
