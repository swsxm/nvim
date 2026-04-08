#### Neovim Config

Welcome to my nvim config!



#### General a

- This is a basic Neovim setup with a few plugins.
   - For a detailed plugin overview, look into `lua/plugins`.
- My convenient keymaps.
- Zellij is used as the terminal emulator.
- Contains also some keybindings i use in vscode, look into `.vscode/`
   - It uses visidata to inspect DataFrames.
   - For example, when debugging, hovering over a DataFrame and clicking `dv` opens visidata with the DataFrame.
    ![Screenshot](img/visidate_debug_example.png)

#### Requirements

- Neovim 0.12+
- visidata installed (install it with `uv tool install visidata` or otherwise)
- just the general installs like ripgrep and so on
- install your lsp
