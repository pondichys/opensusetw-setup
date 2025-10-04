#! /usr/bin/env bash
## Variable declaration
# List of packages to install
pkg_list=(
	bash-completion
 	bat
	btop
	chezmoi
	curl
	eza
 	fastfetch
	fd
	fish
	fzf
	gh
	git-delta
	jq
	lazygit
  lua-language-server
 	neovim
	ripgrep
	sane-backends
	sane-airscan
	selinux-policy-targeted-gaming
 	starship
	steam-devices
	StyLua
	tealdeer
	tmux
 	unzip
 	wget
	yazi
	yubikey-manager
	zoxide
)

# List of directories to check and create if needed
local_dirs=("$HOME/.local/bin" "$HOME/.local/share/fonts" "$HOME/.local/share/icons" "$HOME/.local/share/themes")

## functions
function install_pkg () {
	if ! zypper search --installed-only "$1" | grep -q "^i"; then
		sudo zypper --non-interactive install --auto-agree-with-licenses "$1"
	else
		echo "Package $1 is already installed, skipping..."
	fi
}

echo "Installing base programs ..."
for pkg in "${pkg_list[@]}"; do
	install_pkg $pkg
done

echo "Installing container software"
if [ -z "$CONTAINER_ID" ]; then
	install_pkg podman
	install_pkg distrobox
else
	echo "Running inside distrobox, skipping podman and distrobox installation"
fi

echo "Installing development tools"
sudo zypper --non-interactive install --auto-agree-with-licenses -t pattern devel_basis

echo "Creating $HOME/.local subdirectories"
for dir in "${local_dirs[@]}"; do
	if [ ! -d "$dir" ]; then
		echo "Create $dir"
		mkdir -vp "$dir"
	fi
done
