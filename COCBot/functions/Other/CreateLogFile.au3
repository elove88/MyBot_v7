; #FUNCTION# ====================================================================================================================
; Name ..........: CreateLogFile
; Description ...:
; Syntax ........: CreateLogFile()
; Parameters ....:
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func CreateLogFile()
	If $g_hLogFile <> 0 Then
	   FileClose($g_hLogFile)
	   $g_hLogFile = 0
    EndIf

	$g_sLogFileName = @YEAR & "-" & @MON & "-" & @MDAY & "_" & @HOUR & "." & @MIN & "." & @SEC & ".log"
	Local $sLogPath = $g_sProfileLogsPath & $g_sLogFileName
	$g_hLogFile = FileOpen($sLogPath, $FO_APPEND)
	SetDebugLog("Created log file: " & $sLogPath)
	
	If IsBotLaunched() Then
		; Android info
		SetDebugLog("Android: " & $g_sAndroidEmulator)
		SetDebugLog("Android Instance: " & $g_sAndroidInstance)
		SetDebugLog("Android Version: " & $g_sAndroidVersion)
		SetDebugLog("Android Version API: " & $g_iAndroidVersionAPI)
		SetDebugLog("Android ADB Device: " & $g_sAndroidAdbDevice)
		SetDebugLog("Android Program Path: " & $g_sAndroidProgramPath)
		SetDebugLog("Android Program FileVersionInfo: " & ((IsArray($g_avAndroidProgramFileVersionInfo) ? _ArrayToString($g_avAndroidProgramFileVersionInfo, ",", 1) : "not available")))
		SetDebugLog("Android ADB Path: " & $g_sAndroidAdbPath)
		SetDebugLog("Android VBoxManage Path: " & $__VBoxManage_Path)
		SetDebugLog("Android ADB Shared Folder: " & $g_sAndroidPicturesPath)
	EndIf
	
	; Debug Output of launch parameter
	SetDebugLog("Full Command Line: " & _ArrayToString($CmdLine, " "))
	SetDebugLog("@AutoItExe: " & @AutoItExe)
	SetDebugLog("@ScriptFullPath: " & @ScriptFullPath)
	SetDebugLog("@WorkingDir: " & @WorkingDir)
	SetDebugLog("@AutoItPID: " & @AutoItPID)
	SetDebugLog("@OSArch: " & @OSArch)
	SetDebugLog("@OSVersion: " & @OSVersion)
	SetDebugLog("@OSBuild: " & @OSBuild)
	SetDebugLog("@OSServicePack: " & @OSServicePack)
	SetDebugLog("Primary Display: " & @DesktopWidth & " x " & @DesktopHeight & " - " & @DesktopDepth & "bit")

	FlushGuiLog($g_hTxtLog, $g_oTxtLogInitText)
EndFunc   ;==>CreateLogFile

; #FUNCTION# ====================================================================================================================
; Name ..........: CreateAttackLogFile
; Description ...:
; Syntax ........: CreateAttackLogFile()
; Parameters ....:
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2018
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func CreateAttackLogFile()
	If $g_hAttackLogFile <> 0 Then
	   FileClose($g_hAttackLogFile)
	   $g_hAttackLogFile = 0
    EndIf

	Local $sAttackLogFName = "AttackLog" & "-" & @YEAR & "-" & @MON & ".log"
	Local $sAttackLogPath = $g_sProfileLogsPath & $sAttackLogFName
	$g_hAttackLogFile = FileOpen($sAttackLogPath, $FO_APPEND)
	SetDebugLog("Created attack log file: " & $sAttackLogPath)
EndFunc   ;==>CreateAttackLogFile

; #FUNCTION# ====================================================================================================================
; Name ..........: CreateAttackSwitchFile
; Description ...:
; Syntax ........: CreateAttackSwitchFile()
; Parameters ....:
; Return values .: None
; Author ........:
; Modified ......:
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
Func CreateSwitchLogFile()
	If $g_hSwitchLogFile <> 0 Then
		FileClose($g_hSwitchLogFile)
		$g_hSwitchLogFile = 0
	EndIf

	Local $sSwitchLogFName = "SwitchAccLog" & "-" & @YEAR & "-" & @MON & ".log"
	Local $sSwitchLogPath = $g_sProfilePath & "\" & $sSwitchLogFName
	$g_hSwitchLogFile = FileOpen($sSwitchLogPath, $FO_APPEND)
	SetDebugLog("Created attack log file: " & $sSwitchLogPath)
EndFunc   ;==>CreateSwitchLogFile