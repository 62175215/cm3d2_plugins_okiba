call "%~dp0csc-basic-options.bat" > "%RF%"
del "%OUT%" >nul 2>&1
"%csc%" "@%RF%" || exit /b 1
del "%RF%" >nul 2>&1

if not exist "%OUT%" (
  echo �G���[�F�R���p�C���Ɏ��s���܂����B�u"%OUT%"�v�������ł��܂���ł���
  exit /b 1
)


echo �����F�R���p�C���ɐ������A�u"%OUT%"�v�𐶐����܂���
