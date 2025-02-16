# dotfiles

This repository provides a streamlined approach to managing and deploying my dotfiles on my machines using Nix, nix-darwin, and GNU Stow. Leveraging these tools allows me to maintain a declarative configuration for my system and user environment, ensuring consistency across setups.

## Prerequuisites - macOS

Install the following:

- [Nix](https://nixos.org/download/): The package manager for reproducible builds.
- [nix-darwin](https://github.com/LnL7/nix-darwin/tree/master): A framework for managing macOS configurations with Nix.

If Nix is not installed, you can install it using the [Determinate Systems Nix installer](https://github.com/DeterminateSystems/nix-installer). This will install the necessary tools with [flakes](https://zero-to-nix.com/concepts/flakes) enabled by default. It will also support seamlessly uninstalling Nix and allows Nix to surive macOS upgrades and more.

## Repository Structure

Dotfiles are organized into a modular structure compatible with GNU Stow. Each application or tool should have its own directory containing the respective configuration files.

```
.
├── stow.rc
└── dotfiles
    ├── nix-darwin
    │   └── flake.nix
    ├── zsh
    │   └── .zshrc
    └── nvim
        ├── lua
        │   ├── plugins
        │   └── keymaps.lua
        └── init.lua
```

- *stow.rc*: Configures the target and ignores for the GNU Stow command.
- *dotfiles/*: Directory containing all application and tool configurations.

