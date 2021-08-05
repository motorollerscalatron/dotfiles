#!/bin/zsh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
mkdir ~/.tmux/plugins/tpm
mkdir ~/.tmux
mkdir ~/.tmux/plugins
mkdir ~/.config/nvim
mkdir ~/.config/nvim/bundle
brew install coreutils
brew install tree
brew install fzf
brew install ag
brew install neovim
brew install awscli
brew install node
brew install tmux
ln -sf ~/dotfiles/.config/nvim/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.rubocop.yml ~/.rubocop.yml
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf

mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
cd ~/.vim/bundle && \
    git clone --depth=1 https://github.com/vim-syntastic/syntastic.git
git clone https://github.com/pangloss/vim-javascript.git ~/.vim/bundle/vim-javascript
git clone https://github.com/mxw/vim-jsx.git ~/.vim/bundle/vim-jsx
git clone --recursive https://github.com/joel-porquet/zsh-dircolors-solarized ~/.zsh/zsh-dircolors-solarized

cd ~/.zsh
curl -o git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
curl -o git-completion.bash https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash
curl -o _git https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.zsh
