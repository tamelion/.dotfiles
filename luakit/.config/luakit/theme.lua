--------------------------
-- Default luakit theme --
--------------------------

local theme = {}

-- Default settings
theme.font = "pango:DejaVu Sans 8"
theme.fg   = "#ff0000"
theme.bg   = "#00ff00"

-- Genaral colours
theme.success_fg = "#f0c674"
theme.loaded_fg  = "#f0c674"
theme.error_fg = "#cc6666"
theme.error_bg = "#1d1f21"

-- Warning colours
theme.warning_fg = "#F00"
theme.warning_bg = "#FFF"

-- Notification colours
theme.notif_fg = "#444"
theme.notif_bg = "#FFF"

-- Menu colours
theme.menu_fg                   = "#1d1f21"
theme.menu_bg                   = "#e0e0e0"
theme.menu_selected_fg          = "#e0e0e0"
theme.menu_selected_bg          = "#373b41"
theme.menu_title_bg             = "#1d1f21"
theme.menu_primary_title_fg     = "#de935f"
theme.menu_secondary_title_fg   = "#de935f"

-- Proxy manager
theme.proxy_active_menu_fg      = '#000'
theme.proxy_active_menu_bg      = '#FFF'
theme.proxy_inactive_menu_fg    = '#888'
theme.proxy_inactive_menu_bg    = '#FFF'

-- Statusbar specific
theme.sbar_fg         = "#e0e0e0"
theme.sbar_bg         = "#1d1f21"

-- Downloadbar specific
theme.dbar_fg         = "#e0e0e0"
theme.dbar_bg         = "#1d1f21"
theme.dbar_error_fg   = "#cc6666"

-- Input bar specific
theme.ibar_fg           = "#e0e0e0"
theme.ibar_bg           = "#1d1f21"

-- Tab label
theme.tab_fg            = "#b4b7b4"
theme.tab_bg            = "#373b41"
theme.tab_ntheme        = "#b4b7b4" -- normal number
theme.selected_fg       = "#e0e0e0"
theme.selected_bg       = "#1d1f21"
theme.selected_ntheme   = "#f0c674" -- selected number (if not trusted)
theme.loading_fg        = "#373b41"
theme.loading_bg        = "#de935f"

-- Trusted/untrusted ssl colours
theme.trust_fg          = "#0F0"
theme.notrust_fg        = "#cc6666"

return theme
-- vim: et:sw=4:ts=8:sts=4:tw=80
