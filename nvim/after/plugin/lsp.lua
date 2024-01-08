lsp_zero = require('lsp-zero')
local cmp = require('cmp')

cmp.setup({
    preselect = 'item',
    completion = {
        completeopt = 'menu,menuone,noinsert'
    },
    mapping = cmp.mapping.preset.insert({
        ['<CR>'] = cmp.mapping.confirm({select = false}),
    }),
})

lsp_zero.on_attach(function(client, bufnr)
  lsp_zero.default_keymaps({buffer = bufnr})
end)

local lspconfig = require('lspconfig')

-- get servers from https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'tsserver', 'clangd', 'pyright', 'eslint', 'lua_ls'},
    handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
            lspconfig.lua_ls.setup({
                on_init = function(client)
                    local path = client.workspace_folders[1].name
                    if not vim.loop.fs_stat(path..'/.luarc.json') and not vim.loop.fs_stat(path..'/.luarc.jsonc') then
                        client.config.settings = vim.tbl_deep_extend('force', client.config.settings, {
                            Lua = {
                                runtime = {
                                    -- Tell the language server which version of Lua you're using
                                    -- (most likely LuaJIT in the case of Neovim)
                                    version = 'LuaJIT'
                                },
                                -- Make the server aware of Neovim runtime files
                                workspace = {
                                    checkThirdParty = false,
                                    library = {
                                        vim.env.VIMRUNTIME
                                        -- "${3rd}/luv/library"
                                        -- "${3rd}/busted/library",
                                    }
                                    -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
                                    -- library = vim.api.nvim_get_runtime_file("", true)
                                }
                            }
                        })

                        client.notify("workspace/didChangeConfiguration", { settings = client.config.settings })
                    end
                    return true
                end
            })
        end,
        eslint = function()
            lspconfig.eslint.setup({
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
                ESLintConfig = {
                    rules = {
                        quotes = {"error", "double"},
                    },
                }
            }
            )
        end,
        clangd = function()
            lspconfig.clangd.setup({
                cmd= {
                    "/usr/bin/clangd",
                    '--query-driver="/opt/cid/2.6.2/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-gcc,/opt/cid/2.6.2/sysroots/x86_64-pokysdk-linux/usr/bin/arm-poky-linux-gnueabi/arm-poky-linux-gnueabi-g++"',
                    "--pretty",
                    "--header-insertion=iwyu",
                    "--enable-config",
                    -- "--background-index",
                    "--suggest-missing-includes",
                },
                filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
            })
        end,
        tsserver = function()
            lspconfig.tsserver.setup({
                settings = {
                    completions = {
                        completeFunctionCalls = true
                    }
                },
            })
        end,
    }
})

