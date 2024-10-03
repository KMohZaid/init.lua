# About this nvim config

This is a refactored fork of the [kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) config. (FOR CUSTOM PREFERENCE)

I am going to refactor it into a modular config, so that it can be easier to maintain and extend. (by me and for me, ofcourse).
Check out this section for step by step my plan of refactoring it. [Refactoring TODO](#refactoring-todo)

## WHY refactor this into modular config? instead of using [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim), which is maintained fork of kickstart.nvim?

It is because i want to keep my future config clean and more like i want it to be. BTW, i will keep a fork of kickstart.nvim or kickstart-modular.nvim, so that i  can do fixes and improvements to my config until i master it, lol

## Refactoring TODO

- [x] Clear out unnecessary comments(leave the one i am still learning from) and add comments to where i should divide it into files eg. autocmds.lua, options.lua, etc.
- [ ] Turn this into a modular config.
    - [ ] Divide it into multiple files.
    - [ ] Convert plugins.lua into a folder with multiple files...
    - [ ] Get rid of kickstart lugin folder and copy custom folder plugins into new folder.
- [ ] Lastly, learn and remove comments

## TODO

- [ ] Read README.md of kickstart.nvim and learn something
- [ ] Learn vim
- [ ] Learn vim
...
- [ ] Learn vim

# Credits

- [ThePrimeagen](https://github.com/ThePrimeagen) for his video to make me fall in love with vim/neovim and informing me that kickstart.nvim is must try for beginners. (i used to think that it is another pre-configured neovim setup like neovim distros)
- Thanks to [TJ DeVries](https://github.com/tjdevries) for kickstart.nvim
