return { {
	"williamboman/mason-lspconfig.nvim",
	lazy = true,
	opts = {
		ensure_installed = {
			"lua_ls",
			"vimls",
			"pyright",
			"clangd",
			"rust_analyzer",
            "tflint",
			"tsserver",
			"cmake",
            "terraformls",
            "glsl_analyzer",
            "gopls",
            "spectral"
		},
	},
	config = true
},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { 'BufReadPre', 'BufNewFile' }, -- Sempre que abrir um novo buffer ou tentar criar um novo arquivo
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/nvim-cmp"
		},
		config = function()      -- Será chamado no lugar de plugin.setup()
			local lspconfig = require('lspconfig')
			require "mason"        -- Lazy nvim carrega o mason de acordo com nossas configurações
			require "mason-lspconfig" -- Lazy nvim carrega o mason-lsp de acordo com nossas configurações
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
            lspconfig.glsl_analyzer.setup {
                capabilities = capabilities
            }
			lspconfig.lua_ls.setup {
				capabilities = capabilities
			}
			lspconfig.vimls.setup {
				capabilities = capabilities
			}
			lspconfig.pyright.setup {
				capabilities = capabilities
			}
			lspconfig.clangd.setup {
				capabilities = capabilities
			}
			lspconfig.rust_analyzer.setup {
				capabilities = capabilities
			}
			lspconfig.sqls.setup {
				capabilities = capabilities
			}
			lspconfig.cmake.setup {
				capabilities = capabilities
			}
			lspconfig.tsserver.setup {
				capabilities = capabilities
			}
            lspconfig.tflint.setup {
                capabilities = capabilities
            }
            lspconfig.terraformls.setup {
                capabilities = capabilities
            }
            lspconfig.gopls.setup {
                capabilities = capabilities
            }
            lspconfig.spectral.setup {
                capabilities = capabilities
            }
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }
					vim.keymap.set('v', '<space>f', vim.lsp.buf.format, bufopts)
				end
			})
		end
	},
	{ "williamboman/mason.nvim", lazy = true, config = true }
}
