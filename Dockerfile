FROM archlinux as builder
MAINTAINER Karl Hepworth

RUN mkdir /app
COPY . /app
WORKDIR /app

# Prepare system
RUN pacman -Sy
RUN pacman --noconfirm -Sy base-devel

# Build application
RUN chmod a+rwx /app/pygmy-go /app/pygmy-go-git
RUN cd pygmy-go-git && sudo -u nobody makepkg -Si

FROM archlinux
COPY --from=builder /app /app