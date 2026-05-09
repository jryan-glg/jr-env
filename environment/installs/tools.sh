#! /usr/bin/env bash

function _which() {
  which $1 > /dev/null
}

function _punt() {
  echo "$1"
  exit 1
}

# #############################################################################
# # Software Install - Mac Things
# #############################################################################
if echo $OSTYPE | grep -i darwin > /dev/null; then

  # cache a list of all brew installed formula
  # TODO: this could be written to disk on first boot to improve the loading of scripts
  # Will this error out on first install since brew is not installed?
  INSTALLED_FORMULA=$(brew list)

  # handle brew instal
  brew_install () {
    # check if brew is installed at all
    BREW_CMD="$(which brew)"
    if [ ! -f "${BREW_CMD}" ]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    # change variable to formula that is passed
    BREW_CMD="$1"
    # check if formula is installed. if not, make it so.
    if ! echo "${INSTALLED_FORMULA}" | grep "${BREW_CMD}" > /dev/null; then
      brew install "${BREW_CMD}"
    fi
  }

  # handle brew cask install - these are the GUI installs for Mac OS
  brew_install_cask () {
    # check if brew is installed at all
    BREW_CMD="$(which brew)"
    if [ ! -f "${BREW_CMD}" ]; then
      /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
    # change variable to cask that is passed
    BREW_CMD="$1"
    # check if formula is installed. if not, make it so.
    if ! echo "${INSTALLED_FORMULA}" | grep "${BREW_CMD}" > /dev/null; then
      brew install --cask "${BREW_CMD}"
    fi
  }

  # List of the brew items to install
  brew_install awscli
  brew_install bat
#   brew_install bitwarden-cli
#   brew_install cloudflared
  brew_install coreutils
  brew_install gh
  brew_install git
  brew_install git-delta
  brew_install go
  # I am not following my previous convention because I do not have a way to setup
  # taps. I am fairly confident this should be fine as the first time I run this script
  # it will make sure that I have brew installed at all.
  brew tap common-fate/granted
  brew_install granted
  brew_install jq
  # I am not following my previous convention because I do not have a way to setup
  # taps. I am fairly confident this should be fine as the first time I run this script
  # it will make sure that I have brew installed at all.
  brew tap spacelift-io/spacelift
  brew_install spacectl
  brew_install telnet
  brew_install tenv
  brew_install the_silver_searcher
  brew_install wireguard-tools

  # List of the casks to install
#   brew_install_cask balenaetcher
#   brew_install_cask docker
  brew_install_cask firefox
#   brew_install_cask flycut
  brew_install_cask google-chrome
  brew_install_cask iterm2
  brew_install_cask licecap
#   brew_install_cask microsoft-office
#   brew_install_cask notion
  brew_install_cask postman
#   brew_install_cask powershell
#   brew_install_cask raycast
  brew_install_cask rectangle
  brew_install_cask slack
  brew_install_cask visual-studio-code
  brew_install_cask vlc
  brew_install_cask windows-app
#   brew_install_cask zoom
fi

# #############################################################################
# # Software Install - Linux Poo
# #############################################################################

# apt_get_install () {
#   APP="$(basename $1)"
#   [ -n "$2" ] && CHECK="$2" || CHECK="$1"
#   if ! which "$CHECK" > /dev/null; then
#     [ -z "${RUN_ONCE}" ] && sudo apt-get update -y && RUN_ONCE=true
#     sudo apt-get install -y $APP
#   fi
# }

# npm_install () {
#   APP="$(basename $1)"
#   [ -z "$2" ] || APP="$2"
#   if ! which "${APP}" > /dev/null; then
#     sudo mkdir -p /usr/lib/node_modules
#     sudo mkdir -p /usr/local/lib
#     sudo chown -R "${USER}:${USER}" /usr/lib/node_modules
#     sudo chown -R "${USER}:${USER}" /usr/local/lib
#     sudo chown "root:adm" /usr/bin
#     sudo chmod 775 /usr/bin
#     sudo chown "root:adm" /usr/local/bin
#     sudo chmod 775 /usr/local/bin
#     npm install -g "$1"
#   fi
# }

