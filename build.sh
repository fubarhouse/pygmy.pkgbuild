#!/usr/bin/env bash
# To be run from inside the ArchLinux container.

# Set working directory
cd /app || exit

# Update
pacman -Sy

# Install dependencies
pacman -Sy --noconfirm base-devel git go-pie

# Build pygmy-go-git
cd /app/pygmy-go-git || exit
sudo -u nobody makepkg -Si

# Build pygmy-go
cd /app/pygmy-go || exit
sudo -u nobody makepkg -Si

# Cleanup
pacman -Sc --noconfirm