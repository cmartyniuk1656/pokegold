# Trainer Change Mapping Plan

This document records the implementation mapping decisions for `docs/trainer_change_requirements.md`. It does not change trainer data.

## Approved Scope

- Implement non-rematch trainer changes only.
- Keep current custom `FalknerGroup` and `BugsyGroup`; do not overwrite or merge them with the source document.
- Implement Jasmine/Chuck/Pryce badge-count variants by selecting the trainer constant from the player's current badge count before battle.
- Defer gym leader, Elite Four, Champion, Red, and regular trainer rematches until later.
- Do not add renamed/new Rocket characters. For Rocket rows, map by area and current party species where possible, then document uncertain rows.
- When image-only source cells hide exact species/order, infer from current party plus the `Changes:` text; if not reliable, patch only the reliable delta later and leave the rest documented.

## Status Key

- `MAP_EXACT`: direct exact `TRAINER_CLASS, CONSTANT` mapping.
- `MAP_RIVAL_VARIANTS`: maps one source rival row to all three starter-dependent constants for that battle number.
- `MAP_EXACT_IGNORE_REMATCHES`: exact base trainer mapping; phone/rematch constants with same name are ignored.
- `MAP_BY_NAME_NO_SECTION_BINDING`: exact party name match, but no map binding found in the expected section. Review before editing.
- `MAP_INFERRED_BY_SECTION_SPECIES`: inferred by matching source section and species mentioned in `Changes:` against current party.
- `MAP_INFERRED_BY_BEST_SPECIES`: best species-overlap inference; review before editing.
- `UNRESOLVED_*`: do not patch until manually reviewed.
- `IGNORE_CUSTOM_GYM`: intentionally ignored by scope.

## Mapping Table

## Implemented Variable Gym Selection

- `JASMINE1`: selected below 6 badges; `JASMINE2`: selected at 6+ badges.
- `CHUCK1`: selected below 5 badges; `CHUCK2`: selected at 5 badges; `CHUCK3`: selected at 6+ badges.
- `PRYCE1`: selected below 5 badges; `PRYCE2`: selected at 5 badges; `PRYCE3`: selected at 6+ badges.

### Rival Battles

- `MAP_RIVAL_VARIANTS` -> `RIVAL1, RIVAL1_2_CHIKORITA, RIVAL1, RIVAL1_2_CYNDAQUIL, RIVAL1, RIVAL1_2_TOTODILE`: **Rival #2 (Chikorita) / 1080**; cells `15 (+1); 16!; 18 (+2)`; change: Zubat is 1 level higher and now in front, Larvitar replaces Gastly, Bayleef, Quilava, or Croconaw respectively are 2 levels higher.
  Movesets: `-Leech Life / -Supersonic / -Gust / -Bite` | `-Bite / -Rock Throw / -Sandstorm / -Screech` | `-Scratch / -Leer / -Rage / -Water Gun`.
  Mapping note: maps/AzaleaTown.asm:73; maps/AzaleaTown.asm:82; maps/AzaleaTown.asm:64

- `MAP_RIVAL_VARIANTS` -> `RIVAL1, RIVAL1_3_CHIKORITA, RIVAL1, RIVAL1_3_CYNDAQUIL, RIVAL1, RIVAL1_3_TOTODILE`: **Rival #3 (Chikorita) / 1440**; cells `22!; 23!; 22!; 24 (+2)`; change: Team rework. Golbat replaces Zubat, Starter Pokemon are 2 levels higher, Larvitar & either Remoraid, Weepinbell, or Houndour are added, lost Haunter & Magnemite.
  Movesets: `-Bite / -Rock Throw / -Screech / -` | `-Ember / -Bite / -Smog / -Roar` | `-Bite / -Confuse Ray / -Leech Life / -Gust` | `-Bite / -Ice Punch / -Water Gun / -Mud-Slap`.
  Mapping note: maps/BurnedTower1F.asm:61; maps/BurnedTower1F.asm:70; maps/BurnedTower1F.asm:52

- `MAP_RIVAL_VARIANTS` -> `RIVAL1, RIVAL1_4_CHIKORITA, RIVAL1, RIVAL1_4_CYNDAQUIL, RIVAL1, RIVAL1_4_TOTODILE`: **Rival #4 (Chikorita) / 2400**; cells `39!; 38!; 39!; 39 (+9); 40 (+8)`; change: Team rework. Golbat is 9 levels higher, Meganium & Feraligatr are 8 levels higher, Pupitar & either Octillery & Houndoom, Victreebel & Octillery, or Houndoom & Victreebel are added, lost  Magnemite, Haunter, & Sneasel, Typhlosion replaces Quilava in Rival (Cyndaquil).
  Movesets: `-Thrash / -Rock Slide / -Screech / -Bite` | `-Flamethrower / -Iron Tail / -Bite / -Double Team` | `-Sludge / -Razor Leaf / -Sleep Powder / -Growth` | `-Toxic / -Double Team / -Confuse Ray / -Wing Attack` | `-Ice Punch / -Surf / -Slash / -Bite`.
  Mapping note: maps/GoldenrodUndergroundSwitchRoomEntrances.asm:149; maps/GoldenrodUndergroundSwitchRoomEntrances.asm:158; maps/GoldenrodUndergroundSwitchRoomEntrances.asm:140

- `MAP_RIVAL_VARIANTS` -> `RIVAL1, RIVAL1_5_CHIKORITA, RIVAL1, RIVAL1_5_CYNDAQUIL, RIVAL1, RIVAL1_5_TOTODILE`: **Rival #5 (Chikorita) / 2880**; cells `45! / MiracleBerry; 46! / Quick Claw; 46!; 45 (+9); 47 (+9) / Miracle Seed; 48!`; change: Team rework. Golbat & Starter Pokemon are 9 levels higher, Ursaring, Tyranitar, & either Octillery & Houndoom,Victreebel & Octillery, or Houndoom & Victreebel are added, lost Sneasel, Magneton, Haunter, & Kadabra, and some Pokemon have held items.
  Movesets: `-Slash / -Faint Attack / -Rock Smash / -Rest` | `-Flamethrower / -Iron Tail / -Crunch / -Double Team` | `-Sludge Bomb / -Giga Drain / -Sleep Powder / -Growth` | `-Toxic / -Double Team / -Confuse Ray / -Wing Attack` | `-Ice Punch / -Surf / -Slash / -Bite` | `-Crunch / -Earthquake / -Rock Slide / -Fire Punch`.
  Mapping note: maps/VictoryRoad.asm:74; maps/VictoryRoad.asm:83; maps/VictoryRoad.asm:65

- `MAP_RIVAL_VARIANTS` -> `RIVAL2, RIVAL2_1_CHIKORITA, RIVAL2, RIVAL2_1_CYNDAQUIL, RIVAL2, RIVAL2_1_TOTODILE`: **Rival #6 (Chikorita) / 6400**; cells `64! / Scope Lens; 64! / Nevermeltice; 64! / Charcoal; 64! / Leftovers; 64 (+19) / Miracle Seed; 64! / Quick Claw`; change: Team rework. Starter Pokemon are 19 levels higher, Ursaring, Crobat, Tyranitar, & either Octillery & Houndoom, Victreebel & Octillery, or Houndoom & Victreebel are added, lost Sneasel, Golbat, Magneton, Haunter, & Kadabra, and all Pokemon have held items.
  Movesets: `-Slash / -Faint Attack / -Rock Smash / -Hyper Beam` | `-Fire Blast / -Iron Tail / -Crunch / -Double Team` | `-Sludge Bomb / -Razor Leaf / -Sleep Powder / -Growth` | `-Toxic / -Double Team / -Confuse Ray / -Wing Attack` | `-Ice Beam / -Surf / -Slash / -Earthquake` | `-Crunch / -Earthquake / -Rock Slide / -Fire Blast`.
  Mapping note: maps/MountMoon.asm:44; maps/MountMoon.asm:53; maps/MountMoon.asm:35

- `MAP_RIVAL_VARIANTS` -> `RIVAL2, RIVAL2_2_CHIKORITA, RIVAL2, RIVAL2_2_CYNDAQUIL, RIVAL2, RIVAL2_2_TOTODILE`: **Rival #7 (Chikorita) / 6800**; cells `68! / Scope Lens; 68! / Nevermeltice; 68! / Charcoal; 68 (+20) / Leftovers; 68 (+18) / Miracle Seed; 68! / Quick Claw`; change: Team rework. Starter Pokemon are 18 levels higher, Crobat is 20 levels higher, Ursaring, Tyranitar, & either Octillery & Houndoom, Victreebel & Octillery, or Houndoom & Victreebel are added, lost Sneasel, Magneton, Haunter, & Kadabra, and all Pokemon have held items.
  Movesets: `-Slash / -Faint Attack / -Rock Smash / -Hyper Beam` | `-Flamethrower / -Iron Tail / -Crunch / -Double Team` | `-Sludge Bomb / -Razor Leaf / -Sleep Powder / -Growth` | `-Toxic / -Double Team / -Confuse Ray / -Fly` | `-Surf / -Ice Punch / -Slash / -Earthquake` | `-Crunch / -Earthquake / -Rock Slide / -Fire Blast`.
  Mapping note: maps/IndigoPlateauPokecenter1F.asm:107; maps/IndigoPlateauPokecenter1F.asm:116; maps/IndigoPlateauPokecenter1F.asm:98

### Route 30

- `MAP_EXACT` -> `YOUNGSTER, MIKEY`: **Youngster Mikey64**; cells `2!; 4!`; change: Hoothoot replaces Pidgey, Sentret replaces Pidgey.
  Mapping note: maps/Route30.asm:122

- `MAP_EXACT` -> `BUG_CATCHER, DON`: **Bug Catcher Don48**; cells `3!; 3!`; change: Ledyba replaces Caterpie, Spinarak replaces Weedle.
  Mapping note: maps/Route30.asm:133

### Route 31

- `MAP_EXACT_IGNORE_REMATCHES` -> `BUG_CATCHER, WADE1`: **Bug Catcher Wade / 80**; cells `4 (+1); 5!`; change: Pineco replaces Caterpie, lost 2 Caterpie.
  Mapping note: maps/Route31.asm:26; maps/Route31.asm:60. Ignored regular rematch constants: BUG_CATCHER, WADE2, BUG_CATCHER, WADE3

### Sprout Tower

- `MAP_EXACT` -> `SAGE, NICO`: **Sage Nico / 96**; cells `3; 4!; 3`; change: Hoppip replaces Bellsprout #2.
  Mapping note: maps/SproutTower2F.asm:12

- `MAP_EXACT` -> `SAGE, CHOW`: **Sage Chow / 96**; cells `3; 3!; 3`; change: Sunkern replaces Bellsprout #2.
  Mapping note: maps/SproutTower1F.asm:27

- `MAP_EXACT` -> `SAGE, TROY`: **Sage Troy / 224**; cells `7!; 7`; change: Hoppip replaces Hoothoot, Bellsprout is now second.
  Mapping note: maps/SproutTower3F.asm:105

- `MAP_EXACT` -> `SAGE, LI`: **Sage Li / 288**; cells `7!; 8!; 9 (+2)`; change: Oddish replaces Bellsprout #1, Sunkern replaces Hoothoot, Bellsprout #2 is now third.
  Mapping note: maps/SproutTower3F.asm:73

### Violet Gym

- `MAP_EXACT` -> `BIRD_KEEPER, ROD`: **Bird Keeper Rod168**; cells `7; 7!`; change: Natu replaces Pidgey #2.
  Mapping note: maps/VioletGym.asm:68

### Route 32

- `MAP_EXACT` -> `YOUNGSTER, ALBERT`: **Youngster Albert112**; cells `7!; 7 (-1)`; change: Sentret replaces Rattata.
  Mapping note: maps/Route32.asm:344

- `MAP_EXACT` -> `FISHER, HENRY`: **Fisher Henry / 280**; cells `7!; 7 (-1)`; change: Marill replaces Poliwag #1.
  Mapping note: maps/Route32.asm:250

- `MAP_EXACT` -> `FISHER, JUSTIN`: **Fisher Justin / 280**; cells `7!`; change: Tentacool replaces Magikarp #1, lost 3 Magikarp.
  Mapping note: maps/Route32.asm:156

- `MAP_EXACT_IGNORE_REMATCHES` -> `FISHER, RALPH1`: **Fisher Ralph320**; cells `8 (-2)`; change: Goldeen is 2 levels lower.
  Mapping note: maps/Route32.asm:167; maps/Route32.asm:201. Ignored regular rematch constants: FISHER, RALPH2, FISHER, RALPH3

- `MAP_EXACT` -> `BIRD_KEEPER, PETER`: **Bird Keeper Peter192**; cells `8; 8!`; change: Spearow is now first, Natu replaces Pidgey, lost 1 Pidgey.
  Mapping note: maps/Route32.asm:366

### Union Cave

- `MAP_EXACT` -> `HIKER, RUSSELL`: **Hiker Russel / 256**; cells `9 (+1); 8!`; change: Geodude is 1 level higher, Cubone replaces Geodude #2, lost 1 Geodude.
  Mapping note: maps/UnionCave1F.asm:29

- `MAP_EXACT` -> `FIREBREATHER, BILL`: **Firebreather Bill528**; cells `11!`; change: Growlithe replaces Koffing, lost 1 Koffing.
  Mapping note: maps/UnionCave1F.asm:51

- `MAP_EXACT` -> `POKEMANIAC, LARRY`: **PokeManiac Larry600**; cells `10!`; change: Larvitar replaces Slowpoke.
  Mapping note: maps/UnionCave1F.asm:18

- `MAP_EXACT` -> `COOLTRAINERF, GWEN`: **Cooltrainer Gwen1200**; cells `26; 24 (+2); 25 (+3); 23 (+1)`; change: Vaporeon is 2 levels higher, Jolteon is 3 levels higher, Flareon is 1 level higher.
  Mapping note: maps/UnionCaveB2F.asm:50

### Slowpoke Well

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTM, GRUNTM_2`: **Rocket Grunt #1 (Slowpoke) / 360**; cells `9; 9!`; change: Zubat replaces Rattata #2.
  Mapping note: Best species overlap in Slowpoke Well: RATTATA, ZUBAT; review before patching. Bindings: maps/SlowpokeWellB1F.asm:75

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTM, GRUNTM_2`: **Rocket Eto / (Slowpoke) / 440**; cells `11!; 11!; 11!`; change: Is now named. Elekid replaces Rattata, Smoochum replaces Zubat #1, Magby replaces Zubat #2.
  Mapping note: Best species overlap in Slowpoke Well: RATTATA, ZUBAT; review before patching. Bindings: maps/SlowpokeWellB1F.asm:75

- `MAP_INFERRED_BY_SECTION_SPECIES` -> `GRUNTM, GRUNTM_1`: **Rocket Grunt #3 (Slowpoke) / 600**; cells `12 (-2); 13!; 15!`; change: Koffing is 2 levels lower, Slowpoke & Houndour are added.
  Mapping note: Inferred from Slowpoke Well; current party has mentioned species KOFFING; bindings: maps/SlowpokeWellB1F.asm:32

### Azalea Gym

- `MAP_EXACT_IGNORE_REMATCHES` -> `TWINS, AMYANDMAY1`: **Twins Amy & May240**; cells `12 (+2); 12 (+2)`; change: Ledyba & Spinarak are 2 levels higher.
  Mapping note: maps/AzaleaGym.asm:71. Ignored regular rematch constants: TWINS, AMYANDMAY2

- `MAP_EXACT` -> `BUG_CATCHER, AL`: **Bug Catcher Al192**; cells `9!; 12!`; change: Metapod replaces Caterpie, Butterfree replaces Weedle.
  Mapping note: maps/AzaleaGym.asm:104

- `MAP_EXACT` -> `BUG_CATCHER, BENNY`: **Bug Catcher Benny192**; cells `9; 12`; change: Lost 1 Weedle.
  Mapping note: maps/AzaleaGym.asm:93

- `MAP_EXACT` -> `BUG_CATCHER, JOSH`: **Bug Catcher Josh192**; cells `12!`; change: Yanma replaces Paras.
  Mapping note: maps/AzaleaGym.asm:115

### Ilex Forest

- `UNRESOLVED_NO_CANDIDATES`: **Bug Catcher Wayne240**; cells `15 (+5); 15!`; change: Paras is now 5 levels higher and in front, Oddish replaces Ledyba.
  Mapping note: No map-bound trainers found for section.

### Route 34

- `MAP_EXACT` -> `YOUNGSTER, SAMUEL`: **Youngster Samuel192**; cells `12!; 10; 12 (+4)`; change: Teddiursa replaces Rattata, Spearow is 4 levels higher, Lost 1 Spearow.
  Mapping note: maps/Route34.asm:285

- `MAP_EXACT` -> `POKEFANM, BRANDON`: **PokeFan Brandon / 1200**; cells `15 (+2) / Berry`; change: Snubbull is 2 levels higher.
  Mapping note: maps/Route34.asm:307

- `MAP_EXACT_IGNORE_REMATCHES` -> `PICNICKER, GINA1`: **Picnicker Gina / 280**; cells `14!; 14 (+2)`; change: Skiploom replaces Hoppip, Bulbasaur is 2 levels higher, Lost 1 Hoppip.
  Mapping note: maps/Route34.asm:171; maps/Route34.asm:205. Ignored regular rematch constants: PICNICKER, GINA2, PICNICKER, GINA3

- `MAP_EXACT` -> `YOUNGSTER, IAN`: **Youngster Ian224**; cells `12 (+2); 14 (+2)`; change: Mankey & Diglett are 2 levels higher.
  Mapping note: maps/Route34.asm:296

- `MAP_EXACT_IGNORE_REMATCHES` -> `CAMPER, TODD1`: **Camper Todd / 300**; cells `15!`; change: Azumarill replaces Psyduck.
  Mapping note: maps/Route34.asm:88; maps/Route34.asm:122. Ignored regular rematch constants: CAMPER, TODD2, CAMPER, TODD3

- `MAP_EXACT` -> `OFFICER, KEITH`: **Officer Keith / 640**; cells `16 (-1)`; change: Growlithe is 1 level lower.
  Source notes: Can only be fought at nighttime.
  Mapping note: maps/Route34.asm:265

### Goldenrod Tunnel

- `MAP_EXACT` -> `POKEMANIAC, DONALD`: **PokeManiac Donald900**; cells `15 (+5); 15 (+5)`; change: Slowpokes are 5 levels higher.
  Mapping note: maps/GoldenrodUnderground.asm:148

- `MAP_EXACT` -> `SUPER_NERD, TERU`: **Super Nerd Teru448**; cells `14 (+3); 14 (+5); 14!`; change: Voltorb is 3 levels higher, Magnemite is 5 levels higher, Porygon replaces Magnemite #2, lost 1 Magnemite.
  Mapping note: maps/GoldenrodUnderground.asm:126

- `MAP_EXACT` -> `POKEMANIAC, ISSAC`: **PokeManiac Issac840**; cells `14 (+2)`; change: Lickitung is 2 levels higher.
  Mapping note: maps/GoldenrodUnderground.asm:137

