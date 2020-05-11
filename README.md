# mackeyboard
_Mac Keyboard to Windows Key Mappings_

As humans, we have tactile memories. Years of accumulated muscle memory is important for us to be efficient at work. When our fingers sense a Mac keyboard underneath, they instinctively adapt to a Mac style of hotkeys. This repository should assist in ensuring continuity with the help of [AutoHotkey][ahk] key-mapping tool.

To get this working,

1. Download and install a copy of [AutoHotkey][ahk] in a folder, say, `C:\Apps\misc\ahk`
2. Download a copy of `mackeyboard.ahk` from this repository
3. Run the following in Command Prompt to activate all key mappings:
        
        C:\Apps\misc\ahk> AutoHotkeyU64.exe "mackeyboard.ahk"

4. Optional: To automate this at boot, a batch file, say `mackeyboard.bat`, can be created with the following contents:

        @echo off
        start C:\Apps\misc\ahk\AutoHotkeyU64.exe "C:\Apps\misc\ahk\mackeyboard.ahk"
        exit

The batch file can then be placed under the Startup folder. (Get to the Startup folder by running `shell:startup`.)

## Works with

1. Apple Keyboard &ndash; any model
2. Any Keyboard with MacOS layout 

## Application-specific shortcuts

To write application-specific shortcuts, as an example, the following may be used:

```autohotkey
; Skype for Business
#IfWinActive, ahk_class LyncTabFrameHostWindowClass

::gm::Good morning,

::gf::Good afternoon,

#IfWinActive
```

The following are known `ahk_class` for various applications:

| Application           | `ahk_class`                   |
|---------------------- | ----------------------------- |
| Command Prompt        | `ConsoleWindowClass`          |
| Cygwin                | `mintty`                      |
| Explorer              | `CabinetWClass`               |
| Google Chrome         | `Chrome_WidgetWin_1`          |
| Microsoft Excel       | `XLMAIN`                      |
| Microsoft Outlook     | `rctrl_renwnd32`              |
| Microsoft Word        | `OpusApp`                     |
| Skype Main window     | `CommunicatorMainWindowClass` |
| Skype Message window  | `LyncTabFrameHostWindowClass` |
| Sublime Text 3        | `PX_WINDOW_CLASS`             |

## Trivia

May 2017. Three months ago, I began using my Logitech G610 keyboard at work to avoid managing KVM hygiene everyday, side-effect of a hot-desk policy. It is a fine, if hefty, full-sized keyboard, and that became a problem. I mean at the end of every work day, I'd unplug to shove it inside a one-foot locker, leaving very little usable room for anything else.

Not wanting to buy yet another, I pulled my seldom-used Apple Bluetooth wireless keyboard out. This is in many ways worse than its large, corded sibling. For the portability, you inherit its handicap of missing keys &mdash; some of them critical to be productive; this aside from the prospect of blowing one's mind with jumbled hot keys across OSes &mdash; Mac at home; Windows at work. To recover sanity, I looked at ways to remap keys so I could use Mac hot keys on Windows, and found [AutoHotkey][ahk] promising. As a general scripting tool, however, there is no way around the manual, and it so took me a good few trial and error compiles to get to a set of usable hot key mappings.

It runs just fine in the background capturing all my hot keys, pressed in Mac style, and transforming them into Windows hot keys on-the-fly. In addition, it's also good as a simple text expander, which saves me some repetitive typing.

[ahk]: https://www.autohotkey.com/ "AutoHotkey"
