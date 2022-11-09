use {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("indent_blankline").setup { filetype_exclude = { "dashboard" }
    }
  end
}
