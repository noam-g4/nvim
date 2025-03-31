require("config.custom")
require("config.lazy")
require("config.surroundings")
require("config.terminal")

vim.cmd([[colorscheme gruvbox]])

local function getMacOSAppearanceMode()
	local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
	if handle then
		local result = handle:read("*a")
		handle:close()

		if result:match("Dark") then
			vim.o.background = "dark"
		else
			vim.o.background = "light"
		end
	end
end

getMacOSAppearanceMode()
