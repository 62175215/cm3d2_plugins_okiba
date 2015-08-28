@echo off
setlocal ENABLEEXTENSIONS
call %~dp0..\base.bat || exit /b %ERRORLEVEL%
pushd %~dp0

set OUT=%REIPATCHER_DIR%\Patches\CM3D2.FastFade.Patcher.dll
set RF=temp.rsp

del %RF% >nul 2>&1
del %OUT% >nul 2>&1

echo.>%RF%
echo /nologo >>%RF%
echo /t:library >> %RF%
echo /out:%OUT% >> %RF%
echo /lib:%REIPATCHER_DIR% /r:ReiPatcher.exe /r:mono.cecil.dll /r:mono.cecil.rocks.dll >> %RF%
echo FastFadePatch.cs >> %RF%

%csc% @%RF%

del %RF% >nul 2>&1

if not exist %OUT% (
  echo �G���[�F�R���p�C���Ɏ��s���܂����B%OUT%�������ł��܂���ł���
) else (
  echo �����F�R���p�C���ɐ������A%OUT%�𐶐����܂���
)
popd
