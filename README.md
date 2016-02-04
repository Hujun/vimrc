# vimrc
Personal vim config

## Installation

### 1. Clone project
```
cd ~
# vimrc project -> ~/.vim
git clone git@github.com:Hujun/vimrc.git ~/.vim
# clone Vundle
git clone git@github.com:VundleVim/Vundle.vim.git ~/.vim/bunlde/Vundle.vim
```

### 2. Dependencies

#### 2.1. System Dependencies
```
# mac
brew install CMake
brew install ctags
# brew install the_silver_searcher
```

#### 2.2. Python Plugin Dependencies
```
sudo pip install pyflakes
sudo pip install pylint
sudo pip install pep8
```

#### 2.3. Javascript Plugin Dependencies
```
# mac
brew install node
npm install -g jshint
npm install -g jslint
```

#### 2.4. Upgrade Vim
```
# mac
brew update
brew install vim
echo "alias vim='/usr/local/bin/vim'" >> ~/.profile && source ~/.profile
```

### 3. Install

- Symbolic link for .vimrc and .vimrc.bundles
- Plugin installation via Vundle
- Complile YCM

```
cd ~/.vim
sh -x install.sh
```
