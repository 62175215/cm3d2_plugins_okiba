set "MSBUILD_OUTPUT_FILE=%MSBUILD_TARGET_NAME%.dll"
set "MSBUILD_DESTINATION_FILE=%UNITY_INJECTOR_DIR%\%MSBUILD_OUTPUT_FILE%"

set "MSBUILD=%CSC_PATH%\msbuild.exe"
set "MSBUILD_OPTS=/nologo /tv:3.5 /t:Build"
set "MSBUILD_FILE=%MSBUILD_TARGET_NAME%.msbuild"

del "%MSBUILD_OUTPUT_FILE%" >nul 2>&1
if exist "%MSBUILD_OUTPUT_FILE%" (
  echo �R���p�C�����s�F�r���h�������Ɂu"%MSBUILD_OUTPUT_FILE%"�v�̍폜�Ɏ��s���܂���
  exit /b 1
)

del "%MSBUILD_DESTINATION_FILE%" >nul 2>&1
if exist "%MSBUILD_DESTINATION_FILE%" (
  echo �R���p�C�����s�F�r���h�������Ɂu"%MSBUILD_DESTINATION_FILE%"�v�̍폜�Ɏ��s���܂���
  exit /b 1
)

"%MSBUILD%" %MSBUILD_OPTS% %MSBUILD_FILE%
if %ERRORLEVEL% geq 1 (
  echo �R���p�C�����s�F�r���h���ɃG���[���������܂���
  exit /b 1
)

if not exist "%MSBUILD_OUTPUT_FILE%" (
  echo �R���p�C�����s�F�u"%MSBUILD_OUTPUT_FILE%"�v�������ł��܂���ł���
  exit /b 1
)

copy /y "%MSBUILD_OUTPUT_FILE%" "%MSBUILD_DESTINATION_FILE%" >nul 2>&1
if %ERRORLEVEL% geq 1 (
  echo �G���[�F�u"%MSBUILD_DESTINATION_FILE%"�v�ւ̃R�s�[�Ɏ��s���܂���
  exit /b 1
)

echo �R���p�C�������F�u"%MSBUILD_DESTINATION_FILE%"�v�𐶐����܂���
