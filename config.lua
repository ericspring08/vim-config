use {
  "lukas-reineke/indent-blankline.nvim",
  config = function()
    require("indent_blankline").setup { filetype_exclude = { "dashboard" }
    }
    
  end
}
use {
  'edluffy/hologram.nvim',
  config = function() 
    require('hologram').setup{
      auto_display = true -- WIP automatic markdown image display, may be prone to breaking
    }
}
