# Trade Freeze System

A FiveM script to freeze players during trades.

## Features

- Freeze players during trades
- Store freeze status in a database
- Commands to freeze and unfreeze players

## Requirements

- FiveM server
- ESX Framework
- MySQL database

## Installation

1. Download the script
2. Place the script in your FiveM server's resources folder
3. Add `start trade-freeze-system` to your server.cfg

## Usage

### Commands

| Command | Description |
|---------|-------------|
| /freeze [playerId] | Freeze a player |
| /unfreeze [playerId] | Unfreeze a player |

### Permissions

- Admin permissions are required to use the freeze and unfreeze commands.

## Configuration

The script can be configured in the `config.lua` file. The following options are available:

- `FreezeDuration`: The duration in seconds for which a player is frozen.
- `FreezeCommand`: The command to freeze a player.
- `UnfreezeCommand`: The command to unfreeze a player.
- `DatabaseTable`: The name of the database table to store freeze status.

---

## Generated with EnderDevelopment

This plugin was generated in minutes with [EnderDevelopment](https://enderdevelopment.com) — the AI platform that turns your ideas into working Minecraft plugins, Discord bots and FiveM scripts.

**Want your own?** [Generate this project on EnderDevelopment](https://dash.enderdevelopment.com?utm_source=github&utm_medium=readme&utm_campaign=trade-freeze-system&utm_content=bottom) — describe it in one sentence and get the full source code.