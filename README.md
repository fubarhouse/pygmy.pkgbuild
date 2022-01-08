# Pygmy AUR

[![Build Status](https://github.com/fubarhouse/pygmy-go.pkgbuild/actions/workflows/workflows.yml/badge.svg)](https://github.com/fubarhouse/pygmy-go.pkgbuild/actions/workflows/workflows.yml)

This repository serves as a source for an installer for [Pygmy](https://github.com/fubarhouse/pygmy-go) which is available to Linux distributions which are derived from Arch - such as Manjaro.

## Usage

A Dockerfile has been provided so you can use `makepkg` on any platform, and you are able to generate a copy locally after building the Docker image using a script provided.

```shell script
# To build the applications:
docker build -t archtest .
# To make a copy of the applications locally:
docker run -it -v $PWD:/app archtest /app/build.sh
```

Alternatively, in  due time you will be able to run `pacman -S pygmy` or `pacman -S pygmy-git`, or use any abstraction utility, such as yay - to do so for you.
