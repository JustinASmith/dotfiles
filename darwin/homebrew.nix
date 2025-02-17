{ ... }: {
  homebrew = {
    enable = true;
    global = { autoUpdate = false; };
    # will not be uninstalled when removed
    masApps = {
    };
    onActivation = {
      # "zap" removes manually installed brews and casks
      cleanup = "zap";
      autoUpdate = false;
      upgrade = false;
    };
    brews = [
      "sniffnet" # monitor network traffic
      "borders" # borders for windows
      "openai-whisper" # transcode audio to text
      "pkgxdev/made/pkgx" # run anything
      "diffutils" # gnupkg diff binary
      "libmagic"
      "ruff" # python linter
      "colomia" # container runtimes - minimal setup
      "mas"
      "tailscale"
      "llvm"
      "filosottile/musl-cross/musl-cross"
      "coreutils"
      "zsh-autosuggestions"
      "sqlitecpp"
      "supabase/tap/supabase"
      "dnsmasq"
      "universal-ctags"
    ];
    casks = [
      # utilities
      "aldente" # battery management
      "macfuse" # file system utilities
      "hiddenbar" # hides menu bar icons
      "meetingbar" # shows upcoming meetings
      "karabiner-elements" # keyboard remap
      "nikitabobko/tap/aerospace" # tiling window manager
      "displaylink" # connect to external dell displays

      # coding
      "intellij-idea"
      "postman"

      # virtualization
      "utm" # virtual machines

      # communication
      "slack"
      "telegram"
      "discord"

      "hammerspoon" # desktop automation
      "display-pilog" # benq monitor
      "logi-options+" # logitec mx master 3s
      "1password" # password manager
      "yt-music" # music
      "proton-mail-bridge"
      "the-unarchiver"
      "tunnelblick" # vpn client
      "eul" # mac monitoring
      "sf-symbols" # patched font for sketchybar
      "time-out" # blurs screen every x mins
      "raycast" # launcher on steroids
      "keycastr" # show keystrokes on screen
      "obsidian" # zettelkasten
      "arc" # mac browser
      "google-chrome" # used for selenium and testing
      "firefox"
      "visual-studio-code" # code editor
      "vlc" # media player
      "linear-linear" # task management
      "spacedrive" # file explorer
      "chatgpt" # open ai desktop client
      # "loop" # window manager
      "homerow" # vimium for mac
      "ghostty" # terminal
      "jan" # local ChatGPT
    ];
    taps = [
      # default
      "homebrew/bundle"
      "homebrew/cask-fonts"
      "homebrew/services"
      # custom
      "FelixKratz/formulae" # borders
      "databricks/tap" # databricks
      "pkgxdev/made" # pkgx
      "nikitabobko/tap" # aerospace
      "filosottile/musl-cross"
      "supabase/tap"
    ];
  };
}
