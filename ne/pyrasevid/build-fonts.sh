#!/bin/zsh
cp ./private-build-plans.toml ./font/private-build-plans.toml
cd font
npm install
{
    npm run build -- ttf-unhinted::pyrasevid && cp -r dist/pyrasevid ../
    npm run build -- ttf-unhinted::pyrasevid-term && cp -r dist/pyrasevid-term ../
    npm run build -- ttf-unhinted::pyrasevid-quasi && cp -r dist/pyrasevid-quasi ../
}
# cd ..
# {
#     for f in ./pyrasev-term/ttf/*.ttf; do
#         ./nerd-fonts/font-patcher -c -ext ttf -out ./nerdfont/ $f
#     done
# }

