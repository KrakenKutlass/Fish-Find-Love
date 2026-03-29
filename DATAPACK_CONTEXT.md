# Fish Find Love — Datapack Developer Context

## Project Overview

**Name:** Fish Find Love
**Namespace:** `ffl`
**Version:** v1.1
**Minecraft:** 26.1+ (Baby Mobs Update), backwards compatible to 1.21.1
**Pack format:** `min_format: 48, max_format: 200` (new 26.1 schema — NOT `pack_format`)
**Repository:** KrakenKutlass/Fish-Find-Love
**Authors:** KrakenKutlass, TechBrat

Three independent breeding systems: fish (always on by default), dolphins (off by default), squids/glow squids (off by default).

---

## Directory Structure

```
fish_breeding/
├── pack.mcmeta
└── data/
    ├── minecraft/tags/function/
    │   └── load.json                  # hooks ffl:load into minecraft load tag
    └── ffl/
        ├── advancement/
        │   └── player_use_tropical_fish_on_dolphin.json
        ├── item_modifier/
        │   └── decrease_count.json    # decrements item stack count by 1
        ├── predicate/
        │   └── is_adult_dolphin.json
        ├── tags/
        │   ├── entity_type/
        │   │   └── breedable_fish.json  # cod, salmon, pufferfish, tropical_fish
        │   └── function/
        │       ├── load.json
        │       └── tick.json
        └── function/
            ├── load.mcfunction
            ├── tick.mcfunction
            ├── init/
            │   ├── scoreboards.mcfunction
            │   └── config.mcfunction
            ├── config/
            │   ├── show_config.mcfunction
            │   ├── enable_fish_breeding.mcfunction
            │   ├── disable_fish_breeding.mcfunction
            │   ├── toggle_fish_breeding.mcfunction
            │   ├── enable_dolphin_breeding.mcfunction
            │   ├── disable_dolphin_breeding.mcfunction
            │   ├── toggle_dolphin_breeding.mcfunction
            │   ├── enable_squid_breeding.mcfunction
            │   ├── disable_squid_breeding.mcfunction
            │   ├── toggle_squid_breeding.mcfunction
            │   ├── enable_all_breeding.mcfunction
            │   └── disable_all_breeding.mcfunction
            ├── core/                  # fish breeding
            │   ├── init_fish.mcfunction
            │   ├── init_fish_single.mcfunction
            │   ├── process_cooldowns.mcfunction
            │   ├── process_kelp.mcfunction
            │   └── consume_kelp.mcfunction
            ├── breed/                 # fish breeding (per-species)
            │   ├── find_pairs.mcfunction
            │   ├── breed_cod.mcfunction
            │   ├── breed_cod_execute.mcfunction
            │   ├── breed_salmon.mcfunction
            │   ├── breed_salmon_execute.mcfunction
            │   ├── breed_pufferfish.mcfunction
            │   ├── breed_pufferfish_execute.mcfunction
            │   ├── breed_tropical.mcfunction
            │   ├── breed_tropical_execute.mcfunction
            │   ├── apply_cooldowns.mcfunction
            │   └── spawn_offspring.mcfunction
            ├── tropical/              # tropical fish variant inheritance
            │   ├── inherit_variant.mcfunction
            │   ├── inherit_from_parent1.mcfunction
            │   ├── inherit_from_parent2.mcfunction
            │   ├── random_variant.mcfunction
            │   └── summon_with_variant.mcfunction
            ├── dolphin/
            │   ├── init_dolphins.mcfunction
            │   ├── init_dolphin_single.mcfunction
            │   ├── on_tropical_fish_use.mcfunction
            │   ├── enter_love_mode.mcfunction
            │   ├── check_love_pairs.mcfunction
            │   ├── breed_from_love.mcfunction
            │   ├── process_cooldowns.mcfunction
            │   ├── consume_player_tropical_fish.mcfunction
            │   ├── breed_dolphin.mcfunction
            │   ├── breed_dolphin_execute.mcfunction
            │   ├── find_dolphin_pairs.mcfunction
            │   └── consume_tropical_fish.mcfunction
            └── squid/
                ├── init_squids.mcfunction
                ├── init_squid_single.mcfunction
                ├── process_squid_food.mcfunction
                ├── feed_squid_cod.mcfunction
                ├── feed_glow_squid.mcfunction
                ├── consume_squid_food.mcfunction
                ├── enter_love_mode.mcfunction
                ├── check_love_pairs.mcfunction
                ├── breed_from_love.mcfunction
                └── process_cooldowns.mcfunction
```

---

## pack.mcmeta

```json
{
  "pack": {
    "description": "Fish Find Love - Breed fish and dolphins",
    "min_format": 48,
    "max_format": 200
  }
}
```

