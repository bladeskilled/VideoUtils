@echo off
title Loading...
echo Loading...
powershell "(irm https://github.com/bladeskilled/VideoUtils/raw/main/VideoUtils.bat) | Out-File (Join-Path ([Environment]::GetFolderPath('SendTo')) VideoUtils.bat) -Encoding ASCII"
cls
title VideoUtils
echo VideoUtils
set /p input= type 1 to compress, press 2 to upscale, press 3 for both and press 4 to exit: 
if "%input%"=="1" (
ffmpeg.exe -i %1 -c:v libx264 -vf scale=-2:1080:flags=bicubic -preset medium -crf 22 -c:a copy "%~dpn1 - Compressed.mp4"
)
if "%input%"=="2" (
ffmpeg.exe -i %1 -c:v h264_nvenc -vf scale=-2:2160:flags=bicubic -preset medium -qp 18 -c:a copy "%~dpn1 - 4K.mp4"
)
if "%input%"=="3" (
ffmpeg.exe -i %1 -c:v libx264 -vf scale=-2:2160:flags=bicubic -preset medium -crf 22 -c:a copy "%~dpn1 - 4K - Compressed.mp4"
)
if "%input%"=="4" (
    exit
)
exit
