@echo off && setlocal ENABLEEXTENSIONS && pushd "%~dp0" && call "scripts\base.bat" || exit /b 1

echo.& echo ExternalSaveData && call ExternalSaveData\compile.bat || goto error
echo.& echo FastFade && call FastFade\compile.bat || goto error
echo.& echo MaidVoicePitch && call MaidVoicePitch\compile.bat || goto error
echo.& echo PersonalizedEditSceneSettings && call PersonalizedEditSceneSettings\compile.bat || goto error
echo.& echo SkillCommandShortCut && call SkillCommandShortCut\compile.bat || goto error
echo.& echo ConsistentWindowPosition && call ConsistentWindowPosition\compile.bat || goto error
echo.& echo AddModsSlider && call AddModsSlider\compile.bat || goto error
echo.& echo VoiceNormalizer && call VoiceNormalizer\compile.bat || goto error
echo.& echo EditSceneUndo && call EditSceneUndo\compile.bat || goto error
rem echo.& echo ConsoleCodePage && call ConsoleCodePage\compile.bat || goto error

echo.& echo �����F�S�t�@�C���̃R���p�C���ɐ������܂���

popd
goto end

:error

echo.& echo ���s�F�R���p�C�����ɃG���[���������܂���
exit /b 1

:end
