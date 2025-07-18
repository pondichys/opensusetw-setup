#! /usr/bin/env bash
## Variable declaration
# List of packages to install
pkg_list=(
	bat
	btop
	chezmoi
	curl
	eza
	fd
	fish
	fzf
	gh
	git-delta
	jq
	lazygit
 	neovim
	ripgrep
	tealdeer
	tmux
 	wget
	yazi
	zoxide
)

# List of directories to check and create if needed
local_dirs=("$HOME/.local/bin" "$HOME/.local/share/fonts" "$HOME/.local/share/icons" "$HOME/.local/share/themes")

## functions
function install_pkg () {
	sudo zypper --non-interactive install --auto-agree-with-licenses "$1"
}


echo "Installing base programs ..."
for pkg in "${pkg_list[@]}"; do
	install_pkg $pkg
done

echo "Installing container software"
install_pkg podman

echo "Creating $HOME/.local subdirectories"
for dir in "${local_dirs[@]}"; do
	if [ ! -d "$dir" ]; then
		echo "Create $dir"
		mkdir -vp "$dir"
	fi
done
