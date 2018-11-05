#!/bin/bash
vundle_dir="$HOME/.vimrc/bundle/Vundle.vim"

function is_pacakge_installed {
	l_package_name=$1
	
	dpkg -s $l_package_name &>/dev/null
	if [ ! $? ]; then
		echo "$l_package_name not installed; do it now"
		sudo apt install $l_package_name
	else
		echo "$l_package_name installed"
	fi
}

if [ ! -d $vundle_dir ]; then
	git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
cp ./vimrc ~/.vim/vimrc
ln ~/.vim/vimrc ~/.vimrc 
vim +PluginInstall +qall

echo "dont forget to install / update YoucompleteMe"
yclm_required=("cmake" "build-essential" "python3-dev")
echo "YoucompleteMe needs these packages ${yclm_required[@]}"
for package in ${yclm_required[*]}
do
	is_pacakge_installed $package
done
