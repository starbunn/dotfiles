#!/bin/zsh
cp ./bunni.toml ./iosevka/private-build-plans.toml
cd iosevka
npm install
{
    npm run build -- ttf-unhinted::bunni && cp -r dist/bunni ../
    npm run build -- ttf-unhinted::bunnit && cp -r dist/bunnit ../
    npm run build -- ttf-unhinted::bunniq && cp -r dist/bunniq ../
}
# cd ..
# {
#     for f in ./pyrasev-term/ttf/*.ttf; do
#         ./nerd-fonts/font-patcher -c -ext ttf -out ./nerdfont/ $f
#     done
# }

