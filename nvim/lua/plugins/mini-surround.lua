return {
  "nvim-mini/mini.surround",
  opts = {
    mappings = {
      add = "gs", -- Add surrounding in Normal and Visual modes
      delete = "dgs", -- Delete surrounding
      find = "", -- Find surrounding (to the right)
      find_left = "", -- Find surrounding (to the left)
      highlight = "", -- Highlight surrounding
      replace = "cgs", -- Replace surrounding
      update_n_lines = "", -- Update `n_lines`
    },
  },
}
