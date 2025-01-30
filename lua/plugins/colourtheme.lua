return {
  'morhetz/gruvbox', -- Gruvbox plugin
  lazy = false,
  priority = 1000,
  config = function()
    -- Set the initial color mode to dark and contrast to 'hard'
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.gruvbox_contrast_light = 'hard'
    vim.g.gruvbox_invert_selection = false
    vim.g.gruvbox_borders = true
    vim.g.gruvbox_italic = false
    vim.g.gruvbox_bold = true
    vim.g.gruvbox_sign_column = 'bg0'

    -- Set the initial background and colorscheme
    vim.cmd [[
      set background=dark
      colorscheme gruvbox
    ]]

    -- Toggle function between light and dark modes
    function _G.toggle_gruvbox()
      if vim.g.gruvbox_contrast_dark == 'hard' then
        -- Switch to light mode with 'hard' contrast
        vim.g.gruvbox_contrast_dark = 'soft'
        vim.g.gruvbox_contrast_light = 'hard'
        vim.cmd [[
          set background=light
          colorscheme gruvbox
        ]]
      else
        -- Switch to dark mode with 'hard' contrast
        vim.g.gruvbox_contrast_dark = 'hard'
        vim.g.gruvbox_contrast_light = 'soft'
        vim.cmd [[
          set background=dark
          colorscheme gruvbox
        ]]
      end
    end

    -- Map the keybinding to toggle Gruvbox theme (<leader>tb)
    vim.api.nvim_set_keymap('n', '<leader>tb', ':lua toggle_gruvbox()<CR>', { noremap = true, silent = true })
  end,
}
