# Chicago95 fluxbox

A fluxbox style to complement the [Chicago95 gtk theme](https://github.com/grassmunk/Chicago95).

## Screenshots

1. Clean

![style preview clean](./screenshots/clean.png)

2. Messy

![style preview messy](./screenshots/messy.png)

## Installation

Copy the `Chicago95` folder to your `~/.fluxbox/styles` folder.

## What's in the screenshots?

Take a peek in the [extras](./extras) folder :)

Follow the excellent [Chicago95 install guide](https://github.com/grassmunk/Chicago95/blob/master/INSTALL.md) to setup the gtk theme, icons and fonts.

1. Conky on the bottom right.
2. Idesk for the desktop icons.
3. `feh` for managing wallpapers.
4. GTK theme is `Chicago95` and the icon theme is [SE98](https://github.com/nestoris/Win98SE). The cursor theme is `Chicago95 Standard Cursors` from Chicago95.
5. The fluxbox menu is generated by a wonderful program called [xdgmenumaker](https://github.com/gapan/xdgmenumaker). Behold, the command

```
# without icons
#xdgmenumaker -f fluxbox --no-submenu > ~/.fluxbox/xdg_menu

# with icons
xdgmenumaker -f fluxbox --no-submenu -i > ~/.fluxbox/xdg_menu_icons
```

Then to include the menu in the main `RootMenu`, add the following to `~/.fluxbox/menu`

```
[separator]
[include] (~/.fluxbox/xdg_menu_icons)
[separator]
```
6. To get the same look for the fluxbox toolbar, menu and windows, make the following changes in
`~/.fluxbox/init`

```
session.screen0.iconbar.alignment:      Left
session.screen0.iconbar.mode:   {static groups} (workspace)
session.screen0.iconbar.iconTextPadding:        5
session.screen0.iconbar.usePixmap:      true
session.screen0.iconbar.iconWidth:      225


session.screen0.toolbar.widthPercent:   100
session.screen0.toolbar.tools:  workspacename, iconbar, systemtray, clock

session.screen0.clientMenu.usePixmap:   true

session.screen0.tabs.usePixmap: true
session.screen0.titlebar.left:
session.screen0.titlebar.right: Minimize Maximize Close

session.screen0.strftimeFormat: %a %d %b, %02k:%M
```
7. Follow [Chicago95's](https://github.com/grassmunk/Chicago95/blob/master/INSTALL.md#helvetica-install) guide to get the Helvetica font working. This fluxbox style, relies on the user's `~/.fluxbox/overlay` file to set the fonts up. Here's what I have

```
*.font:                                 Helvetica-9
menu.frame.font:                        Helvetica-9
menu.title.font:                        Helvetica-9:bold
toolbar.clock.font:                     Helvetica-9:bold
toolbar.workspace.font:                 Helvetica-9:bold
toolbar.iconbar.focused.font:           Helvetica-9:bold
toolbar.iconbar.unfocused.font:         Helvetica-9
toolbar.button.font:                    Helvetica-9
window.font:                            Helvetica-9:bold
menu.hilite.font:                       Helvetica-9
window.font:                            Helvetica-9
window.label.focus.font:                Helvetica-9:bold
window.label.unfocus.font:              Helvetica-9:bold
```

Cheers!

