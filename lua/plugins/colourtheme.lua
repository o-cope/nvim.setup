return {
  'morhetz/gruvbox', -- Gruvbox plugin
  lazy = false,
  priority = 1000,
  config = function()
    local theme_file = vim.fn.stdpath 'config' .. '/gruvbox_theme_state.txt'

    -- Initialize the theme state by reading the file (if it exists)
    local function read_theme_state()
      local f = io.open(theme_file, 'r')
      if f then
        local state = f:read '*a'
        f:close()
        return state:match '^%s*(.-)%s*$' -- Trim any extra whitespace
      else
        return 'dark'                     -- Default to 'dark' if no file exists
      end
    end

    -- Set the initial theme based on the file state
    local current_theme = read_theme_state()

    -- Set contrast options
    vim.g.gruvbox_contrast_dark = 'hard'
    vim.g.gruvbox_contrast_light = 'hard'
    vim.g.gruvbox_invert_selection = false
    vim.g.gruvbox_borders = true
    vim.g.gruvbox_italic = false
    vim.g.gruvbox_bold = true
    vim.g.gruvbox_sign_column = 'bg0'

    -- Set the initial background and colorscheme
    if current_theme == 'light' then
      vim.cmd [[
        set background=light
        colorscheme gruvbox
      ]]
    else
      vim.cmd [[
        set background=dark
        colorscheme gruvbox
      ]]
    end

    -- Toggle function between light and dark modes
    function _G.toggle_gruvbox()
      if vim.o.background == 'dark' then
        -- Switch to light mode with 'hard' contrast
        vim.o.background = 'light'
        vim.g.gruvbox_contrast_dark = 'soft'
        vim.g.gruvbox_contrast_light = 'hard'
        vim.cmd [[colorscheme gruvbox]]
        -- Save the theme state to the file
        local f = io.open(theme_file, 'w')
        f:write 'light'
        f:close()
      else
        -- Switch to dark mode with 'hard' contrast
        vim.o.background = 'dark'
        vim.g.gruvbox_contrast_dark = 'hard'
        vim.g.gruvbox_contrast_light = 'soft'
        vim.cmd [[colorscheme gruvbox]]
        -- Save the theme state to the file
        local f = io.open(theme_file, 'w')
        f:write 'dark'
        f:close()
      end
    end

    -- Map the keybinding to toggle Gruvbox theme (<leader>tb)
    vim.api.nvim_set_keymap('n', '<leader>tb', ':lua toggle_gruvbox()<CR>', { noremap = true, silent = true })
  end,
}

