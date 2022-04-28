curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-cli/master/install.sh | sh
curl -fsSL https://raw.githubusercontent.com/spicetify/spicetify-marketplace/main/install.sh | sh
spicetify
spicetify backup apply enable-devtool
spicetify config current_theme catppuccin
spicetify config color_scheme lavender
spicetify config inject_css 1 replace_colors 1 overwrite_assets 1
spicetify config extensions catppuccin.js
SPICE_PATH="~/.config/spicetify"
sudo ln -s $SPICE_PATH/Themes/catppuccin/catppuccin.js $SPICE_PATH/Extensions
