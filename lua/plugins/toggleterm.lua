return {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup({
        size = 20,  -- Adjust the height of the terminal (in lines)
        open_mapping = [[<C-j>]],  -- Custom keybinding to toggle terminal
        direction = "float",  -- Open terminal as a floating window
        persist_mode = true,  -- Keep terminal open between invocations
        close_on_exit = false,  -- Don't close the terminal when the shell exits
        shading_factor = 2,  -- Set the shading factor for the floating terminal
        float_opts = {
          border = "rounded",  -- Border style for the floating window
          winblend = 3,        -- Set window transparency (0-100)
        },
      })
    end
  }