**IMPORTANT:** Minecraft 26.1 replaced `pack_format`/`supported_formats` with `min_format`/`max_format`. Using the old keys causes "pack may be broken or outdated" warning.

---

## Scoreboard Objectives

All created idempotently in `ffl:init/scoreboards`:

| Objective | Purpose |
|---|---|
| `ffl.breed_cooldown` | Fish breeding cooldown per entity |
| `ffl.mature_cooldown` | Fish maturation cooldown per entity |
| `ffl.config` | All config variables (fake player scores) |
| `ffl.temp` | Temporary calculations |
| `ffl.random` | RNG storage |
| `ffl.dolphin_cd` | Dolphin breeding cooldown per entity |
| `ffl.love_timer` | Dolphin love mode countdown per entity |
| `ffl.squid_cd` | Squid/glow squid breeding cooldown per entity |
| `ffl.squid_timer` | Squid/glow squid love mode countdown per entity |

---

## Config Variables (fake player scores on `ffl.config`)

Set in `ffl:init/config`. Protected by `#config_loaded` flag — only set defaults on first load, never on `/reload`.

| Fake Player | Default | Description |
|---|---|---|
| `#breed_cooldown` | 6000 | Fish breeding cooldown (ticks) |
| `#mature_cooldown` | 36000 | Fish maturation cooldown (ticks) |
| `#tick_frequency` | 20 | Tick schedule interval |
| `#fish_breed` | 1 | Fish breeding enabled (1/0) |
| `#dolphins_breed` | 0 | Dolphin breeding enabled (1/0) |
| `#dolphin_breed_cooldown` | 6000 | Dolphin breeding cooldown (ticks) |
| `#squids_breed` | 0 | Squid breeding enabled (1/0) |
| `#squid_breed_cooldown` | 6000 | Squid breeding cooldown (ticks) |
| `#config_loaded` | 1 | Persistence flag — set to 1 after first init |

---

## Tick System

`ffl:tick` is scheduled via `schedule function ffl:tick 20t replace` and self-reschedules each run.

```mcfunction
# Fish system
execute if score #fish_breed ffl.config matches 1 run function ffl:core/init_fish
execute if score #fish_breed ffl.config matches 1 run function ffl:core/process_cooldowns
execute if score #fish_breed ffl.config matches 1 if entity @e[type=item,limit=1,nbt={Item:{id:"minecraft:kelp"}}] run function ffl:core/process_kelp

# Dolphin system
execute if score #dolphins_breed ffl.config matches 1 run function ffl:dolphin/init_dolphins
execute if score #dolphins_breed ffl.config matches 1 run function ffl:dolphin/process_cooldowns
execute if score #dolphins_breed ffl.config matches 1 if entity @e[type=minecraft:dolphin,tag=ffl.in_love,limit=1] run function ffl:dolphin/check_love_pairs

# Squid system
execute if score #squids_breed ffl.config matches 1 run function ffl:squid/init_squids
execute if score #squids_breed ffl.config matches 1 run function ffl:squid/process_cooldowns
execute if score #squids_breed ffl.config matches 1 if entity @e[tag=ffl.squid_love,limit=1] run function ffl:squid/check_love_pairs
execute if score #squids_breed ffl.config matches 1 if entity @e[type=item,limit=1,nbt={Item:{id:"minecraft:cod"}}] run function ffl:squid/process_squid_food
execute if score #squids_breed ffl.config matches 1 if entity @e[type=item,limit=1,nbt={Item:{id:"minecraft:glow_lichen"}}] run function ffl:squid/process_squid_food
```

Performance pattern: item/entity existence check before calling process functions to avoid unnecessary execution.

---

## Fish Breeding System

**Trigger:** Drop `minecraft:kelp` item entity near fish.
**Detection:** `process_kelp` iterates all kelp item entities without `ffl.kelp_used` tag.

### Flow
1. `core/init_fish` → tags untracked fish with `ffl.tracked`, initialises scores
2. `core/process_kelp` → for each kelp item: run `breed/find_pairs` as the item entity
3. `breed/find_pairs` → run as kelp item, check for 2 eligible fish of same species within 5 blocks → call species breed function
4. Species breed function → tags parent1/parent2, spawns offspring, applies cooldowns
5. `core/consume_kelp` → decrements kelp stack count by 1, kills if count reaches 0

### Tags used
- `ffl.tracked` — entity is registered in the system
- `ffl.kelp_used` — kelp item has triggered breeding this tick
- `ffl.parent1`, `ffl.parent2`, `ffl.breeding` — temporary during breed event

### Eligibility check
```mcfunction
@e[type=minecraft:cod, tag=ffl.tracked, tag=!ffl.breeding, scores={ffl.breed_cooldown=0, ffl.mature_cooldown=0}, limit=2]
```

