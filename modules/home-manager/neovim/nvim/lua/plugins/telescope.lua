-- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#usage
local builtin = require("telescope.builtin")
map("n", "<C-Space>", builtin.git_files)
map("n", "<M-Space>", builtin.live_grep)
map("n", "<Leader>ff", builtin.find_files)
map("n", "<Leader>fl", builtin.current_buffer_fuzzy_find)
map("n", "<Leader>fc", builtin.commands)
map("n", "<Leader>fm", builtin.marks)
map("n", "<Leader>fh", builtin.help_tags)
map("n", "<Leader>fb", builtin.buffers)
map("n", "<M-,>", builtin.lsp_document_symbols)
map("n", "<M-.>", builtin.lsp_workspace_symbols)
map("n", "<M-S-,>", builtin.treesitter)

-- https://github.com/nvim-telescope/telescope.nvim/wiki/Configuration-Recipes
local actions = require("telescope.actions")
require("telescope").setup {
	defaults = {
		mappings = {
			i = {
				-- Don't enter normal mode on escape
				["<Esc>"] = actions.close,

				-- Preview navigation
				["<C-h>"] = actions.preview_scrolling_left,
				["<C-j>"] = actions.preview_scrolling_down,
				["<C-k>"] = actions.preview_scrolling_up,
				["<C-l>"] = actions.preview_scrolling_right,

				-- Results navigation
				["<M-h>"] = actions.results_scrolling_left,
				["<M-j>"] = actions.move_selection_next,
				["<M-k>"] = actions.move_selection_previous,
				["<M-l>"] = actions.results_scrolling_right,
				["<M-d>"] = actions.results_scrolling_down,
				["<M-u>"] = actions.results_scrolling_up,

				-- Selecting
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-t>"] = actions.select_tab,
			},
		},
	},
}
