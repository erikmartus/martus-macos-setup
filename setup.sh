#!/usr/bin/env bash
set -e

# Shared functions

pretty_print() {
  printf "\n%b\n" "$1"
}

pretty_print "Running initial setup"

# Homebrew installation

if ! command -v brew &>/dev/null; then
    pretty_print "Installing Homebrew, an OSX package manager, follow the instructions..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

    if ! grep -qs "recommended by brew doctor" ~/.zshrc; then
        pretty_print "Put Homebrew location earlier in PATH ..."
            printf '\n# recommended by brew doctor\n' >> ~/.zshrc
            printf 'export PATH="/usr/local/bin:$PATH"\n' >> ~/.zshrc
            export PATH="/usr/local/bin:$PATH"
    fi
else
    pretty_print "Homebrew already installed"
fi

# Homebrew OSX libraries

pretty_print "Updating brew formulas"
    brew update

pretty_print "Installing GNU core utilities..."
	brew install coreutils

pretty_print "Installing GNU find, locate, updatedb and xargs..."
	brew install findutils

printf 'export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"' >> ~/.zshrc
export PATH="$(brew --prefix coreutils)/libexec/gnubin:$PATH"

pretty_print "Installing 1Password..."
    brew install --cask 1password

pretty_print "Installing Affinity Desiger..."
    brew install --cask affinity-designer

pretty_print "Installing Affinity Photo..."
    brew install --cask affinity-photo

pretty_print "Installing Affinity Publisher..."
    brew install --cask affinity-publisher

pretty_print "Installing Figma..."
    brew install --cask figma

pretty_print "Installing Android Studio..."
    brew install --cask android-studio

pretty_print "Installing Arc..."
    brew install --cask arc

pretty_print "Installing ClickUp..."
    brew install --cask clickup

pretty_print "Installing Discord..."
    brew install --cask discord

pretty_print "Installing Firefox..."
    brew install --cask firefox

pretty_print "Installing FontBase..."
    brew install --cask fontbase

pretty_print "Installing Flutter..."
    brew install --cask flutter

pretty_print "Installing Google Chrome..."
    brew install --cask google-chrome

pretty_print "Installing iTerm2..."
    brew install --cask iterm2

pretty_print "Installing Obsidian..."
    brew install --cask obsidian

pretty_print "Installing Raycast..."
    brew install --cask raycast

pretty_print "Installing Spotify..."
    brew install --cask spotify

pretty_print "Installing VS Code..."
    brew install --cask visual-studio-code

pretty_print "Installing Private Internet Access..."
    brew install --cask private-internet-access

pretty_print "Installing noTunes..."
    brew install --cask notunes

pretty_print "Installing Xcode..."
    brew install mas
    mas install 497799835

XCODE_VERSION=`xcodebuild -version | grep '^Xcode\s' | sed -E 's/^Xcode[[:space:]]+([0-9\.]+)/\1/'`
ACCEPTED_LICENSE_VERSION=`defaults read /Library/Preferences/com.apple.dt.Xcode 2> /dev/null | grep IDEXcodeVersionForAgreedToGMLicense | cut -d '"' -f 2`

if [[ ! "$XCODE_VERSION" = "$ACCEPTED_LICENSE_VERSION" ]]
then 
    sudo xcodebuild -license accept
fi

pretty_print "Setting Arc as default browser..."
    brew install defaultbrowser
    # if this fails run `defaultbrowser` to see available options
    defaultbrowser browser

pretty_print "Installing Canary Mail App..."
    mas install 1236045954

pretty_print "Installing CrossOver..."
    brew install --cask crossover

pretty_print "Configuring System Defaults..."
    defaults write com.apple.dock persistent-apps -array
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Arc.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Firefox.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Google Chrome.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Canary Desktop.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Visual Studio Code.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/iTerm.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Affinity Designer 2.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Affinity Photo 2.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Affinity Publisher 2.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/ClickUp.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Notion.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Discord.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock persistent-apps -array-add '<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>/Applications/Spotify.app</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>'
    defaults write com.apple.dock tilesize -int 40
    defaults write com.apple.dock "autohide" -bool "true"
    defaults write com.apple.dock "autohide-time-modifier" -float "0.25"
    defaults write com.apple.dock "mineffect" -string "scale"
    defaults write com.apple.dock "show-recents" -bool "false"
    killall Dock

    defaults write com.apple.menuextra.clock "DateFormat" -string "\"EEE MMM d h:mm a\""

    defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
    defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
    defaults write com.apple.finder "ShowPathbar" -bool "true"
    defaults write com.apple.finder "FXPreferredViewStyle" -string "clmv"
    defaults write NSGlobalDomain "NSTableViewDefaultSizeMode" -int "1"
    killall Finder

    defaults write NSGlobalDomain "ApplePressAndHoldEnabled" -bool "false"

pretty_print "Setting up dev environment..."
    if [[ ! -d ~/dev ]]
    then
      mkdir -p ~/dev
    fi

    if [[ ! -d ~/.oh-my-zsh ]]
    then
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    fi
    if [[ ! -d ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k ]]
    then
      git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    fi
    sed -i '' -e '/ZSH_THEME/ s/="[^"][^"]*"/="powerlevel10k\/powerlevel10k"/' ~/.zshrc
    brew install --cask font-fira-code
    brew install gh

pretty_print "Manual Steps to complete:"
pretty_print "- [ ] Restart terminal and configure p10k theme"
pretty_print "- [ ] Disable the default Spotlight keyboard shortcut"
pretty_print "- [ ] Configure Raycast Hotkey to ⌘ Space"
pretty_print "- [ ] Configure Raycast shortcuts (see raycast-config.md)"
pretty_print "- [ ] Download and install Fira Code from https://github.com/tonsky/FiraCode/releases"
