return {
	{
		"folke/snacks.nvim",
		opts = {
			indent = {
				enabled = true,
				indent = {
					enabled = true,
					char = "│",
					hl = "IndentLine",
				},
				scope = {
					enabled = true,
					char = "│",
					hl = "IndentScope",
				},
			},
		},
		config = function(_, opts)
			vim.api.nvim_create_autocmd("ColorScheme", {
				callback = function()
					vim.api.nvim_set_hl(0, "IndentLine", { fg = "#1c2228" })
					vim.api.nvim_set_hl(0, "IndentScope", { fg = "#CABBED", bold = true })
				end,
			})

			vim.api.nvim_set_hl(0, "IndentLine", { fg = "#1c2228" })
			vim.api.nvim_set_hl(0, "IndentScope", { fg = "#CABBED", bold = true })

			require("snacks").setup(opts)
		end,
	},

	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {},
		-- Optional dependencies
		dependencies = { { "nvim-mini/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
		-- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
		lazy = false,
		config = function()
			require("oil").setup({
				view_options = {
					show_hidden = true,
				},
			})
		end,
	},
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local harpoon = require("harpoon")
			local mark = require("harpoon.mark")
			local ui = require("harpoon.ui")
			harpoon.setup({})

			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { desc = desc })
			end

			map("<leader>ha", function()
				mark.add_file()
			end, "Harpoon: add")
			map("<leader>hr", function()
				mark.rm_file()
			end, "Harpoon: remove")
			map("<leader>hh", function()
				ui.toggle_quick_menu()
			end, "Harpoon: menu")
			map("<leader>1", function()
				ui.nav_file(1)
			end, "Harpoon 1")
			map("<leader>2", function()
				ui.nav_file(2)
			end, "Harpoon 2")
			map("<leader>3", function()
				ui.nav_file(3)
			end, "Harpoon 3")
			map("<leader>4", function()
				ui.nav_file(4)
			end, "Harpoon 4")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({})
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		end,
	},
	{
		"mbbill/undotree",
		cmd = "UndotreeToggle",
		keys = {
			{ "<leader>u", "<cmd>UndotreeToggle<cr>", desc = "Toggle Undotree" },
		},
		init = function()
			vim.g.undotree_SetFocusWhenToggle = 1
			vim.g.undotree_SplitWidth = 40
			vim.g.undotree_DiffAutoOpen = 0
		end,
	},

	{
		"norcalli/nvim-colorizer.lua",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("colorizer").setup({
				"*",
			}, {
				RGB = true,
				RRGGBB = true,
				RRGGBBAA = true,
				AARRGGBB = true,
				rgb_fn = true,
				hsl_fn = true,
				names = false,
				css = true, 
				css_fn = true,
				mode = "background",
				virtualtext = "■",
			})
		end,
	},
	{
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup()
		end,
	},

	{
		"j-hui/fidget.nvim",
		event = "LspAttach",
		opts = {},
	},

	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-tree").setup()
		end,
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Toggle outline" },
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"python",
					"cpp",
					"rust",
					"bash",
					"html",
					"css",
					"javascript",
					"java",
					"json",
					"toml",
				},
				highlight = { enable = true },
			})
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			require("luasnip.loaders.from_vscode").lazy_load()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fb)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fb()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fb)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fb()
						end
					end, { "i", "s" }),
				}),
				sources = {
					{ name = "nvim_lsp" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "luasnip" },
				},
			})
		end,
	},

	{
		"nvim-mini/mini.starter",
		event = "VimEnter",
		config = function()
			local starter = require("mini.starter")
			starter.setup({
				header = [=[
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
/// \\/// \\/////// \\/// \\\\\\\/// \\\\\\\\/////// \\/// \\/// \///// \/// \\/// \
/// \\/// \/// \\/// \/// \\\\\\\/// \\\\\\\/// \\/// \/// \\/// \\/// \\//// //// \
///////// \///////// \/// \\\\\\\/// \\\\\\\///////// \/// \\/// \\/// \\/// / /// \
/// \\/// \/// \\/// \/// \\\\\\\/// \\\\\\\/// \\/// \\/// /// \\\/// \\/// \\/// \
/// \\/// \/// \\/// \///////// \///////// \/// \\/// \\\///// \\\///// \/// \\/// \
\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
				]=],
				items = {
					starter.sections.builtin_actions(),
					starter.sections.recent_files(5, true),
				},
				footer = "",
			})
		end,
	},
	{
		"stevearc/aerial.nvim",
		opts = {
			use_icon_provider = false,
			nerd_font = true,
			backends = { "lsp", "treesitter", "markdown" },
		},
		keys = {
			{ "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Toggle outline" },
		},
	},
}
