return { -- ~/.config/nvim/lua/gitcandp.lua
  vim.api.nvim_create_user_command('Gcandp', function(opts)
    local message = opts.args
    vim.fn.system('bash ~/.config/nvim/scripts/git_commit_push.sh -m "' .. message .. '"')
  end, { nargs = 1 }),
}
