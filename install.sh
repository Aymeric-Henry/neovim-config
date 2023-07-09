FILE_PATH=$(pwd)
brew install nvim
brew install ripgrep

mkdir -p ~/.config/nvim
rm -rf  ~/.config/nvim/lua
rm -rf  ~/.config/nvim/plugin
cp $FILE_PATH/nvim/init.lua ~/.config/nvim/init.lua
cp -R $FILE_PATH/nvim/plugin ~/.config/nvim/plugin
cp -R $FILE_PATH/nvim/lua ~/.config/nvim/lua
