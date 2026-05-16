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
			harpoon:setup({})

			local function map(lhs, rhs, desc)
				vim.keymap.set("n", lhs, rhs, { desc = desc })
			end

			map("<leader>ha", function()
				harpoon:list():add()
			end, "Harpoon: add")
			map("<leader>hr", function()
				harpoon:list():remove()
			end, "Harpoon: remove")
			map("<leader>hh", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, "Harpoon: menu")
			map("<leader>1", function()
				harpoon:list():select(1)
			end, "Harpoon 1")
			map("<leader>2", function()
				harpoon:list():select(2)
			end, "Harpoon 2")
			map("<leader>3", function()
				harpoon:list():select(3)
			end, "Harpoon 3")
			map("<leader>4", function()
				harpoon:list():select(4)
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
			telescope.setup({
			})
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
		"neovim/nvim-lspconfig",
	},
	{
		"WieeRd/auto-lsp.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
		},
		lazy = false,
		opts = {
			["*"] = function()
				return {
					capabilities = require("cmp_nvim_lsp").default_capabilities(),
				}
			end,
		},
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
		lazy = false,
		config = function()

			require("nvim-treesitter").setup({
				install_dir = vim.fn.stdpath("data") .. "/site"
			})
			-- require("nvim-treesitter").install({
			-- 		"lua",
			-- 		"python",
			-- 		"cpp",
			-- 		"rust",
			-- 		"html",
			-- 		"css",
			-- 		"javascript",
			-- 		"java",
			-- 		"json",
			-- 		"toml",
			-- 		"bash"
			-- })

			vim.api.nvim_create_autocmd('FileType', {
				pattern = {'lua', 'python', 'cpp', 'rust', 'html', 'css', 'javascript', 'java', 'json', 'toml', 'sh'},
				callback = function()
					vim.treesitter.start()
				end
			})

			


		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function() 
		end
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
			local palette = require("mytheme.palette")
			local starter = require("mini.starter")

			vim.api.nvim_set_hl(0, "MiniStarterHeader", { fg = palette.fg })
			vim.api.nvim_set_hl(0, "MiniStarterHeaderSlash", { fg = palette.keyword })

			local function highlight_logo_slashes(content)
				local next_content = {}

				for _, line in ipairs(content) do
					local next_line = {}

					for _, unit in ipairs(line) do
						if unit.type == "header" then
							for i = 1, #unit.string do
								local char = unit.string:sub(i, i)
								table.insert(next_line, {
									string = char,
									type = unit.type,
									hl = char == "/" and "MiniStarterHeaderSlash" or "MiniStarterHeader",
								})
							end
						else
							table.insert(next_line, unit)
						end
					end

					table.insert(next_content, next_line)
				end

				return next_content
			end

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
				content_hooks = {
					highlight_logo_slashes,
					starter.gen_hook.adding_bullet(),
					starter.gen_hook.aligning("center", "center"),
				},
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
