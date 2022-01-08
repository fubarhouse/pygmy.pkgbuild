FROM archlinux as builder
MAINTAINER Karl Hepworth

RUN mkdir /app
COPY . /app

# Prepare system
RUN pacman -Syu --noconfirm
RUN pacman --noconfirm -Sy base-devel
RUN pacman --noconfirm -Sy git go-pie pacman-contrib ruby2.6

RUN mkdir /go
RUN chmod -R 777 /go
RUN mkdir /.cache
RUN chmod -R 777 /.cache

# Build application
RUN chmod -R 777 /app
# Run One - Pygmy
RUN cd /app/pygmy && \
    sudo -u nobody makepkg -f
# Run Two - Pygmy-Bin
RUN cd /app/pygmy-bin && \
    sudo -u nobody makepkg -f
# Run Three - Pygmy-Git
RUN cd /app/pygmy-git && \
    sudo -u nobody makepkg -Sfi
# Run Four - Pygmy-Legacy
RUN cd /app/pygmy-legacy && \
    sudo -u nobody makepkg -Si

# Produce result
FROM archlinux
COPY --from=builder /app /app
WORKDIR /app