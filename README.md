<div align="center">

**Hyprland rice on CachyOS — QuickShell bar, Catppuccin theming, and a morphing pill UI**

![HYPRLAND](https://img.shields.io/badge/Hyprland-white?style=flat-square&logo=wayland&logoColor=white&labelColor=%23492730&color=%236b3a4a) ![QUICKSHELL](https://img.shields.io/badge/QuickShell-white?style=flat-square&logo=qt&logoColor=white&labelColor=%23492730&color=%236b3a4a) ![CACHYOS](https://img.shields.io/badge/CachyOS-white?style=flat-square&logo=archlinux&logoColor=white&labelColor=%23492730&color=%236b3a4a)

<pre>
<a href=#>ᴘʀᴇᴠɪᴇᴡ</a>   •  <a href=#>ɪɴsᴛᴀʟʟᴀᴛɪᴏɴ</a>    •  <a href=#>ᴅᴇᴘᴇɴᴅᴇɴᴄɪᴇs</a>    •  <a href=#>ᴅɪᴀʀʏ</a>
</pre>

</div>

<a name="about"></a>
## About

What is this about you ask ? Well my personal take on having a personalized system. In the last year I tried to personalize my system with ai. Which went very well until I stopped understanding why stuff broke. So this time as litle ai as possible.

<a name="preview"></a>
## Preview

*Still on the way*

<a name="installation"></a>
## Installation

*Still on the way*

*Plan for now: Using tuckr to make the installation as automatic as possible with the hooks*

<a name="dependencies"></a>
## Dependencies

- hyprland
- git
- zsh
- *more may follow*

<a name="diary"></a>
## Personal diary, notes and plans

**[25.July.2026]**

--- Quickshell plan ---
A dynamic floating island which hides when windows fill the screen (non flowting and fullscreen windows).

The island shall transform into all other context windows (wallpaper picker, notification, info bar, control center, ...)

- island (default state): shows the time and missed notification icon with count
- wallpaper picker: single line, scorllable preview of all wallpapers in the Wallpaper folder
- notification: stackable list of displayed notifications, dismissable by click (not shown in notification list of control center)
- info bar: basic information display of battery, media player, date time and connection status (open on island hover)
- control center: basic control need: wifi, bluetooth, audio slide and input, dynamic lights control, lights slider, missed notification list

General control logic will be managed by a fassade api and a event daemon written in rust which later will get a settings app as frontend.

I will orientate my self on my last ai driven [dotfiles project](https://github.com/SirQuacksALot/_dotfiles/blob/master/README.md). For now I started out with a simple status bar with datetime, battery indecator, network indecator and a cachyos icon in some what mac os style.

Icon Style will be [Lucide Icons](https://github.com/lucide-icons/lucide).

Another realy nice project I will take inspiration from (#codeEqualsInspiration:stuck_out_tongue_winking_eye:) is [Tide Island](https://github.com/enhaoswen/Tide-island/tree/main) as the goal is basically the same but a little bit less "mac-os-i".
