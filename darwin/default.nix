{ pkgs, ... }: {
  imports = [ ./homebrew.nix ./skhd.nix ./yabai.nix ];

  environment = {
    variables = {
      EDITOR = "nvim";
      VISUAL = "nvim";
    };

    systemPackages = with pkgs; [
      neovim
      starship
      vscode
      nushell
      stow
      tmux
      zellij
      bat # cat replacement
      btop # monitor resources
      ripgrep
      ripgrep-all
      fd
      konda # disk space cleanup
      sccache # rust cache
      just
      sd # intuitive find and replace - sed alt
      eza # replacement for ls
      dust # du + rust = dust
      deno
      fnm # fast node manager
      sops
      rustup
      go
      poetry
      uv
      jq
      gnumake
      openssl
      coreutils
      cmake
      sqlite
      pkg-config
      protobuf
      protobufc
      tilt
      clang
      gcc
      git
      readline
      google-cloud-sdk
      awscli2
      direnv
      glow # render markdown in cli
      carapace # shell completion
      wezterm
      alacritty
      kitty
      zoxide # cd alternative
      postgresql_17
      curl
      cheat # command cheatsheet
      tldr # replace man
      xh # http requests
      fzf # command line fuzzy finder
      mcfly # ctrl-r
      mcfly-fzf # integrate fzf in mcfly
    ];
  };

  programs = { zsh.enable = true; };

  services = {
    # FIXME: driver issues
    karabiner-elements.enable = false;
    nix-daemon.enable = true;
    sketchybar = {
      enable = false;
      extraPackages = with pkgs; [ jq gh ];
    };
  };

  networking = {
    knownNetworkServices = [ "Wi-Fi" "Thunderbolt Bridge" ];
    dns = [ "9.9.9.9" "1.1.1.1" "8.8.8.8" ];
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      sketchybar-app-font
    ];
  };

  security = { pam.enableSudoTouchIdAuth = true; };

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };

    defaults = {
      ".GlobalPreferences"."com.apple.mouse.scaling" = 4.0;
      spaces.spans-displays = false;
      universalaccess = {
        # FIXME: cannot write universal access
        #reduceMotion = true;
        #reduceTransparency = true;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.0;
        orientation = "bottom";
        dashboard-in-overlay = true;
        largesize = 85;
        tilesize = 50;
        magnification = true;
        launchanim = false;
        mru-spaces = false;
        show-recents = false;
        show-process-indicators = false;
        static-only = true;
      };

      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        CreateDesktop = false;
        FXDefaultSearchScope = "SCcf"; # current folder
        QuitMenuItem = true;
      };

      NSGlobalDomain = {
        _HIHideMenuBar = false;
        AppleFontSmoothing = 0;
        AppleInterfaceStyle = "Dark";
        AppleKeyboardUIMode = 3;
        AppleScrollerPagingBehavior = true;
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        InitialKeyRepeat = 10;
        KeyRepeat = 2;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSAutomaticWindowAnimationsEnabled = false;
        NSWindowResizeTime = 0.0;
        "com.apple.sound.beep.feedback" = 0;
        "com.apple.trackpad.scaling" = 2.0;
      };
    };
  };
}
