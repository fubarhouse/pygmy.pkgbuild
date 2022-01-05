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
sudo -u nobody makepkg -Sfi

# Build pygmy-go-bin
cd /app/pygmy-go-bin || exit
sudo -u nobody makepkg -Sfi

# Cleanup
pacman -Sc --noconfirm