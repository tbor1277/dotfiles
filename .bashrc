  1 " Fisa-vim-config 
  2 " http://fisadev.github.io/fisa-vim-config/ 
  3 " version: 8.3.1 
  4  
  5 " ============================================================================ 
  6 " Vim-plug initialization 
  7 " Avoid modify this section, unless you are very sure of what you are doing 
  8  
  9 let vim_plug_just_installed = 0 
 10 let vim_plug_path = expand('~/.vim/autoload/plug.vim') 
 11 if !filereadable(vim_plug_path) 
 12     echo "Installing Vim-plug..." 
 13     echo "" 
 14     silent !mkdir -p ~/.vim/autoload 
 15     silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/    master/plug.vim 
 16     let vim_plug_just_installed = 1 
 17 endif 
 18  
 19 " manually load vim-plug the first time 
 20 if vim_plug_just_installed 
 21     :execute 'source '.fnameescape(vim_plug_path) 
 22 endif 
 23  
 24 " Obscure hacks done, you can now modify the rest of the .vimrc as you wish :) 
 25  
 26 " ============================================================================ 
 27 " Active plugins 
 28 " You can disable or add new ones here: 
 29  
 30 " this needs to be here, so vim-plug knows we are declaring the plugins we 
 31 " want to use 
 32 call plug#begin('~/.vim/plugged') 
 33  
 34 " Plugins from github repos: 
 35  
 36 " Override configs by directory  
 37 Plug 'arielrossanigo/dir-configs-override.vim' 
 38 " Better file browser 
 39 Plug 'scrooloose/nerdtree' 
 40 " Code commenter 
 41 Plug 'scrooloose/nerdcommenter' 
 42 " Class/module browser 
 43 Plug 'majutsushi/tagbar' 
 44 " Code and files fuzzy finder 
 45 Plug 'ctrlpvim/ctrlp.vim' 
 46 " Extension to ctrlp, for fuzzy command finder 
 47 Plug 'fisadev/vim-ctrlp-cmdpalette' 
 48 " Zen coding 
 49 Plug 'mattn/emmet-vim' 
 50 " Git integration 
 51 Plug 'motemen/git-vim' 
 52 " Tab list panel 
 53 Plug 'kien/tabman.vim' 
 54 " Airline 
 55 Plug 'vim-airline/vim-airline' 
 56 Plug 'vim-airline/vim-airline-themes' 
.vimrc                                                                                             1,1            Top
-- VISUAL LINE --
