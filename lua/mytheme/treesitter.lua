local p = require("mytheme.palette")
local hi = vim.api.nvim_set_hl

local function link(cap, opts)
	hi(0, cap, opts)
end

link("@comment", { fg = p.comment, italic = true })
link("@comment.documentation", { fg = p.comment_doc, italic = true })
link("@constant", { fg = p.constant })
link("@number", { fg = p.number })
link("@string", { fg = p.string })
link("@string.escape", { fg = p.string_escape })
link("@function", { fg = p["function"] })
link("@keyword", { fg = p.keyword })
link("@tag", { fg = p.tag })
link("@type", { fg = p["type"] })
link("@type.builtin", { fg = p["type"] })
link("@namespace", { fg = p.namespace })
link("@attribute", { fg = p.attribute })
link("@property", { fg = p.property })
link("@preproc", { fg = p.preproc })
link("Comment", { fg = p.comment, italic = true })
link("Constant", { fg = p.constant })
link("Number", { fg = p.number })
link("String", { fg = p.string })
link("SpecialChar", { fg = p.string_escape })
link("Function", { fg = p["function"] })
link("Identifier", { fg = p.property })
link("Keyword", { fg = p.keyword })
link("Type", { fg = p["type"] })
link("Tag", { fg = p.tag })
link("PreProc", { fg = p.keyword })

vim.api.nvim_set_hl(0, "DiagnosticError", { fg = "#ff5555" })
vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#f1fa8c" })
vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#8be9fd" })
vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#50fa7b" })

local helix = {
	linenr = "#5a5977",
	linenr_active = "#cabbed",
}

vim.api.nvim_set_hl(0, "LineNr", { fg = helix.linenr })
vim.api.nvim_set_hl(0, "CursorLineNr", { fg = helix.linenr_active, bold = false })
