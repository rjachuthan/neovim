return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  opts = {},
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,
      ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        java = false,-- don't check treesitter on java
      }
    })
  end
}
