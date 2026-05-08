return {
  'Piotr1215/typeit.nvim',
  config = function()
    local function type_visual_selection()
      -- Yank the current visual selection into the z register.
      vim.cmd('normal! "zy')
      local text = vim.fn.getreg('z')
      if text == '' then
        return
      end

      -- Delete the selection without clobbering registers.
      vim.cmd('normal! gv"_d')

      -- Simulate typing at the current cursor position.
      require('typeit').simulate_typing(text, 50)
    end

    -- NOTE: <leader>s is already used as the Search prefix in this config,
    -- so use <leader>st to avoid shadowing those mappings.
    vim.keymap.set('v', '<leader>st', type_visual_selection, { desc = 'Simulate typing visual selection' })

    local function type_from_register()
      local register = vim.fn.input('Register: ')
      if register == '' then
        return
      end

      local text = vim.fn.getreg(register)
      if text == '' then
        return
      end

      require('typeit').simulate_typing(text, 40)
    end

    vim.keymap.set('n', '<leader>tr', type_from_register, { desc = 'Simulate typing from register' })
  end,
}
