vim.g.mapleader = " "
vim.g.maplocalleader = " "

local undo_dir = vim.fn.expand("~/.vim/undo_dir")
vim.fn.mkdir(undo_dir, "p")
vim.opt.undofile = true
vim.opt.undodir = undo_dir

local backup_dir = vim.fn.expand("~/.vim/backups")
vim.fn.mkdir(backup_dir, "p")

local function backup_name(filepath)
	local fname = vim.fn.fnamemodify(filepath, ":t")
	local stamp = os.date("%Y%m%d-%H%M%S")
	return string.format("%s/%s.%s.bak", backup_dir, fname, stamp)
end

local function copy_file(src, dst)
	local ok, err = vim.loop.fs_copyfile(src, dst)
	if not ok then
		vim.notify("backup-copy failed: " .. err, vim.log.levels.WARN)
	end
end

vim.api.nvim_create_autocmd("BufWritePost", {
	callback = function(args)
		local file = args.file
		if #file == 0 or vim.bo.filetype == "" then
			return
		end
		copy_file(file, backup_name(file))
	end,
})

require("bootstrap")
require("lazy").setup("plugins")
require("mytheme").setup()
require("statusline")

vim.opt.termguicolors = true
vim.opt.updatetime = 700
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.guifont = "Monaco Nerd Font:h17"
vim.g.neovide_hide_mouse_when_typing = true

local cmp = require("cmp")

cmp.setup({
	window = {
		completion = cmp.config.window.bordered({
			border = "rounded",
			winhighlight = "Normal:CmpPmenu,FloatBorder:CmpPmenuBorder,CursorLine:PmenuSel,Search:None",
			scrollbar = true,
		}),
		documentation = cmp.config.window.bordered({
			border = "rounded",
			winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder,Search:None",
			max_width = 15,
			max_height = 15,
		}),
	},

	performance = {
		max_view_entries = 15,
	},
})

vim.diagnostic.config({
	underline = true,
	severity_sort = true,
	update_in_insert = false,

	virtual_text = {
		spacing = 4,
		source = "if_many",
		prefix = "",
	},

	signs = true,
	float = {
		border = "rounded",
		source = "if_many",
		header = "",
		prefix = "",
	},
})

vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end,
})

vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "DiagnosticError" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "DiagnosticWarn" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link = "DiagnosticInfo" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link = "DiagnosticHint" })

vim.opt.signcolumn = "yes:1"
local signs = {
	Error = "",
	Warn = "",
	Info = "󰋽",
	Hint = "󰌶",
}

for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

vim.diagnostic.config({
	signs = true,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ministarter",
	callback = function(ev)
		vim.keymap.set("n", "i", function()
			vim.cmd("enew")
			vim.cmd("startinsert")
		end, { buffer = ev.buf, silent = true, nowait = true })
	end,
})

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "line,number"
vim.opt.laststatus = 3

vim.api.nvim_create_autocmd("FileType", {
	pattern = "ministarter",
	callback = function(ev)
		vim.keymap.set("n", "i", function()
			vim.cmd("enew")
			vim.cmd("startinsert")
		end, { buffer = ev.buf, silent = true, nowait = true })
	end,
})

