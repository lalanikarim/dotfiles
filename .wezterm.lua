function getOS()
	-- ask LuaJIT first
	if jit then
		return jit.os
	end

	-- Unix, Linux variants
	local fh, _ = assert(io.popen("uname -o 2>/dev/null", "r"))
	local osname
	if fh then
		osname = fh:read()
	end

	return osname or "Windows"
end

local osname = getOS()

local tmux = "/usr/bin/tmux"

if osname == "Darwin" then
	tmux = "/opt/homebrew/bin/tmux"
elseif osname ~= "Windows" then
	tmux = "/usr/bin/tmux"
end

local wezterm = require 'wezterm'
local config = wezterm.config_builder()
config.font = wezterm.font 'VictorMono Nerd Font Propo'
config.font_size = 17.0
config.window_background_opacity = 0.85
config.initial_rows = 50
config.initial_cols = 200
if osname == "Darwin" or osname ~= "Windows" then
	config.default_prog = { '/bin/bash', '-l', '-c', tmux .. ' attach -t default || ' .. tmux .. ' new -s default' }
end
config.enable_tab_bar = false
return config
