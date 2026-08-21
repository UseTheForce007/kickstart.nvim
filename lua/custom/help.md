# Help

## Neovim Typing Helpers

This setup adds helpers for the typeit.nvim plugin so you can simulate typing from visual selections or registers.

### Simulate typing the current visual selection

1. Select text in visual mode.
2. Press <leader>st.

Behavior:
- The selection is deleted.
- The text is typed back at 50ms per character with line pauses.

### Simulate typing from a register

1. Press <leader>tr in normal mode.
2. Enter a register name and press Enter.

Common registers:

- + : system clipboard
- " : unnamed register
- a : register a

The register content is typed at 50ms per character with line pauses.

### How to save to register a

Use the register prefix "a before yank or delete:

- Yank a word: "ayaw
- Yank a line: "ayy
- Yank a visual selection: select then "ay
- Delete a word into a: "adw

View register contents:

- :reg a

### Stop typing

- :StopTyping
- Ctrl+C

## lemminx XML language server for Neovim.

### Diagnostics

Toggle all diagnostic messages on or off:

- :DiagnosticsToggle



## Neo-tree file explorer

Open the file tree:

- :Neotree toggle
- :Neotree focus
- :Neotree reveal

Common commands inside the Neo-tree window:

- ? : show Neo-tree help
- Enter : open file
- h / l : collapse / expand directory
- a : add file or folder (use a trailing / for folders)
- r : rename
- d : delete
- y : copy
- x : cut
- p : paste
- s / v : open in horizontal / vertical split
- t : open in new tab

## Raspberry Pi development

This setup includes helpers for syncing Pi-project files and refreshing clangd so host Neovim can autocomplete Pi headers and libraries.

### clangd quick fixes

To see the fixes clangd is offering for the current diagnostic or selection, put the cursor on the issue and press <leader>gra.

If you want the surrounding problems first, open the diagnostic list with <leader>q.

Important commands and keybinds:

- :PiSync : sync the current pi-project tree to the Raspberry Pi
- <leader>ps : run PiSync from normal mode
- <leader>tp : open a terminal SSH session to the Pi in ~/pi-project
- :PiClangdSync : sync Pi include directories into the local clangd sysroot cache
- :LspRestart clangd : restart clangd after syncing headers or changing C/C++ settings

Recommended workflow:

1. Run :PiClangdSync to refresh the cached Pi headers.
2. Open a C or C++ buffer that belongs to your Pi project.
3. Use :LspRestart clangd if autocomplete does not refresh immediately.

## Debugging with DAP

This setup uses `nvim-dap` with `dap-ui` for debugging.

### Basic controls

- <F5> : start or continue the current debug session
- <F1> : step into
- <F2> : step over
- <F3> : step out
- <leader>b : toggle a breakpoint
- <leader>B : set a conditional breakpoint
- <F7> : toggle the DAP UI

### Running a session

1. Open the file you want to debug.
2. Put breakpoints where you need them.
3. Press <F5>.
4. For C, C++, or Rust, enter the path to the executable when prompted.

### Notes

- The debugger UI opens automatically when a session starts and closes when it ends.
- If the debug adapter is missing, install `codelldb` or `delve` with Mason.
- Use <F7> if you want to bring the debug UI back without restarting the session.
