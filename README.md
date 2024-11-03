# Pygmy AUR

[![Build Status](https://github.com/fubarhouse/pygmy.pkgbuild/actions/workflows/workflows.yml/badge.svg)](https://github.com/fubarhouse/pygmy.pkgbuild/actions/workflows/workflows.yml)

This repository serves as a source for an installer for [Pygmy](https://github.com/pygmystack/pygmy) which is available to Linux distributions which are derived from Arch - such as Manjaro.

## Usage

A Dockerfile has been provided so you can use `makepkg` on any platform, and you are able to generate a copy locally after building the Docker image using a script provided.

```shell script
docker build -t archtest .
```

Alternatively, in  due time you will be able to run `pacman -S pygmy` or `pacman -S pygmy-git`, or use any abstraction utility, such as yay - to do so for you.

## Purpose

The reason this repository exists is to ensure the long-term stability of the Arch distribution method of Pygmy, although this does need to be updated with the project over time.

## License

MIT