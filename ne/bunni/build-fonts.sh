#!/bin/zsh

BUILDPLAN="$1.toml"

cd iosevka
rm -rf private-build-plans.toml
cp ../$BUILDPLAN private-build-plans.toml

npm install
npm run build -- ttf::bunni && cp -r dist/bunni ../
npm run build -- ttf::bunnit && cp -r dist/bunnit ../
npm run build -- ttf::bunniq && cp -r dist/bunniq ../
