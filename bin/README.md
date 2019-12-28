Tools to install:

node (currently need 8 for rails stuff)
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
sudo apt-get install -y nodejs

yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn


elm
https://github.com/elm/compiler/blob/master/installers/linux/README.md

elm-format
npm install -g elm-format

elm-analyse
npm install -g elm-analyse

elm-oracle
npm install -g elm-oracle

elm-test
npm install -g elm-test

elm-generate (Spades)
npm -g install git+https://github.com/rogeriochaves/spades.git

create-elm-app
npm install create-elm-app -g



Install RVM
From https://rvm.io/rvm/install
\curl -sSL https://get.rvm.io | bash -s stable
