@echo off
:input
title VideoUtils
echo VideoUtils
set /p input= type 1 to compress, press 2 to upscale, press 3 for both and press 4 to exit: 
if "%input%"=="1" (
    ffmpeg.exe -i %1 -c:v libx264 -vf scale=1920:1080:flags=bicubic -preset medium -rc constqp -crf 18 -c:a copy "%~dpn1 - Compressed.mp4"
)
if "%input%"=="2" (
    ffmpeg.exe -i %1 -c:v h264_nvenc -vf scale=3840:2160:flags=bicubic -preset medium -rc constqp -crf 18 -c:a copy "%~dpn1 - 4K.mp4"
)
if "%input%"=="3" (
    ffmpeg.exe -i %1 -c:v libx264 -vf scale=3840:2160:flags=bicubic -preset medium -rc constqp -crf 18 -c:a copy "%~dpn1 - 4K - Compressed.mp4"
)
if "%input%"=="4" (
    exit
)
cls
pause