- `MAP_EXACT` -> `SUPER_NERD, ERIC`: **Super Nerd Eric480**; cells `15 (+4); 15!`; change: Grimer is 5 levels higher, Cubone replaces Grimer #2.
  Mapping note: maps/GoldenrodUnderground.asm:115

### Goldenrod Gym

- `MAP_EXACT` -> `BEAUTY, VICTORIA`: **Beauty Victoria1496**; cells `15!; 17!`; change: Teddiursa replaces Sentret #1, Furret replaces Sentret #2, Lost 1 Sentret.
  Mapping note: maps/GoldenrodGym.asm:129

- `MAP_EXACT` -> `BEAUTY, SAMANTHA`: **Beauty Samantha / 1584**; cells `18 (+2)`; change: Meowth is 2 levels higher, lost 1 Meowth.
  Mapping note: maps/GoldenrodGym.asm:140

- `MAP_EXACT` -> `LASS, BRIDGET`: **Lass Bridget / 384**; cells `16!; 16!`; change: Jigglypuff #1 replaced with Aipom, Jigglypuff #2 replaced with Togepi, lost 1 Jigglypuff.
  Mapping note: maps/GoldenrodGym.asm:118

### Gym Leader Whitney

- `MAP_EXACT` -> `WHITNEY, WHITNEY1`: **Whitney / 2100**; cells `20 (+2); 20!; 21 (+1) / MiracleBerry`; change: Teddiursa is added, Miltank now has a held MiracleBerry.
  Movesets: `-Headbutt / -Charm / -Ice Punch / -Metronome` | `-Headbutt / -Metal Claw / -Lick / -Mud-Slap` | `-Rollout / -Attract / -Stomp / -Milk Drink`.
  Mapping note: maps/GoldenrodGym.asm:31

### Route 35

- `MAP_EXACT` -> `PICNICKER, KIM`: **Picnicker Kim / 360**; cells `18 (+3)`; change: Vulpix is 3 levels higher.
  Mapping note: maps/Route35.asm:147

- `MAP_EXACT` -> `CAMPER, ELLIOT`: **Camper Elliot320**; cells `16 (+3); 16 (+1)`; change: Sandshrew is 3 levels higher, Marill is 1 level higher.
  Mapping note: maps/Route35.asm:125

- `MAP_EXACT` -> `PICNICKER, BROOKE`: **Picnicker Brooke360**; cells `18 (+2)`; change: Pikachu is 2 levels higher.
  Mapping note: maps/Route35.asm:136

- `MAP_EXACT` -> `CAMPER, IVAN`: **Camper Ivan / 320**; cells `16!; 16 (+2)`; change: Eevee replaces Diglett #1, Diglett #2 is 2 levels higher, lost 1 Zubat.
  Mapping note: maps/Route35.asm:114

- `MAP_EXACT` -> `FIREBREATHER, WALT`: **Firebreather Walt720**; cells `15 (+2); 15 (+2)`; change: Magmar’s are 2 levels higher.
  Mapping note: maps/Route35.asm:213

- `MAP_EXACT_IGNORE_REMATCHES` -> `JUGGLER, IRWIN1`: **Juggler Irwin / 640**; cells `16 (+2); 16!; 16 (+2)`; change: Voltorbs are 2 levels higher, Pineco replaces Voltorb #2, lost 1 Voltorb.
  Mapping note: maps/Route35.asm:31; maps/Route35.asm:65. Ignored regular rematch constants: JUGGLER, IRWIN2, JUGGLER, IRWIN3

- `MAP_EXACT` -> `OFFICER, DIRK`: **Officer Dirk / 640**; cells `16 (+2); 16!`; change: Growlithe #1 is 2 levels higher, Houndour replaces Growlithe #2.
  Source notes: Can only be fought at nighttime.
  Mapping note: maps/Route35.asm:235

- `MAP_EXACT_IGNORE_REMATCHES` -> `BUG_CATCHER, ARNIE1`: **Bug Catcher Arnie / 288**; cells `18!; 18 (+3)`; change: Venonat is 3 levels higher and not in front, & Yanma is added.
  Mapping note: maps/Route35.asm:158; maps/Route35.asm:192. Ignored regular rematch constants: BUG_CATCHER, ARNIE2, BUG_CATCHER, ARNIE3

- `MAP_EXACT` -> `BIRD_KEEPER, BRYAN`: **Bird Keeper Bryan432**; cells `16 (+4); 18!; 18 (+4)`; change: Pidgey & Pidgeotto are 4 levels higher, Spearow is added.
  Mapping note: maps/Route35.asm:20

### National Park

- `MAP_EXACT_IGNORE_REMATCHES` -> `POKEFANF, BEVERLY1`: **PokeFan Beverly1600**; cells `20 (+6) / Berry`; change: Snubbull is 6 levels higher.
  Mapping note: maps/NationalPark.asm:167; maps/NationalPark.asm:201. Ignored regular rematch constants: POKEFANF, BEVERLY2, POKEFANF, BEVERLY3

- `MAP_EXACT_IGNORE_REMATCHES` -> `SCHOOLBOY, JACK1`: **Schoolboy Jack / 544**; cells `16!; 17 (+2)`; change: Sunflora replaces Oddish, Voltorb is 2 levels higher.
  Mapping note: maps/NationalPark.asm:73; maps/NationalPark.asm:107. Ignored regular rematch constants: SCHOOLBOY, JACK2, SCHOOLBOY, JACK3

- `MAP_EXACT` -> `LASS, KRISE`: **Lass Krise / 384**; cells `17!; 16 (+1)`; change: Skiploom replaces Oddish, Cubone is 1 level higher.
  Mapping note: maps/NationalPark.asm:250

- `MAP_EXACT` -> `POKEFANM, WILLIAM`: **PokeFan William1200**; cells `15 (+1) / Berry`; change: Raichu is 1 level higher.
  Mapping note: maps/NationalPark.asm:156

### Route 36

- `MAP_EXACT` -> `PSYCHIC_T, MARK`: **Psychic Mark / 512**; cells `15 (+2); 15 (+2); 16 (+1)`; change: Abra’s are 2 levels higher, Kadabra is 1 level higher.
  Mapping note: maps/Route36.asm:199

- `MAP_EXACT_IGNORE_REMATCHES` -> `SCHOOLBOY, ALAN1`: **Schoolboy Alan / 640**; cells `20 (+4); 20!`; change: Tangela is 4 levels higher, Growlithe is added.
  Mapping note: maps/Route36.asm:116; maps/Route36.asm:150. Ignored regular rematch constants: SCHOOLBOY, ALAN2, SCHOOLBOY, ALAN3

### Route 37

- `MAP_EXACT_IGNORE_REMATCHES` -> `TWINS, ANNANDANNE1`: **Twins Ann & Anne360**; cells `18 (+2); 18!`; change: Clefairy is 2 levels higher and in front, Furret replaces Jigglypuff.
  Mapping note: maps/Route37.asm:27. Ignored regular rematch constants: TWINS, ANNANDANNE2

- `MAP_EXACT` -> `PSYCHIC_T, GREG`: **Psychic Greg / 704**; cells `22!`; change: Stantler replaces Drowzee.
  Mapping note: maps/Route37.asm:49

### Ecruteak City

- `UNRESOLVED_SECTION_CANDIDATES`: **Kimono Girl Naoko1512 / Kimono Girl Sayo1512 / Kimono Girl Zuki1512 / Kimono Girl Kuni1512 / Kimono Girl Miki1512**; cells `21 (+4)`; change: Eeveelutions are 4 levels higher.
  Mapping note: No confident species/name match. Section has candidates: KIMONO_GIRL, NAOKO, KIMONO_GIRL, SAYO, KIMONO_GIRL, ZUKI, KIMONO_GIRL, KUNI, KIMONO_GIRL, MIKI

- `UNRESOLVED_SECTION_CANDIDATES`: **Sage Gaku / 1280**; cells `40 (+8); 40!; 40 (+8)`; change: Noctowl & Flareon are 8 levels higher, Victreebel is added.
  Mapping note: No confident species/name match. Section has candidates: KIMONO_GIRL, NAOKO, KIMONO_GIRL, SAYO, KIMONO_GIRL, ZUKI, KIMONO_GIRL, KUNI, KIMONO_GIRL, MIKI

- `UNRESOLVED_SECTION_CANDIDATES`: **Sage Masa / 1280**; cells `40 (+8); 40!; 40 (+8)`; change: Noctowl & Jolteon are 8 levels higher, Victreebel is added.
  Mapping note: No confident species/name match. Section has candidates: KIMONO_GIRL, NAOKO, KIMONO_GIRL, SAYO, KIMONO_GIRL, ZUKI, KIMONO_GIRL, KUNI, KIMONO_GIRL, MIKI

- `UNRESOLVED_SECTION_CANDIDATES`: **Sage Koji / 1280**; cells `40 (+8); 40!; 40 (+8)`; change: Noctowl & Vaporeon are 8 levels higher, Victreebel is added.
  Mapping note: No confident species/name match. Section has candidates: KIMONO_GIRL, NAOKO, KIMONO_GIRL, SAYO, KIMONO_GIRL, ZUKI, KIMONO_GIRL, KUNI, KIMONO_GIRL, MIKI

### Ecruteak Gym

- `MAP_EXACT` -> `SAGE, PING`: **Sage Ping / 704**; cells `22!`; change: Misdreavus replaced Gastly, lost 4 Gastly… That’s a lot of gas to let out man.
  Mapping note: maps/EcruteakGym.asm:82

- `MAP_EXACT` -> `SAGE, JEFFREY`: **Sage Jeffrey / 672**; cells `21!; 21 (+1); 21!`; change: Haunter is 1 level higher, 2 Gastly’s are added.
  Mapping note: maps/EcruteakGym.asm:71

- `MAP_EXACT` -> `MEDIUM, MARTHA`: **Medium Martha800**; cells `20; 20!`; change: Houndour replaces Gastly, Haunter is now in front, lost 1 Gastly.
  Mapping note: maps/EcruteakGym.asm:93

### Gym Leader Morty

- `MAP_EXACT` -> `MORTY, MORTY1`: **Morty / 2500**; cells `24 (+3); 23!; 24!; 25 / MiracleBerry`; change: Haunter is now first and 3 levels higher, Stantler replaces Gastly, Misdreavus replaces Haunter #2, Gengar now has a held MiracleBerry.
  Movesets: `-Hypnosis / -Nightmare / -Curse / -Night Shade` | `-Swift / -Hypnosis / -Nightmare / -Leer` | `-Shadow Ball / -Pain Split / -Perish Song / -Psywave` | `-Hypnosis / -Shadow Ball / -Mean Look / -Dream Eater`.
  Mapping note: maps/EcruteakGym.asm:23

### Route 38

- `MAP_EXACT` -> `SAILOR, HARRY`: **Sailor Harry / 920**; cells `23!`; change: Quagsire replaces Wooper.
  Mapping note: maps/Route38.asm:26

- `MAP_EXACT_IGNORE_REMATCHES` -> `LASS, DANA1`: **Lass Dana / 480**; cells `19 (+1); 20 (+2)`; change: Flaaffy is 1 level higher, Psyduck is 2 levels higher.
  Mapping note: maps/Route38.asm:37; maps/Route38.asm:71. Ignored regular rematch constants: LASS, DANA2, LASS, DANA3

- `MAP_EXACT` -> `BEAUTY, VALERIE`: **Beauty Valerie1848**; cells `22 (+5); 21!`; change: Skiploom is now 5 levels higher and in front, Miltank replaces Hoppip.
  Mapping note: maps/Route38.asm:203

- `MAP_EXACT` -> `BIRD_KEEPER, TOBY`: **Bird Keeper Toby528**; cells `22 (+6); 22 (+5)`; change: Doduo’s are now 5 levels higher, lost 1 Doduo.
  Mapping note: maps/Route38.asm:15

- `MAP_EXACT_IGNORE_REMATCHES` -> `SCHOOLBOY, CHAD1`: **Schoolboy Chad / 704**; cells `22 (+3); 22!`; change: Mr. Mime is now 3 levels higher, Magnemite is added.
  Mapping note: maps/Route38.asm:120; maps/Route38.asm:154. Ignored regular rematch constants: SCHOOLBOY, CHAD2, SCHOOLBOY, CHAD3

- `UNRESOLVED_SECTION_CANDIDATES`: **Beauty Olivia / 1848**; cells `21 (+2)`; change: Corsola is now 2 levels higher.
  Mapping note: No confident species/name match. Section has candidates: BIRD_KEEPER, TOBY, SAILOR, HARRY, LASS, DANA1, LASS, DANA2, LASS, DANA3, SCHOOLBOY, CHAD1, SCHOOLBOY, CHAD2, SCHOOLBOY, CHAD3, BEAUTY, VALERIE

### Route 39

- `MAP_EXACT` -> `PSYCHIC_T, NORMAN`: **Psychic Norman736**; cells `22 (+5); 23 (+3)`; change: Slowpoke #1 is 5 levels higher, Slowpoke #2 is 3 levels higher.
  Mapping note: maps/Route39.asm:131

- `MAP_EXACT_IGNORE_REMATCHES` -> `POKEFANM, DEREK1`: **PokeFan Derek1760**; cells `22 (+5) / Berry; 22! / Berry`; change: Pikachu is 5 levels higher, & Ponyta is added.
  Mapping note: maps/Route39.asm:26; maps/Route39.asm:60. Ignored regular rematch constants: POKEFANM, DEREK2, POKEFANM, DEREK3

- `MAP_EXACT` -> `POKEFANF, RUTH`: **PokeFan Ruth / 1840**; cells `23 (+6) / Berry`; change: Pikachu is 6 levels higher.
  Mapping note: maps/Route39.asm:109

- `MAP_EXACT` -> `SAILOR, EUGENE`: **Sailor Eugene / 880**; cells `20 (+3); 22!`; change: Poliwhirl is 3 levels higher, Tauros replaces Raticate, lost 1 Krabby.
  Mapping note: maps/Route39.asm:120

- `UNRESOLVED_SECTION_CANDIDATES`: **PokeFan Jaime1600**; cells `20! / Berry`; change: Umbreon replaces Meowth.
  Source notes: Can only be fought at nighttime.
  Mapping note: No confident species/name match. Section has candidates: POKEFANM, DEREK1, POKEFANM, DEREK2, POKEFANM, DEREK3, POKEFANF, RUTH, SAILOR, EUGENE, PSYCHIC_T, NORMAN

### Olivine Lighthouse

- `MAP_EXACT` -> `GENTLEMAN, ALFRED`: **Gentlemen Alfred1584**; cells `22 (+2)`; change: Noctowl is 2 levels higher.
  Mapping note: maps/OlivineLighthouse2F.asm:11

- `MAP_EXACT_IGNORE_REMATCHES` -> `SAILOR, HUEY1`: **Sailor Huey / 880**; cells `20 (+2); 22!`; change: Poliwhirl is now in front, Machop replaces Poliwag.
  Mapping note: maps/OlivineLighthouse2F.asm:22; maps/OlivineLighthouse2F.asm:56. Ignored regular rematch constants: SAILOR, HUEY2, SAILOR, HUEY3

- `MAP_EXACT` -> `BIRD_KEEPER, THEO`: **Bird Keeper Theo552**; cells `23!`; change: Murkrow replaces Pidgey, lost 4 Pidgey.
  Mapping note: maps/OlivineLighthouse3F.asm:13

- `MAP_EXACT` -> `GENTLEMAN, PRESTON`: **Gentlemen Preston1584**; cells `22 (+4); 22!`; change: Growlithe #1 is 4 levels higher, Vulpix replaces Growlithe #2.
  Mapping note: maps/OlivineLighthouse3F.asm:24

- `MAP_EXACT` -> `LASS, CONNIE1`: **Lass Connie / 528**; cells `21!; 22!`; change: Ponyta replaces Marill, Weepinbell is added.
  Mapping note: maps/OlivineLighthouse4F.asm:11

- `MAP_EXACT` -> `SAILOR, KENT`: **Sailor Kent / 920**; cells `23!; 23!`; change: Shellder replaces Krabby #1, Chinchou replaces Krabby #2.
  Mapping note: maps/OlivineLighthouse4F.asm:22

- `MAP_EXACT` -> `BIRD_KEEPER, DENIS`: **Bird Keeper Denis576**; cells `24!; 24 (+4)`; change: Pidgeotto replaces Spearow #1, Fearow 4 levels higher, lost 1 Spearow.
  Mapping note: maps/OlivineLighthouse5F.asm:14

- `MAP_EXACT` -> `SAILOR, TERRELL`: **Sailor Terrell / 960**; cells `24 (+4)`; change: Poliwhirl is now 4 levels higher.
  Mapping note: maps/OlivineLighthouse3F.asm:35

- `MAP_EXACT` -> `SAILOR, ERNEST`: **Sailor Ernest / 960**; cells `22 (+4); 24 (+6); 24!`; change: Machop #1 is 4 levels higher, Quagsire replaces Machop #2 and in back, Poliwhirl is 6 levels higher.
  Mapping note: maps/OlivineLighthouse5F.asm:25

### Gym Leader Jasmine

