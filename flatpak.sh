#!/usr/bin/env bash
declare -a flatpak_apps
flatpak_apps=(
	com.bitwarden.desktop
	com.heroicgameslauncher.hgl
	com.synology.SynologyDrive
	com.valvesoftware.Steam
	com.vivaldi.Vivaldi
	com.vysp3r.ProtonPlus
	io.github.flattool.Warehouse
	io.github.giantpinkrobots.flatsweep
)
echo Installing flatpak applications
for app in "${flatpak_apps[@]}"; do
	sudo flatpak install --assumeyes --noninteractive --or-update $app
done

