; Created by Jan Odstrcilik

#SingleInstance, Force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.
coordMode,pixel


; Reading of the ini file 
iniRead, sections, ContextMenuCharacters.ini
; Going through all sections
Loop, parse, sections, `n
{
  ; Reading of the section
	IniRead, _thisSection, ContextMenuCharacters.ini, %A_LoopField%
  ; Reading the key "labels" and saving its values into the variable Labels
  IniRead, Labels, ContextMenuCharacters.ini, %A_LoopField%, labels
  ; Creating a menu name for the section - needed for AHK
  nameSection = menu%A_LoopField%
  ; Parsing the value of "labels" - it splits the string into an array using , as the separator
  Loop, parse, Labels, `,
  {
    nameItem = %A_LoopField%
    ; This removes a possible blank space on the beginning of the string
    nameItem := RegExReplace(nameItem, "^ ", "")
    if (nameSection = "menu_Top")
    { 
      Menu, ContextMenu, Add, %nameItem%, MenuHandler
    }
    else
    {
      ; Creating the menu item
     Menu, %nameSection%, Add, %nameItem%, MenuHandler
    }
  }
    if (nameSection = "menu_Top")
    { 
      ; empty
    }
    else
    {
      ; Creating the menu item
      Menu, ContextMenu, Add, %A_LoopField%, :%nameSection%
    }
}


; ---------- Processing the menu ----------------

MenuHandler:
  ; Saves the label of the selected menu into a variable
  selected = %A_ThisMenuItem%
  ; remove everything after - in selected
  selected := RegExReplace(selected, " -.*", "")
 ; MsgBox, %selected%
  ; remove the blank space at the end of selected
  selected := RegExReplace(selected, " $", "")
  ; remove the blank space at the beginning of selected
  selected := RegExReplace(selected, "^ ", "")
  ; Send selected
  Send, %selected%
  return

; ------------------ Showing the menu ------------------

; Show menu when clicking the middle button while holding control
Control & MButton Up::Menu, ContextMenu, Show ; i.e. press the Win-Z hotkey to show the menu.

; shows the menu when writing .bb on keyboard
:*?:.bb::
  Menu, ContextMenu, Show 
  return

; 
