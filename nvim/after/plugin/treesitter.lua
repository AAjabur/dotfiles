require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installe>
  ensure_installed = { "c", "cpp", "python", "css", "javascript", "typescript", "sql" },

  -- Install parsers synchronously (only applied to ensure_installed)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have tree-sitter CLI installed locally
  auto_install = true,

  ---- If you need to change the installation directory of the parsers (see -> Advanced >
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runt>

  highlight = {
    enable = true,

    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
