# Everything Homebrew installs on this Mac. rcm links ~/.Brewfile here, so
# these work from any directory:
#
#   brew bundle --global            install what's listed
#   brew bundle check --global      is everything listed installed?
#   brew bundle cleanup --global    what's installed but not listed (--force removes it)

tap "cassettelab/cassette", "https://github.com/CassetteLab/homebrew-cassette", trusted: true
tap "darrylmorley/whatcable"
tap "gfontenot/formulae"
tap "meta/fb", "https://github.com/meta/homebrew-fb.git"
tap "teamookla/speedtest"

# Shell: zshrc loads all of these
brew "direnv"                    # loads .envrc files
brew "eza"                       # ls, ll and la aliases
brew "fzf"                       # history search and fzf-git.sh key bindings
brew "mise"                      # node, python, ruby, rust and bun versions
brew "neovim"                    # $EDITOR, and the vim alias
brew "starship"                  # prompt
brew "zoxide"                    # z to jump to directories
brew "zsh-autosuggestions"
brew "zsh-syntax-highlighting"

# Libraries mise needs to compile Ruby
brew "gmp"
brew "libyaml"
brew "openssl@3"
brew "readline"

# Version control and CI
brew "act"                       # run GitHub Actions locally
brew "actionlint"                # lint workflow files
brew "gh"                        # GitHub from the shell, used by agents all day
brew "git"                       # newer than Apple's
brew "git-delta"                 # pager and diffFilter in gitconfig
brew "git-lfs"                   # lfs filter in gitconfig
brew "gnupg"                     # gpg, so jj log can verify the merge commits GitHub signs (key: see README)
brew "jj"                        # main VCS, colocated with git
brew "rcm"                       # links this repo into ~ (rcup)
brew "shellcheck"                # lint shell scripts; actionlint uses it for run: steps

# Command line
brew "bat"                       # cat with syntax highlighting
brew "coreutils"                 # GNU tools; agents use timeout
brew "fd"                        # find
brew "ffmpeg"                    # audio and video conversion; yt-dlp uses it to merge streams
brew "gnu-sed"                   # gsed, for scripts written for GNU sed
brew "imagemagick"               # magick, image conversion
brew "litecli"                   # SQLite client
brew "ripgrep"                   # rg, how agents search code
brew "rtk"                       # trims command output for Claude Code (hook)
brew "tree"
brew "uv"                        # run Python tools with uvx
brew "yt-dlp"                    # download videos

# iOS and macOS development
brew "gfontenot/formulae/xcode-cli", trusted: true # xcode command to open and clean projects
brew "libimobiledevice" # logs from a plugged-in iPhone (idevicesyslog)
brew "meta/fb/idb-companion", trusted: true # lets agents drive simulators and devices with idb
brew "swiftformat"               # for repos with a .swiftformat config
brew "xcbeautify"                # readable xcodebuild output
brew "xcodes"                    # install and switch Xcode versions

# Network
brew "dnscontrol"                # DNS records as code
brew "ipinfo-cli"                # IPinfo API from the shell
brew "nmap"                      # port scans
brew "teamookla/speedtest/speedtest", trusted: true # internet speed test
brew "trippy" # trip, traceroute with a live view

# Home
brew "esphome" # firmware for ESP32 devices in Home Assistant
brew "syncthing", restart_service: :changed # file sync; runs as a brew service

# Daily apps
cask "1password"                 # passwords, SSH agent and commit signing
cask "1password-cli"             # op, for secrets in scripts
cask "cassettelab/cassette/cassette" # Subsonic music client
cask "chatgpt"
cask "cleanupbuddy"              # locks keyboard and trackpad while cleaning
cask "discord"
cask "fastmail"                  # mail
cask "ghostty"                   # terminal
cask "obsidian"                  # notes
cask "raycast"                   # launcher
cask "signal"
cask "slack"
cask "spotify"
cask "tailscale-app"             # VPN to my own devices
cask "zen"                       # main browser

# Development
cask "android-studio"            # Android SDK; zshrc points JAVA_HOME at its JDK
cask "codex"                     # OpenAI's coding agent
cask "firefox@developer-edition" # testing in Firefox
cask "gcloud-cli"                # gcloud and bq
cask "orbstack"                  # Docker runtime; provides docker
cask "sf-symbols"                # browse Apple's SF Symbols
cask "ungoogled-chromium"        # testing in Chromium

# Hardware
cask "darrylmorley/whatcable/whatcable", trusted: true # what a USB-C cable supports
cask "keymapp"                   # flash ZSA keyboard layouts
cask "ledger-wallet"             # Ledger hardware wallet

# Media and creative
cask "audacity"                  # audio editing
cask "inkscape"                  # vector editing
cask "jellyfin-media-player"     # Jellyfin client
cask "multiviewer"               # F1 TV

# Fonts
cask "font-iosevka-term-nerd-font" # Ghostty's font (IosevkaTerm NFM)
cask "font-pretendard" # design fonts; no current project uses them
cask "font-roboto"
cask "font-suit"
cask "font-urbanist"

# Global npm packages, installed into mise's active Node
npm "corepack"                   # comes with Node; listed so cleanup leaves it alone
npm "firebase-tools"             # firebase CLI
npm "titanium"                   # ti CLI
