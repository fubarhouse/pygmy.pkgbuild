#!/usr/bin/env bash
# To be run from inside the ArchLinux container.

# Set working directory
cd /app || exit

# Update
pacman -Sy

# Install dependencies
pacman -Sy --noconfirm base-devel git go-pie pacman-contrib ruby2.6

# Build pygmy-git
cd /app/pygmy || exit
sudo -u nobody makepkg -Sfi

# Build pygmy-bin
cd /app/pygmy-bin || exit
sudo -u nobody makepkg -Sfi

# Build pygmy-git
cd /app/pygmy-git || exit
sudo -u nobody makepkg -Sfi

# Build pygmy-legacy
cd /app/pygmy-legacy || exit
sudo -u nobody makepkg -Si

# Cleanup
pacman -Sc --noconfirm