# What is this?
This little programme for Windows made in AutoHotkey has one simple purpose: to make an easily customizable context menu to insert unusual characters.


# Why was this program created?
I needed a simple way to insert various unusual characters from the middle ages, like ꝭ, ꝯ and ꝝ. The program is, however, flexible and can be configured to insert any other characters or even text snippets.


![](screenshot1.png)

# How to install it? 
Download the .zip file, unpack it and configure the .ini file as you wish. 
Then start ContextMenuCharacters.exe.

No installation is needed.

# How to modify the list of characters?
The .ini file has a very simple structure:

```
[section]
labels="character 1, character 2, character 3"

```

Characters under "labels" are separated by `,`. You can add any additional information after "-". This part is not being inserted when the character is selected.

If you want to have some specific characters directly accessible and not under any submenu, put them into `[_Top]` section.


# Limitations
Currently, the string of characters cannot contain any "," or "-". See the preceding section.


# How to use it? 
There are two ways how to invoke the custom context menu:
1. By pressing the middle button of the mouse together with the CTRL key.
2. By typing .bb .

# How to modify the code?
Look at the .ahk file in the zip file.



