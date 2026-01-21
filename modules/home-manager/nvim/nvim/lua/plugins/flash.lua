-- https://github.com/folke/flash.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
local flash = require("flash")

local search_labels = "asdfghjklqwertyuiopzxcvbnm2398014576"

flash.setup({
	labels = search_labels,

	label = {
		-- allow uppercase labels
		uppercase = false,
	},

	modes = {
		-- options used when flash is activated through
		-- a regular search with `/` or `?`
		search = {
			enabled = true,
			multi_window = false,
		},

		-- options used when flash is activated through
		-- `f`, `F`, `t`, `T`, `;` and `,` motions
		char = {
			enabled = true,
			multi_line = false,
			highlight = { backdrop = false },
		},

		treesitter = {
			labels = search_labels,
		},
	},
})

map("o", "r", flash.remote)
map("c", "<C-s>", flash.toggle)
map("", "<M-6>", flash.treesitter)
