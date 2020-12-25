@echo off

set base_dir=%~dp0  
%base_dir:~0,2%  

cd %base_dir%

copy ..\dts\rk-kernel.dtb 

copy ..\dts\logo.bmp

copy ..\dts\logo_kernel.bmp

resource_tool rk-kernel.dtb logo.bmp logo_kernel.bmp

if %errorlevel% EQU 0 (
	echo Info:dts to dtb success.
)else (
	echo Error:dts to dtb error.
)

del ..\Temp\Android\Image\resource.img
 
copy resource.img ..\Temp\Android\Image\resource.img 

del rk-kernel.dtb
del logo.bmp
del logo_kernel.bmp

del resource.img

:exit

@echo on