- `MAP_EXACT` -> `JASMINE, JASMINE1`: **Jasmine / (Badge #5-6) / 3600**; cells `35!; 35!; 35!; 36! / Focus Band; 36 (+1) / Quick Claw`; change: Jasmine now has varying levels & movepools depending on what Gym Badge the player is fighting her for. Magneton replaces Magnemite #1, Skarmory, Corsola, & Scizor are added, with a held Focus Band on Scizor, & Steelix is 1 & 4 levels higher respectively with a held Quick Claw.
  Movesets: `-Spikes / -Drill Peck / -Swagger / -Steel Wing` | `-Thunderbolt / -Tri Attack / -Rain Dance / -Thunder` | `-Rain Dance / -Surf / -Recover / -AncientPower` | `-Twineedle / -Metal Claw / -Agility / -Swords Dance` | `-Crunch / -Earthquake / -Rock Slide / -Iron Tail`.
  Mapping note: maps/OlivineGym.asm:19

### Route 40

- `MAP_EXACT` -> `SWIMMERM, SIMON`: **Swimmer / Simon200**; cells `25 (+5); 25 (+5)`; change: Tentacool’s are 5 levels higher.
  Mapping note: maps/Route40.asm:51

- `MAP_EXACT` -> `SWIMMERF, ELAINE`: **Swimmer Elaine500**; cells `25!`; change: Starmie replaces Staryu.
  Mapping note: maps/Route40.asm:29

- `MAP_EXACT` -> `SWIMMERF, PAULA`: **Swimmer Paula520**; cells `25 (+6); 26 (+7)`; change: Staryu is 6 levels higher, Shellder is now 7 levels higher.
  Mapping note: maps/Route40.asm:40

- `MAP_EXACT` -> `SWIMMERM, RANDALL`: **Swimmer Randall200**; cells `25 (+7); 25 (+5)`; change: Shellder is 7 levels higher, Wartortle is 5 levels higher, lost 1 Shellder.
  Mapping note: maps/Route40.asm:62

### Route 41

- `MAP_EXACT` -> `SWIMMERM, GEORGE`: **Swimmer George208**; cells `26 (+9); 26 (+7); 26 (+7)`; change: Tentacool is 9 levels higher, Staryu & Remoraid are 7 levels higher, lost 3 Tentacool.
  Mapping note: maps/Route41.asm:85

- `MAP_EXACT` -> `SWIMMERM, CHARLIE`: **Swimmer Charlie208**; cells `26!; 26 (+7)`; change: Cloyster replaces Shellder, Tentacruel is 7 levels higher, lost 1 Tentacool.
  Mapping note: maps/Route41.asm:74

- `MAP_EXACT` -> `SWIMMERF, KAYLEE`: **Swimmer Kaylee480**; cells `24 (+4); 24!; 24!`; change: Seaking is now in front and 4 levels higher, Lanturn replaces Goldeen #1, Quagsire replaces Goldeen #2.
  Mapping note: maps/Route41.asm:19

- `MAP_EXACT` -> `SWIMMERF, SUSIE`: **Swimmer Susie520**; cells `27 (+7); 26!`; change: Psyduck is 7 levels higher, Seaking replaces Goldeen.
  Source notes: Surprise Surf on Seaking.
  Mapping note: maps/Route41.asm:30

- `MAP_EXACT` -> `SWIMMERF, KARA`: **Swimmer Kara520**; cells `25!; 26 (+6)`; change: Horsea replaces Staryu, Starmie is 6 levels higher.
  Mapping note: maps/Route41.asm:52

- `MAP_EXACT` -> `SWIMMERM, KIRK`: **Swimmer Kirk / 192**; cells `24 (+4); 24 (+4)`; change: Gyarados’s are 4 levels higher.
  Mapping note: maps/Route41.asm:107

- `MAP_EXACT` -> `SWIMMERF, DENISE`: **Swimmer Denise540**; cells `27!`; change: Lapras replaces Seel.
  Mapping note: maps/Route41.asm:41

- `MAP_EXACT` -> `SWIMMERM, BERKE`: **Swimmer Berke216**; cells `27 (+4)`; change: Qwilfish is 4 levels higher.
  Mapping note: maps/Route41.asm:96

- `MAP_EXACT` -> `SWIMMERM, MATHEW`: **Swimmer Mathew208**; cells `26 (+3); 26!`; change: Krabby is 3 levels higher, Qwilfish added.
  Mapping note: maps/Route41.asm:118

- `MAP_EXACT` -> `SWIMMERF, WENDY`: **Swimmer Wendy540**; cells `26 (+5); 27!`; change: Horsea #1 is 5 levels higher, Seadra replaces Horsea #2.
  Mapping note: maps/Route41.asm:63

### Eusine

- `UNRESOLVED_NO_CANDIDATES`: **Mysticalman Eusine2700**; cells `27!; 27!; 27!`; change: Politoed replaces Haunter and is now in front, Flaaffy replaces Electrode, Hypno replaces Drowzee.
  Movesets: `-Ice Beam / -Bubblebeam / -Rain Dance / -Hypnosis` | `-ThunderPunch / -Thunder Wave / -Thundershock / -Body Slam` | `-Dream Eater / -Hypnosis / -Disable / -Confusion`.
  Mapping note: No map-bound trainers found for section.

### Cianwood Gym

- `MAP_EXACT` -> `BLACKBELT_T, YOSHI`: **Blackbelt Yoshi696**; cells `29 (+2)`; change: Hitmonlee is 2 levels higher.
  Mapping note: maps/CianwoodGym.asm:88

- `MAP_EXACT` -> `BLACKBELT_T, LAO`: **Blackbelt Lao / 696**; cells `29 (+2)`; change: Hitmonchan is 2 levels higher.
  Mapping note: maps/CianwoodGym.asm:99

- `MAP_EXACT` -> `BLACKBELT_T, NOB`: **Blackbelt Nob / 648**; cells `27 (+2); 27 (+2)`; change: Machop & Machoke are 2 levels higher.
  Mapping note: maps/CianwoodGym.asm:110

- `MAP_EXACT` -> `BLACKBELT_T, LUNG`: **Blackbelt Lung648**; cells `27 (+4); 27!; 27 (+2)`; change: Mankey #1 is 4 levels higher, Machoke replaces Mankey #2, Primeape is 2 levels higher.
  Mapping note: maps/CianwoodGym.asm:121

### Gym Leader Chuck

- `MAP_EXACT` -> `CHUCK, CHUCK1`: **Chuck / (Badge #5) / 3100**; cells `30!; 30!; 29 (+2); 31 (+1) / Black Belt`; change: Chuck now has multiple teams depending on what Gym Badge the player is fighting him for. Hitmontop & Sudowoodo are added, Pinsir as well Badge #6 onward. Primeape is 2, 7, and 10 levels higher respectively. Poliwrath is 1, 6, and 8 levels higher respectively and has a held Black Belt.
  Movesets: `-Triple Kick / -Rolling Kick / -Dig / -Pursuit` | `-Rock Slide / -Thunderpunch / -Low Kick / -Faint Attack` | `-Submission / -Twineedle / -Strength / -Swords Dance` | `-DynamicPunch / -Karate Chop / -Rock Slide / -Rage` | `-Ice Punch / -Mind Reader / -Surf / -DynamicPunch`.
  Mapping note: maps/CianwoodGym.asm:41

### Route 42

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Fisher Tully / 960**; cells `24 (+6)`; change: Qwilfish is 6 levels higher.
  Mapping note: FISHER, CHRIS1 (QWILFISH), FISHER, CHRIS2 (QWILFISH), FISHER, CHRIS3 (QWILFISH)

- `MAP_EXACT` -> `HIKER, BENJAMIN`: **Hiker Benjamin / 768**; cells `24!; 24 (+8)`; change: Graveler replaces Geodude, Dugtrio is 8 levels higher, lost 1 Diglett.
  Mapping note: maps/Route42.asm:111

### Mt. Mortar

- `UNRESOLVED_SECTION_CANDIDATES`: **PokeManiac Miller1200**; cells `20 (+3); 20 (+3)`; change: Pokemon are 3 levels higher.
  Mapping note: No confident species/name match. Section has candidates: BLACKBELT_T, KIYO

- `MAP_EXACT` -> `BLACKBELT_T, KIYO`: **Black Belt Kiyo576**; cells `24 (-10); 24 (-10)`; change: Hitmonlee & Hitmonchan are 10 levels lower. Accessible before obtaining Waterfall & the 8th Gym Badge now.
  Source notes: Will give the player a Tyrogue after being defeated.
  Mapping note: maps/MountMortarB1F.asm:23

### Route 43

- `MAP_EXACT` -> `CAMPER, SPENCER`: **Camper Spencer500**; cells `25 (+8); 25!`; change: Sandslash is 8 levels higher, Golbat replaces Zubat, lost 1 Sandshrew.
  Mapping note: maps/Route43.asm:28

- `MAP_EXACT_IGNORE_REMATCHES` -> `PICNICKER, TIFFANY1`: **Picnicker Tiffany / 580**; cells `29!`; change: Clefable replaces Clefairy.
  Mapping note: maps/Route43.asm:196. Ignored regular rematch constants: PICNICKER, TIFFANY2, PICNICKER, TIFFANY3

- `MAP_EXACT_IGNORE_REMATCHES` -> `POKEMANIAC, BRENT1`: **PokeManiac Brent / 1560**; cells `26 (+7); 26!`; change: Lickitung is 7 levels higher, Ivysaur is added.
  Mapping note: maps/Route43.asm:50; maps/Route43.asm:84. Ignored regular rematch constants: POKEMANIAC, BRENT2, POKEMANIAC, BRENT3

- `MAP_EXACT` -> `POKEMANIAC, RON`: **PokeManiac Ron1560**; cells `26 (+7); 26!`; change: Nidoking is 7 levels higher, Charmeleon is added.
  Mapping note: maps/Route43.asm:133

- `MAP_EXACT` -> `POKEMANIAC, BEN`: **PokeManiac Ben1560**; cells `26 (+7); 26!`; change: Slowbro is 7 levels higher, Wartortle is added.
  Mapping note: maps/Route43.asm:39

- `MAP_EXACT` -> `FISHER, MARVIN`: **Fisher Marvin / 1000**; cells `25 (+15); 25 (+10)`; change: Gyarados #1 is 15 levels higher, Gyarados #2 is 10 levels higher, lost 2 Magikarp.
  Mapping note: maps/Route43.asm:144

### Lake of Rage

- `MAP_EXACT` -> `COOLTRAINERM, AARON`: **Cooltrainer Aaron1296**; cells `27 (+3); 27 (+3); 27 (+3)`; change: Ivysaur, Charmeleon, & Wartortle are 3 levels higher.
  Mapping note: maps/LakeOfRage.asm:169

- `MAP_EXACT` -> `COOLTRAINERF, LOIS`: **Cooltrainer Lois1296**; cells `28 (+3); 27 (+2)`; change: Skiploom is 3 levels higher, Ninetales is 2 levels higher.
  Mapping note: maps/LakeOfRage.asm:180

- `MAP_EXACT` -> `FISHER, RAYMOND`: **Fisher Raymond / 1120**; cells `28!`; change: Vaporeon replaces Magikarp #1, lost 3 Magikarp.
  Mapping note: maps/LakeOfRage.asm:158

### Team Rocket Hideout

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTM, GRUNTM_20`: **Rocket Guard #1 1040**; cells `26 (+9); 26!`; change: Drowzee is 9 levels higher, Gligar replaces Zubat.
  Mapping note: Best species overlap in Team Rocket Hideout: DROWZEE, ZUBAT; review before patching. Bindings: maps/TeamRocketBaseB1F.asm:239

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTM, GRUNTM_21`: **Rocket Guard #21080**; cells `27!; 27!; 27!`; change: Golbat replaces Zubat, Ariados replaces Grimer, Raticate replaces Rattata.
  Mapping note: Best species overlap in Team Rocket Hideout: GRIMER, RATTATA, ZUBAT; review before patching. Bindings: maps/TeamRocketBaseB1F.asm:252

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #1 (HQ B1F) / 1120**; cells `28!`; change: Kangaskhan replaces Rattata #1, lost 4 Rattata.
  Mapping note: GRUNTM, GRUNTM_16 (RATTATA), GRUNTM, GRUNTM_18 (RATTATA), GRUNTM, GRUNTM_21 (RATTATA)

- `MAP_EXACT` -> `SCIENTIST, JED`: **Scientist Jed / 2800**; cells `28 (+8); 28!`; change: Magnemite is 8 levels higher, Porygon replaces Magnemite #2, lost 1 Magnemite.
  Mapping note: maps/TeamRocketBaseB1F.asm:482

- `MAP_INFERRED_BY_SECTION_SPECIES` -> `GRUNTM, GRUNTM_19`: **Rocket Grunt #1 (HQ B2F) / 1240**; cells `31!`; change: Venomoth replaces Venonat #1, lost 1 Venonat.
  Mapping note: Inferred from Team Rocket Hideout; current party has mentioned species VENONAT; bindings: maps/TeamRocketBaseB2F.asm:211

- `MAP_INFERRED_BY_SECTION_SPECIES` -> `GRUNTM, GRUNTM_17`: **Rocket Grunt #2 (HQ B2F) / 1160**; cells `29 (+11)`; change: Golbat is 11 levels higher.
  Mapping note: Inferred from Team Rocket Hideout; current party has mentioned species GOLBAT; bindings: maps/TeamRocketBaseB2F.asm:189

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTM, GRUNTM_21`: **Rocket Grunt #3 (HQ B2F) / 1040**; cells `26!; 26!; 27!`; change: Raticate replaces Rattata #1, Golbat replaces Zubat, Grimer replaces Rattata #2.
  Mapping note: Best species overlap in Team Rocket Hideout: GRIMER, RATTATA, ZUBAT; review before patching. Bindings: maps/TeamRocketBaseB1F.asm:252

### Rocket Executive Ariana #1

- `MAP_INFERRED_BY_BEST_SPECIES` -> `EXECUTIVEF, EXECUTIVEF_2`: **Exec. Ariana (Rocket HQ) / 2232**; cells `31 (+8); 30!; 30!; 31 (+6)`; change: Is now named. Arbok is 8 levels higher, Meowth is added, Murkrow is 6 levels higher, Vileplume replaces Gloom.
  Movesets: `-Wrap / -Leer / -Sludge Bomb / -Bite` | `-Slash / -Faint Attack / -Pay Day / -Mud-Slap` | `-Giga Drain / -Sweet Scent / -Sleep Powder / -Sludge Bomb` | `-Fly / -Pursuit / -Toxic / -Faint Attack`.
  Mapping note: Best species overlap in Rocket Executive Ariana #1: ARBOK, GLOOM, MURKROW; review before patching. Bindings: maps/TeamRocketBaseB2F.asm:98

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #1 (HQ B3F) / 1120**; cells `28!; 28!`; change: Arbok replaces Ekans, Sneasel replaces Gloom.
  Mapping note: EXECUTIVEF, EXECUTIVEF_2 (ARBOK/GLOOM), GRUNTF, GRUNTF_5 (EKANS/GLOOM)

- `MAP_EXACT` -> `SCIENTIST, ROSS`: **Scientist Ross / 2800**; cells `28 (+6); 28!`; change: Koffing #1 is 6 levels higher, Raichu replaces Koffing #2
  Mapping note: maps/TeamRocketBaseB3F.asm:152

- `MAP_EXACT` -> `SCIENTIST, MITCH`: **Scientist Mitch / 2800**; cells `28!`; change: Electrode replaces Ditto.
  Mapping note: maps/TeamRocketBaseB3F.asm:163

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Eto / (Rocket HQ) / 1120**; cells `28!; 28!; 28!; 28!`; change: Is now named. Jynx replaces Raticate, Electabuzz, Magmar, & Poliwhirl are added.
  Mapping note: EXECUTIVEM, EXECUTIVEM_4 (RATICATE), GRUNTM, GRUNTM_28 (RATICATE)

### Rocket Executive Archer #1

- `MAP_INFERRED_BY_SECTION_SPECIES` -> `GRUNTM, GRUNTM_18`: **Exec. Archer (Rocket HQ) / 3000**; cells `30!; 30!; 29!; 30!`; change: Is now named. Complete team rework. Weezing, Slowbro, Tauros & Houndoom are added, lost 1 Zubat, Koffing, & Raticate.
  Movesets: `-Sludge / -Smokescreen / -Tackle / -Toxic` | `-Headbutt / -Curse / -Confusion / -Surf` | `-Rage / -Frustration / -Horn Attack / -Pursuit` | `-Flame Wheel / -Bite / -Smog / -Roar`.
  Mapping note: Inferred from Rocket Executive Archer #1; current party has mentioned species ZUBAT; bindings: maps/TeamRocketBaseB2F.asm:200

### Mahogany Gym

- `MAP_EXACT` -> `BOARDER, RONALD`: **Boarder Ronald2160**; cells `29 (+4); 30!`; change: Dewgong is 4 levels higher and in front, Delibird replaces Seel #1, lost 1 Seel.
  Mapping note: maps/MahoganyGym.asm:94

- `MAP_EXACT` -> `SKIER, CLARISSA`: **Skier Clarissa / 2232**; cells `31 (+3)`; change: Dewgong is 3 levels higher.
  Mapping note: maps/MahoganyGym.asm:83

- `MAP_EXACT` -> `BOARDER, BRAD`: **Boarder Brad / 2160**; cells `30 (+4); 30!`; change: Swinub #1 is 4 levels higher, Sneasel replaces Swinub #2.
  Mapping note: maps/MahoganyGym.asm:105

- `MAP_EXACT` -> `BOARDER, DOUGLAS`: **Boarder Douglas2160**; cells `28 (+4); 28!; 30 (+5)`; change: Shellder #1 is 4 levels higher, Seel replaces Shellder #2, Cloyser is 5 levels higher.
  Mapping note: maps/MahoganyGym.asm:116

- `MAP_EXACT` -> `SKIER, ROXANNE`: **Skier Roxanne / 2160**; cells `30 (+2)`; change: Jynx is now 2 levels higher.
  Mapping note: maps/MahoganyGym.asm:72

### Gym Leader Pryce

- `MAP_EXACT` -> `PRYCE, PRYCE1`: **Pryce / (Badge #5) / 3300**; cells `31 (+2); 32!; 31!; 33 (+2) / Gold Berry`; change: Pryce now has multiple teams depending on what Gym Badge the player is fighting him for. / Sneasel & Jynx are added, Cloyster as well Badge #6 onward. Dewgong is 2, 5, and 8 levels higher respectively. Piloswine is 2, 4, and 7 levels higher respectively, and has a held Gold Berry.
  Movesets: `-Surf / -Spikes / -Aurora Beam / -Rain Dance` | `-Faint Attack / -Metal Claw / -Reflect / -Blizzard` | `-Surf / -Aurora Beam / -Snore / -Rest` | `-Ice Punch / -Psychic / -Shadow Ball / -Lovely Kiss` | `-Headbutt / -Earthquake / -Rock Smash / -Blizzard`.
  Mapping note: maps/MahoganyGym.asm:24

### Radio Tower

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #1 (Radio 1F) / 1320**; cells `33 (+9); 33 (+9); 33!`; change: Raticate’s are 9 levels higher, Raticate #3 is added.
  Mapping note: GRUNTM, GRUNTM_3 (RATICATE), GRUNTM, GRUNTM_9 (RATICATE)

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #1 (Radio 2F) / 1400**; cells `35 (+9); 35!`; change: Arbok is 9 levels higher, Gloom is added.
  Mapping note: EXECUTIVEF, EXECUTIVEF_1 (ARBOK), GRUNTF, GRUNTF_2 (ARBOK), GRUNTF, GRUNTF_4 (GLOOM)

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTM, GRUNTM_7`: **Rocket Grunt #2 (Radio 2F) / 1360**; cells `34!; 34!; 34!`; change: Aipom replaces Rattata #1, Aipom replaces Rattata #2, Koffing replaces Rattata #3, lost 2 Rattata.
  Mapping note: Best species overlap in Radio Tower: KOFFING, RATTATA; review before patching. Bindings: maps/RadioTower3F.asm:84

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #3 (Radio 2F) / 1360**; cells `34!; 34!`; change: Gligar replaces Zubat #1, Hypno replaces Zubat #2
  Mapping note: GRUNTM, GRUNTM_10 (ZUBAT), GRUNTM, GRUNTM_6 (ZUBAT), GRUNTM, GRUNTM_7 (ZUBAT)

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTM, GRUNTM_4`: **Rocket Grunt #4 (Radio 2F) / 1320**; cells `33!; 33 (+8)`; change: Weezing replaces Grimer #1, Muk is 8 levels higher, lost 1 Grimer.
  Mapping note: Best species overlap in Radio Tower: GRIMER, MUK; review before patching. Bindings: maps/RadioTower2F.asm:54

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #1 (Radio 3F) / 1360**; cells `34!; 34!`; change: Muk replaces Weezing, Venomoth is added.
  Mapping note: EXECUTIVEM, EXECUTIVEM_3 (WEEZING), GRUNTM, GRUNTM_4 (MUK), GRUNTM, GRUNTM_8 (WEEZING)

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTM, GRUNTM_7`: **Rocket Grunt #2 (Radio 3F) / 1360**; cells `34!; 34!; 34!`; change: Aipom replaces Koffing, Murkrow replaces Zubat, Forretress replaces Rattata, lost 1 Grimer.
  Mapping note: Best species overlap in Radio Tower: GRIMER, KOFFING, RATTATA, ZUBAT; review before patching. Bindings: maps/RadioTower3F.asm:84

- `MAP_EXACT` -> `SCIENTIST, MARC`: **Scientist Marc / 3700**; cells `37!`; change: Omastar replaces Magnemite #1, lost 2 Magnemites.
  Mapping note: maps/RadioTower3F.asm:117

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #3 (Radio 3F) / (Key Card) / 1400**; cells `35!; 35!`; change: Tauros replaces Koffing #1, Slowbro replaces Koffing #2.
  Mapping note: EXECUTIVEM, EXECUTIVEM_1 (KOFFING), EXECUTIVEM, EXECUTIVEM_3 (KOFFING), GRUNTM, GRUNTM_7 (KOFFING), GRUNTM, GRUNTM_9 (KOFFING)

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTM, GRUNTM_10`: **Rocket Grunt #1 (Radio 4F) / 1400**; cells `35!; 35!; 35!`; change: Exeggutor replaces Zubat, Electrode replaces Golbat, Electabuzz replaces Grimer.
  Mapping note: Best species overlap in Radio Tower: GOLBAT, GRIMER, ZUBAT; review before patching. Bindings: maps/RadioTower4F.asm:57

- `MAP_EXACT` -> `SCIENTIST, RICH`: **Scientist Rich / 4000**; cells `40 (+10)`; change: Porygon is 10 levels higher.
  Mapping note: maps/RadioTower4F.asm:90

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTF, GRUNTF_4`: **Rocket Grunt #2 (Radio 2F) (Key Card) / 1440**; cells `36!; 35 (+11); 36!; 36!`; change: Arbok replaces Ekans #1, Gloom is 11 levels higher and second, Ariados replaces Oddish, Vileplume replaces Ekans #2.
  Mapping note: Best species overlap in Radio Tower: EKANS, GLOOM, ODDISH; review before patching. Bindings: maps/RadioTower4F.asm:79

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Executive / (Key Card) / 2736**; cells `38!; 38!; 38!; 39!`; change: Forretress replaces Golbat, Cloyster, Pupitar, & Magcargo are added.
  Mapping note: EXECUTIVEM, EXECUTIVEM_2 (GOLBAT), GRUNTM, GRUNTM_10 (GOLBAT)

### Rocket Executive (Imposter)

- `MAP_INFERRED_BY_BEST_SPECIES` -> `EXECUTIVEM, EXECUTIVEM_3`: **Rocket Executive (Radio Tower) / 2736**; cells `36; 36 (+4); 37; 37; 38`; change: Complete team rework. Weezing is 4 levels higher and in 2nd, Muk, Nidoqueen, Nidoking, & Rhydon added, lost 5 Koffing’s.
  Movesets: `-Minimize / -Sludge Bomb / -Pound / -Acid Armor` | `-Tackle / -Sludge Bomb / -Selfdestruct / -Haze` | `-Body Slam / -Sludge Bomb / -Double Kick / -ThunderPunch` | `-Thrash / -Sludge Bomb / -Double Kick / -Ice Punch` | `-Rock Slide / -Earthquake / -Surf / -`.
  Mapping note: Best species overlap in Rocket Executive (Imposter): KOFFING, WEEZING; review before patching. Bindings: maps/RadioTower5F.asm:39

### Rocket Executive Ariana #2

- `MAP_INFERRED_BY_SECTION_SPECIES` -> `EXECUTIVEF, EXECUTIVEF_1`: **Exec. Ariana (Radio Tower) / 2880**; cells `39 (+7); 40!; 39 (+4); 40!; 40 (+8)`; change: Is now named. Arbok is 9 levels higher, Vileplume is 11 levels higher, Murkrow is 12 levels higher, Persian & Gyarados are added.
  Movesets: `-Sludge Bomb / -Screech / -Bite / -Glare` | `-Slash / -Bite / -Screech / -Charm` | `-Giga Drain / -Sleep Powder / -Sludge Bomb` | `-Surf / -Strength / -Twister / -Gust` | `-Fly / -Pursuit / -Toxic / -Night Shade`.
  Mapping note: Inferred from Rocket Executive Ariana #2; current party has mentioned species ARBOK, MURKROW, VILEPLUME; bindings: maps/RadioTower5F.asm:68

### Rocket Executive Archer #2

- `MAP_INFERRED_BY_BEST_SPECIES` -> `EXECUTIVEM, EXECUTIVEM_1`: **Exec. Archer (Radio Tower) / 4000**; cells `39 (+7); 38; 39; 38!; 40!`; change: Complete team rework. Kangaskhan, Nidoqueen, Persian, Steelix, & Nidoking are added, lost 1 Houndour, Koffing, & Houndoom.
  Movesets: `-Sludge Bomb / -Selfdestruct / -Smog / -Smokescreen` | `-Frustration / -Headbutt / -Rock Smash / -Pursuit` | `-Surf / -Bite / -Strength / -Gust` | `-Flamethrower / -Bite / -Smog / -Roar` | `-Surf / -Confusion / -Curse / -Amnesia`.
  Mapping note: Best species overlap in Rocket Executive Archer #2: HOUNDOOM, HOUNDOUR, KOFFING; review before patching. Bindings: maps/RadioTower5F.asm:88

### Goldenrod Tunnel

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #1 (Tunnel) / 1480**; cells `36!; 37!`; change: Golbat replaces Rattata, Weezing added.
  Mapping note: GRUNTM, GRUNTM_11 (RATTATA), GRUNTM, GRUNTM_13 (RATTATA), RIVAL1, RIVAL1_4_CHIKORITA (GOLBAT), RIVAL1, RIVAL1_4_CYNDAQUIL (GOLBAT), RIVAL1, RIVAL1_4_TOTODILE (GOLBAT)

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #2 (Tunnel) / 1480**; cells `36!; 37 (+13)`; change: Golbat is added and in front, Muk is 13 levels higher.
  Mapping note: GRUNTM, GRUNTM_11 (MUK), GRUNTM, GRUNTM_25 (MUK), RIVAL1, RIVAL1_4_CHIKORITA (GOLBAT), RIVAL1, RIVAL1_4_CYNDAQUIL (GOLBAT), RIVAL1, RIVAL1_4_TOTODILE (GOLBAT)

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #3 (Tunnel) / 1480**; cells `36!; 37!`; change: Golbat replaces Koffing, Arbok replaces Muk.
  Mapping note: GRUNTM, GRUNTM_11 (KOFFING/MUK), GRUNTM, GRUNTM_25 (KOFFING/MUK), BURGLAR, DUNCAN (KOFFING), BURGLAR, EDDIE (KOFFING), RIVAL1, RIVAL1_4_CHIKORITA (GOLBAT), RIVAL1, RIVAL1_4_CYNDAQUIL (GOLBAT), RIVAL1, RIVAL1_4_TOTODILE (GOLBAT)

- `MAP_EXACT` -> `BURGLAR, EDDIE`: **Burglar Eddie / 3080**; cells `35!; 35!`; change: Arcanine replaces Growlithe and in front, Weezing replaces Koffing.
  Mapping note: maps/GoldenrodUndergroundSwitchRoomEntrances.asm:206

- `MAP_EXACT` -> `BURGLAR, DUNCAN`: **Burglar Duncan3080**; cells `35!; 35 (+10)`; change: Delibird replaces Koffing #1, Magmar is 10 levels higher, lost 1 Koffing.
  Mapping note: maps/GoldenrodUndergroundSwitchRoomEntrances.asm:195

- `MAP_INFERRED_BY_SECTION_SPECIES` -> `GRUNTF, GRUNTF_3`: **Rocket Grunt #4 (Tunnel) / 1440**; cells `35!; 35!; 35!; 36!`; change: Vileplume replaces Gloom #1, Pinsir replaces Gloom #2, Arbok & Murkrow are added.
  Mapping note: Inferred from Goldenrod Tunnel; current party has mentioned species GLOOM; bindings: maps/GoldenrodUndergroundSwitchRoomEntrances.asm:228

### Goldenrod Warehouse

- `MAP_INFERRED_BY_BEST_SPECIES` -> `GRUNTM, GRUNTM_14`: **Rocket Grunt #1 (Warehou.) / 1400**; cells `35!; 35!; 37!`; change: Weezing replaces Raticate, Hypno replaces Golbat, Gligar is added.
  Mapping note: Best species overlap in Goldenrod Warehouse: GOLBAT, RATICATE; review before patching. Bindings: maps/GoldenrodUndergroundWarehouse.asm:47

- `MAP_INFERRED_BY_SECTION_SPECIES` -> `GRUNTM, GRUNTM_15`: **Rocket Eto / (Warehouse) / 1440**; cells `36!; 36!; 36!; 36!; 36!`; change: Is now named. Poliwrath replaces Grimer, Jynx replaces Weezing,, Electabuzz, Magmar, & Rhydon are added.
  Mapping note: Inferred from Goldenrod Warehouse; current party has mentioned species GRIMER, WEEZING; bindings: maps/GoldenrodUndergroundWarehouse.asm:58

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Rocket Grunt #2 (Warehou.) / 1480**; cells `37!`; change: Weezing replaces Koffing #1, lost 1 Koffing.
  Mapping note: GRUNTM, GRUNTM_15 (WEEZING), GRUNTM, GRUNTM_24 (KOFFING)

### Route 44

- `MAP_EXACT` -> `PSYCHIC_T, PHIL`: **Psychic Phil / 1152**; cells `36!; 36 (+10); 36!`; change: Xatu replaces Natu, Kadabra is 10 levels higher, Girafarig is added.
  Mapping note: maps/Route44.asm:102

- `MAP_EXACT` -> `FISHER, EDGAR`: **Fisher Edgar / 1440**; cells `38!; 36!; 36!`; change: Octillery replaces Remoraid #1, Gyarados replaces Remoraid #2, Seaking is added.
  Mapping note: maps/Route44.asm:168

- `MAP_EXACT` -> `COOLTRAINERF, CYBIL`: **Cooltrainer Cybil1824**; cells `40 (+15); 37 (+12); 38!`; change: Butterfree is 15 levels higher, Bellossom is 12 levels higher, Quagsire added.
  Mapping note: maps/Route44.asm:179

- `MAP_EXACT` -> `COOLTRAINERM, ALLEN`: **Cooltrainer Allen1776**; cells `35 (+8); 37!`; change: Charmeleon is 8 levels higher, Electabuzz is added.
  Mapping note: maps/Route44.asm:201

- `MAP_EXACT` -> `POKEMANIAC, ZACH`: **PokeManiac Zach2280**; cells `40!; 37!; 38!`; change: Rhydon replaces Rhyhorn, Pupitar & Heracross are added.
  Mapping note: maps/Route44.asm:190

- `MAP_EXACT_IGNORE_REMATCHES` -> `FISHER, WILTON1`: **Fisher Wilton / 1440**; cells `38!; 36!; 36 (+11)`; change: Qwilfish replaces Goldeen #1, Octillery replaces Goldeen #2, Seaking is 11 levels higher.
  Mapping note: maps/Route44.asm:113; maps/Route44.asm:147. Ignored regular rematch constants: FISHER, WILTON2, FISHER, WILTON3

- `MAP_EXACT_IGNORE_REMATCHES` -> `BIRD_KEEPER, VANCE1`: **Bird Keeper Vance / 888**; cells `36!; 36!; 36!; 37!`; change: Pidgeot replaces Pidgeotto #1, Xatu replaces Pidgeotto #2, Murkrow & Skarmory are added.
  Mapping note: maps/Route44.asm:19; maps/Route44.asm:53. Ignored regular rematch constants: BIRD_KEEPER, VANCE2, BIRD_KEEPER, VANCE3

### Blackthorn Gym

- `MAP_EXACT` -> `COOLTRAINERM, PAUL`: **Cooltrainer Paul1920**; cells `34; 40!; 40!; 40!`; change: Dragonair’s #1 & #2 replace Dratini’s #2 & #3, Dragonair #3 is added.
  Mapping note: maps/BlackthornGym1F.asm:94

- `MAP_EXACT` -> `COOLTRAINERF, FRAN`: **Cooltrainer Fran1968**; cells `41 (+4); 41!; 41!`; change: Seadra is 4 levels higher, Gyarados & Dragonair are added.
  Mapping note: maps/BlackthornGym2F.asm:71

- `MAP_EXACT` -> `COOLTRAINERM, CODY`: **Cooltrainer Cody2016**; cells `42 (+6); 41!; 42!; 43!`; change: Seadra is 6 levels higher and in front, Dragonair #1 replaces Horsea,  Dragonair #2 and… Golduck is added'
  Mapping note: maps/BlackthornGym2F.asm:60

- `MAP_EXACT` -> `COOLTRAINERM, MIKE`: **Cooltrainer Mike2016**; cells `42!; 43 (+6); 42!`; change: Dragonair is 6 levels higher, Gyarados & Vaporeon are added, with Gyarados in front.
  Mapping note: maps/BlackthornGym1F.asm:105

- `MAP_EXACT` -> `COOLTRAINERF, LOLA`: **Cooltrainer Lola2016**; cells `41!; 42!; 41!; 42 (+6)`; change: Dragonair #1 is 6 levels higher and in back, Dragonair #2 replaces Dratini, Mantine & Lanturn are added.
  Mapping note: maps/BlackthornGym1F.asm:116

### Gym Leader Clair

- `MAP_EXACT` -> `CLAIR, CLAIR1`: **Clair / 4500**; cells `42 (+5); 43! / Focus Band; 43! / Mint Berry; 44 (+7) / Gold Berry; 45 (+5) / Leftovers`; change: Dragonair #1 is 5 levels higher, Dragonair #2 is 7 levels higher and has a held Gold Berry, Gyarados & Lapras are added and have a held Focus Band & Mint Berry respectively, & Kingdra is 5 levels higher and has a held Leftovers.
  Movesets: `-Thunder Wave / -Thunderbolt / -Flamethrower / -Dragonbreath` | `-Bite / -Waterfall / -Fly / -Twister` | `-Surf / -Ice Beam / -Body Slam / -Rest` | `-Thunder Wave / -Thunderbolt / -Ice Beam / -Dragonbreath` | `-Smokescreen / -Surf / -Hyper Beam / -Dragonbreath`.
  Mapping note: maps/BlackthornGym1F.asm:40

### Dragon’s Den

- `UNRESOLVED_NO_CANDIDATES`: **Cooltrainer Darin2016**; cells `42 (+5); 42!; 42!; 42!`; change: Dragonair #1 is 5 levels higher, 3 Dragonair’s are added.
  Mapping note: No map-bound trainers found for section.

- `UNRESOLVED_NO_CANDIDATES`: **Cooltrainer Cara2016**; cells `40 (+5); 41!; 42!`; change: Seadra #1 is 5 levels higher and in front,  Seadra #2 replaces Horsea #1, Gyarados replaces Horsea #2.
  Mapping note: No map-bound trainers found for section.

- `UNRESOLVED_NO_CANDIDATES`: **Twins Lea & Pia840**; cells `41!; 42!; 42!; 41!`; change: Dragonair #1 & #2 replace Dratini #1 & #2, & 2 Gyarados’s are added.
  Mapping note: No map-bound trainers found for section.

### Route 45

- `MAP_EXACT` -> `HIKER, ERIK`: **Hiker Erik / 1184**; cells `37!; 38!; 37!`; change: Machoke replaces Machop #1, Golem replaces Graveler, Kangaskhan replaces Machop #2.
  Mapping note: maps/Route45.asm:104

- `MAP_EXACT` -> `COOLTRAINERM, RYAN`: **Cooltrainer Ryan1776**; cells `37 (+12); 37!; 37!`; change: Pidgeot is 12 levels higher, Magmar replaces Electabuzz.
  Mapping note: maps/Route45.asm:192

- `MAP_EXACT` -> `COOLTRAINERF, KELLY`: **Cooltrainer Kelly1824**; cells `37!; 37!; 38!; 37!`; change: Togetic replaces Marill, Ampharos replaces Wartortle #1, Blastoise replaces Wartortle #2. Tangela is added.
  Mapping note: maps/Route45.asm:203

- `MAP_EXACT_IGNORE_REMATCHES` -> `HIKER, PARRY1`: **Hiker Parry / 1216**; cells `38!; 38!; 38!`; change: Piloswine is added and in front, Steelix replaces Onix, Dugtrio is added.
  Mapping note: maps/Route45.asm:167. Ignored regular rematch constants: HIKER, PARRY2, HIKER, PARRY3

- `MAP_EXACT_IGNORE_REMATCHES` -> `BLACKBELT_T, KENJI1`: **Black Belt Kenji / 864**; cells `33!; 36!; 33!; 38!`; change: Machamp replaces Machoke and in back, Onix, Hitmonlee, & Steelix are added.
  Mapping note: maps/Route45.asm:62. Ignored regular rematch constants: BLACKBELT_T, KENJI2, BLACKBELT_T, KENJI3

- `MAP_EXACT` -> `HIKER, TIMOTHY`: **Hiker Timothy / 1216**; cells `38 (+11); 38!; 39!; 38!`; change: Dugtrio is 11 levels higher and in front, Gligar replaces Diglett, Graveler & Dugtrio is added.
  Mapping note: maps/Route45.asm:181

- `MAP_EXACT` -> `HIKER, MICHAEL`: **Hiker Michael / 1216**; cells `38!; 38!; 38 (+13)`; change: Rhyhorn replaces Geodude, Donphan replaces Graveler, Golem is 13 levels higher.
  Mapping note: maps/Route45.asm:115

- `UNRESOLVED_SECTION_CANDIDATES`: **Camper Quentin760**; cells `38 (+8); 38 (+8); 38 (+8); 38!`; change: Fearow, Primeape, & Tauros are 8 levels higher., & Raichu is added.
  Mapping note: No confident species/name match. Section has candidates: BLACKBELT_T, KENJI3, BLACKBELT_T, KENJI1, BLACKBELT_T, KENJI2, HIKER, ERIK, HIKER, MICHAEL, HIKER, PARRY3, HIKER, PARRY1, HIKER, PARRY2, HIKER, TIMOTHY, COOLTRAINERM, RYAN, COOLTRAINERF, KELLY

### Route 46

- `MAP_EXACT` -> `CAMPER, TED`: **Camper Ted / 800**; cells `40!; 40!; 40!`; change: Primeape replaces Mankey and is second, Ursaring & Nidoking are added.
  Source notes: All 3 trainers in Route 46 can actually be reached just after beating the 3rd Gym, as all that is required is the Rock Smash TM. Yes, you can technically reach these trainers before the 4th Gym. Good luck.
  Mapping note: maps/Route46.asm:15

- `MAP_EXACT_IGNORE_REMATCHES` -> `PICNICKER, ERIN1`: **Picnicker Erin / 800**; cells `40!; 38!; 38!; 40!`; change: Rapidash replaces Ponyta #1, Rapidash replaces Ponyta #2, Nidoqueen & Raichu are added.
  Mapping note: maps/Route46.asm:26; maps/Route46.asm:60. Ignored regular rematch constants: PICNICKER, ERIN2, PICNICKER, ERIN3

- `MAP_EXACT` -> `HIKER, BAILEY`: **Hiker Bailey / 1280**; cells `40!; 40!; 40!; 40!; 40!`; change: Golems #1, #2, #3, #4, & #5, replace Geodude’s #1, #2, #3, #4, #5.
  Mapping note: maps/Route46.asm:109

### Route 27

- `MAP_EXACT` -> `COOLTRAINERF, MEGAN`: **Cooltrainer Megan2112**; cells `44!; 44!; 44 (+12); 44!`; change: Tangela replaces Bulbasaur, Bellossom replaces Ivysaur, Venusaur is 12 levels higher, & Victreebel is added.
  Mapping note: maps/Route27.asm:249

- `MAP_EXACT` -> `COOLTRAINERM, BLAKE`: **Cooltrainer Blake2112**; cells `43 (+10); 44 (+13); 43!; 44!`; change: Magneton is 10 levels higher, Quagsire is 13 levels higher,  Exeggutor replaces Exeggcute, Piloswine is added.
  Mapping note: maps/Route27.asm:144

- `MAP_EXACT` -> `COOLTRAINERM, BRIAN`: **Cooltrainer Brian2064**; cells `45 (+10); 45!; 44!; 43!`; change: Sandslash is 10 levels higher, Sneasel, Scizor, & Ursaring are added.
  Mapping note: maps/Route27.asm:155

- `MAP_EXACT_IGNORE_REMATCHES` -> `BIRD_KEEPER, JOSE1`: **Bird Keeper Jose / 1056**; cells `44!; 43!; 44 (+10); 44!`; change: Farfetch’d is 10 levels higher, & Fearow, Pidgeot, & Skarmory are added, with Fearow in front.
  Mapping note: maps/Route27.asm:102. Ignored regular rematch constants: BIRD_KEEPER, JOSE2, BIRD_KEEPER, JOSE3

- `MAP_EXACT` -> `PSYCHIC_T, GILBERT`: **Psychic Gilbert1408**; cells `42!; 44!; 44 (+10)`; change: Xatu #1 replaces Starmie, Exeggutor replaces Exeggcute, Girafarig is 10 levels higher.
  Mapping note: maps/Route27.asm:50

- `MAP_EXACT_IGNORE_REMATCHES` -> `COOLTRAINERF, REENA1`: **Cooltrainer Reena / 2160**; cells `44 (+13); 43 (+10); 44!; 43!; 45 (+14)`; change: Starmie #1 is 13 levels higher, Nidoqueen is 10 levels higher, Starmie #2 is 14 levels higher, & Vileplume & Electrode are added.
  Mapping note: maps/Route27.asm:166; maps/Route27.asm:200. Ignored regular rematch constants: COOLTRAINERF, REENA2, COOLTRAINERF, REENA3

### Route 26

- `MAP_EXACT` -> `FISHER, SCOTT`: **Fisher Scott / 1720**; cells `45 (+15); 43!; 44 (+10); 43!`; change: Qwilfish #1 is 15 levels higher, Gyarados replaces Qwilfish #2, Seaking is 10 levels higher, & Quagsire is added.
  Mapping note: maps/Route26.asm:216

- `MAP_EXACT` -> `PSYCHIC_T, RICHARD`: **Psychic Richard1440**; cells `45 (+9); 45!; 45!`; change: Espeon is 9 levels higher, Slowking & Mr. Mime are added.
  Mapping note: maps/Route26.asm:205

- `MAP_EXACT` -> `COOLTRAINERF, JOYCE`: **Cooltrainer Joyce2160**; cells `44 (+12); 45!; 45!; 45!; 46!`; change: Blastoise is 12 levels higher and in front, Raichu replaces Pikachu, Jumpluff, Rhydon, & Tauros are added.
  Mapping note: maps/Route26.asm:111

- `MAP_EXACT_IGNORE_REMATCHES` -> `COOLTRAINERM, GAVEN1`: **Cooltrainer Gaven / 2112**; cells `45 (+13); 46 (+14); 45 (+13); 45!; 44!`; change: Victreebel & Flareon are 13 levels higher, Kingler is 14 levels higher, Dragonair & Porygon2 are added.
  Mapping note: maps/Route26.asm:69. Ignored regular rematch constants: COOLTRAINERM, GAVEN2, COOLTRAINERM, GAVEN3

- `MAP_EXACT` -> `COOLTRAINERM, JAKE`: **Cooltrainer / Jake2160**; cells `45!; 45!; 45!; 47!; 45!`; change: Cloyster replaces Parasect, Jolteon replaces Golduck, Arcanine, Alakazam, & Pidgeot are added.
  Mapping note: maps/Route26.asm:17

- `MAP_EXACT_IGNORE_REMATCHES` -> `COOLTRAINERF, BETH1`: **Cooltrainer Beth / 2160**; cells `45 (+9); 45!; 45!; 45!; 45!`; change: Rapidash is 9 levels higher, Ampharos, Miltank, Lanturn, & Gengar are added.
  Mapping note: maps/Route26.asm:122; maps/Route26.asm:156. Ignored regular rematch constants: COOLTRAINERF, BETH2, COOLTRAINERF, BETH3

### Elite Four Will

- `MAP_EXACT` -> `WILL, WILL1`: **Will / 5000**; cells `48!; 48!; 49 (+8) / Quick Claw; 49!; 50 (+8) / TwistedSpoon`; change: Girafarig replaces Xatu #1, Espeon replaces Exeggutor, Slowbro is 8 levels higher and has a held Quick Claw, Slowking replaces Jynx, & Xatu #2 is now 8 levels higher and has a held TwistedSpoon.
  Movesets: `-Psychic / -Rock Smash / -Agility / -Baton Pass` | `-Psychic / -Shadow Ball / -Reflect / -Headbutt` | `-Curse / -Rock Smash / -Body Slam / -Psychic` | `-Amnesia / -Flamethrower / -Surf / -Psychic` | `-Drill Peck / -Recover / -Confuse Ray / -Psychic`.
  Mapping note: maps/WillsRoom.asm:52

### Elite Four Koga

- `MAP_EXACT` -> `KOGA, KOGA1`: **Koga / 5200**; cells `50 (+10) / King’s Rock; 50 (+8) / Leftovers; 51!; 51 (+10); 52 (+8) / BrightPowder`; change: Ariados is now 10 levels higher and has a held King’s Rock, Muk is now 8 levels and has a held Leftovers, Qwilfish replaces Forretress, Venomoth is now 10 levels higher, & Crobat is now 8 levels higher and has a held Bright Powder.
  Movesets: `-Megahorn / -Giga Drain / -Double Team / -Toxic` | `-Minimize / -Fire Blast / -Sludge Bomb / -Toxic` | `-Surf / -Toxic / -Protect / -Sludge Bomb` | `-Leech Life / -Psychic / -Sludge Bomb / -Sleep Powder` | `-Double Team / -Toxic / -Bite / -Confuse Ray`.
  Mapping note: maps/KogasRoom.asm:52

### Elite Four Bruno

- `MAP_EXACT` -> `BRUNO, BRUNO1`: **Bruno / Hoo-Hah! / 5400**; cells `53 (+11) / Scope Lens; 52!; 53 (+11) / Pink Bow; 53!; 54 (+8) / Black Belt`; change: Hitmonchan is 11 levels higher, in front, and has a held Scope Lens, Hitmonlee is 11 levels higher and has a held Pink Bow, Heracross replaces Hitmontop, Steelix replaces Onix, & Machamp is 8 levels higher and has a held Black Belt.
  Movesets: `-Mach Punch / -Pursuit / -Dizzy Punch / -ThunderPunch` | `-Cross Chop / -Megahorn / -Take Down / -Earthquake` | `-Body Slam / -Meditate / -Reversal / -Hi Jump Kick` | `-Crunch / -Earthquake / -Rock Slide / -Iron Tail` | `-Rock Slide / -Fire Punch / -Vital Throw / -Cross Chop`.
  Mapping note: maps/BrunosRoom.asm:52

### Elite Four Karen

- `MAP_EXACT` -> `KAREN, KAREN1`: **Karen / 5500**; cells `54 (+12) / MiracleBerry; 53 (+11) / Leftovers; 53 (+8); 53 (+9) / Sharp Beak; 55 (+8) / BlackGlasses`; change: Umbreon is 12 levels higher and has a held MiracleBerry, Vileplume is 11 levels higher and has a held Leftovers, Gengar is 8 levels higher, Murkrow is 9 levels higher and has a held Sharp Beak, & Houndoom is 8 levels higher and has a held BlackGlasses.
  Movesets: `-Faint Attack / -Double Team / -Baton Pass / -Moonlight` | `-Sleep Powder / -Giga Drain / -Leech Seed / -Substitute` | `-Shadow Ball / -Hypnosis / -Dream Eater / -Confuse Ray` | `-Drill Peck / -Faint Attack / -Steel Wing / -Haze` | `-Flamethrower / -Crunch / -Iron Tail / -Reversal`.
  Mapping note: maps/KarensRoom.asm:52

### Champion Lance

- `MAP_EXACT` -> `CHAMPION, LANCE`: **Lance / 5600**; cells `54 (+10) / Leftovers; 55 (+8) / Gold Berry; 54 (+8) / Charcoal; 55! / Magnet; 54 (+8) / Pink Bow; 56 (+6) / MiracleBerry`; change: Gyarados is 10 levels higher, Dragonite #1 is 8 levels higher, Charizard is 8 levels higher, Aerodactyl is 8 levels higher, Zapdos replaces Dragonite #2, Dragonite #3 is 6 levels higher, and all Pokemon have held items.
  Movesets: `-Surf / -Rain Dance / -Hyper Beam / -Rock Smash` | `-Blizzard / -Fire Blast / -Thunder / -ExtremeSpeed` | `-Flamethrower / -Wing Attack / -Double Team / -Steel Wing` | `-Drill Peck / -Sky Attack / -Thunderbolt / -Thunder Wave` | `-Wing Attack / -Rock Slide / -Hyper Beam / -Earthquake` | `-Thunder / -Safeguard / -Outrage / -Hyper Beam`.
  Mapping note: maps/LancesRoom.asm:60

### S.S. Aqua: First Trip

- `MAP_EXACT` -> `HIKER, NOLAND`: **Hiker Noland / 1760**; cells `55 (+24); 55 (+22)`; change: Sandlash is 24 levels higher, Golem is 22 levels higher.
  Mapping note: maps/FastShipCabins_NNW_NNE_NE.asm:49

- `MAP_EXACT` -> `POKEFANM, COLIN`: **PokeFan Colin / 4480**; cells `56 (+22) / Berry`; change: Delibird is 22 levels higher.
  Mapping note: maps/FastShipCabins_SE_SSE_CaptainsCabin.asm:132

- `MAP_EXACT_IGNORE_REMATCHES` -> `TWINS, MEGANDPEG1`: **Twins Meg & Peg 1080**; cells `54!; 54!`; change: Donphan replaces Phanpy, Ursaring replaces Teddiursa.
  Mapping note: maps/FastShipCabins_SE_SSE_CaptainsCabin.asm:143. Ignored regular rematch constants: TWINS, MEGANDPEG2

- `MAP_EXACT` -> `FIREBREATHER, LYLE`: **Firebreather Lyle 2592**; cells `54!; 54 (+23); 54!`; change: Weezing replaces Koffing #1, Flareon is 23 levels higher, Ninetales replaces Koffing #2.
  Mapping note: maps/FastShipCabins_SW_SSW_NW.asm:13

- `MAP_EXACT` -> `SAILOR, STANLY`: **Sailor Stanly / 2160**; cells `53!; 53 (+20); 54!`; change: Qwilfish replaces Machop, Machoke is 20 levels higher, Golduck replaces Psyduck.
  Mapping note: maps/FastShipCabins_NNW_NNE_NE.asm:89

- `MAP_EXACT` -> `JUGGLER, FRITZ`: **Juggler Fritz / 2240**; cells `54 (+25); 54 (+25); 56 (+27)`; change: Mr. Mime & Magmar are 25 levels higher, Machoke is 27 levels higher.
  Mapping note: maps/FastShipB1F.asm:117

- `MAP_EXACT` -> `SAILOR, JEFF`: **Sailor Jeff / 2320**; cells `58 (+26); 58!`; change: Raticate #1 is 26 levels higher, Furret replaces Raticate #2.
  Mapping note: maps/FastShipB1F.asm:95

- `MAP_EXACT` -> `PICNICKER, DEBRA`: **Picnicker Debra / 1160**; cells `58 (+25)`; change: Seaking is 25 levels higher.
  Mapping note: maps/FastShipB1F.asm:106

### S.S. Aqua: Kanto -> Johto

- `MAP_EXACT` -> `POKEMANIAC, ETHAN`: **PokeManiac Ethan3660**; cells `61!; 61 (+30)`; change: Haunter replaces Rhyhorn, Rhydon is 30 levels higher..
  Mapping note: maps/FastShipCabins_NNW_NNE_NE.asm:38

- `MAP_EXACT` -> `BURGLAR, COREY`: **Burglar Corey / 5280**; cells `55 (+30); 58 (+30); 60 (+30); 55 (+30)`; change: All Pokemon are 30 levels higher.
  Mapping note: maps/FastShipCabins_NNW_NNE_NE.asm:71

- `MAP_EXACT` -> `BUG_CATCHER, KEN`: **Bug Catcher Ken992**; cells `60 (+30); 62 (+30)`; change: Both Pokemon are 30 levels higher.
  Mapping note: maps/FastShipCabins_SW_SSW_NW.asm:24

- `MAP_EXACT` -> `GUITARIST, CLYDE`: **Guitarist Clyde1952**; cells `61 (+27)`; change: Electabuzz is 27 levels higher.
  Mapping note: maps/FastShipCabins_SW_SSW_NW.asm:46

- `MAP_EXACT` -> `POKEFANM, JEREMY`: **PokeFan Jeremy4640**; cells `58 (+30) / Berry; 60! / Berry; 58 (+30) / Berry`; change: Meowth’s #1 & #3 are 30 levels higher, Persian replaces Meowth #2.
  Mapping note: maps/FastShipCabins_SE_SSE_CaptainsCabin.asm:176

- `MAP_EXACT` -> `POKEFANF, GEORGIA`: **PokeFan Georgia4880**; cells `61 (+38) / Berry; 61 (+38) / Berry; 61 (+38) / Berry; 63 (+35) / Berry; 61 (+38) / Berry`; change: Sentret’s are all 38 levels higher, Furret is 35 levels higher.
  Mapping note: maps/FastShipCabins_SE_SSE_CaptainsCabin.asm:187

- `MAP_EXACT` -> `SAILOR, KENNETH`: **Sailor Kenneth2320**; cells `58 (+30); 58!; 58 (+30); 58!`; change: Machop #1 & Poliwrath are 30 levels higher, Machoke replaces Machop #2, & Machamp replaces Machop #3.
  Mapping note: maps/FastShipB1F.asm:161

- `MAP_EXACT` -> `TEACHER, SHIRLEY`: **Teacher Shirley4536**; cells `61 (+25); 63!`; change: Jigglypuff is 25 levels higher, Wigglytuff is added.
  Mapping note: maps/FastShipB1F.asm:172

- `MAP_EXACT` -> `SCHOOLBOY, NATE`: **Schoolboy Nate1984**; cells `62 (+30); 62 (+30)`; change: Both Pokemon are 30 levels higher.
  Mapping note: maps/FastShipB1F.asm:183

- `MAP_EXACT` -> `SCHOOLBOY, RICKY`: **Schoolboy Ricky1984**; cells `62 (+30); 62 (+30)`; change: Both Pokemon are 30 levels higher.
  Mapping note: maps/FastShipB1F.asm:194

### S.S. Aqua: Johto -> Kanto

- `MAP_EXACT` -> `COOLTRAINERM, SEAN`: **Cooltrainer Sean2880**; cells `60 (+25); 60 (+25); 60 (+25)`; change: All Pokemon are 25 levels higher.
  Mapping note: maps/FastShipCabins_NNW_NNE_NE.asm:16

- `MAP_EXACT` -> `COOLTRAINERF, CAROL`: **Cooltrainer Carol2880**; cells `60 (+25); 61 (+26); 60 (+25)`; change: Electrode & Ninetales are 25 levels higher, Starmie is 26 levels higher.
  Mapping note: maps/FastShipCabins_NNW_NNE_NE.asm:27

- `MAP_EXACT` -> `GENTLEMAN, EDWARD`: **Gentleman Edward4536**; cells `63 (+30)`; change: Persian is 30 levels higher.
  Mapping note: maps/FastShipCabins_NNW_NNE_NE.asm:60

- `MAP_EXACT` -> `BEAUTY, CASSIE`: **Beauty Cassie / 5456**; cells `60 (+32); 62!`; change: Vileplume is 32 levels higher, Jynx replaces Butterfree.
  Mapping note: maps/FastShipCabins_SW_SSW_NW.asm:35

- `MAP_EXACT` -> `PSYCHIC_T, RODNEY`: **Psychic Rodney2016**; cells `59 (+30); 63 (+30)`; change: Both Pokemon are 30 levels higher.
  Mapping note: maps/FastShipCabins_SE_SSE_CaptainsCabin.asm:165

- `MAP_EXACT` -> `SUPER_NERD, SHAWN`: **Super Nerd Shawn1888**; cells `57!; 58 (+25); 59!`; change: Arcanine replaces Magnemite #1, Muk is 25 levels higher, & Magneton replaces Magnemite #2.
  Mapping note: maps/FastShipCabins_SE_SSE_CaptainsCabin.asm:198

- `MAP_EXACT` -> `FISHER, JONAH`: **Fisher Jonah / 2360**; cells `55 (+30); 59 (+30); 55 (+30); 59 (+30)`; change: All Pokemon are 30 levels higher.
  Mapping note: maps/FastShipB1F.asm:139

- `MAP_EXACT` -> `SAILOR, GARRETT`: **Sailor Garret / 2560**; cells `64 (+30)`; change: Kingler is 30 levels higher.
  Mapping note: maps/FastShipB1F.asm:128

- `MAP_EXACT` -> `BLACKBELT_T, WAI`: **Blackbelt Wai / 1440**; cells `56!; 58 (+26); 60!`; change: Machoke #2 is 26 levels higher, Machamp’s #1 & #3 replace Machoke’s #1 & #3.
  Mapping note: maps/FastShipB1F.asm:150

### Vermilion Gym

- `MAP_EXACT` -> `JUGGLER, HORTON`: **Juggler Horton2320**; cells `56 (+23); 57 (+24); 56 (+23); 58 (+25)`; change: Electrode’s #1 & #3 are 23 levels higher, Electrode #2 is 24 levels higher, & Electrode #4 is 25 levels higher.
  Mapping note: maps/VermilionGym.asm:68

- `MAP_EXACT` -> `GUITARIST, VINCENT`: **Guitarist Vincent1760**; cells `57!; 55!; 55!; 57!`; change: Magneton #1 replaces Magnemite #1, Electrode & Jolteon replace Voltorb & Magnemite #2, Magneton #2 replaces Magnemite #3.
  Mapping note: maps/VermilionGym.asm:57

- `MAP_EXACT` -> `GENTLEMAN, GREGORY`: **Gentleman Gregory4032**; cells `57 (+20); 56!`; change: Pikachu is 20 levels higher, Ampharos replaces Flaaffy.
  Mapping note: maps/VermilionGym.asm:46

### Gym Leader Lt. Surge

- `MAP_EXACT` -> `LT_SURGE, LT_SURGE1`: **Lt. Surge / 6000**; cells `57 (+17) / Focus Band; 59 (+19); 58! / Leftovers; 58!; 59 (+13) / Scope Lens; 60 (+16) / Magnet`; change: Electrode #1 is 17 levels higher, has a held Focus Band, and in front, Magneton is 19 levels higher, Raichu is 16 levels higher and has a held Magnet, Electabuzz is 13 levels higher and has a held Scope Lens, and Lanturn & Ampharos are added, with Lanturn having a held Leftovers. Lost 1 Electrode.
  Movesets: `-Thunder / -Rain Dance / -Thunder Wave / -Explosion` | `-Thunder / -Reflect / -Rain Dance / -Double-Edge` | `-Surf / -Thunderbolt / -Ice Beam / -Confuse Ray` | `-Rain Dance / -Thunder / -Thunder Wave / -Iron Tail` | `-Thunderbolt / -Fire Punch / -Ice Punch / -Submission` | `-Thunder / -Rain Dance / -Body Slam / -Surf`.
  Mapping note: maps/VermilionGym.asm:22

### Route 6

- `UNRESOLVED_NO_CANDIDATES`: **PokeFan Rex / 4400**; cells `55! / Berry`; change: Stantler replaces Phanpy.
  Mapping note: No map-bound trainers found for section.

- `UNRESOLVED_NO_CANDIDATES`: **PokeFan Allan4400**; cells `55! / Berry`; change: Granbull replaces Teddiursa.
  Mapping note: No map-bound trainers found for section.

### Saffron Gym

- `MAP_EXACT` -> `MEDIUM, REBECCA`: **Medium Rebecca / 2320**; cells `58!; 58!; 58 (+23)`; change: Hypno #2 replaces Drowzee, Hypno #1 is 23 levels higher, & Jynx is added.
  Mapping note: maps/SaffronGym.asm:48

- `MAP_EXACT` -> `PSYCHIC_T, JARED`: **Psychic Jared / 1856**; cells `58!; 58 (+26); 58!`; change: Unown is added and in front, Mr. Mime is 26 levels higher, & Exeggutor replaces Exeggcute.
  Mapping note: maps/SaffronGym.asm:81

- `MAP_EXACT` -> `MEDIUM, DORIS`: **Medium Doris / 2320**; cells `58!; 59 (+23); 58!`; change: Noctowl replaces Slowpoke, Slowbro is 23 levels higher, & Xatu is added.
  Mapping note: maps/SaffronGym.asm:70

- `MAP_EXACT` -> `PSYCHIC_T, FRANKLIN`: **Psychic Franklin1920**; cells `60!`; change: Alakazam replaces Kadabra.
  Mapping note: maps/SaffronGym.asm:59

### Gym Leader Sabrina

- `MAP_EXACT` -> `SABRINA, SABRINA1`: **Sabrina / 6600**; cells `65 (+19) / Quick Claw; 64!; 64! / Mint Berry; 64! / Leftovers; 65! / Focus Band; 66 (+18) / TwistedSpoon`; change: Mr. Mime is 19 levels higher and has a Quick Claw, Jynx, Slowbro, Wobbuffet, & Hypno are added, with Slowbro having a Mint Berry, Wobbuffet a Leftovers, & Hypno a Focus Band, and Alakazam is 18 levels higher and has a TwistedSpoon.
  Movesets: `-Psychic / -Thunder Wave / -Encore / -Ice Punch` | `-Psychic / -Ice Beam / -Lovely Kiss / -BubbleBeam` | `-Rest / -Sleep Talk / -Submission / -Surf` | `-Mirror Coat / -Counter / -Safeguard / -Destiny Bond` | `-Dream Eater / -Hypnosis / -Fire Punch / -Submission` | `-Shadow Ball / -Psychic / -Recover / -ThunderPunch`.
  Mapping note: maps/SaffronGym.asm:23

### Celadon Gym

- `UNRESOLVED_MULTI_SPECIES_MATCH`: **Twins Joe & Zoe1160**; cells `58 (+23); 58 (+23)`; change: Victreebel & Vileplume are 23 levels higher.
  Mapping note: TWINS, JOANDZOE1 (VICTREEBEL/VILEPLUME), TWINS, JOANDZOE2 (VICTREEBEL/VILEPLUME), ERIKA, ERIKA1 (VICTREEBEL)

- `MAP_EXACT` -> `PICNICKER, TANYA`: **Picnicker Tanya1140**; cells `57!; 57 (+20); 57!`; change: Exeggutor is 20 levels higher and no longer in front, Bellossom & Sunflora are added.
  Mapping note: maps/CeladonGym.asm:62

- `MAP_EXACT` -> `LASS, MICHELLE`: **Lass Michelle / 1368**; cells `57!; 58!; 57 (+23)`; change: Jumpluff’s #2 & #3 replaces Skiploom & Hoppip, Jumpluff #1 is 23 levels higher.
  Mapping note: maps/CeladonGym.asm:51

- `MAP_EXACT` -> `BEAUTY, JULIA`: **Beauty Julia / 5104**; cells `58 (+23); 56!; 58!`; change: Parasect is 23 levels higher and in front, Exeggutor replaces Exeggcute, & Sunflora replaces Paras.
  Mapping note: maps/CeladonGym.asm:73

### Gym Leader Erika

- `MAP_EXACT` -> `ERIKA, ERIKA1`: **Erika / 6200**; cells `61 (+20) / Focus Band; 60!; 60!; 61! / Leftovers; 62 (+16) / Poison Barb; 62 (+16) / Miracle Seed`; change: Jumpluff is 20 levels higher, has a held Focus Band, and is in front, Victreebel & Bellossom are 16 levels higher, with Victreebel holding a Poison Barb, & Bellossom holding a Miracle Seed, Sudowoodo, Exeggutor, & Venusaur are added, with Venusaur having a held Leftovers, lost 1 Tangela.
  Movesets: `-Giga DraIn / -Sleep Powder / -Encore / -Leech Seed` | `-Rock Slide / -Earthquake / -Faint Attack / -ThunderPunch` | `-Giga Drain / -Psychic / -Stun Spore / -AncientPower` | `-Sunny Day / -Solarbeam / -Sludge Bomb / -Sleep Powder` | `-Sludge Bomb / -Giga Drain / -Swords Dance / -Sleep Powder` | `-Sunny Day / -Synthesis / -Sleep Powder / -Solarbeam`.
  Mapping note: maps/CeladonGym.asm:23

### Route 24

- `MAP_INFERRED_BY_SECTION_SPECIES` -> `GRUNTM, GRUNTM_31`: **Rocket Grunt (Route 24) / (Machine Part Quest) / 2320**; cells `58!; 58!; 58!; 58!; 58!`; change: Crobat replaces Golbat, Weezing, Marowak, Hypno, & Cloyster are added.
  Mapping note: Inferred from Route 24; current party has mentioned species GOLBAT; bindings: maps/Route24.asm:17

### Route 25

- `MAP_EXACT` -> `SCHOOLBOY, DUDLEY`: **Schoolboy Dudley1792**; cells `56!`; change: Vileplume replaces Oddish.
  Mapping note: maps/Route25.asm:80

- `MAP_EXACT` -> `LASS, ELLEN`: **Lass Ellen / 1320**; cells `55 (+25); 55 (+21)`; change: Wigglytuff is 25 levels higher, Granbull is 21 levels higher.
  Mapping note: maps/Route25.asm:91

- `MAP_EXACT` -> `SCHOOLBOY, JOE`: **Schoolboy Joe1792**; cells `56 (+23); 56 (+23)`; change: Tangela & Vaporeon are 23 levels higher.
  Mapping note: maps/Route25.asm:102

- `MAP_EXACT` -> `LASS, LAURA`: **Lass Laura / 1320**; cells `55 (+24); 55!; 55!`; change: Bellossom is 24 levels higher and in front, Pidgeot replaces Pidgeotto, Politoed replaces Gloom
  Mapping note: maps/Route25.asm:113

- `MAP_EXACT` -> `CAMPER, LLOYD`: **Camper Lloyd / 1140**; cells `57 (+23)`; change: Nidoking is 23 levels higher.
  Mapping note: maps/Route25.asm:124

- `MAP_EXACT` -> `LASS, SHANNON`: **Lass Shannon / 1344**; cells `56!; 55!; 56 (+24)`; change: Parasect #2 replaces Paras #1, Tangela replaces Paras #2, & Parasect #1 is 24 levels higher.
  Mapping note: maps/Route25.asm:135

- `MAP_EXACT` -> `SUPER_NERD, PAT`: **Super Nerd Pat1792**; cells `56 (+20); 56!; 56!`; change: Porygon is 20 levels higher, Magneton & Porygon2 are added.
  Mapping note: maps/Route25.asm:146

- `MAP_EXACT` -> `COOLTRAINERM, KEVIN`: **Cooltrainer Kevin2784**; cells `58 (+20); 57!; 57!; 58!`; change: Rhyhorn is 20 levels higher, Lanturn replaces Wartortle, Charizard replaces Charmeleon, & Espeon is added.
  Mapping note: maps/Route25.asm:173

### Cerulean Gym

- `MAP_EXACT` -> `SWIMMERM, PARKER`: **Swimmer Parker456**; cells `57!; 57!; 57 (+22)`; change: Seadra #2 replaces Horsea #1, Gyarados replaces Horsea #2, & Seadra #1 is 22 levels higher.
  Mapping note: maps/CeruleanGym.asm:109

- `MAP_EXACT` -> `SWIMMERF, BRIANA`: **Swimmer Briana1160**; cells `58 (+23); 58!; 58 (+23)`; change: Seakings are 23 levels higher, Azumarill is added.
  Mapping note: maps/CeruleanGym.asm:98

- `MAP_EXACT` -> `SWIMMERF, DIANA`: **Swimmer Diana1140**; cells `57 (+20); 57!; 57!`; change: Golduck is 20 levels higher, Cloyster & Corsola are added.
  Mapping note: maps/CeruleanGym.asm:87

### Gym Leader Misty

- `MAP_EXACT` -> `MISTY, MISTY1`: **Misty / 6300**; cells `62 (+20); 62 (+20) / Quick Claw; 61! / Leftovers; 61!; 62 (+18) / NeverMeltIce; 63 (+16) / Mystic Water`; change: Golduck & Quagsire are 20 levels higher, Lapras is 18 levels higher, Starmie is 16 levels higher, Vaporeon & Kingdra are added.
  Movesets: `-Surf / -Psychic / -Hypnosis / -Cross Chop` | `-Surf / -Amnesia / -Earthquake / -Rain Dance` | `-Surf / -Ice Beam / -Acid Armor / -Shadow Ball` | `-Hydro Pump / -Ice Beam / -Rest / -Sleep Talk` | `-Surf / -Ice Beam / -Rain Dance / -Reflect` | `-Surf / -Psychic / -Recover / -Thunderbolt`.
  Mapping note: maps/CeruleanGym.asm:68

### Route 8

- `MAP_EXACT` -> `BIKER, DWAYNE`: **Biker Dwayne1920**; cells `57 (+30); 58 (+30); 59 (+30); 60 (+30)`; change: Koffing’s are 30 levels higher.
  Mapping note: maps/Route8.asm:15

- `MAP_EXACT` -> `BIKER, HARRIS`: **Biker Harris / 1888**; cells `59 (+25)`; change: Flareon is 25 levels higher.
  Mapping note: maps/Route8.asm:26

- `MAP_EXACT` -> `BIKER, ZEKE`: **Biker Zeke / (Von Genbu) / (Also known as the Zekenator!) / 1792**; cells `58!; 56!`; change: Crobat replaces Koffing #1, Muk replaces Koffing #2.
  Mapping note: maps/Route8.asm:37

- `MAP_EXACT` -> `SUPER_NERD, SAM`: **Super Nerd Sam1984**; cells `62!`; change: Porygon2 replaces Grimer, lost 1 Muk.
  Mapping note: maps/Route8.asm:48

- `MAP_EXACT` -> `SUPER_NERD, TOM`: **Super Nerd Tom1792**; cells `56 (+24); 56!; 56 (+24)`; change: Magnemite’s #1 & #3 are 24 levels higher, Steelix replaces Magnemite #2.
  Mapping note: maps/Route8.asm:59

### Route 9

- `MAP_EXACT` -> `PICNICKER, EDNA`: **Picnicker Edna1120**; cells `56!; 56 (+22)`; change: Nidoqueen replaces Nidorina, Raichu is 22 levels higher.
  Mapping note: maps/Route9.asm:48

- `MAP_EXACT` -> `CAMPER, SID`: **Camper Sid / 1120**; cells `56 (+24); 55 (+26); 56 (+27)`; change: Dugtrio is 24 levels higher, Primeape is 26 levels higher, & Poliwrath is 27 levels higher.
  Mapping note: maps/Route9.asm:37

- `MAP_EXACT` -> `CAMPER, DEAN`: **Camper Dean / 1140**; cells `56!; 57!`; change: Heracross replaces Golduck, Kangaskhan replaces Sandslash.
  Mapping note: maps/Route9.asm:15

- `MAP_EXACT` -> `HIKER, TIM`: **Hiker Tim / 1760**; cells `55!; 55!; 55!`; change: Golem replaces Graveler #1, Kabutops replaces Graveler #2, Quagsire replaces Graveler #3.
  Mapping note: maps/Route9.asm:59

- `MAP_EXACT` -> `HIKER, SIDNEY`: **Hiker Sidney / 1792**; cells `56 (+22); 56!`; change: Dugtrio is 22 levels higher, Steelix replaces Onix.
  Mapping note: maps/Route9.asm:70

- `MAP_EXACT` -> `PICNICKER, HEIDI`: **Picnicker Heidi1160**; cells `56!; 58!`; change: Jumpluff replaces Skiploom #1, Seadra replaces Skiploom #2.
  Mapping note: maps/Route9.asm:26

### Route 10

- `MAP_EXACT` -> `POKEFANM, ROBERT`: **PokeFan Robert4800**; cells `60! / Berry`; change: Kangaskhan replaces Quagsire.
  Mapping note: maps/Route10South.asm:22

- `MAP_EXACT` -> `HIKER, JIM`: **Hiker Jim / 1856**; cells `58 (+23)`; change: Machamp is 23 levels higher.
  Mapping note: maps/Route10South.asm:11

### Route 11

- `MAP_EXACT` -> `PSYCHIC_T, HERMAN`: **Psychic Herman1760**; cells `55 (+25); 55!; 55!`; change: Exeggutor is 25 levels and in front, Xatu replaces Exeggcute #1, and Starmie replaces Exeggcute #2.
  Mapping note: maps/Route11.asm:36

- `MAP_EXACT` -> `YOUNGSTER, JASON`: **Youngster Jason880**; cells `55!; 55 (+22)`; change: Octillery replaces Sandslash, Crobat is 22 levels higher.
  Mapping note: maps/Route11.asm:25

- `MAP_EXACT` -> `YOUNGSTER, OWEN`: **Youngster Olwen880**; cells `55!`; change: Arcanine replaces Growlithe.
  Mapping note: maps/Route11.asm:14

- `MAP_EXACT` -> `PSYCHIC_T, FIDEL`: **Psychic Fidel1728**; cells `54 (+20)`; change: Xatu is 20 levels higher.
  Mapping note: maps/Route11.asm:47

### Route 12

- `MAP_EXACT` -> `FISHER, KYLE`: **Fisher Kyle / 2360**; cells `58 (+30); 58 (+27); 59 (+28)`; change: Seaking #1 is 30 levels higher, Poliwhirl is 27 levels higher, and Seaking #2 is 28 levels higher.
  Mapping note: maps/Route12.asm:15

- `MAP_EXACT` -> `FISHER, MARTIN`: **Fisher Martin / 2480**; cells `62 (+30); 62 (+30)`; change: Remoraid’s are 30 levels higher.
  Mapping note: maps/Route12.asm:26

- `MAP_EXACT` -> `FISHER, STEPHEN`: **Fisher Stephen2280**; cells `75!' (+50); 57!; 58 (+27); 57 (+26)`; change: Magikarp #1 is… 5-50 levels higher!' Gyarados replaces Magikarp #2, Qwilfish is 27 levels higher, and Tentacruel is 26 levels higher.
  Mapping note: maps/Route12.asm:37

- `MAP_EXACT` -> `FISHER, BARNEY`: **Fisher Barney / 2320**; cells `58 (+28); 58 (+28); 58 (+28)`; change: Gyarados’s are 28 levels higher.
  Mapping note: maps/Route12.asm:48

### Route 13

- `MAP_EXACT` -> `BIRD_KEEPER, BRET`: **Bird Keeper Bret1392**; cells `58!; 58 (+26)`; change: Skarmory replaces Pidgeotto, Fearow is 26 levels higher.
  Mapping note: maps/Route13.asm:47

- `MAP_EXACT` -> `BIRD_KEEPER, PERRY`: **Bird Keeper Perry1464**; cells `61 (+27)`; change: Farfetch’d is 27 levels higher.
  Mapping note: maps/Route13.asm:36

- `MAP_EXACT` -> `POKEFANM, JOSHUA`: **PokeFan Joshua4800**; cells `60 (+37) / Berry; 60 (+37) / Berry; 60 (+37) / Berry`; change: Pikachu’s are 37 levels higher, lost 3 Pikachu.
  Mapping note: maps/Route13.asm:25

- `MAP_EXACT` -> `POKEFANM, ALEX`: **PokeFan Alex4640**; cells `56 (+27) / Berry; 57 (+28) / Berry; 58 (+29) / Berry`; change: Nidoking is 27 levels higher, Slowking is 28 levels higher, & Seaking is 29 levels higher.
  Mapping note: maps/Route13.asm:14

- `MAP_EXACT` -> `HIKER, KENNY`: **Hiker Kenny / 1888**; cells `56 (+29); 59 (+30); 57 (+26); 59 (+30)`; change: Sandslash is 29 levels higher, Gravelers are 30 levels higher, Golem is 26 levels higher.
  Mapping note: maps/Route13.asm:58

### Route 14

- `MAP_EXACT` -> `POKEFANM, CARTER`: **PokeFan Carter5200**; cells `65! / Berry; 65! / Berry; 65! / Berry`; change: Chikorita, Cyndaquil, & Totodile replace Bulbasaur, Charmander, & Totodile.
  Mapping note: maps/Route14.asm:21

- `MAP_EXACT` -> `BIRD_KEEPER, ROY`: **Bird Keeper Roy1416**; cells `59 (+30); 59 (+24)`; change: Fearow #1 is 30 levels higher, Fearow #2 is 24 levels higher.
  Mapping note: maps/Route14.asm:32

- `MAP_EXACT` -> `POKEFANM, TREVOR`: **PokeFan Trevor4800**; cells `60! / Berry`; change: Scizor replaces Psyduck.
  Mapping note: maps/Route14.asm:43

### Route 15

- `MAP_EXACT` -> `SCHOOLBOY, JOHNNY`: **Schoolboy Johnny1888**; cells `59!; 59 (+26)`; change: Tauros replaces Bellsprout, Victreebel is 26 levels higher, lost 1 Weepinbell.
  Mapping note: maps/Route15.asm:60

- `MAP_EXACT` -> `TEACHER, COLETTE`: **Teacher Colette4320**; cells `60 (+24)`; change: Clefairy is 24 levels higher.
  Mapping note: maps/Route15.asm:16

- `MAP_EXACT` -> `SCHOOLBOY, BILLY`: **Schoolboy Billy1920**; cells `57!; 57!; 60 (+25)`; change: Parasect replaces Paras #1, Poliwrath replaces Poliwhirl, Ditto is 25 levels higher, lost 1 Paras.
  Mapping note: maps/Route15.asm:71

- `MAP_EXACT` -> `TEACHER, HILLARY`: **Teacher Hillary4392**; cells `61 (+29); 61 (+25)`; change: Aipom is 29 levels higher, & Cubone is 25 levels higher.
  Mapping note: maps/Route15.asm:27

- `MAP_EXACT` -> `SCHOOLBOY, TOMMY`: **Schoolboy Tommy1856**; cells `60 (+28); 58 (+26)`; change: Xatu is 28 levels higher, & Alakazam is 26 levels higher..
  Mapping note: maps/Route15.asm:49

- `MAP_EXACT` -> `SCHOOLBOY, KIPP`: **Schoolboy Kipp1888**; cells `59!; 59 (+32)`; change: Electrode replaces Voltorb #1, Magnemite is 32 levels higher, lost 1 Voltorb & 1 Magneton.
  Mapping note: maps/Route15.asm:38

### Fuchsia Gym

- `MAP_EXACT` -> `LASS, LINDA`: **Lass Linda / 1392**; cells `58 (+24); 58!; 58!`; change: Venusaur is 24 levels higher and in front, Muk replaces Bulbasaur, & Qwilfish replaces Ivysaur.
  Mapping note: maps/FuchsiaGym.asm:110

- `MAP_EXACT` -> `PICNICKER, CINDY`: **Picnicker Cindy1200**; cells `57!; 60 (+24)`; change: Nidoqueen is 24 levels higher and in back, Tentacruel is added.
  Mapping note: maps/FuchsiaGym.asm:144

- `MAP_EXACT` -> `CAMPER, BARRY`: **Camper Barry / 1200**; cells `57!; 60 (+24)`; change: Nidoking is 24 levels higher and in back, Tentacruel is added.
  Mapping note: maps/FuchsiaGym.asm:178

- `MAP_EXACT` -> `LASS, ALICE`: **Lass Alice / 1392**; cells `58!; 59 (+25); 58!`; change: Vileplumes #1 & #2 replaces Glooms #1 & #2, & Arbok is 25 levels higher.
  Mapping note: maps/FuchsiaGym.asm:76

### Gym Leader Janine

- `MAP_EXACT` -> `JANINE, JANINE1`: **Janine / 6400**; cells `63 (+27) / Leftovers; 61 / Mystic Water; 62!; 62! / Quick Claw; 63 (+27); 64 (+25) / BrightPowder`; change: Weezing #1 & Crobat are 27 levels higher & Weezing is in front, Venomoth is 25 levels higher, & Tentacruel, Muk, & Nidoqueen, are added, lost 1 Weezing & Ariados.
  Movesets: `-Sludge Bomb / -Fire Blast / -Destiny Bond / -Amnesia` | `-Surf / -Ice Beam / -Toxic / -Confuse Ray` | `-Minimize / -Sludge Bomb / -Toxic / -Acid Armor` | `-Earthquake / -Sludge Bomb / -Thunderbolt / -Submission` | `-Pursuit / -Sludge Bomb / -Toxic / -Confuse Ray` | `-Giga Drain / -Psychic / -Toxic / -Double Team`.
  Mapping note: maps/FuchsiaGym.asm:24

### Route 17

- `MAP_EXACT` -> `BIKER, RILEY`: **Biker Riley / 1920**; cells `60 (+26)`; change: Weezing is 26 levels higher.
  Mapping note: maps/Route17.asm:30

- `MAP_EXACT` -> `BIKER, GLENN`: **Biker Glenn / 1856**; cells `57 (+29); 55 (+25); 58 (+26)`; change: Koffing is 29 levels higher, Magmar is 25 levels higher, Weezing is 26 levels higher.
  Mapping note: maps/Route17.asm:52

- `MAP_EXACT` -> `BIKER, JOEL`: **Biker Joel / 1856**; cells `58 (+26); 58!`; change: Magmar #1 is 26 levels higher, Electabuzz replaces Magmar #2.
  Mapping note: maps/Route17.asm:41

- `MAP_EXACT` -> `BIKER, CHARLES`: **Biker Charles / 1792 / (He’s a Heartbreaker… his name… Charles).**; cells `56!; 56!; 56 (+26)`; change: Poliwrath replaces Koffing, Charizard replaces Charmeleon, & Weezing is 26 levels higher.
  Mapping note: maps/Route17.asm:19

### Route 18

- `MAP_EXACT` -> `BIRD_KEEPER, BOB`: **Bird Keeper Bob1464**; cells `61 (+27)`; change: Noctowl is 27 levels higher.
  Mapping note: maps/Route18.asm:22

- `MAP_EXACT` -> `BIRD_KEEPER, BORIS`: **Bird Keeper Boris1440**; cells `60!; 58!; 60 (+28)`; change: Yanma replaces Doduo #1, Murkrow replaces Doduo #2, & Dodrio is 28 levels higher.
  Mapping note: maps/Route18.asm:11

### Pewter Gym

- `MAP_EXACT` -> `CAMPER, JERRY`: **Camper Jerry / 1200**; cells `60!; 58 (+21); 60!`; change: Sandslash is 21 levels higher and no longer in front, Dugtrio & Donphan are added.
  Mapping note: maps/PewterGym.asm:42

### Gym Leader Brock

- `MAP_EXACT` -> `BROCK, BROCK1`: **Brock / 6600**; cells `66! / Quick Claw; 66! / Hard Stone; 66 (+26) / Focus Band; 66 (+26) / Scope Lens; 66! / Magnet; 66! / Leftovers`; change: Golem replaces Graveler, Aerodactyl replaces Rhyhorn, Steelix replaces Onix, Omastar & Kabutops are 26 levels higher, & Tyranitar is added, with all Pokemon having held items.
  Movesets: `-Curse / -Rock Slide / -Body Slam / -Earthquake` | `-AncientPower / -Sky Attack / -Earthquake / -Fire Blast` | `-AncientPower / -Ice Beam / -Surf / -Toxic` | `-Surf / -AncientPower / -Cut / -Swords Dance` | `-Crunch / -Rock Slide / -Curse / -Thunderbolt` | `-Curse / -Earthquake / -Rock Slide / -Iron Tail`.
  Mapping note: maps/PewterGym.asm:20

### Route 2

- `MAP_EXACT` -> `BUG_CATCHER, ED`: **Bug Catcher Ed960**; cells `60 (+30); 60 (+30); 60 (+30)`; change: Beedrills are 30 levels higher.
  Mapping note: maps/Route2.asm:28

- `MAP_EXACT` -> `BUG_CATCHER, DOUG`: **Bug Catcher Doug992**; cells `62 (+28)`; change: Ariados is 28 levels higher.
  Mapping note: maps/Route2.asm:39

- `MAP_EXACT` -> `BUG_CATCHER, ROB`: **Bug Catcher Rob992**; cells `62 (+30); 62 (+30)`; change: Beedrill & Butterfree are 30 levels higher.
  Mapping note: maps/Route2.asm:17

### Route 3

- `MAP_EXACT` -> `YOUNGSTER, WARREN`: **Youngster Warren960**; cells `60 (+25)`; change: Fearow is 25 levels higher.
  Mapping note: maps/Route3.asm:24

- `MAP_EXACT` -> `YOUNGSTER, JIMMY`: **Youngster Jimmy944**; cells `59 (+26); 59 (+26)`; change: Raticate & Arbok are 26 levels higher.
  Mapping note: maps/Route3.asm:35

- `MAP_EXACT` -> `FIREBREATHER, OTIS`: **Firebreather Otis2784**; cells `58 (+29); 60 (+28); 58 (+29)`; change: Magmars are 29 levels higher, Weezing is 28 levels higher.
  Mapping note: maps/Route3.asm:13

- `MAP_EXACT` -> `FIREBREATHER, BURT`: **Firebreather Burt2880**; cells `60!; 60!`; change: Weezing replaces Koffing, Magcargo replaces Slugma.
  Mapping note: maps/Route3.asm:46

### Route 4

- `MAP_EXACT` -> `PICNICKER, HOPE`: **Picnicker Hope1220**; cells `61!`; change: Ampharos replaces Flaaffy.
  Mapping note: maps/Route4.asm:24

- `MAP_EXACT` -> `BIRD_KEEPER, HANK`: **Bird Keeper Hank1416**; cells `59!; 59 (+25)`; change: Murkrow replaces Pidgey, Pidgeot is 25 levels higher.
  Mapping note: maps/Route4.asm:13

- `MAP_EXACT` -> `PICNICKER, SHARON`: **Picnicker Sharon1160**; cells `61 (+30); 58 (+25)`; change: Furret is 30 levels higher, Rapidash is 25 levels higher.
  Mapping note: maps/Route4.asm:35

### Gym Leader Blue

- `MAP_EXACT` -> `BLUE, BLUE1`: **Blue / 6900**; cells `69! / Miracle Berry; 68 (+13) / TwistedSpoon; 67! / Scope Lens; 68 (+10) / Focus Band; 68 (+10) / Leftovers; 69 (+11) / Pink Bow`; change: Articuno replaces Pidgeot, Alakazam is 13 levels higher, Gyarados & Exeggutor are 10 levels higher, Arcanine is 11 levels higher, Machamp replaces Rhydon, & all Pokemon have held items.
  Movesets: `-Ice Beam / -Sky Attack / -Rest / -Toxic` | `-ThunderPunch / -Recover / -Psychic / -ShadowBall` | `-Cross Chop / -Rock Slide / -Earthquake / -Body Slam` | `-Hydro Pump / -Double Team / -Body Slam / -Reversal` | `-Leech Seed / -Sleep Powder / -Psychic / -Giga Drain` | `-Flamethrower / -Curse / -Crunch / -ExtremeSpeed`.
  Mapping note: maps/ViridianGym.asm:19

### Route 1

- `MAP_EXACT` -> `SCHOOLBOY, DANNY`: **Schoolboy Danny1760**; cells `55 (+24); 55 (+24); 55 (+24)`; change: Jynx, Magmar, & Electabuzz are 24 levels higher.
  Mapping note: maps/Route1.asm:12

- `MAP_EXACT` -> `COOLTRAINERF, QUINN`: **Cooltrainer Quinn2784**; cells `58 (+20); 58 (+20)`; change: Ivysaur & Starmie are 20 levels higher.
  Mapping note: maps/Route1.asm:23

### Route 21

- `MAP_EXACT` -> `SWIMMERF, NIKKI`: **Swimmer Nikki1160**; cells `58!; 58!; 58 (+30)`; change: Dewgong #2 replaces Seel #1, Cloyster replaces Seel #2, Dewgong is 30 levels higher, & lost 1 Seel.
  Mapping note: maps/Route21.asm:23

- `MAP_EXACT` -> `FISHER, ARNOLD`: **Fisher Arnold / 2440**; cells `61!; 61!`; change: Lanturn replaces Tentacruel, Quagsire is added.
  Mapping note: maps/Route21.asm:34

- `MAP_EXACT` -> `SWIMMERM, SETH`: **Swimmer Seth472**; cells `59 (+28); 59 (+28); 59!`; change: Quagsire #1 & Octillery are 28 levels higher, Gyarados replaces Quagsire #2.
  Mapping note: maps/Route21.asm:12

### Route 20

- `MAP_EXACT` -> `SWIMMERM, CAMERON`: **Swimmer Cameron512**; cells `64!`; change: Azumarill replaces Marill.
  Mapping note: maps/Route20.asm:39

- `MAP_EXACT` -> `SWIMMERF, LORI`: **Swimmer Lori / 1240**; cells `62 (+30); 62 (+30)`; change: Starmie’s are 30 levels higher.
  Mapping note: maps/Route20.asm:28

- `MAP_EXACT` -> `SWIMMERF, NICOLE`: **Swimmer Nicole1260**; cells `60!; 63 (+31)`; change: Mantine replaces Marill #1, Lapras is 31 levels higher, lost 1 Marill.
  Mapping note: maps/Route20.asm:17

### Gym Leader Blaine

- `MAP_EXACT` -> `BLAINE, BLAINE1`: **Blaine / 6700**; cells `66 (+16) / Pink Bow; 65 (+20) / Gold Berry; 66! / Miracle Seed; 65! / Leftovers; 67! / Sharp Beak; 67! / Charcoal`; change: Rapidash is 16 levels higher and in front, Magmar is 20 levels higher, Houndoom, Ninetales, Moltres, & Arcanine are added, and all Pokemon have held items, lost 1 Magcargo.
  Movesets: `-Double-Edge / -Sunny Day / -Fire Blast / -Solarbeam` | `-ThunderPunch / -Fire Blast / -Psychic / -Confuse Ray` | `-Flamethrower / -Sunny Day / -Solarbeam / -Crunch` | `-Fire Blast / -Shadow Ball / -Sunny Day / -Hypnosis` | `-Fire Blast / -Sky Attack / -Solarbeam / -Sunny Day` | `-Crunch / -ExtremeSpeed / -DragonBreath / -Fire Blast`.
  Mapping note: maps/SeafoamGym.asm:23

### Route 19

- `MAP_EXACT` -> `SWIMMERM, TUCKER`: **Swimmer Tucker480**; cells `60!; 60 (+26)`; change: Qwilfish replaces Shellder, Cloyster is 26 levels higher.
  Mapping note: maps/Route19.asm:61

- `MAP_EXACT` -> `SWIMMERF, DAWN`: **Swimmer Dawn1200**; cells `60 (+26)`; change: Seaking is 26 levels higher.
  Mapping note: maps/Route19.asm:28

- `MAP_EXACT` -> `SWIMMERM, HAROLD`: **Swimmer Harold488**; cells `62!; 61 (+31)`; change: Octillery replaces Remoraid, Seadra is 31 levels higher.
  Mapping note: maps/Route19.asm:39

- `MAP_EXACT` -> `SWIMMERM, JEROME`: **Swimmer Jerome464**; cells `58!; 58!; 58 (+28)`; change: Vaporeon replaces Seadra, Seaking replaces Goldeen, & Tentacruel is 28 levels higher, lost 1 Tentacool.
  Mapping note: maps/Route19.asm:50

### Red

- `MAP_EXACT` -> `RED, RED1`: **PKMN Trainer Red7500**; cells `93 (+12) / Light Ball; 75 / Leftovers; 77 / Miracle Seed; 77 / Charcoal; 77 / Quick Claw; 75! / MiracleBerry`; change: Pikachu is 12 levels higher, Mewtwo replaces Espeon, Venusaur, Charizard, & Blastoise are 2 levels lower, and all Pokemon have held items.
  Movesets: `-Thunderbolt / -Surf / -Iron Tail / -Double Team` | `-Amnesia / -Curse / -Body Slam / -Earthquake` | `-Giga Drain / -Body Slam / -Sleep Powder / -Leech Seed` | `-Fire Blast / -Wing Attack / -Outrage / -Steel Wing` | `-Ice Beam / -Hydro Pump / -Body Slam / -Earthquake` | `-Recover / -Submission / -Flamethrower / -Psychic`.
  Mapping note: maps/SilverCaveRoom3.asm:17

## Ignored Regular Trainer Rematch Constants

These are same-name phone/rematch constants that should not be updated in this patch; the base map trainer is the target instead.

- **Route 31 / Bug Catcher Wade / 80**: maps/Route31.asm:26; maps/Route31.asm:60. Ignored regular rematch constants: BUG_CATCHER, WADE2, BUG_CATCHER, WADE3
- **Route 32 / Fisher Ralph320**: maps/Route32.asm:167; maps/Route32.asm:201. Ignored regular rematch constants: FISHER, RALPH2, FISHER, RALPH3
- **Azalea Gym / Twins Amy & May240**: maps/AzaleaGym.asm:71. Ignored regular rematch constants: TWINS, AMYANDMAY2
- **Route 34 / Picnicker Gina / 280**: maps/Route34.asm:171; maps/Route34.asm:205. Ignored regular rematch constants: PICNICKER, GINA2, PICNICKER, GINA3
- **Route 34 / Camper Todd / 300**: maps/Route34.asm:88; maps/Route34.asm:122. Ignored regular rematch constants: CAMPER, TODD2, CAMPER, TODD3
- **Route 35 / Juggler Irwin / 640**: maps/Route35.asm:31; maps/Route35.asm:65. Ignored regular rematch constants: JUGGLER, IRWIN2, JUGGLER, IRWIN3
- **Route 35 / Bug Catcher Arnie / 288**: maps/Route35.asm:158; maps/Route35.asm:192. Ignored regular rematch constants: BUG_CATCHER, ARNIE2, BUG_CATCHER, ARNIE3
- **National Park / PokeFan Beverly1600**: maps/NationalPark.asm:167; maps/NationalPark.asm:201. Ignored regular rematch constants: POKEFANF, BEVERLY2, POKEFANF, BEVERLY3
- **National Park / Schoolboy Jack / 544**: maps/NationalPark.asm:73; maps/NationalPark.asm:107. Ignored regular rematch constants: SCHOOLBOY, JACK2, SCHOOLBOY, JACK3
- **Route 36 / Schoolboy Alan / 640**: maps/Route36.asm:116; maps/Route36.asm:150. Ignored regular rematch constants: SCHOOLBOY, ALAN2, SCHOOLBOY, ALAN3
- **Route 37 / Twins Ann & Anne360**: maps/Route37.asm:27. Ignored regular rematch constants: TWINS, ANNANDANNE2
- **Route 38 / Lass Dana / 480**: maps/Route38.asm:37; maps/Route38.asm:71. Ignored regular rematch constants: LASS, DANA2, LASS, DANA3
- **Route 38 / Schoolboy Chad / 704**: maps/Route38.asm:120; maps/Route38.asm:154. Ignored regular rematch constants: SCHOOLBOY, CHAD2, SCHOOLBOY, CHAD3
- **Route 39 / PokeFan Derek1760**: maps/Route39.asm:26; maps/Route39.asm:60. Ignored regular rematch constants: POKEFANM, DEREK2, POKEFANM, DEREK3
- **Olivine Lighthouse / Sailor Huey / 880**: maps/OlivineLighthouse2F.asm:22; maps/OlivineLighthouse2F.asm:56. Ignored regular rematch constants: SAILOR, HUEY2, SAILOR, HUEY3
- **Route 43 / Picnicker Tiffany / 580**: maps/Route43.asm:196. Ignored regular rematch constants: PICNICKER, TIFFANY2, PICNICKER, TIFFANY3
- **Route 43 / PokeManiac Brent / 1560**: maps/Route43.asm:50; maps/Route43.asm:84. Ignored regular rematch constants: POKEMANIAC, BRENT2, POKEMANIAC, BRENT3
- **Route 44 / Fisher Wilton / 1440**: maps/Route44.asm:113; maps/Route44.asm:147. Ignored regular rematch constants: FISHER, WILTON2, FISHER, WILTON3
- **Route 44 / Bird Keeper Vance / 888**: maps/Route44.asm:19; maps/Route44.asm:53. Ignored regular rematch constants: BIRD_KEEPER, VANCE2, BIRD_KEEPER, VANCE3
- **Route 45 / Hiker Parry / 1216**: maps/Route45.asm:167. Ignored regular rematch constants: HIKER, PARRY2, HIKER, PARRY3
- **Route 45 / Black Belt Kenji / 864**: maps/Route45.asm:62. Ignored regular rematch constants: BLACKBELT_T, KENJI2, BLACKBELT_T, KENJI3
- **Route 46 / Picnicker Erin / 800**: maps/Route46.asm:26; maps/Route46.asm:60. Ignored regular rematch constants: PICNICKER, ERIN2, PICNICKER, ERIN3
- **Route 27 / Bird Keeper Jose / 1056**: maps/Route27.asm:102. Ignored regular rematch constants: BIRD_KEEPER, JOSE2, BIRD_KEEPER, JOSE3
- **Route 27 / Cooltrainer Reena / 2160**: maps/Route27.asm:166; maps/Route27.asm:200. Ignored regular rematch constants: COOLTRAINERF, REENA2, COOLTRAINERF, REENA3
- **Route 26 / Cooltrainer Gaven / 2112**: maps/Route26.asm:69. Ignored regular rematch constants: COOLTRAINERM, GAVEN2, COOLTRAINERM, GAVEN3
- **Route 26 / Cooltrainer Beth / 2160**: maps/Route26.asm:122; maps/Route26.asm:156. Ignored regular rematch constants: COOLTRAINERF, BETH2, COOLTRAINERF, BETH3
- **S.S. Aqua: First Trip / Twins Meg & Peg 1080**: maps/FastShipCabins_SE_SSE_CaptainsCabin.asm:143. Ignored regular rematch constants: TWINS, MEGANDPEG2

## Unresolved Rows To Review

Rows below should not be patched without manual review.

- `MAP_INFERRED_BY_BEST_SPECIES` **Slowpoke Well / Rocket Grunt #1 (Slowpoke) / 360**: Zubat replaces Rattata #2. Mapping note: Best species overlap in Slowpoke Well: RATTATA, ZUBAT; review before patching. Bindings: maps/SlowpokeWellB1F.asm:75
- `MAP_INFERRED_BY_BEST_SPECIES` **Slowpoke Well / Rocket Eto / (Slowpoke) / 440**: Is now named. Elekid replaces Rattata, Smoochum replaces Zubat #1, Magby replaces Zubat #2. Mapping note: Best species overlap in Slowpoke Well: RATTATA, ZUBAT; review before patching. Bindings: maps/SlowpokeWellB1F.asm:75
- `UNRESOLVED_NO_CANDIDATES` **Ilex Forest / Bug Catcher Wayne240**: Paras is now 5 levels higher and in front, Oddish replaces Ledyba. Mapping note: No map-bound trainers found for section.
- `UNRESOLVED_SECTION_CANDIDATES` **Ecruteak City / Kimono Girl Naoko1512 / Kimono Girl Sayo1512 / Kimono Girl Zuki1512 / Kimono Girl Kuni1512 / Kimono Girl Miki1512**: Eeveelutions are 4 levels higher. Mapping note: No confident species/name match. Section has candidates: KIMONO_GIRL, NAOKO, KIMONO_GIRL, SAYO, KIMONO_GIRL, ZUKI, KIMONO_GIRL, KUNI, KIMONO_GIRL, MIKI
- `UNRESOLVED_SECTION_CANDIDATES` **Ecruteak City / Sage Gaku / 1280**: Noctowl & Flareon are 8 levels higher, Victreebel is added. Mapping note: No confident species/name match. Section has candidates: KIMONO_GIRL, NAOKO, KIMONO_GIRL, SAYO, KIMONO_GIRL, ZUKI, KIMONO_GIRL, KUNI, KIMONO_GIRL, MIKI
- `UNRESOLVED_SECTION_CANDIDATES` **Ecruteak City / Sage Masa / 1280**: Noctowl & Jolteon are 8 levels higher, Victreebel is added. Mapping note: No confident species/name match. Section has candidates: KIMONO_GIRL, NAOKO, KIMONO_GIRL, SAYO, KIMONO_GIRL, ZUKI, KIMONO_GIRL, KUNI, KIMONO_GIRL, MIKI
- `UNRESOLVED_SECTION_CANDIDATES` **Ecruteak City / Sage Koji / 1280**: Noctowl & Vaporeon are 8 levels higher, Victreebel is added. Mapping note: No confident species/name match. Section has candidates: KIMONO_GIRL, NAOKO, KIMONO_GIRL, SAYO, KIMONO_GIRL, ZUKI, KIMONO_GIRL, KUNI, KIMONO_GIRL, MIKI
- `UNRESOLVED_SECTION_CANDIDATES` **Route 38 / Beauty Olivia / 1848**: Corsola is now 2 levels higher. Mapping note: No confident species/name match. Section has candidates: BIRD_KEEPER, TOBY, SAILOR, HARRY, LASS, DANA1, LASS, DANA2, LASS, DANA3, SCHOOLBOY, CHAD1, SCHOOLBOY, CHAD2, SCHOOLBOY, CHAD3, BEAUTY, VALERIE
- `UNRESOLVED_SECTION_CANDIDATES` **Route 39 / PokeFan Jaime1600**: Umbreon replaces Meowth. Mapping note: No confident species/name match. Section has candidates: POKEFANM, DEREK1, POKEFANM, DEREK2, POKEFANM, DEREK3, POKEFANF, RUTH, SAILOR, EUGENE, PSYCHIC_T, NORMAN
- `UNRESOLVED_NO_CANDIDATES` **Eusine / Mysticalman Eusine2700**: Politoed replaces Haunter and is now in front, Flaaffy replaces Electrode, Hypno replaces Drowzee. Mapping note: No map-bound trainers found for section.
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Route 42 / Fisher Tully / 960**: Qwilfish is 6 levels higher. Mapping note: FISHER, CHRIS1 (QWILFISH), FISHER, CHRIS2 (QWILFISH), FISHER, CHRIS3 (QWILFISH)
- `UNRESOLVED_SECTION_CANDIDATES` **Mt. Mortar / PokeManiac Miller1200**: Pokemon are 3 levels higher. Mapping note: No confident species/name match. Section has candidates: BLACKBELT_T, KIYO
- `MAP_INFERRED_BY_BEST_SPECIES` **Team Rocket Hideout / Rocket Guard #1 1040**: Drowzee is 9 levels higher, Gligar replaces Zubat. Mapping note: Best species overlap in Team Rocket Hideout: DROWZEE, ZUBAT; review before patching. Bindings: maps/TeamRocketBaseB1F.asm:239
- `MAP_INFERRED_BY_BEST_SPECIES` **Team Rocket Hideout / Rocket Guard #21080**: Golbat replaces Zubat, Ariados replaces Grimer, Raticate replaces Rattata. Mapping note: Best species overlap in Team Rocket Hideout: GRIMER, RATTATA, ZUBAT; review before patching. Bindings: maps/TeamRocketBaseB1F.asm:252
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Team Rocket Hideout / Rocket Grunt #1 (HQ B1F) / 1120**: Kangaskhan replaces Rattata #1, lost 4 Rattata. Mapping note: GRUNTM, GRUNTM_16 (RATTATA), GRUNTM, GRUNTM_18 (RATTATA), GRUNTM, GRUNTM_21 (RATTATA)
- `MAP_INFERRED_BY_BEST_SPECIES` **Team Rocket Hideout / Rocket Grunt #3 (HQ B2F) / 1040**: Raticate replaces Rattata #1, Golbat replaces Zubat, Grimer replaces Rattata #2. Mapping note: Best species overlap in Team Rocket Hideout: GRIMER, RATTATA, ZUBAT; review before patching. Bindings: maps/TeamRocketBaseB1F.asm:252
- `MAP_INFERRED_BY_BEST_SPECIES` **Rocket Executive Ariana #1 / Exec. Ariana (Rocket HQ) / 2232**: Is now named. Arbok is 8 levels higher, Meowth is added, Murkrow is 6 levels higher, Vileplume replaces Gloom. Mapping note: Best species overlap in Rocket Executive Ariana #1: ARBOK, GLOOM, MURKROW; review before patching. Bindings: maps/TeamRocketBaseB2F.asm:98
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Rocket Executive Ariana #1 / Rocket Grunt #1 (HQ B3F) / 1120**: Arbok replaces Ekans, Sneasel replaces Gloom. Mapping note: EXECUTIVEF, EXECUTIVEF_2 (ARBOK/GLOOM), GRUNTF, GRUNTF_5 (EKANS/GLOOM)
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Rocket Executive Ariana #1 / Rocket Eto / (Rocket HQ) / 1120**: Is now named. Jynx replaces Raticate, Electabuzz, Magmar, & Poliwhirl are added. Mapping note: EXECUTIVEM, EXECUTIVEM_4 (RATICATE), GRUNTM, GRUNTM_28 (RATICATE)
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Radio Tower / Rocket Grunt #1 (Radio 1F) / 1320**: Raticate’s are 9 levels higher, Raticate #3 is added. Mapping note: GRUNTM, GRUNTM_3 (RATICATE), GRUNTM, GRUNTM_9 (RATICATE)
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Radio Tower / Rocket Grunt #1 (Radio 2F) / 1400**: Arbok is 9 levels higher, Gloom is added. Mapping note: EXECUTIVEF, EXECUTIVEF_1 (ARBOK), GRUNTF, GRUNTF_2 (ARBOK), GRUNTF, GRUNTF_4 (GLOOM)
- `MAP_INFERRED_BY_BEST_SPECIES` **Radio Tower / Rocket Grunt #2 (Radio 2F) / 1360**: Aipom replaces Rattata #1, Aipom replaces Rattata #2, Koffing replaces Rattata #3, lost 2 Rattata. Mapping note: Best species overlap in Radio Tower: KOFFING, RATTATA; review before patching. Bindings: maps/RadioTower3F.asm:84
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Radio Tower / Rocket Grunt #3 (Radio 2F) / 1360**: Gligar replaces Zubat #1, Hypno replaces Zubat #2 Mapping note: GRUNTM, GRUNTM_10 (ZUBAT), GRUNTM, GRUNTM_6 (ZUBAT), GRUNTM, GRUNTM_7 (ZUBAT)
- `MAP_INFERRED_BY_BEST_SPECIES` **Radio Tower / Rocket Grunt #4 (Radio 2F) / 1320**: Weezing replaces Grimer #1, Muk is 8 levels higher, lost 1 Grimer. Mapping note: Best species overlap in Radio Tower: GRIMER, MUK; review before patching. Bindings: maps/RadioTower2F.asm:54
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Radio Tower / Rocket Grunt #1 (Radio 3F) / 1360**: Muk replaces Weezing, Venomoth is added. Mapping note: EXECUTIVEM, EXECUTIVEM_3 (WEEZING), GRUNTM, GRUNTM_4 (MUK), GRUNTM, GRUNTM_8 (WEEZING)
- `MAP_INFERRED_BY_BEST_SPECIES` **Radio Tower / Rocket Grunt #2 (Radio 3F) / 1360**: Aipom replaces Koffing, Murkrow replaces Zubat, Forretress replaces Rattata, lost 1 Grimer. Mapping note: Best species overlap in Radio Tower: GRIMER, KOFFING, RATTATA, ZUBAT; review before patching. Bindings: maps/RadioTower3F.asm:84
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Radio Tower / Rocket Grunt #3 (Radio 3F) / (Key Card) / 1400**: Tauros replaces Koffing #1, Slowbro replaces Koffing #2. Mapping note: EXECUTIVEM, EXECUTIVEM_1 (KOFFING), EXECUTIVEM, EXECUTIVEM_3 (KOFFING), GRUNTM, GRUNTM_7 (KOFFING), GRUNTM, GRUNTM_9 (KOFFING)
- `MAP_INFERRED_BY_BEST_SPECIES` **Radio Tower / Rocket Grunt #1 (Radio 4F) / 1400**: Exeggutor replaces Zubat, Electrode replaces Golbat, Electabuzz replaces Grimer. Mapping note: Best species overlap in Radio Tower: GOLBAT, GRIMER, ZUBAT; review before patching. Bindings: maps/RadioTower4F.asm:57
- `MAP_INFERRED_BY_BEST_SPECIES` **Radio Tower / Rocket Grunt #2 (Radio 2F) (Key Card) / 1440**: Arbok replaces Ekans #1, Gloom is 11 levels higher and second, Ariados replaces Oddish, Vileplume replaces Ekans #2. Mapping note: Best species overlap in Radio Tower: EKANS, GLOOM, ODDISH; review before patching. Bindings: maps/RadioTower4F.asm:79
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Radio Tower / Rocket Executive / (Key Card) / 2736**: Forretress replaces Golbat, Cloyster, Pupitar, & Magcargo are added. Mapping note: EXECUTIVEM, EXECUTIVEM_2 (GOLBAT), GRUNTM, GRUNTM_10 (GOLBAT)
- `MAP_INFERRED_BY_BEST_SPECIES` **Rocket Executive (Imposter) / Rocket Executive (Radio Tower) / 2736**: Complete team rework. Weezing is 4 levels higher and in 2nd, Muk, Nidoqueen, Nidoking, & Rhydon added, lost 5 Koffing’s. Mapping note: Best species overlap in Rocket Executive (Imposter): KOFFING, WEEZING; review before patching. Bindings: maps/RadioTower5F.asm:39
- `MAP_INFERRED_BY_BEST_SPECIES` **Rocket Executive Archer #2 / Exec. Archer (Radio Tower) / 4000**: Complete team rework. Kangaskhan, Nidoqueen, Persian, Steelix, & Nidoking are added, lost 1 Houndour, Koffing, & Houndoom. Mapping note: Best species overlap in Rocket Executive Archer #2: HOUNDOOM, HOUNDOUR, KOFFING; review before patching. Bindings: maps/RadioTower5F.asm:88
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Goldenrod Tunnel / Rocket Grunt #1 (Tunnel) / 1480**: Golbat replaces Rattata, Weezing added. Mapping note: GRUNTM, GRUNTM_11 (RATTATA), GRUNTM, GRUNTM_13 (RATTATA), RIVAL1, RIVAL1_4_CHIKORITA (GOLBAT), RIVAL1, RIVAL1_4_CYNDAQUIL (GOLBAT), RIVAL1, RIVAL1_4_TOTODILE (GOLBAT)
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Goldenrod Tunnel / Rocket Grunt #2 (Tunnel) / 1480**: Golbat is added and in front, Muk is 13 levels higher. Mapping note: GRUNTM, GRUNTM_11 (MUK), GRUNTM, GRUNTM_25 (MUK), RIVAL1, RIVAL1_4_CHIKORITA (GOLBAT), RIVAL1, RIVAL1_4_CYNDAQUIL (GOLBAT), RIVAL1, RIVAL1_4_TOTODILE (GOLBAT)
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Goldenrod Tunnel / Rocket Grunt #3 (Tunnel) / 1480**: Golbat replaces Koffing, Arbok replaces Muk. Mapping note: GRUNTM, GRUNTM_11 (KOFFING/MUK), GRUNTM, GRUNTM_25 (KOFFING/MUK), BURGLAR, DUNCAN (KOFFING), BURGLAR, EDDIE (KOFFING), RIVAL1, RIVAL1_4_CHIKORITA (GOLBAT), RIVAL1, RIVAL1_4_CYNDAQUIL (GOLBAT), RIVAL1, RIVAL1_4_TOTODILE (GOLBAT)
- `MAP_INFERRED_BY_BEST_SPECIES` **Goldenrod Warehouse / Rocket Grunt #1 (Warehou.) / 1400**: Weezing replaces Raticate, Hypno replaces Golbat, Gligar is added. Mapping note: Best species overlap in Goldenrod Warehouse: GOLBAT, RATICATE; review before patching. Bindings: maps/GoldenrodUndergroundWarehouse.asm:47
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Goldenrod Warehouse / Rocket Grunt #2 (Warehou.) / 1480**: Weezing replaces Koffing #1, lost 1 Koffing. Mapping note: GRUNTM, GRUNTM_15 (WEEZING), GRUNTM, GRUNTM_24 (KOFFING)
- `UNRESOLVED_NO_CANDIDATES` **Dragon’s Den / Cooltrainer Darin2016**: Dragonair #1 is 5 levels higher, 3 Dragonair’s are added. Mapping note: No map-bound trainers found for section.
- `UNRESOLVED_NO_CANDIDATES` **Dragon’s Den / Cooltrainer Cara2016**: Seadra #1 is 5 levels higher and in front,  Seadra #2 replaces Horsea #1, Gyarados replaces Horsea #2. Mapping note: No map-bound trainers found for section.
- `UNRESOLVED_NO_CANDIDATES` **Dragon’s Den / Twins Lea & Pia840**: Dragonair #1 & #2 replace Dratini #1 & #2, & 2 Gyarados’s are added. Mapping note: No map-bound trainers found for section.
- `UNRESOLVED_SECTION_CANDIDATES` **Route 45 / Camper Quentin760**: Fearow, Primeape, & Tauros are 8 levels higher., & Raichu is added. Mapping note: No confident species/name match. Section has candidates: BLACKBELT_T, KENJI3, BLACKBELT_T, KENJI1, BLACKBELT_T, KENJI2, HIKER, ERIK, HIKER, MICHAEL, HIKER, PARRY3, HIKER, PARRY1, HIKER, PARRY2, HIKER, TIMOTHY, COOLTRAINERM, RYAN, COOLTRAINERF, KELLY
- `UNRESOLVED_NO_CANDIDATES` **Route 6 / PokeFan Rex / 4400**: Stantler replaces Phanpy. Mapping note: No map-bound trainers found for section.
- `UNRESOLVED_NO_CANDIDATES` **Route 6 / PokeFan Allan4400**: Granbull replaces Teddiursa. Mapping note: No map-bound trainers found for section.
- `UNRESOLVED_MULTI_SPECIES_MATCH` **Celadon Gym / Twins Joe & Zoe1160**: Victreebel & Vileplume are 23 levels higher. Mapping note: TWINS, JOANDZOE1 (VICTREEBEL/VILEPLUME), TWINS, JOANDZOE2 (VICTREEBEL/VILEPLUME), ERIKA, ERIKA1 (VICTREEBEL)

## Summary

- `MAP_EXACT`: 256
- `MAP_EXACT_IGNORE_REMATCHES`: 27
- `MAP_INFERRED_BY_BEST_SPECIES`: 14
- `MAP_INFERRED_BY_SECTION_SPECIES`: 8
- `MAP_RIVAL_VARIANTS`: 6
- `UNRESOLVED_MULTI_SPECIES_MATCH`: 15
- `UNRESOLVED_NO_CANDIDATES`: 7
- `UNRESOLVED_SECTION_CANDIDATES`: 8
