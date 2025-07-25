# Dew Decor Link

🌿 **Dew Decor Link** is a minimal, focused [Neorg](https://github.com/nvim-neorg/neorg) extension designed to insert custom icons into Neorg link texts to make your notes visually more distinctive and expressive.

This module is part of the [Neorg Dew](https://github.com/setupyourskills/neorg-dew) ecosystem.

## Features

- Telescope-powered icon picker.

- Smartly positions the icon as a prefix to the link label

- Lightweight and easily customizable.

## Installation

### Prerequisites

- A functional installation of [Neorg](https://github.com/nvim-neorg/neorg) is required for this module to work.
- The core module [Neorg Dew](https://github.com/setupyourskills/neorg-dew) must be installed, as it provides essential base libraries.
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) — this module is used for the picker UI.

### Using Lazy.nvim

```lua
{
  "setupyourskills/dew-decorlink",
  ft = "norg",
  dependencies = {
    "setupyourskills/neorg-dew",
    "nvim-telescope/telescope.nvim",
  },
}
```

## Configuration

Make sure all of them are loaded through Neorg’s module system in your config:

```lua
["external.neorg-dew"] = {},
["external.dew-decorlink"] = {
  config = {
    -- Here the list of all your custom icons
    -- Each entry defines a label → icon pair displayed in the Telescope picker.
    icons = {
      ["0"] = "",
      ["Apple"] = "",
      ["Amazon"] = "",
      ["Arch Linux"] = "",
      ["Audio"] = "",
      ["Cd"] = "",
      ["Credit card"] = "",
      ["Discord"] = "",
      ["Ebook"] = "",
      ["GitHub"] = "",
      ["GitLab"] = "",
      ["Google"] = "",
      ["Http"] = "󰕑",
      ["Https"] = "󰞉",
      ["Hyprland"] = "",
      ["Game"] = "󰺷",
      ["Line"] = "",
      ["Mail"] = "󰪱",
      ["Media"] = "",
      ["Neovim"] = "",
      ["Norg"] = "",
      ["Password"] = "",
      ["PDF"] = "",
      ["Phone"] = "",
      ["Python"] = "",
      ["Reddit"] = "",
      ["Software"] = "󰍽",
      ["Stackoverflow"] = "",
      ["Video"] = "",
      ["Vuejs"] = "",
      ["Whatsapp"] = "",
      ["Wikipedia"] = "",
    },
  },
},
```

## Usage

Run the following Neorg command to insert an icon as a prefix to the link label:

```
:Neorg dew_decorlink
```

## How it works

1. The module checks whether the cursor is on a line containing a Neorg link.

2. A Telescope picker appears with your configured icons.

3. Once an icon is selected, it is automatically inserted before the link label, decorating it.

## Collaboration and Compatibility

This project embraces collaboration and may build on external modules created by other Neorg members, which will be tested regularly to ensure they remain **functional** and **compatible** with the latest versions of Neorg and Neovim.  

## Why **dew**?

Like morning dew, it’s **subtle**, **natural**, and brief, yet vital and effective for any workflow.
