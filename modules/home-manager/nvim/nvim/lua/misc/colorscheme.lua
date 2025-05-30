if os.getenv("VIM_TTY_COLORSCHEME") then
	vim.cmd.colorscheme("default")
else
	o.background = "dark"
	vim.cmd.colorscheme("flexoki-dark")
end

-- local function transparent_bg()
-- 	vim.cmd.highlight({"Normal",       "guibg=NONE", "ctermbg=NONE"})
-- 	vim.cmd.highlight({"Title",        "guibg=NONE", "ctermbg=NONE"})
-- 	vim.cmd.highlight({"LineNr",       "guibg=NONE", "ctermbg=NONE"})
-- 	vim.cmd.highlight({"Folded",       "guibg=NONE", "ctermbg=NONE"})
-- 	vim.cmd.highlight({"NonText",      "guibg=NONE", "ctermbg=NONE"})
-- 	vim.cmd.highlight({"FoldColumn",   "guibg=NONE", "ctermbg=NONE"})
-- 	vim.cmd.highlight({"SignColumn",   "guibg=NONE", "ctermbg=NONE"})
-- 	vim.cmd.highlight({"CursorLine",   "guibg=NONE", "ctermbg=NONE"})
-- 	vim.cmd.highlight({"CursorLineNr", "guibg=NONE", "ctermbg=NONE"})
-- 	vim.cmd.highlight({"FloatBorder",  "guifg=white", "ctermfg=white", "guibg=NONE", "ctermbg=NONE"})
-- end
-- 
-- autocmd(
-- 	{"VimEnter", "ColorScheme"}, {
-- 		pattern = "*",
-- 		callback = transparent_bg,
-- 	}
-- )
