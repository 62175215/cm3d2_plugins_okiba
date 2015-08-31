set OKIBA_URL=https://github.com/neguse11/cm3d2_plugins_okiba/archive/%OKIBA_BRANCH%.zip
set OKIBA_FILE=%OKIBA_BRANCH%.zip
set OKIBA_DIR=cm3d2_plugins_okiba-%OKIBA_BRANCH%

set REIPATCHER_URL=https://mega.co.nz/#!rsImja6D!Of4s5lsD7y9JylVZ7miWg63Mxt5MVKniLgWqBr0oJl8
set REIPATCHER_7Z=ReiPatcher_0.9.0.7.7z
set REIPATCHER_PASSWD=byreisen

set UNITYINJECTOR_URL=https://mega.co.nz/#!m1YV1CpI!Knssx6-S1q2q6Qfuq8cFQQ6LKZeA-JiLRm4I7tkQxo8
set UNITYINJECTOR_7Z=UnityInjector_1.0.1.1.7z
set UNITYINJECTOR_PASSWD=byreisen

set _7Z_URL=http://sourceforge.net/projects/sevenzip/files/7-Zip/9.20/7za920.zip
set _7Z_FILE=7za920.zip

set REIPATCHER_INI=%ROOT%\ReiPatcher\CM3D2%PLATFORM%.ini
set _7z="%ROOT%\_7z\7za.exe"
set CSC=C:\Windows\Microsoft.NET\Framework\v3.5\csc.exe
set MEGADL="%ROOT%\%OKIBA_DIR%\scripts\megadl.exe"

set INSTALL_PATH=
set MOD_PATH=
set SAME_PATH=


