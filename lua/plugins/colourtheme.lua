return {
  'morhetz/gruvbox', -- Correct Gruvbox plugin
  lazy = false,
  priority = 1000,
  config = function()
    -- Example config in lua
    vim.g.gruvbox_contrast_dark = 'hard' -- 'hard', 'medium', or 'soft'
    vim.g.gruvbox_borders = true -- Set borders for windows
    vim.g.gruvbox_disable_background = false -- Set to false to keep background
    vim.g.gruvbox_italic = false -- Set to true if you want italic text
    vim.g.gruvbox_bold = true -- Set to true if you want bold text
    vim.g.gruvbox_sign_column = 'bg0' -- Sign column background color
    vim.g.gruvbox_invert_selection = false -- Invert selection (set to true if you prefer)

    -- Load the colorscheme
    vim.cmd [[colorscheme gruvbox]]

    -- Toggle background transparency
    local bg_transparent = true

    local toggle_transparency = function()
      bg_transparent = not bg_transparent
      vim.g.gruvbox_disable_background = bg_transparent
      vim.cmd [[colorscheme gruvbox]] -- Switch the colorscheme
    end

    vim.keymap.set('n', '<leader>bg', toggle_transparency, { noremap = true, silent = true })
  end,
}
