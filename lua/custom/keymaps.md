# Neovim Keymaps

This file inventories the keymaps defined in this Neovim config, including direct `vim.keymap.set()` calls, lazy plugin `keys` entries, and key-binding style plugin options.

## Global Settings

| Setting | Value | Source |
| --- | --- | --- |
| Leader | `<Space>` | [init.lua](../init.lua#L90) |
| Local leader | `<Space>` | [init.lua](../init.lua#L91) |

## Core Maps

| Mode | Key | Action | Label | Scope | Source |
| --- | --- | --- | --- | --- | --- |
| n | `<Esc>` | `:nohlsearch` | Clear search highlight | Global | [init.lua](../init.lua#L172) |
| n | `<leader>q` | `vim.diagnostic.setloclist` | Open diagnostic quickfix list | Global | [init.lua](../init.lua#L190) |
| t | `<Esc><Esc>` | `<C-\\><C-n>` | Exit terminal mode | Terminal | [init.lua](../init.lua#L198) |
| n | `<C-h>` | `<C-w><C-h>` | Move focus to the left window | Global | [init.lua](../init.lua#L210) |
| n | `<C-l>` | `<C-w><C-l>` | Move focus to the right window | Global | [init.lua](../init.lua#L211) |
| n | `<C-j>` | `<C-w><C-j>` | Move focus to the lower window | Global | [init.lua](../init.lua#L212) |
| n | `<C-k>` | `<C-w><C-k>` | Move focus to the upper window | Global | [init.lua](../init.lua#L213) |

## Telescope And Search

| Mode | Key | Action | Label | Scope | Source |
| --- | --- | --- | --- | --- | --- |
| n | `<leader>sh` | `telescope.builtin.help_tags` | Search help | Global | [init.lua](../init.lua#L408) |
| n | `<leader>sk` | `telescope.builtin.keymaps` | Search keymaps | Global | [init.lua](../init.lua#L409) |
| n | `<leader>sf` | `telescope.builtin.find_files` | Search files | Global | [init.lua](../init.lua#L410) |
| n | `<leader>ss` | `telescope.builtin.builtin` | Search Telescope pickers | Global | [init.lua](../init.lua#L411) |
| n, v | `<leader>sw` | `telescope.builtin.grep_string` | Search current word | Global | [init.lua](../init.lua#L412) |
| n | `<leader>sg` | `telescope.builtin.live_grep` | Search by grep | Global | [init.lua](../init.lua#L413) |
| n | `<leader>sd` | `telescope.builtin.diagnostics` | Search diagnostics | Global | [init.lua](../init.lua#L414) |
| n | `<leader>sr` | `telescope.builtin.resume` | Search resume | Global | [init.lua](../init.lua#L415) |
| n | `<leader>s.` | `telescope.builtin.oldfiles` | Search recent files | Global | [init.lua](../init.lua#L416) |
| n | `<leader>sc` | `telescope.builtin.commands` | Search commands | Global | [init.lua](../init.lua#L417) |
| n | `<leader><leader>` | `telescope.builtin.buffers` | Find existing buffers | Global | [init.lua](../init.lua#L418) |
| n | `grr` | `telescope.builtin.lsp_references` | Go to references | Buffer-local on LSP attach | [init.lua](../init.lua#L428) |
| n | `gri` | `telescope.builtin.lsp_implementations` | Go to implementation | Buffer-local on LSP attach | [init.lua](../init.lua#L432) |
| n | `grd` | `telescope.builtin.lsp_definitions` | Go to definition | Buffer-local on LSP attach | [init.lua](../init.lua#L437) |
| n | `gO` | `telescope.builtin.lsp_document_symbols` | Open document symbols | Buffer-local on LSP attach | [init.lua](../init.lua#L441) |
| n | `gW` | `telescope.builtin.lsp_dynamic_workspace_symbols` | Open workspace symbols | Buffer-local on LSP attach | [init.lua](../init.lua#L445) |
| n | `grt` | `telescope.builtin.lsp_type_definitions` | Go to type definition | Buffer-local on LSP attach | [init.lua](../init.lua#L450) |
| n | `<leader>/` | `telescope.builtin.current_buffer_fuzzy_find()` | Fuzzy search current buffer | Global | [init.lua](../init.lua#L455) |
| n | `<leader>s/` | `telescope.builtin.live_grep()` | Search open files | Global | [init.lua](../init.lua#L465) |
| n | `<leader>sn` | `telescope.builtin.find_files()` with config cwd | Search Neovim config files | Global | [init.lua](../init.lua#L478) |

## LSP Actions

| Mode | Key | Action | Label | Scope | Source |
| --- | --- | --- | --- | --- | --- |
| n | `grn` | `vim.lsp.buf.rename` | Rename | Buffer-local on LSP attach | [init.lua](../init.lua#L549) |
| n, x | `gra` | `vim.lsp.buf.code_action` | Code action | Buffer-local on LSP attach | [init.lua](../init.lua#L553) |
| n | `grD` | `vim.lsp.buf.declaration` | Go to declaration | Buffer-local on LSP attach | [init.lua](../init.lua#L557) |
| n | `<leader>th` | Toggle `vim.lsp.inlay_hint` | Toggle inlay hints | Buffer-local on LSP attach | [init.lua](../init.lua#L593) |

## Git Signs

| Mode | Key | Action | Label | Scope | Source |
| --- | --- | --- | --- | --- | --- |
| n | `]c` | Next git change / hunk | Jump to next git change | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L23) |
| n | `[c` | Previous git change / hunk | Jump to previous git change | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L31) |
| v | `<leader>hs` | `gitsigns.stage_hunk()` | Stage hunk | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L41) |
| v | `<leader>hr` | `gitsigns.reset_hunk()` | Reset hunk | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L42) |
| n | `<leader>hs` | `gitsigns.stage_hunk()` | Stage hunk | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L44) |
| n | `<leader>hr` | `gitsigns.reset_hunk()` | Reset hunk | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L45) |
| n | `<leader>hS` | `gitsigns.stage_buffer()` | Stage buffer | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L46) |
| n | `<leader>hR` | `gitsigns.reset_buffer()` | Reset buffer | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L47) |
| n | `<leader>hp` | `gitsigns.preview_hunk()` | Preview hunk | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L48) |
| n | `<leader>hi` | `gitsigns.preview_hunk_inline()` | Preview hunk inline | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L49) |
| n | `<leader>hb` | `gitsigns.blame_line({ full = true })` | Blame line | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L50) |
| n | `<leader>hd` | `gitsigns.diffthis()` | Diff against index | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L51) |
| n | `<leader>hD` | `gitsigns.diffthis('@')` | Diff against last commit | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L52) |
| n | `<leader>hQ` | `gitsigns.setqflist('all')` | Git hunk quickfix list for all files | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L53) |
| n | `<leader>hq` | `gitsigns.setqflist()` | Git hunk quickfix list for current file | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L54) |
| n | `<leader>tb` | `gitsigns.toggle_current_line_blame()` | Toggle blame line | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L56) |
| n | `<leader>tw` | `gitsigns.toggle_word_diff()` | Toggle intra-line word diff | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L57) |
| o, x | `ih` | `gitsigns.select_hunk()` | Select hunk text object | Buffer-local when gitsigns attaches | [lua/kickstart/plugins/gitsigns.lua](../lua/kickstart/plugins/gitsigns.lua#L60) |

## Debugging

| Mode | Key | Action | Label | Scope | Source |
| --- | --- | --- | --- | --- | --- |
| n | `<F5>` | `dap.continue()` | Start / continue debugging | Global lazy key | [lua/kickstart/plugins/debug.lua](../lua/kickstart/plugins/debug.lua#L35) |
| n | `<F1>` | `dap.step_into()` | Debug step into | Global lazy key | [lua/kickstart/plugins/debug.lua](../lua/kickstart/plugins/debug.lua#L36) |
| n | `<F2>` | `dap.step_over()` | Debug step over | Global lazy key | [lua/kickstart/plugins/debug.lua](../lua/kickstart/plugins/debug.lua#L37) |
| n | `<F3>` | `dap.step_out()` | Debug step out | Global lazy key | [lua/kickstart/plugins/debug.lua](../lua/kickstart/plugins/debug.lua#L38) |
| n | `<leader>b` | `dap.toggle_breakpoint()` | Toggle breakpoint | Global lazy key | [lua/kickstart/plugins/debug.lua](../lua/kickstart/plugins/debug.lua#L39) |
| n | `<leader>B` | `dap.set_breakpoint()` with condition prompt | Set conditional breakpoint | Global lazy key | [lua/kickstart/plugins/debug.lua](../lua/kickstart/plugins/debug.lua#L40) |
| n | `<F7>` | `dapui.toggle()` | Toggle debugger UI | Global lazy key | [lua/kickstart/plugins/debug.lua](../lua/kickstart/plugins/debug.lua#L42) |

## File Navigation

| Mode | Key | Action | Label | Scope | Source |
| --- | --- | --- | --- | --- | --- |
| n | `\\` | `:Neotree reveal<CR>` | Reveal Neo-tree | Global lazy key | [lua/kickstart/plugins/neo-tree.lua](../lua/kickstart/plugins/neo-tree.lua#L15) |
| n | `\\` | `close_window` | Close Neo-tree window | Neo-tree filesystem window | [lua/kickstart/plugins/neo-tree.lua](../lua/kickstart/plugins/neo-tree.lua#L23) |

## Terminal And Utilities

| Mode | Key | Action | Label | Scope | Source |
| --- | --- | --- | --- | --- | --- |
| n | `<leader>tt` | `toggleterm.nvim` open mapping | Open floating terminal | Global plugin option | [lua/custom/plugins/toggleterm.lua](../lua/custom/plugins/toggleterm.lua#L5) |
| n | `<leader>u` | `vim.cmd.Undotree` | Toggle undotree | Global | [lua/custom/undotree.lua](../lua/custom/undotree.lua#L2) |
| n | `<leader>tp` | Open `ssh -t pi` terminal in `~/pi-project` | Terminal to Pi | Global | [lua/custom/remote_sync.lua](../lua/custom/remote_sync.lua#L53) |
| n | `<leader>ps` | `sync_project()` | Pi sync | Global | [lua/custom/remote_sync.lua](../lua/custom/remote_sync.lua#L57) |

## Opencode

| Mode | Key | Action | Label | Scope | Source |
| --- | --- | --- | --- | --- | --- |
| n, i | `<a-a>` | `opencode_send` | Send selection to opencode | Snacks picker input binding | [lua/custom/plugins/opencode.lua](../lua/custom/plugins/opencode.lua#L19) |
| n, x | `<C-a>` | `opencode.ask()` | Ask opencode | Global plugin key | [lua/custom/plugins/opencode.lua](../lua/custom/plugins/opencode.lua#L36) |
| n, x | `<C-x>` | `opencode.select()` | Select opencode | Global plugin key | [lua/custom/plugins/opencode.lua](../lua/custom/plugins/opencode.lua#L37) |
| n, t | `<C-.>` | `opencode.toggle()` | Toggle opencode | Global plugin key | [lua/custom/plugins/opencode.lua](../lua/custom/plugins/opencode.lua#L38) |
| n, x | `go` | `opencode.operator()` | Add range to opencode | Expr mapping | [lua/custom/plugins/opencode.lua](../lua/custom/plugins/opencode.lua#L40) |
| n | `goo` | `opencode.operator() .. '_'` | Add line to opencode | Expr mapping | [lua/custom/plugins/opencode.lua](../lua/custom/plugins/opencode.lua#L41) |
| n | `<S-C-u>` | `opencode.command('session.half.page.up')` | Scroll opencode up | Global plugin key | [lua/custom/plugins/opencode.lua](../lua/custom/plugins/opencode.lua#L43) |
| n | `<S-C-d>` | `opencode.command('session.half.page.down')` | Scroll opencode down | Global plugin key | [lua/custom/plugins/opencode.lua](../lua/custom/plugins/opencode.lua#L44) |
| n | `+` | `<C-a>` | Increment under cursor | Global remap | [lua/custom/plugins/opencode.lua](../lua/custom/plugins/opencode.lua#L47) |
| n | `-` | `<C-x>` | Decrement under cursor | Global remap | [lua/custom/plugins/opencode.lua](../lua/custom/plugins/opencode.lua#L48) |

## Typeit

| Mode | Key | Action | Label | Scope | Source |
| --- | --- | --- | --- | --- | --- |
| v | `<leader>st` | `type_visual_selection()` | Simulate typing visual selection | Global | [lua/custom/plugins/typeit.lua](../lua/custom/plugins/typeit.lua#L68) |
| n | `<leader>ti` | `type_inline_from_register()` | Simulate inline typing from register | Global | [lua/custom/plugins/typeit.lua](../lua/custom/plugins/typeit.lua#L84) |
| n | `<leader>tr` | `type_from_register()` | Simulate typing from register | Global | [lua/custom/plugins/typeit.lua](../lua/custom/plugins/typeit.lua#L100) |
