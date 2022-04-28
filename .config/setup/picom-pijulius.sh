git clone https://github.com/pijulius/picom pijuliuspicom
cd pijuliuspicom
git submodule update --init --recursive
sudo meson --buildtype=release . build
sudo ninja -C build install
