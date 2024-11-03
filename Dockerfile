FROM archlinux as builder
MAINTAINER Karl Hepworth

RUN mkdir -p /home/runner/work/pygmy.pkgbuild/pygmy.pkgbuild
ADD . /home/runner/work/pygmy.pkgbuild/pygmy.pkgbuild
RUN chmod -R 777 /home/runner/work/pygmy.pkgbuild/pygmy.pkgbuild

RUN mkdir /.gem
RUN chmod 777 /.gem 

# Prepare system
RUN pacman -Syu --noconfirm
RUN pacman --noconfirm -Sy base-devel
RUN pacman --noconfirm -Sy git go-pie

# Prepare system for legacy package test
RUN pacman --noconfirm -Sy ruby2.7

RUN mkdir /go
RUN chmod -R 777 /go
RUN mkdir /.cache
RUN chmod -R 777 /.cache

# Run One - Pygmy
RUN cd /home/runner/work/pygmy.pkgbuild/pygmy.pkgbuild/pygmy && \
    sudo -u nobody makepkg -f

# Run Two - Pygmy-Bin
RUN cd /home/runner/work/pygmy.pkgbuild/pygmy.pkgbuild/pygmy-bin && \
    sudo -u nobody makepkg -f

# Run Three - Pygmy-Git
RUN cd //home/runner/work/pygmy.pkgbuild/pygmy.pkgbuild/pygmy-git && \
    sudo -u nobody makepkg -f \

# Run Four - Pygmy-Git
RUN cd /home/runner/work/pygmy.pkgbuild/pygmy.pkgbuild/pygmy-static-bin && \
    sudo -u nobody makepkg -f

# Run Five - Pygmy-Legacy
RUN cd /home/runner/work/pygmy.pkgbuild/pygmy.pkgbuild/pygmy-legacy && \
   sudo -u nobody makepkg -f

# Produce result
FROM archlinux
COPY --from=builder /home/runner/work/pygmy.pkgbuild/pygmy.pkgbuild/ /app
WORKDIR /app