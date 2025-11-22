# The machine specification

To have easy setup of nix configuration I make the machine specification.
It have minimal amount of properties that need to be set and this does not handles
complex cases like adding or removing application.

With these specification I can use the same nix configuration on different machines
with different hardware setups like monitor, keyboard, mouse and so on.

You can use on of my machine specification as a template and modify it for your case.
Below I described each available configuration that need to be set.

---

## Properties

| Property       | Description                                                                                   |
| :------------- | :-------------------------------------------------------------------------------------------- |
| `is-not-nixos` | Set `false` if your current distro is NixOS, otherwise set `true`                             |
| `outputs`      | Table of your defined outputs with specific configuration. See below for further information. |
| `keyboard`     | Table of your keyboard and layout configuration by XKB (most usual in Wayland)                |

### Outputs

The `outputs` table have `main` and `secondary` subproperties.
The `secondary` monitor is usually external monitor if you use laptop and you cannot leave it undefined,
becaues at current moment my nix configuration does not handle such case (will be fixed in future).

They both have the same list of properties:

| Property    | Description                                                                  |
| :---------- | :--------------------------------------------------------------------------- |
| `name`      | The name of current used port for monitor                                    |
| `width`     | The width of current used monitor                                            |
| `height`    | The height of current used monitor                                           |
| `framerate` | The selected framerate for current monitor                                   |
| `scale`     | The selected scale for current monitor                                       |
| `transform` | The selected transforam for current monitor like rotation, mirroring         |
| `offset`    | The selected offset in logical space for correct placing the current monitor |

> [!NOTE]
> These configurations is suitable only for niri. If you want to read more inforamtion, please visit [the wiki](https://github.com/YaLTeR/niri/wiki/Configuration:-Outputs).

### keyboard

| Property   | Description                                                                       |
| :--------- | :-------------------------------------------------------------------------------- |
| `layouts`  | The list of selected layouts separated by comma                                   |
| `variants` | The list of selected variants for corresponding list of layout separated by comma |
| `options`  | The list of selected optoins separated by comma                                   |

> [!NOTE]
> [The wiki](https://github.com/YaLTeR/niri/wiki/Configuration:-Input#keyboard) of niri have best explanation for each property.
