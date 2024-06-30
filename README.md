## Neovim configuration 
Features: 

- Telescope 
- Language server
- Code completion
- Debugger
- Harpoon
- Undotree
- Git 

## Instalation
`git clone https://github.com/BMHDAC/nvim ~/.config/nvim`


## Changes From Mason to native ArchLinux Language Server

** To install all the required Language Server, run this command **

`sudo pacman -S luarocks nodejs npm typescript typescript-language-server vscode-html-languageserver vscode-json-languageserver lua-language-server vscode-css-languageserver python-lsp-server`

** To install other dependencies from cargo and npm **

`cargo component add rust-analyzer clippy`

`sudo npm intall -g @tailwindcss/language-server @microsoft/compose-language-service`

** Other tools such as formatter and linter ** 

`sudo pacman -S python-lsp-black python-isort prettier stylua `

Yes I did include the php setup in my lspconfig
