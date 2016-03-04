#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force

SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2

file := "results.csv"

; delay in ms
delay := 100

songs := 20

loops := 5

WinActivate, ahk_class SpotifyMainWindow
Loop, %loops% {
	send ^s
	sleep %delay%
	send ^s
	sleep %delay%
	send {Enter}
	sleep %delay%

	titles := ""
	Loop, %songs% {
		WinGetTitle, now_playing, ahk_class SpotifyMainWindow
		;StringTrimLeft, playing, now_playing, 10
		titles .= now_playing ";"

		send ^{Right}
		sleep %delay%
	}

	FileAppend, % titles "`r`n", %file%
}

MsgBox, Finished