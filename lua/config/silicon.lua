require("silicon").setup({
	theme = "Dracula",
	-- to_clipboard = true,
	output = function()
		return "~/.local/Screenshots/" .. os.date("!%Y-%m-%dT%H-%M-%S") .. "_code.png"
	end,
	font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34;"
})
