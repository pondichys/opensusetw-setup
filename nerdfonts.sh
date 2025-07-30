#!/usr/bin/bash
declare nf_download_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/"
declare -a nf_list=(
	Hack.zip
	JetBrainsMono.zip
	Meslo.zip
	Monaspace.zip
)

if [ -d $HOME/.local/share/fonts ]; then
	echo "Download nerd fonts"
	for nf in "${nf_list[@]}"; do
		curl --output-dir $HOME/.local/share/fonts -OL $nf_download_url$nf
	done
fi
