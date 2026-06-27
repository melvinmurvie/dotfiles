-- Variables shared across config files
-- See https://wiki.hypr.land/Configuring/Start/

local M = {}

M.mainMod = "SUPER"
M.opMod = "ALT"

M.terminal = "uwsm app -- kitty"
M.fileManager = "uwsm app -- dolphin"
M.menu = "uwsm app -- rofi -show drun"
M.serviceMenu = "uwsm app -- uuctl rofi"
M.browser = "uwsm app -- brave"
M.lock = "uwsm app -- hyprlock"
M.webapp = M.browser .. " --new-window --app"
M.nc = "swaync-client --toggle-panel"
M.fnfMenu = "uwsm app -- ~/.local/share/fnf/bin/fnf-menu"
M.top = M.terminal .. " sh -c 'btop'"

M.hyprshot = "uwsm app -- hyprshot"
M.sattyEditStdin = "uwsm app -- satty --actions-on-right-click save-to-clipboard --filename -"
M.ocr4 = "uwsm app -- OCR4Linux.sh -l --lang all"

return M

