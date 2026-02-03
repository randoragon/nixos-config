-- https://github.com/nvim-treesitter/nvim-treesitter
treesitter = require("nvim-treesitter")

treesitter.setup()
treesitter.install({
	"awk",
	"bash",
	"c", "cpp", "c_sharp",
	"corn",
	"make", "cmake",
	"diff",
	"dockerfile",
	"dot",
	"gitcommit", "git_config", "gitignore", "git_rebase", "gitattributes",
	"gnuplot",
	"go", "gosum", "gowork",
	"html", "css", "javascript", "typescript", "jsdoc",
	"json", "yaml",
	"latex", "bibtex",
	"ledger",
	"lua", "luadoc", "luap",
	"markdown", "markdown_inline", "rst",
	"nix",
	"passwd",
	"python",
	"regex",
	"ruby",
	"rust",
	"sql",
	"toml",
	"typst",
	"vim", "vimdoc",
	"zig",
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = { "<filetype>" },
	callback = function()
		vim.treesitter.start()
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
		vim.bo.indentexpr = "v:lua.vim.treesitter.indentexpr()"
	end,
})
