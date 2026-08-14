return {
  "shortcuts/no-neck-pain.nvim",
  version = "*", -- optional
  cmd = { "NoNeckPain" }, -- trigger plugin loading on this command
  keys = {{
    "<leader>cc",
    "<cmd>NoNeckPain<CR>",
    desc = "Toggle NoNeckPain"
  }},
  config = function()
    require("no-neck-pain").setup({
      -- your config options here
    })
  end
}
