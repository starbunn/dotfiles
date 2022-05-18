#!/bin/zsh
BUILDPLAN=$1
cp ./$BUILDPLAN ./iosevka/private-build-plans.toml
cd iosevka
npm install
{
    npm run build -- ttf::bunni && cp -r dist/bunni ../
    npm run build -- ttf::bunnit && cp -r dist/bunnit ../
    npm run build -- ttf::bunniq && cp -r dist/bunniq ../
}
# cd ..
# {
#     for f in ./pyrasev-term/ttf/*.ttf; do
#         ./nerd-fonts/font-patcher -c -ext ttf -out ./nerdfont/ $f
#     done
# }

