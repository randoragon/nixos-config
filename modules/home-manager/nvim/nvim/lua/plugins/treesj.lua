-- https://github.com/Wansmer/treesj?tab=readme-ov-file#installation
treesj = require("treesj")

treesj.setup({
	use_default_keymaps = false,
	check_syntax_error = true,  -- refuses operation if there is a syntax error
	max_join_length = 9999,
	cursor_behavior = "hold",
	notify = true,
	dot_repeat = true,
})

map("n", "<M-2>", treesj.toggle)
