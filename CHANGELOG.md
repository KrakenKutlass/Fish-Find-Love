# Changelog

## v1.1 - 2026-03-26

### Major Features
- **Dolphin Breeding System**: Added vanilla-style dolphin breeding using right-click interaction with tropical fish
  - Right-click dolphins with tropical fish to enter "love mode" (60 second timer)
  - Two love-mode dolphins within 3 blocks automatically breed
  - Only adult dolphins (Age = 0) can breed; baby dolphins are exempt
  - Baby dolphins use vanilla Age system and grow naturally
  - 5-minute breeding cooldown (configurable)
  - Heart particles and sound effects for feedback
  - Disabled by default - enable via `/function ffl:config/enable_dolphin_breeding`

### Configuration
- **Config Persistence**: Configuration settings now persist across world reloads and server restarts
- **Fish Breeding Toggle**: Added `/function ffl:config/enable_fish_breeding` and `/function ffl:config/disable_fish_breeding` commands
- **Dolphin Breeding Toggle**: Added config commands to enable/disable/toggle dolphin breeding independently
- **Show Config**: View all current settings with `/function ffl:config/show_config`

### Quality of Life
- **Creative Mode Support**: Tropical fish no longer consumed from inventory when breeding dolphins in creative mode
- **Enhanced Load Message**: Added dolphin breeding instructions and credits to startup message
- **Namespace Rename**: Changed namespace from `fshb` to `ffl` (Fish Find Love) for better clarity

### Technical Changes
- **Pack Format Update**: Updated to pack format 101.1 for Minecraft 26.1 (Baby Mobs Update) compatibility
- **Supported Formats**: Maintained backwards compatibility with pack formats 48-101
- **Scoreboard Optimization**: Separated dolphin and fish cooldown tracking for independent control
- **Advancement-Based Interaction**: Used `player_interacted_with_entity` trigger for reliable right-click detection

### Bug Fixes
- Fixed config values resetting to defaults on world reload
- Fixed creative mode item consumption
- Improved adult dolphin detection using NBT Age checking

---

## v1.0 - Initial Release

### Features
- Fish breeding system for Cod, Salmon, Pufferfish, and Tropical Fish
- Kelp-based breeding mechanic
- Proximity detection (5 block range)
- Breeding cooldown (5 minutes, configurable)
- Maturation cooldown (30 minutes, configurable)
- Tropical fish variant inheritance (80% parent, 20% random)
- Visual feedback with heart particles and XP orbs
- Stack-friendly kelp consumption
