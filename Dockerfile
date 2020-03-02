FROM archlinux as builder
MAINTAINER Karl Hepworth

RUN mkdir /app
COPY . /app

# Prepare system
RUN pacman -Sy
RUN pacman --noconfirm -Sy base-devel

# Build application
RUN chmod -R 777 /app
RUN cd /app/pygmy-go && \
    sudo -u nobody makepkg
RUN cd /app/pygmy-go-git && \
    sudo -u nobody makepkg -Si

FROM archlinux
COPY --from=builder /app /app
WORKDIR /app