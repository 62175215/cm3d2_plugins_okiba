@echo off
setlocal ENABLEEXTENSIONS
call %~dp0..\base.bat || exit /b %ERRORLEVEL%
pushd %~dp0

if not exist %CM3D2_MOD_MANAGED_DIR%\CM3D2.ExternalSaveData.Managed.dll (
  echo �G���[�F�ˑ��t�@�C�� %CM3D2_MOD_MANAGED_DIR%\CM3D2.ExternalSaveData.Managed.dll �����݂��Ȃ����߁A�R���p�C�����ł��܂���
  echo ExternalSaveData�̃R���p�C�����Ɏ��s���Ă�������
  exit /b 1
)

set OUT=%UNITY_INJECTOR_DIR%\CM3D2.MaidVoicePitch.Plugin.dll
set RF=temp.rsp

del %RF% >nul 2>&1
del %OUT% >nul 2>&1

echo.>%RF%
echo /nologo >>%RF%
echo /t:library >> %RF%
echo /out:%OUT% >> %RF%
echo /lib:%REIPATCHER_DIR% /r:ReiPatcher.exe /r:mono.cecil.dll /r:mono.cecil.rocks.dll >> %RF%
echo /lib:%UNITY_INJECTOR_DIR% /r:UnityInjector.dll >> %RF%
echo /lib:%CM3D2_MOD_MANAGED_DIR% /r:UnityEngine.dll /r:Assembly-CSharp.dll /r:Assembly-CSharp-firstpass.dll >> %RF%
echo /r:CM3D2.ExternalSaveData.Managed.dll >> %RF%
echo MaidVoicePitchPlugin.cs >> %RF%

%csc% @%RF% || exit /b %ERRORLEVEL%

del %RF% >nul 2>&1

if not exist %OUT% (
  echo �G���[�F�R���p�C���Ɏ��s���܂����B%OUT%�������ł��܂���ł���
) else (
  echo �����F�R���p�C���ɐ������A%OUT%�𐶐����܂���
)
popd
