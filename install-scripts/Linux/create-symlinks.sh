#!/usr/bin/env sh 

#==============
# Create text file to log progress of the installation
#==============
touch ~/install_progress_log.txt

#============== 
# Variables 
#============== 
dotfiles_dir=~/dotfiles 
log_file=~/install_progress_log.txt 

#============== 
# Delete existing dot files and folders
#==============
sudo rm -rf ~/.viminfo > /dev/null 2>&1
sudo rm -rf ~/.vim > /dev/null 2>&1
sudo rm -rf ~/.vimrc > /dev/null 2>&1
sudo rm -rf ~/.bashrc > /dev/null 2>&1
sudo rm -rf ~/.bash_aliases > /dev/null 2>&1
sudo rm -rf ~/.config/i3 > /dev/null 2>&1

#==============
# Create symlinks in the home folder
# Allow overriding with files of matching names in the custom-configs dir
#==============
ln -s -f ~/dotfiles/.viminfo ~/.viminfo
ln -s -f ~/dotfiles/.vim ~/.vim
ln -s -f ~/dotfiles/.vimrc ~/.vimrc
ln -s -f ~/dotfiles/.bashrc ~/.bashrc
ln -s -f ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -s -f ~/dotfiles/.config/i3 ~/.config/i3

#==============
# Give the user a summary of what has been installed
#==============
echo -e "\n====== Summary ======\n"
cat $log_file
echo
echo "Enjoy -tbor"
rm $log_file
