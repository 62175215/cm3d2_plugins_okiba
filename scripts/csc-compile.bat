call "%~dp0csc-basic-options.bat" > %RF%
del %OUT% >nul 2>&1
%csc% @%RF% || exit /b %ERRORLEVEL%
del %RF% >nul 2>&1

if not exist "%OUT%" (
  echo �G���[�F�R���p�C���Ɏ��s���܂����B%OUT%�������ł��܂���ł���
  exit /b 1
) else (
  echo �����F�R���p�C���ɐ������A%OUT%�𐶐����܂���
)