# if echo $OSTYPE | grep -i linux > /dev/null; then
#   apt_get_install nodejs node
#   apt_get_install npm
#   apt_get_install curl
#   apt_get_install wget
#   apt_get_install tmux
#   apt_get_install openvpn
#   apt_get_install traceroute
#   apt_get_install strace
#   apt_get_install jq
#   apt_get_install silversearcher-ag ag
#   npm_install "glg-core/vpn-client"
#   npm_install "git-clone-cli" "clone"

#   if ! which bat > /dev/null; then
#     pushd /tmp > /dev/null
#     URL='https://github.com/sharkdp/bat/releases/download/v0.7.1/bat-musl_0.7.1_amd64.deb'
#     wget "${URL}"
#     sudo dpkg -i "$(basename ${URL})"
#     popd >/dev/null
#   fi

#   if [ ! -L "${HOME}/.zshrc" ] \
#   && [ -f "${HOME}/Dropbox/syncstuff/.zshrc" ]; then
#     mv "${HOME}/.zshrc" "${HOME}/.zshrc.bak"
#     ln -s "${HOME}/Dropbox/syncstuff/.zshrc" "${HOME}/.zshrc"
#   fi

#   if [ ! -L "/usr/bin/open" ] \
#   && [ -f "${HOME}/Dropbox/syncstuff/open" ]; then
#     sudo mv "/usr/bin/open" "/usr/bin/open.bak"
#     sudo ln -s "${HOME}/Dropbox/syncstuff/open" "/usr/bin/open"
#   fi

#   if [ -f "${HOME}/.oh-my-zsh/themes/agnoster.zsh-theme" ] \
#   && ! grep prompt_context "${HOME}/.oh-my-zsh/themes/agnoster.zsh-theme" | grep -v '{' | grep '#' > /dev/null; then
#     sed -i 's|prompt_context$|# prompt_context$|' "${HOME}/.oh-my-zsh/themes/agnoster.zsh-theme"
#   fi

#   if [ ! -L "${HOME}/.ssh" ] \
#   && [ -d "${HOME}/Dropbox/syncstuff/.ssh" ]; then
#     mv "${HOME}/.ssh" "${HOME}/.ssh.bak"
#     ln -s "${HOME}/Dropbox/syncstuff/.ssh" "${HOME}/.ssh"
#     for file in $(echo id_rsa \
#                        id_dsa \
#                        glguser \
#                        beta_bot); do
#       pushd "${HOME}/.ssh" > /dev/null
#       chmod 400 "${file}"
#       popd > /dev/null
#     done
#   fi

#   if ! which kitty > /dev/null; then
#     pushd /tmp > /dev/null
#     apt_get_install libjs-underscore
#     apt_get_install libjs-sphinxdoc
#     for url in $(echo 'http://http.us.debian.org/debian/pool/main/k/kitty/kitty-terminfo_0.11.3-1_all.deb' \
#                       'http://http.us.debian.org/debian/pool/main/k/kitty/kitty-doc_0.11.3-1_all.deb' \
#                       'http://http.us.debian.org/debian/pool/main/k/kitty/kitty_0.11.3-1_amd64.deb'); do

#       wget "$url"
#       sudo dpkg -i "$(basename ${url})"
#     done
#     popd
#   fi

#   if [ ! -L "${HOME}/.config/kitty/kitty.conf" ] \
#   && [ -f "${HOME}/Dropbox/syncstuff/.config/kitty/kitty.conf" ]; then
#     mv "${HOME}/.config/kitty/kitty.conf" "${HOME}/.config/kitty/kitty.conf.bak"
#     ln -s "${HOME}/Dropbox/syncstuff/.config/kitty/kitty.conf" "${HOME}/.config/kitty/kitty.conf"
#   fi

