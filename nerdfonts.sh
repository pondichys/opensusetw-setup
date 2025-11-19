#!/usr/bin/bash
declare local_fonts_dir="$HOME/.local/share/fonts"
declare nf_download_url="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/"
declare -a nf_list=(
	Hack
	JetBrainsMono
	Meslo
)

if [ ! -d "$local_fonts_dir" ]; then
	mkdir -pv "$local_fonts_dir"
fi

echo "Downloading nerd fonts"
for nf in "${nf_list[@]}"; do
	curl --output-dir "$local_fonts_dir" -OL "$nf_download_url${nf}.zip"
	echo "Extracting ${nf}.zip"
	unzip "$local_fonts_dir/${nf}.zip" -d "$local_fonts_dir/$nf"
	echo "Removing ${nf}.zip archive"
	rm -v "$local_fonts_dir/${nf}.zip"
done

echo "Refreshing font cache"
fc-cache -fv
