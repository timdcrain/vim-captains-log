Captain's Log [![build status](https://gitlab.com/timdcrain/vim-captains-log/badges/master/build.svg)](https://gitlab.com/timdcrain/vim-captains-log/commits/master)
=============

Captain's Log is a personal log entry plugin.

![Example usage](https://gitlab.com/timdcrain/vim-captains-log/uploads/fbdcb3e11e629ed5c6f6204cadfc7b4c/example.gif)

Basic Usage
===========

Whenever you want to log something, run `:CaptainsLogEnable` to enable the plugin.
This only enables it in the current buffer, so it won't affect anything else you
are doing. From there, all you need to do is write something interesting down and
hit enter, and Captain's Log will automagically enter the current timestamp at the
beginning of the line.

You can run `:CaptainsLogDisable` to turn this off.

Configuration
=============

The default timestamp is ISO8601 date and time, so it will look something like
`2017-02-23T13:30:58+08:00`. If that is too verbose, you can change it via:

    let g:captains_log_date_format = "{format}"

See `:help strftime` for more information about the format string.

Installation
============

* [NeoBundle](https://github.com/Shougo/neobundle.vim):
`NeoBundle 'https://gitlab.com/timdcrain/vim-captains-log'`

* [Pathogen](https://github.com/tpope/vim-pathogen):
`git clone https://gitlab.com/timdcrain/vim-captains-log ~/.vim/bundle/vim-captains-log`

* [Vundle](https://github.com/VundleVim/Vundle.vim):
`Plugin 'https://gitlab.com/timdcrain/vim-captains-log'`

* [VimPlug](https://github.com/junegunn/vim-plug):
`Plug 'https://gitlab.com/timdcrain/vim-captains-log'`

* Manual:
Copy all of the files into your ~/.vim directory
