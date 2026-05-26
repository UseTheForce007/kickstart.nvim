return {
  'Piotr1215/typeit.nvim',
  config = function()
    local function type_inline(text, speed, line_pause)
      if text == '' then
        return
      end

      local lines = vim.split(text, '\n', { plain = true })
      local line_index = 1
      speed = speed or 35
      line_pause = line_pause or math.max(speed * 8, 250)

      local function finish_typing()
        vim.api.nvim_input(vim.api.nvim_replace_termcodes('<Esc>', true, false, true))
      end

      local function type_next_line()
        if line_index > #lines then
          finish_typing()
          return
        end

        local line = lines[line_index]
        local char_index = 1

        local function type_next_char()
          if char_index > #line then
            line_index = line_index + 1
            if line_index > #lines then
              finish_typing()
            else
              vim.api.nvim_input('\n')
              vim.defer_fn(type_next_line, line_pause)
            end
            return
          end

          vim.api.nvim_input(line:sub(char_index, char_index))
          char_index = char_index + 1
          vim.defer_fn(type_next_char, speed)
        end

        type_next_char()
      end

      vim.api.nvim_input('i')
      vim.defer_fn(type_next_line, 0)
    end

    local function type_visual_selection()
      -- Yank the current visual selection into the z register.
      vim.cmd('normal! "zy')
      local text = vim.fn.getreg('z')
      if text == '' then
        return
      end

      -- Delete the selection without clobbering registers.
      vim.cmd('normal! gv"_d')

      -- Simulate typing at the current cursor position with line pauses.
      require('typeit').simulate_typing_with_pauses(text, 'line', 50)
    end

    -- NOTE: <leader>s is already used as the Search prefix in this config,
    -- so use <leader>st to avoid shadowing those mappings.
    vim.keymap.set('v', '<leader>st', type_visual_selection, { desc = 'Simulate typing visual selection' })

    local function type_inline_from_register()
      local register = vim.fn.input('Register: ')
      if register == '' then
        return
      end

      local text = vim.fn.getreg(register)
      if text == '' then
        return
      end

      type_inline(text, 50, 400)
    end

    vim.keymap.set('n', '<leader>ti', type_inline_from_register, { desc = 'Simulate inline typing from register' })

    local function type_from_register()
      local register = vim.fn.input('Register: ')
      if register == '' then
        return
      end

      local text = vim.fn.getreg(register)
      if text == '' then
        return
      end

      require('typeit').simulate_typing_with_pauses(text, 'line', 35)
    end

    vim.keymap.set('n', '<leader>tr', type_from_register, { desc = 'Simulate typing from register' })
  end,
}
