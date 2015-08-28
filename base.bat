if not exist %~dp0\config.bat (
  echo �G���[�Fconfig.bat �����ݒ�̂��߁A�������I�����܂��B
  echo �ڂ����� README.md ���Q�Ƃ��Ă�������
  exit /b 1
)

call %~dp0\config.bat || exit /b %ERRORLEVEL%

set CM3D2_VANILLA_DATA_DIR=%CM3D2_VANILLA_DIR%\CM3D2%CM3D2_PLATFORM%_Data
set CM3D2_VANILLA_MANAGED_DIR=%CM3D2_VANILLA_DATA_DIR%\Managed

set CM3D2_MOD_DATA_DIR=%CM3D2_MOD_DIR%\CM3D2%CM3D2_PLATFORM%_Data
set CM3D2_MOD_MANAGED_DIR=%CM3D2_MOD_DATA_DIR%\Managed

set REIPATCHER_DIR=%CM3D2_MOD_DIR%\ReiPatcher
set UNITY_INJECTOR_DIR=%CM3D2_MOD_DIR%\UnityInjector

set CSC=C:\Windows\Microsoft.NET\Framework\v3.5\csc.exe

if not exist %CM3D2_VANILLA_DIR% (
  echo �G���[�Fconfig.bat����CM3D2_VANILLA_DIR�������t�H���_�[�u%CM3D2_VANILLA_DIR%�v�����݂��܂���
  exit /b 1
)

if not exist %CM3D2_MOD_DIR% (
  echo �G���[�Fconfig.bat����CM3D2_MOD_DIR�������t�H���_�[�u%CM3D2_MOD_DIR%�v�����݂��܂���
  exit /b 1
)

if not exist %REIPATCHER_DIR% (
  echo �G���[�FReiPatcher�t�H���_�[�u%REIPATCHER_DIR%�v�����݂��܂���
  exit /b 1
)

if not exist %UNITY_INJECTOR_DIR% (
  echo �G���[�FUnityInjector�t�H���_�[�u%UNITY_INJECTOR_DIR%�v�����݂��܂���
  exit /b 1
)

if not exist %CSC% (
  echo �G���[�FC# �R���p�C���[�ucsc.exe�v�����݂��܂���
  exit /b 1
)
