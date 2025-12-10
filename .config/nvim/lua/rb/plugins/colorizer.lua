return {
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        filetypes = {
          "*",
          css =  { names = true },
          html = { names = true},
          javascript = { names = true},
        },
        user_default_option = {
          names = true,
          rgb_fn = true,
          hsl_fn = true,
          tailwind = true,
          mode = "background",
        },
      })
    end,
  }
}
