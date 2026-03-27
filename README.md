# Fish Find Love

A Minecraft Java Edition datapack that adds breeding mechanics for fish, dolphins, squids, and glow squids.

[![Modrinth](https://img.shields.io/badge/Modrinth-Download-1bd96a?logo=modrinth)](https://modrinth.com/datapack/fish-find-love-fish-breeding)
[![CurseForge](https://img.shields.io/badge/CurseForge-Download-f16436?logo=curseforge)](https://www.curseforge.com/minecraft/data-packs/fish-find-love-fish-breeding)
[![Planet Minecraft](https://img.shields.io/badge/Planet%20Minecraft-Download-4caf50)](https://www.planetminecraft.com/data-pack/fish-find-love-fish-breeding-datapack/)

## Why This Datapack?

In vanilla Minecraft, fish and squid cannot be bred like other animals. This datapack fills that gap with a kelp-based breeding system for all four vanilla fish species, vanilla-style love mode breeding for dolphins, and a drop-based breeding system for squids and glow squids.

## Features

### Fish Breeding
- **All vanilla fish species:** Cod, Salmon, Pufferfish, and Tropical Fish
- **Kelp-based breeding:** Drop kelp near two fish of the same species to trigger breeding
- **Proximity detection:** Fish must be within 5 blocks of the dropped kelp
- **Tropical fish variant inheritance:** 80% chance to inherit a parent's appearance, 20% random variant
- **Visual feedback:** Heart particles and XP orbs on successful breeding
- **Stack-friendly:** Only 1 kelp consumed per breeding event
- **Breeding cooldown:** 5 minutes (configurable)
- **Maturation cooldown:** 30 minutes before offspring can breed (configurable)

### Dolphin Breeding (optional, off by default)
- **Vanilla-style love mode:** Right-click dolphins with tropical fish to enter love mode (60 seconds)
- **Auto-breeding:** Two love-mode dolphins within 3 blocks breed automatically
- **Adult-only:** Only adult dolphins can enter love mode; babies are exempt
- **Vanilla growth:** Baby dolphins use the vanilla Age system and grow naturally
- **Creative mode safe:** Tropical fish not consumed in creative mode
- **Breeding cooldown:** 5 minutes (configurable)

### Squid Breeding (optional, off by default) [26.1+]
- **Drop-based feeding:** Drop raw cod near squids, or glow lichen near glow squids
- **Love mode mechanic:** Fed squids enter love mode for 60 seconds with heart particles
- **Auto-breeding:** Two love-mode squids of the same type within 3 blocks breed automatically
- **Type separation:** Squids only breed with squids; glow squids only with glow squids
- **Adult-only:** Only adult squids can be fed; babies are exempt
- **Vanilla growth:** Baby squids use the vanilla Age system and grow naturally
- **Stack-friendly:** Only 1 item consumed per feeding
- **Breeding cooldown:** 5 minutes (configurable)

## Installation

1. Download the `fish_breeding` folder
2. Place it in your world's `datapacks` directory:
   - Single-player: `.minecraft/saves/<world_name>/datapacks/`
   - Server: `<server_directory>/world/datapacks/`
3. Run `/reload` in-game or restart the world

## Usage

### Fish Breeding
1. Find two fish of the same species in water
2. Drop kelp nearby (within 5 blocks)
3. Heart particles confirm successful breeding

### Dolphin Breeding
1. Enable: `/function ffl:config/enable_dolphin_breeding`
2. Right-click each of two adult dolphins with tropical fish
3. Heart particles show love mode (60 second window)
4. When two love-mode dolphins are within 3 blocks they breed automatically

### Squid Breeding
1. Enable: `/function ffl:config/enable_squid_breeding`
2. Drop raw cod near two adult squids, or glow lichen near two adult glow squids
3. Heart particles show love mode (60 second window)
4. When two love-mode squids of the same type are within 3 blocks they breed automatically

## Configuration

### View Settings
| Command | Description |
|---------|-------------|
| `/function ffl:config/show_config` | View all current settings (clickable toggles) |

### Fish Breeding
| Command | Description |
|---------|-------------|
| `/function ffl:config/enable_fish_breeding` | Enable fish breeding |
| `/function ffl:config/disable_fish_breeding` | Disable fish breeding |
| `/function ffl:config/set_breed_cooldown` | Set fish breeding cooldown (default: 6000 ticks / 5 min) |
| `/function ffl:config/set_mature_cooldown` | Set fish maturation cooldown (default: 36000 ticks / 30 min) |
| `/function ffl:config/set_tick_frequency` | Set processing frequency (default: 20 ticks / 1 sec) |

### Dolphin Breeding
| Command | Description |
|---------|-------------|
| `/function ffl:config/enable_dolphin_breeding` | Enable dolphin breeding |
| `/function ffl:config/disable_dolphin_breeding` | Disable dolphin breeding |
| `/function ffl:config/toggle_dolphin_breeding` | Toggle dolphin breeding on/off |

### Squid Breeding
| Command | Description |
|---------|-------------|
| `/function ffl:config/enable_squid_breeding` | Enable squid/glow squid breeding |
| `/function ffl:config/disable_squid_breeding` | Disable squid/glow squid breeding |
| `/function ffl:config/toggle_squid_breeding` | Toggle squid breeding on/off |

### Configuration Persistence
All settings persist across world reloads and server restarts. Use `/function ffl:config/show_config` to verify current values at any time.

## Technical Details

- **Namespace:** `ffl`
- **Pack format:** Minecraft 26.1+ (`min_format: 48`, `max_format: 200`)
- **Processing:** Schedule-based tick system (every 20 ticks by default)

## Credits

Created by **KrakenKutlass** and **TechBrat** with assistance from Claude Code by Anthropic.

## License

Feel free to use, modify, and distribute this datapack.