### Tropical fish variant inheritance
80% chance to inherit from a parent, 20% random. Inheritance uses NBT data copy from parent entity to offspring.

---

## Dolphin Breeding System

**Trigger:** Player right-clicks a dolphin with tropical fish.
**Detection:** `minecraft:player_interacted_with_entity` advancement (works because dolphins ARE interactive entities in vanilla).

### Advancement
```json
{
  "criteria": { "requirement": {
    "trigger": "minecraft:player_interacted_with_entity",
    "conditions": {
      "entity": { "type": "minecraft:dolphin" },
      "item": { "items": ["minecraft:tropical_fish"] }
    }
  }},
  "rewards": { "function": "ffl:dolphin/on_tropical_fish_use" }
}
```

Advancement is **revoked immediately** in `on_tropical_fish_use` so it can re-trigger.

### Flow
1. Player right-clicks dolphin with tropical fish → advancement fires → `on_tropical_fish_use` runs as player
2. Find nearest eligible dolphin within 6 blocks → `enter_love_mode`
3. If dolphin entered love mode → `consume_player_tropical_fish` (skip if creative)
4. Each tick: `process_cooldowns` counts down `ffl.love_timer`; removes `ffl.in_love` when timer hits 0
5. Each tick (if any dolphin in love): `check_love_pairs` → if two `ffl.in_love` dolphins within 3 blocks → `breed_from_love`

### Love mode
- Tag: `ffl.in_love`
- Timer: `ffl.love_timer` set to 1200 ticks (60 seconds)
- Visual: `particle heart` + `playsound minecraft:entity.dolphin.ambient_water`

### Adult check
```mcfunction
execute unless data entity @s {Age:0} run return 0
```
In 26.1 (Baby Mobs Update), all breedable mobs use `Age` NBT. `Age:0` = adult, negative = baby.

### Breed from love
- Tags parent1 + parent2 with `ffl.breeding`
- Spawns baby: `summon minecraft:dolphin ~ ~ ~ {Age:-24000, Tags:["ffl.tracked","ffl.newborn"]}`
- Applies `#dolphin_breed_cooldown` to both parents via scoreboard operation
- Cleans all temporary tags

### Item consumption
```mcfunction
execute if items entity @s weapon.mainhand tropical_fish run item modify entity @s weapon.mainhand ffl:decrease_count
execute unless items entity @s weapon.mainhand tropical_fish if items entity @s weapon.offhand tropical_fish run item modify entity @s weapon.offhand ffl:decrease_count
```
`ffl:decrease_count` is an item modifier that reduces stack count by 1.

---

## Squid & Glow Squid Breeding System

**Trigger:** Drop item entity near squid/glow squid.
- Squids: `minecraft:cod`
- Glow squids: `minecraft:glow_lichen`

**WHY NOT advancement-based:** `player_interacted_with_entity` does NOT fire for squids — they are not interactive entities in vanilla. `using_item` was tried but requires hunger (food items) and fires every tick while held. Drop-based system is reliable and consistent with the fish system.

### Flow
1. `process_squid_food` iterates dropped cod/glow_lichen items without `ffl.squid_food_used`
2. `feed_squid_cod` (run as cod item) → find nearest eligible squid within 5 blocks → `enter_love_mode`; tag item `ffl.squid_food_used`
3. `feed_glow_squid` (run as glow_lichen item) → same for glow squid
4. `consume_squid_food` → decrement item stack, remove `ffl.squid_food_used`
5. Tick: `check_love_pairs` → squids only pair with squids, glow squids only with glow squids
6. `breed_from_love` → branches on entity type to spawn correct baby

### Type separation in check_love_pairs
```mcfunction
execute as @e[type=minecraft:squid,tag=ffl.squid_love,tag=!ffl.breeding] at @s if entity @e[type=minecraft:squid,tag=ffl.squid_love,tag=!ffl.breeding,distance=0.1..3,limit=1] run function ffl:squid/breed_from_love
execute as @e[type=minecraft:glow_squid,tag=ffl.squid_love,tag=!ffl.breeding] at @s if entity @e[type=minecraft:glow_squid,tag=ffl.squid_love,tag=!ffl.breeding,distance=0.1..3,limit=1] run function ffl:squid/breed_from_love
```

### Type branching in breed_from_love
```mcfunction
execute if entity @s[type=minecraft:squid] as @e[type=minecraft:squid,tag=ffl.squid_love,tag=!ffl.breeding,distance=0.1..3,limit=1,sort=nearest] run tag @s add ffl.parent2
execute if entity @s[type=minecraft:glow_squid] as @e[type=minecraft:glow_squid,tag=ffl.squid_love,tag=!ffl.breeding,distance=0.1..3,limit=1,sort=nearest] run tag @s add ffl.parent2

execute if entity @s[type=minecraft:squid] at @s run summon minecraft:squid ~ ~ ~ {Age:-24000,Tags:["ffl.tracked","ffl.newborn"]}
execute if entity @s[type=minecraft:glow_squid] at @s run summon minecraft:glow_squid ~ ~ ~ {Age:-24000,Tags:["ffl.tracked","ffl.newborn"]}
```

