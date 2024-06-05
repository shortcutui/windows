# windows

[中文版本](./README.md)

This is an implementation of [SUI](https://github.com/shortcutui/sui) for windows. The implementation is based on a norman layout, now if you want to use it in a qwerty layout, you need to tweak some of the key bindings a bit.

> [!WARNING]
> - This implementation is still under development, although I have stabilized it for my own daily use, but it is based on the norman layout keybindings, if you want to experience it in qwerty layout, you need to make some modifications to the keybindings in kanata.kbd by yourself now.
> - Be careful when using mouse interface, the current implementation will hide the mouse automatically on exit mouse mode, you can show the mouse through [SUI's mouse interface](https://github.com/shortcutui/sui?tab=readme-ov-file#mouse-interface). If you don't like this feature, you can find the SystemCursor method in sui.ahk file, just comment it out. Turning off sui.ahk will also display the mouse.

## Dependencies

The following are required dependencies

- [komorebi](https://github.com/LGUG2Z/komorebi) is a tiled window manager for windows.
- [kanata](https://github.com/jtroo/kanata) is a cross-platform user-level key modifier.
- [AutoHotkey](https://www.autohotkey.com) is a key modifier for windows.

The following table shows the optional dependencies

- [win32yank](https://github.com/equalsraf/win32yank) This is a command line clipboard utility, and can be replaced by others, if there is an installation of neovim for windows it will come with one.
- [ScreenToGif](https://github.com/NickeManarin/ScreenToGif) This is a gif recording tool, used to record gif images.
- [CapsWriter](https://github.com/HaujetZhao/CapsWriter-Offline) This is a voice to text tool, currently bound to ctrl+u.
- [SogouInputMethod]() Currently, the input method switching only applies to Sogou, in some vim mode applications, in order to facilitate the writing of Chinese, press esc to automatically switch the input method to English.

## Installation

> - ahk please use the last version of 1.x, when startup if ahk encounter encoding problems, eg. pop up a garbled popup window can not start, need to adjust the system encoding to utf8 encoding.
> - The ahk in the apps directory is optional, but be careful, if you need to delete it, you need to delete the Include statement in sui.ahk.
> - The installation of kanata must have a command-enabled variant installed.
> - It is better to start bat via administrator
> - It is better to find the app_specific_configuration_path_TODO field in komorebi.json, remove the _TODO at the end, and change its value to the path of applications.yaml in your directory.

First, clone the repository and install the required dependencies, komorebi, kanata and AutoHotkey.
After installation, start startsui.bat, startahk.bat with administrator.
The startahk.bat will start an ahk script in the tray area, and the startsui.bat will open two cmd windows, which you can stop by removing them.

## Uninstall

If you dont like it, the implementation is a clean green version. Just stop sui and delete the entire directory.