@rem
@rem INSTALL_PATH�Ƀ��W�X�g�����̃C���X�g�[���p�X������
@rem
set INSTALL_PATH_REG_KEY="HKCU\Software\KISS\�J�X�^�����C�h3D2"
set INSTALL_PATH_REG_VALUE=InstallPath

@rem http://stackoverflow.com/questions/445167/
for /F "usebackq skip=2 tokens=1-2*" %%A in (`REG QUERY %INSTALL_PATH_REG_KEY% /v %INSTALL_PATH_REG_VALUE% 2^>nul`) do (
    set INSTALL_PATH=%%C
)

if not exist "%INSTALL_PATH%\GameData\csv.arc" (
    set INSTALL_PATH=
)

if defined INSTALL_PATH (
    set INSTALL_PATH=%INSTALL_PATH:~0,-1%
)


@rem
@rem MOD_PATH�ɉ����ł̃p�X������
@rem
set MOD_PATH=%ROOT%


@rem
@rem INSTALL_PATH��MOD_PATH�����ꂩ�ǂ����m�F���A���ʂ�SAME_PATH�ɓ����
@rem
if defined INSTALL_PATH (
  if defined MOD_PATH (
    echo.>"%INSTALL_PATH%\__dummy__test__file__"
    if exist "%ROOT%\__dummy__test__file__" (
      set SAME_PATH=True
    )
    del "%INSTALL_PATH%\__dummy__test__file__"
  )
)


if defined SAME_PATH (
  echo �ʏ�̃Q�[�����C���X�g�[�����ꂽ�t�H���_�[�ł̎��s�͂ł��܂���
  echo �����ŗp�̃t�H���_�[��ʂɍ��A�����Ŏ��s���Ă�������
  exit /b 1
)

if exist "%ROOT%\ReiPatcher" (
  echo �t�H���_�[�u%ROOT%\ReiPatcher�v�����݂��邽�߁A�����𒆎~���܂�
  echo ���̃t�H���_�[���ړ��A���l�[�����邩�A�폜���Ă�����s���Ă�������
  exit /b 1
)

if exist "%ROOT%\UnityInjector" (
  echo �t�H���_�[�u%ROOT%\UnityInjector�v�����݂��邽�߁A�����𒆎~���܂�
  echo ���̃t�H���_�[���ړ��A���l�[�����邩�A�폜���Ă�����s���Ă�������
  exit /b 1
)


@rem
@rem �V�K�f�B���N�g���̏ꍇ�Axcopy���s��
@rem
if not exist "%ROOT%\CM3D2%PLATFORM%_Data" (
  echo �o�j������̃R�s�[���s���܂�
  xcopy /e /y "%INSTALL_PATH%" "%ROOT%"
)


@rem
@rem %ROOT%\_7z\ ���� 7zip ��W�J����
@rem

mkdir _7z >nul 2>&1
pushd _7z
echo 7z�̃A�[�J�C�u�u%_7Z_URL%�v�̃_�E�����[�h�A�W�J��
powershell -Command "(New-Object Net.WebClient).DownloadFile('%_7Z_URL%', '%_7Z_FILE%')"
if not exist "%_7Z_FILE%" (
  echo 7z�̃A�[�J�C�u %_7Z_URL% �̃_�E�����[�h�Ɏ��s���܂����B
  exit /b 1
)
powershell -Command "$s=new-object -com shell.application;$z=$s.NameSpace('%ROOT%\_7z\%_7Z_FILE%');foreach($i in $z.items()){$s.Namespace('%ROOT%\_7z').copyhere($i,0x14)}"
echo 7z�̃A�[�J�C�u�̓W�J����
popd


@rem
@rem cm3d2_plugins_okiba�̃A�[�J�C�u���_�E�����[�h���A
@rem %ROOT%\cm3d2_plugins_okiba\ ���ɓW�J����
@rem

echo �u%OKIBA_URL%�v����u%OKIBA_FILE%�v�̃_�E�����[�h��

@rem http://stackoverflow.com/a/20476904/2132223
powershell -Command "(New-Object Net.WebClient).DownloadFile('%OKIBA_URL%', '%OKIBA_FILE%')"
if not exist "%OKIBA_FILE%" (
  echo �u%OKIBA_FILE%�v�̃_�E�����[�h�Ɏ��s���܂����B
  exit /b 1
)

rmdir /s /q "%OKIBA_DIR%" >nul 2>&1

@rem http://www.howtogeek.com/tips/how-to-extract-zip-files-using-powershell/
@rem http://stackoverflow.com/questions/2359372/
%_7z% -y x "%OKIBA_FILE%" >nul 2>&1
if not exist "%OKIBA_DIR%\config.bat.txt" (
  echo �u%OKIBA_FILE%�v�̓W�J�Ɏ��s���܂���
  exit /b 1
)
del %ZIP% >nul 2>&1

echo ZIP�t�@�C�����t�H���_�[�u%ROOT%\%OKIBA_DIR%�v�ɓW�J���܂���


@rem
@rem megadl �̃R���p�C��
@rem
del %MEGADL% >nul 2>&1
pushd "%ROOT%\%OKIBA_DIR%\scripts\"
%CSC% /nologo megadl.cs
popd
if not exist %MEGADL% (
  echo �u%ROOT%\%OKIBA_DIR%\scripts\megadl.cs�v�̃R���p�C���Ɏ��s���܂���
  exit /b 1
)


@rem
@rem %ROOT%\ ���� ReiPatcher ���_�E�����[�h
@rem
echo �u%REIPATCHER_URL%�v���_�E�����[�h��
%MEGADL% %REIPATCHER_URL% %REIPATCHER_7Z%
if not exist %REIPATCHER_7Z% (
  echo �u%REIPATCHER_URL%�v�̃_�E�����[�h�Ɏ��s���܂���
  exit /b 1
)


@rem
@rem %ROOT%\ ���� UnityInjector ���_�E�����[�h
@rem
echo �u%UNITYINJECTOR_URL%�v���_�E�����[�h��
%MEGADL% %UNITYINJECTOR_URL% %UNITYINJECTOR_7Z%
if not exist %UNITYINJECTOR_7Z% (
  echo �u%UNITYINJECTOR_7Z%�v�̃_�E�����[�h�Ɏ��s���܂���
  exit /b 1
)


@rem
@rem %ROOT%\ReiPatcher\ ���� ReiPatcher ��W�J����
@rem
if not exist "%REIPATCHER_7Z%" (
  echo ReiPatcher�̃A�[�J�C�u�t�@�C���u%REIPATCHER_7Z%�v������܂���
  echo �A�[�J�C�u���_�E�����[�h���āA�u%ROOT%�v�ɔz�u���Ă�������
  exit /b 1
)

echo ReiPatcher�̃A�[�J�C�u�u%REIPATCHER_7Z%�v�̓W�J��
rmdir /s /q ReiPatcher >nul 2>&1
mkdir ReiPatcher >nul 2>&1
pushd ReiPatcher
%_7z% -y x ..\%REIPATCHER_7Z% -p%REIPATCHER_PASSWD% >nul 2>&1
mkdir Patches >nul 2>&1
echo ;Configuration file for ReiPatcher>%REIPATCHER_INI%
echo.>>%REIPATCHER_INI%
echo [ReiPatcher]>>%REIPATCHER_INI%
echo PatchesDir=Patches>>%REIPATCHER_INI%
echo ;@cm3d=%ROOT%>>%REIPATCHER_INI%
echo AssembliesDir=%%cm3d%%\CM3D2%PLATFORM%_Data\Managed>>%REIPATCHER_INI%
echo.>>%REIPATCHER_INI%
echo [Assemblies]>>%REIPATCHER_INI%
echo Assembly-CSharp=Assembly-CSharp.dll>>%REIPATCHER_INI%
echo.>>%REIPATCHER_INI%
echo [Launch]>>%REIPATCHER_INI%
echo Executable=>>%REIPATCHER_INI%
echo Arguments=>>%REIPATCHER_INI%
echo Directory=>>%REIPATCHER_INI%
echo.>>%REIPATCHER_INI%
echo [UnityInjector]>>%REIPATCHER_INI%
echo Class=SceneLogo>>%REIPATCHER_INI%
echo Method=Start>>%REIPATCHER_INI%
popd
echo ReiPatcher�̓W�J����


@rem
@rem %ROOT%\UnityInjector\ ���� UnityInjector ��W�J����
@rem
if not exist "%UNITYINJECTOR_7Z%" (
  echo ReiPatcher�̃A�[�J�C�u�t�@�C���u%UNITYINJECTOR_7Z%�v������܂���
  echo �A�[�J�C�u���_�E�����[�h���āA�u%ROOT%�v�ɔz�u���Ă�������
  exit /b 1
)

echo UnityInjector�̃A�[�J�C�u�u%UNITYINJECTOR_7Z%�v�̓W�J��
rmdir /s /q UnityInjector >nul 2>&1
mkdir UnityInjector >nul 2>&1
pushd UnityInjector
%_7z% -y x ..\%UNITYINJECTOR_7Z% -p%UNITYINJECTOR_PASSWD% >nul 2>&1
copy /y Managed\*.dll ..\CM3D2%PLATFORM%_Data\Managed\ >nul 2>&1
copy /y ReiPatcher\*.dll ..\ReiPatcher\Patches\ >nul 2>&1
popd
echo UnityInjector�̓W�J����


if defined SAME_PATH (
  set INSTALL_PATH=
  set MOD_PATH=
)

set TARGET=%ROOT%\%OKIBA_DIR%\config.bat

echo.>"%TARGET%"
echo @rem �o�j���� CM3D2 �̈ʒu>>"%TARGET%"
if defined INSTALL_PATH (
  echo set CM3D2_VANILLA_DIR=%INSTALL_PATH%>>"%TARGET%"
) else (
  echo set CM3D2_VANILLA_DIR=C:\KISS\CM3D2>>"%TARGET%"
)
echo.>>"%TARGET%"
echo @rem �����ł� CM3D2 �̈ʒu>>"%TARGET%"
if defined MOD_PATH (
  echo set CM3D2_MOD_DIR=%MOD_PATH%>>"%TARGET%"
) else (
  echo set CM3D2_MOD_DIR=C:\KISS\CM3D2_KAIZOU>>"%TARGET%"
)
echo.>>"%TARGET%"
echo @rem 64bit/32bit �̑I�� (64bit�Ȃ�ux64�v�A32bit�Ȃ�ux86�v)>>"%TARGET%"
echo set CM3D2_PLATFORM=%PLATFORM%>>"%TARGET%"
echo.>>"%TARGET%"
echo @rem ReiPatcher �� ini �t�@�C����>>"%TARGET%"
echo set REIPATCHER_INI=CM3D2%PLATFORM%.ini>>"%TARGET%"


echo.
echo ���Ƃ͈ȉ��̑�������邱�ƂŁA�������������܂�
echo.
echo (1)�u%ROOT%\%OKIBA_DIR%\config.bat�v
echo    ���́uCM3D2_VANILLA_DIR�v�ƁuCM3D2_MOD_DIR�v���m�F���A
echo    �K�v�Ȃ���ɍ��킹�ď��������Ă�������
echo.
echo (2)�u%ROOT%\%OKIBA_DIR%\compile-patch-and-go.bat�v
echo    �����s����ƁA�R���p�C���A�p�b�`���삪�s��ꂽ��A�Q�[�����N�����܂�
echo.
