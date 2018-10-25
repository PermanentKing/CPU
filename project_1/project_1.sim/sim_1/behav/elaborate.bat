@echo off
set xv_path=D:\\Vivado\\vivado\\Vivado\\2015.2\\bin
call %xv_path%/xelab  -wto f0760f7cba7f455eaa197b32ac0ee581 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip --snapshot TestSingleCycleCpu_behav xil_defaultlib.TestSingleCycleCpu xil_defaultlib.glbl -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
