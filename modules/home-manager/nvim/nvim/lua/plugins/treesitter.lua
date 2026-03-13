-- https://github.com/nvim-treesitter/nvim-treesitter
treesitter = require("nvim-treesitter")

local grammars_and_ftypes = {
	"awk",
	"bash",
	"c", "cpp",
	"corn",
	"make", "cmake",
	"diff",
	"dockerfile",
	"dot",
	"gitcommit", "gitignore", "gitattributes",
	"gnuplot",
	"go",
	"html", "css", "javascript", "typescript",
	"json", "yaml",
	"kdl",
	"latex", "bibtex",
	"ledger",
	"lua",
	"markdown", "rst",
	"nix",
	"passwd",
	"python",
	"ruby",
	"rust",
	"sql",
	"toml",
	"typst",
	"vim",
	"zig",
}

local additional_grammars = {
	"c_sharp",
	"git_config", "git_rebase",
	"gosum", "gowork",
	"jsdoc",
	"luadoc", "luap",
	"markdown_inline",
	"regex",
	"vimdoc",
}

local additional_ftypes = {
	"sh", "zsh",
	"cs",
	"gitconfig", "gitrebase",
	"viminfo",
	"help",
}

-- Merge config tables
local grammars = {}
local ftypes = {}
for _, v in ipairs(grammars_and_ftypes) do
	grammars[#grammars + 1] = v
	ftypes[#ftypes + 1] = v
end
for _, v in ipairs(additional_grammars) do
	grammars[#grammars + 1] = v
end
for _, v in ipairs(additional_ftypes) do
	ftypes[#ftypes + 1] = v
end

treesitter.install(grammars)

vim.api.nvim_create_autocmd("FileType", {
	pattern = ftypes,
	callback = function()
		vim.treesitter.start()
		vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
		vim.wo[0][0].foldmethod = "expr"
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
