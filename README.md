# JarKz's NixOS configuration

> [!NOTE] The configuration initially was copied from [my dotfiles](https://github.com/jarkz/dotfiles), but most of things were changed. So it's incompatible with it.

![Showcase](assets/showcase.png)

Using components:

- **WM**: niri
- **Wallpaper**: AWWW
- **Lock**: hyprlock
- **Idle manager**: hypridle
- **Bar**: Waybar
- **Application Launcher**: wofi
- **Notification Daemon**: noti
- **Terminal**: WezTerm
- **IDE**: NeoVim or JetBrains products

## Installation

### Fox NixOS

Here I provide the steps after which you will have full configured system.

#### Hardware Confgiuration

It should be provided by `nixos-install` application. Just copy it and replace the existing `hosts/desktop/hardware-configuration.nix` by generated.

I recommend this approach because your machine will differ from mine. And mine `hardware-configuration.nix` will cause of non-running your NixOS.

#### VPN

My NixOS-configuration can assume that you have VPN setup, but doesn't require it. If you want to write a configuration for it, then uncomment import line in `system/default.nix`.

#### User

Update the user name at `system/users.nix` to your. Don't forget after updating user list with `nixos-rebuild` set the password to new user (using `passwd {user}`).

#### Rebiuld System

```bash
# nixos-rebuild switch --flake .#{appropriate-flake}
```

### Home Manager

Below steps are provided either as next steps after NixOS configuration or for standalone Home Manager on non-NixOS distro.

#### Machine Specifications

You may have another output size, its name as another port and so on. I've grouped them into `machineSpecs` that is described by TOML files at `specs/*.toml`. And tweak it when you deem it necessary.

It's important thing for home-manager setups because they differ only by specific configurations. For instance, on non-NixOS system need to use nixGL, because without it applications that are provided by nix manager will not have appropriate graphic libraries and won't run their GUI normally.

If you have some questions of these specs, you can read [a simple documenation for this](./specs/SPECIFICATION.md).

#### Machine types

There are plenty configurations for different machines, depending on provided specification. Each of specifications made only for specific case, therefore you can not to use them, and make your own. Better to have a flake template like `"{user}@{machine_type}"`, because it's very memorizable.

#### Activate configuration

Firstly install the [home-manager](https://github.com/nix-community/home-manager) by nix-channel (as standalone application or as package by flake). There is a clear guide in link.

Switch current home manager configuration to specific by:

```bash
$ home-manager switch --flake .{your_user}@{machine_type}
```

## Caveats

My NixOS configuration may not suit for some of you, and it's normal. The main goal of putting this into GitHub was availability to configure my machines without frictions. And for some people it can be guide of "how to properly configure my system".

It's impossible to make an easy configuration that suits for all people, like... Each of us have different tastes.