### Tags used
- `ffl.tracked` — shared across all systems (entity type selectors prevent collision)
- `ffl.squid_love` — squid/glow squid in love mode
- `ffl.squid_food_used` — item entity used this tick
- `ffl.parent1`, `ffl.parent2`, `ffl.breeding` — temporary during breed event

---

## Config Commands

All 12 commands call `ffl:config/show_config` after executing.

```
ffl:config/show_config
ffl:config/toggle_fish_breeding
ffl:config/enable_fish_breeding
ffl:config/disable_fish_breeding
ffl:config/toggle_dolphin_breeding
ffl:config/enable_dolphin_breeding
ffl:config/disable_dolphin_breeding
ffl:config/toggle_squid_breeding
ffl:config/enable_squid_breeding
ffl:config/disable_squid_breeding
ffl:config/enable_all_breeding
ffl:config/disable_all_breeding
```

Toggle pattern:
```mcfunction
execute store result score #temp ffl.temp run scoreboard players get #fish_breed ffl.config
execute if score #temp ffl.temp matches 0 run scoreboard players set #fish_breed ffl.config 1
execute if score #temp ffl.temp matches 1 run scoreboard players set #fish_breed ffl.config 0
function ffl:config/show_config
```

### show_config
Displays coloured status for all three systems. Uses `click_event` (NOT `clickEvent`) for Minecraft 1.21.5+ syntax:
```mcfunction
execute if score #fish_breed ffl.config matches 1 run tellraw @s [{"text":"Fish Breeding:    ","color":"white"},{"text":"[ENABLED]","color":"green","bold":true,"underlined":true,"click_event":{"action":"run_command","command":"/function ffl:config/toggle_fish_breeding"}}]
```

**IMPORTANT:** Minecraft 1.21.5 changed clickEvent JSON keys:
- OLD: `"clickEvent":{"action":"run_command","value":"..."}` — broken in 1.21.5+
- NEW: `"click_event":{"action":"run_command","command":"..."}` — required in 1.21.5+

---

## Key Technical Patterns

### Config persistence across /reload
```mcfunction
# Only set defaults if never initialised
execute unless score #config_loaded ffl.config matches 1 run scoreboard players set #breed_cooldown ffl.config 6000
# ... other defaults ...
# Mark as initialised (persists in scoreboard data)
scoreboard players set #config_loaded ffl.config 1
```

### Item stack consumption (generic pattern)
```mcfunction
execute store result score #count ffl.temp run data get entity @s Item.count
scoreboard players remove #count ffl.temp 1
execute if score #count ffl.temp matches ..0 run kill @s
execute if score #count ffl.temp matches 1.. store result entity @s Item.count int 1 run scoreboard players get #count ffl.temp
tag @s remove ffl.used_tag
```

### Baby spawning (26.1 Baby Mobs Update)
All breedable mobs now use `Age` NBT:
- `Age:0` = adult (can breed)
- `Age:-24000` = newborn baby (counts up to 0 over time)
- Check: `execute unless data entity @s {Age:0} run return 0`

### Performance guards
Always check entity/item existence before running process functions:
```mcfunction
if entity @e[type=item,limit=1,nbt={Item:{id:"minecraft:kelp"}}]
if entity @e[type=minecraft:dolphin,tag=ffl.in_love,limit=1]
```

### Creative mode item protection
```mcfunction
unless entity @s[gamemode=creative] run function ffl:dolphin/consume_player_tropical_fish
```

---

## Known Limitations / Gotchas

1. **`player_interacted_with_entity` only works for interactive entities.** Squids, fish, and most passive mobs do NOT trigger this advancement on right-click. Only mobs with vanilla interaction handlers (dolphins, villagers, etc.) work.

2. **`using_item` for food items requires hunger.** If the player is at full hunger, right-clicking with food does nothing and the advancement never fires.

3. **`click_event` syntax changed in 1.21.5.** Old `clickEvent`/`value` keys are silently ignored. Must use `click_event`/`command`.

4. **`ffl.tracked` tag is shared across all entity types** but this is safe because all selectors include `type=` filters.

5. **Scoreboard objectives are idempotent** — `scoreboard objectives add` on an existing objective prints a warning but doesn't error, so init can safely re-run on reload.

6. **`schedule function X Nt replace`** — the `replace` flag prevents duplicate scheduled functions stacking if the datapack reloads mid-schedule.