# fi

# #############################################################################
# # Global Configs
# #############################################################################

# # If bat successfully gets installed we will
# # swap cat with bat
# if which bat > /dev/null; then
#   alias cat='bat'
# fi

# if which diff-so-fancy > /dev/null; then
#   git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
#   git config --global color.ui true
#   git config --global color.diff-highlight.oldNormal    "red bold"
#   git config --global color.diff-highlight.oldHighlight "red bold 52"
#   git config --global color.diff-highlight.newNormal    "green bold"
#   git config --global color.diff-highlight.newHighlight "green bold 22"

#   git config --global color.diff.meta       "yellow"
#   git config --global color.diff.frag       "magenta bold"
#   git config --global color.diff.commit     "yellow bold"
#   git config --global color.diff.old        "red bold"
#   git config --global color.diff.new        "green bold"
#   git config --global color.diff.whitespace "red reverse"
# fi

# Install prettyping
if [ ! -f /usr/local/bin/prettyping ]; then
  pushd /tmp > /dev/null
  curl -s -O https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
  sudo cp prettyping /usr/local/bin
  echo Installing prettyping
  sudo chmod +x /usr/local/bin/prettyping
  popd > /dev/null
fi

if [ -f /usr/local/bin/prettyping ]; then
  alias ping='prettyping --nolegend'
fi

# # Global git config
# if [ ! -f "$HOME/.gitconfig" ]; then
#   git config --global user.email "mikemartin1090@users.noreply.github.com"
#   git config --global user.name "Mike Martin"
#   git config --global pull.rebase false # merge (the default strategy)
#   git config --global init.defaultBranch main
#   git config --global url.ssh://git@github.com/.insteadOf https://github.com/
#   git config --global core.pager "delta"
#   git config --global interactive.diffFilter "delta --color-only"
#   git config --global delta.navigate true
#   git config --global delta.line-numbers true
#   git config --global delta.side-by-side true
#   git config --global merge.conflictStyle diff3
  git config --global diff.colorMoved default
fi

# Install fuzzy finder
# if ! _which fzf \
# && [ ! -d "$HOME/.fzf" ]; then
#   git clone --depth 1 "https://github.com/junegunn/fzf.git" "$HOME/.fzf"
#   pushd "$HOME/.fzf" > /dev/null
#   "$HOME/.fzf/install" --key-bindings --completion --update-rc
#   popd > /dev/null
# fi

# Install oh my zsh
# if [ ! -d "$HOME/.oh-my-zsh" ]; then
#   sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
# fi

# Install NVM
# if [ ! -f "$HOME/.nvm/nvm.sh" ]; then
#   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
#   export NVM_DIR="$HOME/.nvm"
#   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#   [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
# fi

# handle npm install globals
# cache a list of all brew installed formula
# TODO: this could be written to disk on first boot to improve the loading of scripts
# Will this error out on first install since npm is not installed and kill my script?
# INSTALLED_PACKAGE=$(npm list -g)

# npm_install_global () {
#   # check if npm is installed at all
#   NPM_CMD="$(which npm)"
#   if [ ! -f "${NPM_CMD}" ]; then
#     nvm install --lts
#   fi
#   # change variable to package that is passed
#   NPM_CMD="$1"
#   # check if package is installed. if not, make it so.
#   if ! echo "${INSTALLED_PACKAGE}" | grep "${NPM_CMD}" > /dev/null; then
#     npm install -g "${NPM_CMD}"
#   fi
# }

# # Install NPM tools globally
# npm_install_global jwt-cli

# # Configure AWS CLI auto-complete
# if _which aws; then
#   autoload bashcompinit && bashcompinit
#   autoload -Uz compinit && compinit
#   complete -C '/usr/local/bin/aws_completer' aws
# fi