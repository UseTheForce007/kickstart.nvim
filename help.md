# Neovim Typing Helpers

This setup adds helpers for the typeit.nvim plugin so you can simulate typing from visual selections or registers.

## Prerequisites

- Plugin installed: Piotr1215/typeit.nvim
- Custom plugins enabled via { import = 'custom.plugins' }

## Keymaps

### Simulate typing the current visual selection

1. Select text in visual mode.
2. Press <leader>st.

Behavior:
- The selection is deleted.
- The text is typed back at 50ms per character.

### Simulate typing from a register

1. Press <leader>tr in normal mode.
2. Enter a register name and press Enter.

Common registers:
- + : system clipboard
- " : unnamed register
- a : register a

The register content is typed at 50ms per character.

## How to save to register a

Use the register prefix "a before yank or delete:

- Yank a word: "ayaw
- Yank a line: "ayy
- Yank a visual selection: select then "ay
- Delete a word into a: "adw

View register contents:

- :reg a

## Stop typing

- :StopTyping
- Ctrl+C
