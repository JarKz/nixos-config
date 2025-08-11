# JarKz's NixOS configuration

The configuration was copied from [my dotfiles](https://github.com/jarkz/dotfiles) with optimizations that can be doable with Nix.

![Showcase](assets/showcase.png)

Using components:

- **WM**: niri
- **Wallpaper**: SWWW
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

My NixOS-configuration assumes that you uses VPN and because of this there is a missing `system/vpn.nix`. If you don't use it, remove the line from import in `system/default.nix`.

#### User

Update the user name at `system/users.nix` to your. Don't forget after updating user list with `nixos-rebuild` set the password to new user (using `passwd {user}`).

#### Rebiuld System

```bash
# nixos-rebuild switch --flake .#desktop
```

### Home Manager

Below steps are provided either as next steps after NixOS configuration or for standalone Home Manager on non-NixOS distro.

#### Machine Specifications

You may have another output size, its name as another port and so on. I've grouped them into `machineSpecs` that is described by TOML files at `specs/*.toml`. And tweak it when you deem it necessary.

#### Desktop and Laptop

There is two home configurations depending on what machine is used: desktop or laptop. This is reflected in the configuration name by template `"{user}@{machine_type}"`.

The main difference between these configurations is using Linux distributive. My desktop have NixOS, but my laptop have Arch Linux that needs additional configurations like wrapping needed packages by `nixGL`. Pick the confugiration carefully.

#### Activate configuration

Firstly install the [home-manager](https://github.com/nix-community/home-manager) by nix-channel. There is a clear guide in link.

Switch current home manager configuration to specific by:

```bash
$ home-manager switch --flake .{your_user}@{machine_type}
```

> [!NOTE]
> Rename specified home configuration to `{your_user}@{machine_type}` from `jarkz@{machine_type}` for convenience.

## Caveats

### Additional tweaks

This configuration was made perfectly for my machine and may not suit your. At this point I list here the potential changes that you can made:

- niri configuration (e.g. languages) — `home/configuration/niri`
- theme configuratoin — `home/configuration/theming`
- waybar configuration - `home/configuration/waybar`

### Possible solves

The caveats may be resolved with using `machineSpecs` or `configurationSpecs`. In other words, it doable with struct that have specific schema by which the configuration will be less messy.

But this solves only small parts of configurations. It won't resolve such cases like deem of full modifying the waybar to your.
