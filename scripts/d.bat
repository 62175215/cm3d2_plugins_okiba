@echo off

set ZIP_URL=https://github.com/neguse11/cm3d2_plugins_okiba/archive/master.zip
set ZIP=master.zip
set DST=%~dp0
set Z=%DST%%ZIP%
set D=%DST%

echo ZIP�t�@�C���u%ZIP_URL%�v�̃_�E�����[�h��

@rem http://stackoverflow.com/a/20476904/2132223
powershell -Command "(New-Object Net.WebClient).DownloadFile('%ZIP_URL%', '%ZIP%')"
if not exist %ZIP% (
  echo zip�t�@�C�� %ZIP_URL% �̃_�E�����[�h�Ɏ��s���܂����B
  exit /b 1
)

@rem http://www.howtogeek.com/tips/how-to-extract-zip-files-using-powershell/
@rem http://stackoverflow.com/questions/2359372/
powershell -Command "$s=new-object -com shell.application;$z=$s.NameSpace('%Z%');foreach($i in $z.items()){$s.Namespace('%D%').copyhere($i,0x14)}"

copy cm3d2_plugins_okiba-master\config.bat.txt cm3d2_plugins_okiba-master\config.bat >nul 2>&1

del %ZIP% >nul 2>&1
echo ZIP�t�@�C�����t�H���_�[�u%D%cm3d2_plugins_okiba-master�v�ɓW�J���܂���
echo.
echo ���Ƃ͈ȉ��̑�������邱�ƂŁA�R���p�C�����s���܂�
echo.
echo     (1)�u%D%cm3d2_plugins_okiba-master\config.bat�v��ҏW
echo     (2)�u%D%cm3d2_plugins_okiba-master\compile.bat�v�����s
echo
