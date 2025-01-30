vim.api.nvim_create_user_command('Ssm', function()
  local file = vim.fn.expand '%:p'  -- Get full file path
  local dir = vim.fn.expand '%:p:h' -- Get directory of the file
  local base_name = dir .. '/a'     -- Base filename
  local output_file = base_name .. '.out'

  -- Find a unique filename by incrementing (a1.out, a2.out, etc.)
  local count = 1
  while vim.fn.filereadable(output_file) == 1 do
    output_file = string.format('%s%d.out', base_name, count)
    count = count + 1
  end

  -- Run SSM to generate output
  local cmd = string.format('java -jar ~/oli-env/uni/SSM.jar %s > %s 2>&1', file, output_file)
  vim.fn.system(cmd)

  -- Check if output file was created
  if vim.fn.filereadable(output_file) == 1 then
    -- Check if it's text or binary
    local file_type = vim.fn.system('file -b ' .. output_file)

    if file_type:match 'text' then
      -- Open the file in a split if it's text
      vim.cmd('vsplit ' .. output_file)
    else
      -- If binary, make executable and run it
      vim.fn.system(string.format('chmod +x %s', output_file))
      vim.cmd('split | terminal ' .. output_file)
    end
  else
    print '❌ Failed to generate output.'
  end
end, { desc = 'Run current SSM file and open output correctly' })

