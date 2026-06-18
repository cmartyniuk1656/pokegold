# Trainer Change Requirements

Source: Google Doc `1DoLkGTxL1kqEeZYKip1TJiXfdK_WUXe1_MsculSPpiA`.
Generated from `trainer_changes_source.html` on 2026-06-16.

## Reading Notes

- This is a requirements/planning document only. No trainer data is implemented here.
- The Google Doc uses image-only Pokemon cells. The parser preserves trainer names, target level/item cells, moveset cells, `Changes:` prose, and notes, but not every Pokemon species image. For implementation, treat each row as a delta against the current trainer party and use the `Changes:` text as the source of species changes.
- `!`, `(+N)`, and `(-N)` are copied from the source document. They are source annotations, not assembler syntax.
- Held items are recorded when they appear in the level/item cell or in `Changes:`.
- Existing data lives primarily in `data/trainers/parties.asm`; trainer constants are in `constants/trainer_constants.asm`; map bindings are in `maps/*.asm`.

## Scope Decisions

- Rematches are deferred. Do not implement the rematch system in this patch; use the rematch appendix as future source data.
- Jasmine, Chuck, and Pryce have badge-count variants. These are implemented by selecting a party from the player's current badge count before battle.
- Current `FalknerGroup` and `BugsyGroup` are already custom in this repo and do not cleanly match the source document. Keep the current custom teams; do not overwrite or merge them with the source document.
- Renamed or newly added trainers from the source hack are not in scope. For Rocket entries, map to existing game trainers by area and current party where possible; do not introduce new Rocket characters.
- If source species/order cannot be inferred from current party plus the `Changes:` text, only patch the reliable part of the change and document the uncertainty.

## Variable Gym Work

- `Jasmine`: use `JASMINE1` below 6 badges and `JASMINE2` at 6+ badges.
- `Chuck`: use `CHUCK1` below 5 badges, `CHUCK2` at 5 badges, and `CHUCK3` at 6+ badges.
- `Pryce`: use `PRYCE1` below 5 badges, `PRYCE2` at 5 badges, and `PRYCE3` at 6+ badges.

## Pending Implementation Requirements

### Rival Battles

- **Rival #2 (Chikorita) / 1080**: target cells `15 (+1); 16!; 18 (+2)`. Zubat is 1 level higher and now in front, Larvitar replaces Gastly, Bayleef, Quilava, or Croconaw respectively are 2 levels higher. Unable to map automatically to an existing trainer constant.
  Movesets: `-Leech Life / -Supersonic / -Gust / -Bite` | `-Bite / -Rock Throw / -Sandstorm / -Screech` | `-Scratch / -Leer / -Rage / -Water Gun`.

- **Rival #3 (Chikorita) / 1440**: target cells `22!; 23!; 22!; 24 (+2)`. Team rework. Golbat replaces Zubat, Starter Pokemon are 2 levels higher, Larvitar & either Remoraid, Weepinbell, or Houndour are added, lost Haunter & Magnemite. Unable to map automatically to an existing trainer constant.
  Movesets: `-Bite / -Rock Throw / -Screech / -` | `-Ember / -Bite / -Smog / -Roar` | `-Bite / -Confuse Ray / -Leech Life / -Gust` | `-Bite / -Ice Punch / -Water Gun / -Mud-Slap`.

- **Rival #4 (Chikorita) / 2400**: target cells `39!; 38!; 39!; 39 (+9); 40 (+8)`. Team rework. Golbat is 9 levels higher, Meganium & Feraligatr are 8 levels higher, Pupitar & either Octillery & Houndoom, Victreebel & Octillery, or Houndoom & Victreebel are added, lost  Magnemite, Haunter, & Sneasel, Typhlosion replaces Quilava in Rival (Cyndaquil). Unable to map automatically to an existing trainer constant.
  Movesets: `-Thrash / -Rock Slide / -Screech / -Bite` | `-Flamethrower / -Iron Tail / -Bite / -Double Team` | `-Sludge / -Razor Leaf / -Sleep Powder / -Growth` | `-Toxic / -Double Team / -Confuse Ray / -Wing Attack` | `-Ice Punch / -Surf / -Slash / -Bite`.

- **Rival #5 (Chikorita) / 2880**: target cells `45! / MiracleBerry; 46! / Quick Claw; 46!; 45 (+9); 47 (+9) / Miracle Seed; 48!`. Team rework. Golbat & Starter Pokemon are 9 levels higher, Ursaring, Tyranitar, & either Octillery & Houndoom,Victreebel & Octillery, or Houndoom & Victreebel are added, lost Sneasel, Magneton, Haunter, & Kadabra, and some Pokemon have held items. Unable to map automatically to an existing trainer constant.
  Movesets: `-Slash / -Faint Attack / -Rock Smash / -Rest` | `-Flamethrower / -Iron Tail / -Crunch / -Double Team` | `-Sludge Bomb / -Giga Drain / -Sleep Powder / -Growth` | `-Toxic / -Double Team / -Confuse Ray / -Wing Attack` | `-Ice Punch / -Surf / -Slash / -Bite` | `-Crunch / -Earthquake / -Rock Slide / -Fire Punch`.

- **Rival #6 (Chikorita) / 6400**: target cells `64! / Scope Lens; 64! / Nevermeltice; 64! / Charcoal; 64! / Leftovers; 64 (+19) / Miracle Seed; 64! / Quick Claw`. Team rework. Starter Pokemon are 19 levels higher, Ursaring, Crobat, Tyranitar, & either Octillery & Houndoom, Victreebel & Octillery, or Houndoom & Victreebel are added, lost Sneasel, Golbat, Magneton, Haunter, & Kadabra, and all Pokemon have held items. Unable to map automatically to an existing trainer constant.
  Movesets: `-Slash / -Faint Attack / -Rock Smash / -Hyper Beam` | `-Fire Blast / -Iron Tail / -Crunch / -Double Team` | `-Sludge Bomb / -Razor Leaf / -Sleep Powder / -Growth` | `-Toxic / -Double Team / -Confuse Ray / -Wing Attack` | `-Ice Beam / -Surf / -Slash / -Earthquake` | `-Crunch / -Earthquake / -Rock Slide / -Fire Blast`.

- **Rival #7 (Chikorita) / 6800**: target cells `68! / Scope Lens; 68! / Nevermeltice; 68! / Charcoal; 68 (+20) / Leftovers; 68 (+18) / Miracle Seed; 68! / Quick Claw`. Team rework. Starter Pokemon are 18 levels higher, Crobat is 20 levels higher, Ursaring, Tyranitar, & either Octillery & Houndoom, Victreebel & Octillery, or Houndoom & Victreebel are added, lost Sneasel, Magneton, Haunter, & Kadabra, and all Pokemon have held items. Unable to map automatically to an existing trainer constant.
  Movesets: `-Slash / -Faint Attack / -Rock Smash / -Hyper Beam` | `-Flamethrower / -Iron Tail / -Crunch / -Double Team` | `-Sludge Bomb / -Razor Leaf / -Sleep Powder / -Growth` | `-Toxic / -Double Team / -Confuse Ray / -Fly` | `-Surf / -Ice Punch / -Slash / -Earthquake` | `-Crunch / -Earthquake / -Rock Slide / -Fire Blast`.

### Route 30

- **Youngster Mikey64**: target cells `2!; 4!`. Hoothoot replaces Pidgey, Sentret replaces Pidgey. Current mapping: `Youngster` `YOUNGSTER` (MIKEY).

- **Bug Catcher Don48**: target cells `3!; 3!`. Ledyba replaces Caterpie, Spinarak replaces Weedle. Current mapping: `BugCatcher` `BUG_CATCHER` (DON).

### Route 31

- **Bug Catcher Wade / 80**: target cells `4 (+1); 5!`. Pineco replaces Caterpie, lost 2 Caterpie. Mapping ambiguous: `BugCatcher` `BUG_CATCHER`, `BugCatcher` `BUG_CATCHER`, `BugCatcher` `BUG_CATCHER`.

### Sprout Tower

- **Sage Nico / 96**: target cells `3; 4!; 3`. Hoppip replaces Bellsprout #2. Current mapping: `Sage` `SAGE` (NICO).

- **Sage Chow / 96**: target cells `3; 3!; 3`. Sunkern replaces Bellsprout #2. Current mapping: `Sage` `SAGE` (CHOW).

- **Sage Troy / 224**: target cells `7!; 7`. Hoppip replaces Hoothoot, Bellsprout is now second. Current mapping: `Sage` `SAGE` (TROY).

- **Sage Li / 288**: target cells `7!; 8!; 9 (+2)`. Oddish replaces Bellsprout #1, Sunkern replaces Hoothoot, Bellsprout #2 is now third. Current mapping: `Sage` `SAGE` (LI).

### Violet Gym

- **Bird Keeper Rod168**: target cells `7; 7!`. Natu replaces Pidgey #2. Current mapping: `BirdKeeper` `BIRD_KEEPER` (ROD).

### Route 32

- **Youngster Albert112**: target cells `7!; 7 (-1)`. Sentret replaces Rattata. Current mapping: `Youngster` `YOUNGSTER` (ALBERT).

- **Fisher Henry / 280**: target cells `7!; 7 (-1)`. Marill replaces Poliwag #1. Current mapping: `Fisher` `FISHER` (HENRY).

- **Fisher Justin / 280**: target cells `7!`. Tentacool replaces Magikarp #1, lost 3 Magikarp. Current mapping: `Fisher` `FISHER` (JUSTIN).

- **Fisher Ralph320**: target cells `8 (-2)`. Goldeen is 2 levels lower. Mapping ambiguous: `Fisher` `FISHER`, `Fisher` `FISHER`, `Fisher` `FISHER`.

- **Bird Keeper Peter192**: target cells `8; 8!`. Spearow is now first, Natu replaces Pidgey, lost 1 Pidgey. Current mapping: `BirdKeeper` `BIRD_KEEPER` (PETER).

### Union Cave

- **Hiker Russel / 256**: target cells `9 (+1); 8!`. Geodude is 1 level higher, Cubone replaces Geodude #2, lost 1 Geodude. Unable to map automatically to an existing trainer constant.

- **Firebreather Bill528**: target cells `11!`. Growlithe replaces Koffing, lost 1 Koffing. Current mapping: `Firebreather` `FIREBREATHER` (BILL).

- **PokeManiac Larry600**: target cells `10!`. Larvitar replaces Slowpoke. Current mapping: `Pokemaniac` `POKEMANIAC` (LARRY).

- **Cooltrainer Gwen1200**: target cells `26; 24 (+2); 25 (+3); 23 (+1)`. Vaporeon is 2 levels higher, Jolteon is 3 levels higher, Flareon is 1 level higher. Current mapping: `CooltrainerF` `COOLTRAINERF` (GWEN).

### Slowpoke Well

- **Rocket Grunt #1 (Slowpoke) / 360**: target cells `9; 9!`. Zubat replaces Rattata #2. Unable to map automatically to an existing trainer constant.

- **Rocket Eto / (Slowpoke) / 440**: target cells `11!; 11!; 11!`. Is now named. Elekid replaces Rattata, Smoochum replaces Zubat #1, Magby replaces Zubat #2. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #3 (Slowpoke) / 600**: target cells `12 (-2); 13!; 15!`. Koffing is 2 levels lower, Slowpoke & Houndour are added. Unable to map automatically to an existing trainer constant.

### Azalea Gym

- **Twins Amy & May240**: target cells `12 (+2); 12 (+2)`. Ledyba & Spinarak are 2 levels higher. Mapping ambiguous: `Twins` `TWINS`, `Twins` `TWINS`.

- **Bug Catcher Al192**: target cells `9!; 12!`. Metapod replaces Caterpie, Butterfree replaces Weedle. Current mapping: `BugCatcher` `BUG_CATCHER` (AL).

- **Bug Catcher Benny192**: target cells `9; 12`. Lost 1 Weedle. Current mapping: `BugCatcher` `BUG_CATCHER` (BENNY).

- **Bug Catcher Josh192**: target cells `12!`. Yanma replaces Paras. Current mapping: `BugCatcher` `BUG_CATCHER` (JOSH).

### Ilex Forest

- **Bug Catcher Wayne240**: target cells `15 (+5); 15!`. Paras is now 5 levels higher and in front, Oddish replaces Ledyba. Unable to map automatically to an existing trainer constant.

### Route 34

- **Youngster Samuel192**: target cells `12!; 10; 12 (+4)`. Teddiursa replaces Rattata, Spearow is 4 levels higher, Lost 1 Spearow. Current mapping: `Youngster` `YOUNGSTER` (SAMUEL).

- **PokeFan Brandon / 1200**: target cells `15 (+2) / Berry`. Snubbull is 2 levels higher. Current mapping: `PokefanM` `POKEFANM` (BRANDON).

- **Picnicker Gina / 280**: target cells `14!; 14 (+2)`. Skiploom replaces Hoppip, Bulbasaur is 2 levels higher, Lost 1 Hoppip. Mapping ambiguous: `Picnicker` `PICNICKER`, `Picnicker` `PICNICKER`, `Picnicker` `PICNICKER`.

- **Youngster Ian224**: target cells `12 (+2); 14 (+2)`. Mankey & Diglett are 2 levels higher. Current mapping: `Youngster` `YOUNGSTER` (IAN).

- **Camper Todd / 300**: target cells `15!`. Azumarill replaces Psyduck. Mapping ambiguous: `Camper` `CAMPER`, `Camper` `CAMPER`, `Camper` `CAMPER`.

- **Officer Keith / 640**: target cells `16 (-1)`. Growlithe is 1 level lower. Current mapping: `Officer` `OFFICER` (KEITH).
  Notes: Can only be fought at nighttime.

### Goldenrod Tunnel

- **PokeManiac Donald900**: target cells `15 (+5); 15 (+5)`. Slowpokes are 5 levels higher. Current mapping: `Pokemaniac` `POKEMANIAC` (DONALD).

- **Super Nerd Teru448**: target cells `14 (+3); 14 (+5); 14!`. Voltorb is 3 levels higher, Magnemite is 5 levels higher, Porygon replaces Magnemite #2, lost 1 Magnemite. Current mapping: `SuperNerd` `SUPER_NERD` (TERU).

- **PokeManiac Issac840**: target cells `14 (+2)`. Lickitung is 2 levels higher. Current mapping: `Pokemaniac` `POKEMANIAC` (ISSAC).

- **Super Nerd Eric480**: target cells `15 (+4); 15!`. Grimer is 5 levels higher, Cubone replaces Grimer #2. Mapping ambiguous: `SuperNerd` `SUPER_NERD`, `SuperNerd` `SUPER_NERD`.

### Goldenrod Gym

- **Beauty Victoria1496**: target cells `15!; 17!`. Teddiursa replaces Sentret #1, Furret replaces Sentret #2, Lost 1 Sentret. Current mapping: `Beauty` `BEAUTY` (VICTORIA).

- **Beauty Samantha / 1584**: target cells `18 (+2)`. Meowth is 2 levels higher, lost 1 Meowth. Current mapping: `Beauty` `BEAUTY` (SAMANTHA).

- **Lass Bridget / 384**: target cells `16!; 16!`. Jigglypuff #1 replaced with Aipom, Jigglypuff #2 replaced with Togepi, lost 1 Jigglypuff. Current mapping: `Lass` `LASS` (BRIDGET).

### Gym Leader Whitney

- **Whitney / 2100**: target cells `20 (+2); 20!; 21 (+1) / MiracleBerry`. Teddiursa is added, Miltank now has a held MiracleBerry. Current mapping: `Whitney` `WHITNEY` (WHITNEY).
  Movesets: `-Headbutt / -Charm / -Ice Punch / -Metronome` | `-Headbutt / -Metal Claw / -Lick / -Mud-Slap` | `-Rollout / -Attract / -Stomp / -Milk Drink`.

### Route 35

- **Picnicker Kim / 360**: target cells `18 (+3)`. Vulpix is 3 levels higher. Current mapping: `Picnicker` `PICNICKER` (KIM).

- **Camper Elliot320**: target cells `16 (+3); 16 (+1)`. Sandshrew is 3 levels higher, Marill is 1 level higher. Current mapping: `Camper` `CAMPER` (ELLIOT).

- **Picnicker Brooke360**: target cells `18 (+2)`. Pikachu is 2 levels higher. Current mapping: `Picnicker` `PICNICKER` (BROOKE).

- **Camper Ivan / 320**: target cells `16!; 16 (+2)`. Eevee replaces Diglett #1, Diglett #2 is 2 levels higher, lost 1 Zubat. Current mapping: `Camper` `CAMPER` (IVAN).

- **Firebreather Walt720**: target cells `15 (+2); 15 (+2)`. Magmar’s are 2 levels higher. Current mapping: `Firebreather` `FIREBREATHER` (WALT).

- **Juggler Irwin / 640**: target cells `16 (+2); 16!; 16 (+2)`. Voltorbs are 2 levels higher, Pineco replaces Voltorb #2, lost 1 Voltorb. Mapping ambiguous: `Juggler` `JUGGLER`, `Juggler` `JUGGLER`, `Juggler` `JUGGLER`.

- **Officer Dirk / 640**: target cells `16 (+2); 16!`. Growlithe #1 is 2 levels higher, Houndour replaces Growlithe #2. Current mapping: `Officer` `OFFICER` (DIRK).
  Notes: Can only be fought at nighttime.

- **Bug Catcher Arnie / 288**: target cells `18!; 18 (+3)`. Venonat is 3 levels higher and not in front, & Yanma is added. Mapping ambiguous: `BugCatcher` `BUG_CATCHER`, `BugCatcher` `BUG_CATCHER`, `BugCatcher` `BUG_CATCHER`.

- **Bird Keeper Bryan432**: target cells `16 (+4); 18!; 18 (+4)`. Pidgey & Pidgeotto are 4 levels higher, Spearow is added. Current mapping: `BirdKeeper` `BIRD_KEEPER` (BRYAN).

### National Park

- **PokeFan Beverly1600**: target cells `20 (+6) / Berry`. Snubbull is 6 levels higher. Mapping ambiguous: `PokefanF` `POKEFANF`, `PokefanF` `POKEFANF`, `PokefanF` `POKEFANF`.

- **Schoolboy Jack / 544**: target cells `16!; 17 (+2)`. Sunflora replaces Oddish, Voltorb is 2 levels higher. Mapping ambiguous: `Schoolboy` `SCHOOLBOY`, `Schoolboy` `SCHOOLBOY`, `Schoolboy` `SCHOOLBOY`.

- **Lass Krise / 384**: target cells `17!; 16 (+1)`. Skiploom replaces Oddish, Cubone is 1 level higher. Current mapping: `Lass` `LASS` (KRISE).

- **PokeFan William1200**: target cells `15 (+1) / Berry`. Raichu is 1 level higher. Current mapping: `PokeFanM` `POKEFANM` (WILLIAM).

### Route 36

- **Psychic Mark / 512**: target cells `15 (+2); 15 (+2); 16 (+1)`. Abra’s are 2 levels higher, Kadabra is 1 level higher. Current mapping: `Psychic` `PSYCHIC_T` (MARK).

- **Schoolboy Alan / 640**: target cells `20 (+4); 20!`. Tangela is 4 levels higher, Growlithe is added. Mapping ambiguous: `Schoolboy` `SCHOOLBOY`, `Schoolboy` `SCHOOLBOY`, `Schoolboy` `SCHOOLBOY`.

### Route 37

- **Twins Ann & Anne360**: target cells `18 (+2); 18!`. Clefairy is 2 levels higher and in front, Furret replaces Jigglypuff. Mapping ambiguous: `Twins` `TWINS`, `Twins` `TWINS`.

- **Psychic Greg / 704**: target cells `22!`. Stantler replaces Drowzee. Current mapping: `Psychic` `PSYCHIC_T` (GREG).

### Ecruteak City

- **Kimono Girl Naoko1512 / Kimono Girl Sayo1512 / Kimono Girl Zuki1512 / Kimono Girl Kuni1512 / Kimono Girl Miki1512**: target cells `21 (+4)`. Eeveelutions are 4 levels higher. Unable to map automatically to an existing trainer constant.

- **Sage Gaku / 1280**: target cells `40 (+8); 40!; 40 (+8)`. Noctowl & Flareon are 8 levels higher, Victreebel is added. Unable to map automatically to an existing trainer constant.

- **Sage Masa / 1280**: target cells `40 (+8); 40!; 40 (+8)`. Noctowl & Jolteon are 8 levels higher, Victreebel is added. Unable to map automatically to an existing trainer constant.

- **Sage Koji / 1280**: target cells `40 (+8); 40!; 40 (+8)`. Noctowl & Vaporeon are 8 levels higher, Victreebel is added. Unable to map automatically to an existing trainer constant.

### Ecruteak Gym

- **Sage Ping / 704**: target cells `22!`. Misdreavus replaced Gastly, lost 4 Gastly… That’s a lot of gas to let out man. Current mapping: `Sage` `SAGE` (PING).

- **Sage Jeffrey / 672**: target cells `21!; 21 (+1); 21!`. Haunter is 1 level higher, 2 Gastly’s are added. Current mapping: `Sage` `SAGE` (JEFFREY).

- **Medium Martha800**: target cells `20; 20!`. Houndour replaces Gastly, Haunter is now in front, lost 1 Gastly. Current mapping: `Medium` `MEDIUM` (MARTHA).

### Gym Leader Morty

- **Morty / 2500**: target cells `24 (+3); 23!; 24!; 25 / MiracleBerry`. Haunter is now first and 3 levels higher, Stantler replaces Gastly, Misdreavus replaces Haunter #2, Gengar now has a held MiracleBerry. Current mapping: `Morty` `MORTY` (MORTY).
  Movesets: `-Hypnosis / -Nightmare / -Curse / -Night Shade` | `-Swift / -Hypnosis / -Nightmare / -Leer` | `-Shadow Ball / -Pain Split / -Perish Song / -Psywave` | `-Hypnosis / -Shadow Ball / -Mean Look / -Dream Eater`.

### Route 38

- **Sailor Harry / 920**: target cells `23!`. Quagsire replaces Wooper. Current mapping: `Sailor` `SAILOR` (HARRY).

- **Lass Dana / 480**: target cells `19 (+1); 20 (+2)`. Flaaffy is 1 level higher, Psyduck is 2 levels higher. Mapping ambiguous: `Lass` `LASS`, `Lass` `LASS`, `Lass` `LASS`.

- **Beauty Valerie1848**: target cells `22 (+5); 21!`. Skiploom is now 5 levels higher and in front, Miltank replaces Hoppip. Current mapping: `Beauty` `BEAUTY` (VALERIE).

- **Bird Keeper Toby528**: target cells `22 (+6); 22 (+5)`. Doduo’s are now 5 levels higher, lost 1 Doduo. Current mapping: `BirdKeeper` `BIRD_KEEPER` (TOBY).

- **Schoolboy Chad / 704**: target cells `22 (+3); 22!`. Mr. Mime is now 3 levels higher, Magnemite is added. Mapping ambiguous: `Schoolboy` `SCHOOLBOY`, `Schoolboy` `SCHOOLBOY`, `Schoolboy` `SCHOOLBOY`.

- **Beauty Olivia / 1848**: target cells `21 (+2)`. Corsola is now 2 levels higher. Unable to map automatically to an existing trainer constant.

### Route 39

- **Psychic Norman736**: target cells `22 (+5); 23 (+3)`. Slowpoke #1 is 5 levels higher, Slowpoke #2 is 3 levels higher. Current mapping: `Psychic` `PSYCHIC_T` (NORMAN).

- **PokeFan Derek1760**: target cells `22 (+5) / Berry; 22! / Berry`. Pikachu is 5 levels higher, & Ponyta is added. Mapping ambiguous: `PokefanM` `POKEFANM`, `PokefanM` `POKEFANM`, `PokefanM` `POKEFANM`.

- **PokeFan Ruth / 1840**: target cells `23 (+6) / Berry`. Pikachu is 6 levels higher. Current mapping: `PokefanF` `POKEFANF` (RUTH).

- **Sailor Eugene / 880**: target cells `20 (+3); 22!`. Poliwhirl is 3 levels higher, Tauros replaces Raticate, lost 1 Krabby. Current mapping: `Sailor` `SAILOR` (EUGENE).

- **PokeFan Jaime1600**: target cells `20! / Berry`. Umbreon replaces Meowth. Unable to map automatically to an existing trainer constant.
  Notes: Can only be fought at nighttime.

### Olivine Lighthouse

- **Gentlemen Alfred1584**: target cells `22 (+2)`. Noctowl is 2 levels higher. Current mapping: `Gentleman` `GENTLEMAN` (ALFRED).

- **Sailor Huey / 880**: target cells `20 (+2); 22!`. Poliwhirl is now in front, Machop replaces Poliwag. Mapping ambiguous: `Sailor` `SAILOR`, `Sailor` `SAILOR`, `Sailor` `SAILOR`.

- **Bird Keeper Theo552**: target cells `23!`. Murkrow replaces Pidgey, lost 4 Pidgey. Current mapping: `BirdKeeper` `BIRD_KEEPER` (THEO).

- **Gentlemen Preston1584**: target cells `22 (+4); 22!`. Growlithe #1 is 4 levels higher, Vulpix replaces Growlithe #2. Current mapping: `Gentleman` `GENTLEMAN` (PRESTON).

- **Lass Connie / 528**: target cells `21!; 22!`. Ponyta replaces Marill, Weepinbell is added. Mapping ambiguous: `Lass` `LASS`, `Lass` `LASS`, `Lass` `LASS`.

- **Sailor Kent / 920**: target cells `23!; 23!`. Shellder replaces Krabby #1, Chinchou replaces Krabby #2. Current mapping: `Sailor` `SAILOR` (KENT).

- **Bird Keeper Denis576**: target cells `24!; 24 (+4)`. Pidgeotto replaces Spearow #1, Fearow 4 levels higher, lost 1 Spearow. Current mapping: `BirdKeeper` `BIRD_KEEPER` (DENIS).

- **Sailor Terrell / 960**: target cells `24 (+4)`. Poliwhirl is now 4 levels higher. Current mapping: `Sailor` `SAILOR` (TERRELL).

- **Sailor Ernest / 960**: target cells `22 (+4); 24 (+6); 24!`. Machop #1 is 4 levels higher, Quagsire replaces Machop #2 and in back, Poliwhirl is 6 levels higher. Current mapping: `Sailor` `SAILOR` (ERNEST).

### Gym Leader Jasmine

- **Jasmine / (Badge #5-6) / 3600**: target cells `35!; 35!; 35!; 36! / Focus Band; 36 (+1) / Quick Claw`. Jasmine now has varying levels & movepools depending on what Gym Badge the player is fighting her for. Magneton replaces Magnemite #1, Skarmory, Corsola, & Scizor are added, with a held Focus Band on Scizor, & Steelix is 1 & 4 levels higher respectively with a held Quick Claw. Current mapping: `Jasmine` `JASMINE` (JASMINE).
  Movesets: `-Spikes / -Drill Peck / -Swagger / -Steel Wing` | `-Thunderbolt / -Tri Attack / -Rain Dance / -Thunder` | `-Rain Dance / -Surf / -Recover / -AncientPower` | `-Twineedle / -Metal Claw / -Agility / -Swords Dance` | `-Crunch / -Earthquake / -Rock Slide / -Iron Tail`.
  Decision: implemented as `JASMINE1`; `JASMINE2` is the 6+ badge variant.

### Route 40

- **Swimmer / Simon200**: target cells `25 (+5); 25 (+5)`. Tentacool’s are 5 levels higher. Current mapping: `SwimmerM` `SWIMMERM` (SIMON).

- **Swimmer Elaine500**: target cells `25!`. Starmie replaces Staryu. Current mapping: `SwimmerF` `SWIMMERF` (ELAINE).

- **Swimmer Paula520**: target cells `25 (+6); 26 (+7)`. Staryu is 6 levels higher, Shellder is now 7 levels higher. Current mapping: `SwimmerF` `SWIMMERF` (PAULA).

- **Swimmer Randall200**: target cells `25 (+7); 25 (+5)`. Shellder is 7 levels higher, Wartortle is 5 levels higher, lost 1 Shellder. Current mapping: `SwimmerM` `SWIMMERM` (RANDALL).

### Route 41

- **Swimmer George208**: target cells `26 (+9); 26 (+7); 26 (+7)`. Tentacool is 9 levels higher, Staryu & Remoraid are 7 levels higher, lost 3 Tentacool. Current mapping: `SwimmerM` `SWIMMERM` (GEORGE).

- **Swimmer Charlie208**: target cells `26!; 26 (+7)`. Cloyster replaces Shellder, Tentacruel is 7 levels higher, lost 1 Tentacool. Current mapping: `SwimmerM` `SWIMMERM` (CHARLIE).

- **Swimmer Kaylee480**: target cells `24 (+4); 24!; 24!`. Seaking is now in front and 4 levels higher, Lanturn replaces Goldeen #1, Quagsire replaces Goldeen #2. Current mapping: `SwimmerF` `SWIMMERF` (KAYLEE).

- **Swimmer Susie520**: target cells `27 (+7); 26!`. Psyduck is 7 levels higher, Seaking replaces Goldeen. Current mapping: `SwimmerF` `SWIMMERF` (SUSIE).
  Notes: Surprise Surf on Seaking.

- **Swimmer Kara520**: target cells `25!; 26 (+6)`. Horsea replaces Staryu, Starmie is 6 levels higher. Current mapping: `SwimmerF` `SWIMMERF` (KARA).

- **Swimmer Kirk / 192**: target cells `24 (+4); 24 (+4)`. Gyarados’s are 4 levels higher. Current mapping: `SwimmerM` `SWIMMERM` (KIRK).

- **Swimmer Denise540**: target cells `27!`. Lapras replaces Seel. Current mapping: `SwimmerF` `SWIMMERF` (DENISE).

- **Swimmer Berke216**: target cells `27 (+4)`. Qwilfish is 4 levels higher. Current mapping: `SwimmerM` `SWIMMERM` (BERKE).

- **Swimmer Mathew208**: target cells `26 (+3); 26!`. Krabby is 3 levels higher, Qwilfish added. Current mapping: `SwimmerM` `SWIMMERM` (MATHEW).

- **Swimmer Wendy540**: target cells `26 (+5); 27!`. Horsea #1 is 5 levels higher, Seadra replaces Horsea #2. Current mapping: `SwimmerF` `SWIMMERF` (WENDY).

### Eusine

- **Mysticalman Eusine2700**: target cells `27!; 27!; 27!`. Politoed replaces Haunter and is now in front, Flaaffy replaces Electrode, Hypno replaces Drowzee. Unable to map automatically to an existing trainer constant.
  Movesets: `-Ice Beam / -Bubblebeam / -Rain Dance / -Hypnosis` | `-ThunderPunch / -Thunder Wave / -Thundershock / -Body Slam` | `-Dream Eater / -Hypnosis / -Disable / -Confusion`.

### Cianwood Gym

- **Blackbelt Yoshi696**: target cells `29 (+2)`. Hitmonlee is 2 levels higher. Current mapping: `Blackbelt` `BLACKBELT_T` (YOSHI).

- **Blackbelt Lao / 696**: target cells `29 (+2)`. Hitmonchan is 2 levels higher. Current mapping: `Blackbelt` `BLACKBELT_T` (LAO).

- **Blackbelt Nob / 648**: target cells `27 (+2); 27 (+2)`. Machop & Machoke are 2 levels higher. Current mapping: `Blackbelt` `BLACKBELT_T` (NOB).

- **Blackbelt Lung648**: target cells `27 (+4); 27!; 27 (+2)`. Mankey #1 is 4 levels higher, Machoke replaces Mankey #2, Primeape is 2 levels higher. Current mapping: `Blackbelt` `BLACKBELT_T` (LUNG).

### Gym Leader Chuck

- **Chuck / (Badge #5) / 3100**: target cells `30!; 30!; 29 (+2); 31 (+1) / Black Belt`. Chuck now has multiple teams depending on what Gym Badge the player is fighting him for. Hitmontop & Sudowoodo are added, Pinsir as well Badge #6 onward. Primeape is 2, 7, and 10 levels higher respectively. Poliwrath is 1, 6, and 8 levels higher respectively and has a held Black Belt. Current mapping: `Chuck` `CHUCK` (CHUCK).
  Movesets: `-Triple Kick / -Rolling Kick / -Dig / -Pursuit` | `-Rock Slide / -Thunderpunch / -Low Kick / -Faint Attack` | `-Submission / -Twineedle / -Strength / -Swords Dance` | `-DynamicPunch / -Karate Chop / -Rock Slide / -Rage` | `-Ice Punch / -Mind Reader / -Surf / -DynamicPunch`.
  Decision: implemented as `CHUCK1`; `CHUCK2` and `CHUCK3` are selected at 5 and 6+ badges.

### Route 42

- **Fisher Tully / 960**: target cells `24 (+6)`. Qwilfish is 6 levels higher. Unable to map automatically to an existing trainer constant.

- **Hiker Benjamin / 768**: target cells `24!; 24 (+8)`. Graveler replaces Geodude, Dugtrio is 8 levels higher, lost 1 Diglett. Current mapping: `Hiker` `HIKER` (BENJAMIN).

### Mt. Mortar

- **PokeManiac Miller1200**: target cells `20 (+3); 20 (+3)`. Pokemon are 3 levels higher. Unable to map automatically to an existing trainer constant.

- **Black Belt Kiyo576**: target cells `24 (-10); 24 (-10)`. Hitmonlee & Hitmonchan are 10 levels lower. Accessible before obtaining Waterfall & the 8th Gym Badge now. Current mapping: `Blackbelt` `BLACKBELT_T` (KIYO).
  Notes: Will give the player a Tyrogue after being defeated.

### Route 43

- **Camper Spencer500**: target cells `25 (+8); 25!`. Sandslash is 8 levels higher, Golbat replaces Zubat, lost 1 Sandshrew. Current mapping: `Camper` `CAMPER` (SPENCER).

- **Picnicker Tiffany / 580**: target cells `29!`. Clefable replaces Clefairy. Mapping ambiguous: `Picnicker` `PICNICKER`, `Picnicker` `PICNICKER`, `Picnicker` `PICNICKER`.

- **PokeManiac Brent / 1560**: target cells `26 (+7); 26!`. Lickitung is 7 levels higher, Ivysaur is added. Mapping ambiguous: `Pokemaniac` `POKEMANIAC`, `Pokemaniac` `POKEMANIAC`, `Pokemaniac` `POKEMANIAC`.

- **PokeManiac Ron1560**: target cells `26 (+7); 26!`. Nidoking is 7 levels higher, Charmeleon is added. Current mapping: `Pokemaniac` `POKEMANIAC` (RON).

- **PokeManiac Ben1560**: target cells `26 (+7); 26!`. Slowbro is 7 levels higher, Wartortle is added. Current mapping: `Pokemaniac` `POKEMANIAC` (BEN).

- **Fisher Marvin / 1000**: target cells `25 (+15); 25 (+10)`. Gyarados #1 is 15 levels higher, Gyarados #2 is 10 levels higher, lost 2 Magikarp. Current mapping: `Fisher` `FISHER` (MARVIN).

### Lake of Rage

- **Cooltrainer Aaron1296**: target cells `27 (+3); 27 (+3); 27 (+3)`. Ivysaur, Charmeleon, & Wartortle are 3 levels higher. Current mapping: `CooltrainerM` `COOLTRAINERM` (AARON).

- **Cooltrainer Lois1296**: target cells `28 (+3); 27 (+2)`. Skiploom is 3 levels higher, Ninetales is 2 levels higher. Current mapping: `CooltrainerF` `COOLTRAINERF` (LOIS).

- **Fisher Raymond / 1120**: target cells `28!`. Vaporeon replaces Magikarp #1, lost 3 Magikarp. Current mapping: `Fisher` `FISHER` (RAYMOND).

### Team Rocket Hideout

- **Rocket Guard #1 1040**: target cells `26 (+9); 26!`. Drowzee is 9 levels higher, Gligar replaces Zubat. Unable to map automatically to an existing trainer constant.

- **Rocket Guard #21080**: target cells `27!; 27!; 27!`. Golbat replaces Zubat, Ariados replaces Grimer, Raticate replaces Rattata. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #1 (HQ B1F) / 1120**: target cells `28!`. Kangaskhan replaces Rattata #1, lost 4 Rattata. Unable to map automatically to an existing trainer constant.

- **Scientist Jed / 2800**: target cells `28 (+8); 28!`. Magnemite is 8 levels higher, Porygon replaces Magnemite #2, lost 1 Magnemite. Current mapping: `Scientist` `SCIENTIST` (JED).

- **Rocket Grunt #1 (HQ B2F) / 1240**: target cells `31!`. Venomoth replaces Venonat #1, lost 1 Venonat. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #2 (HQ B2F) / 1160**: target cells `29 (+11)`. Golbat is 11 levels higher. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #3 (HQ B2F) / 1040**: target cells `26!; 26!; 27!`. Raticate replaces Rattata #1, Golbat replaces Zubat, Grimer replaces Rattata #2. Unable to map automatically to an existing trainer constant.

### Rocket Executive Ariana #1

- **Exec. Ariana (Rocket HQ) / 2232**: target cells `31 (+8); 30!; 30!; 31 (+6)`. Is now named. Arbok is 8 levels higher, Meowth is added, Murkrow is 6 levels higher, Vileplume replaces Gloom. Unable to map automatically to an existing trainer constant.
  Movesets: `-Wrap / -Leer / -Sludge Bomb / -Bite` | `-Slash / -Faint Attack / -Pay Day / -Mud-Slap` | `-Giga Drain / -Sweet Scent / -Sleep Powder / -Sludge Bomb` | `-Fly / -Pursuit / -Toxic / -Faint Attack`.

- **Rocket Grunt #1 (HQ B3F) / 1120**: target cells `28!; 28!`. Arbok replaces Ekans, Sneasel replaces Gloom. Unable to map automatically to an existing trainer constant.

- **Scientist Ross / 2800**: target cells `28 (+6); 28!`. Koffing #1 is 6 levels higher, Raichu replaces Koffing #2 Current mapping: `Scientist` `SCIENTIST` (ROSS).

- **Scientist Mitch / 2800**: target cells `28!`. Electrode replaces Ditto. Current mapping: `Scientist` `SCIENTIST` (MITCH).

- **Rocket Eto / (Rocket HQ) / 1120**: target cells `28!; 28!; 28!; 28!`. Is now named. Jynx replaces Raticate, Electabuzz, Magmar, & Poliwhirl are added. Unable to map automatically to an existing trainer constant.

### Rocket Executive Archer #1

- **Exec. Archer (Rocket HQ) / 3000**: target cells `30!; 30!; 29!; 30!`. Is now named. Complete team rework. Weezing, Slowbro, Tauros & Houndoom are added, lost 1 Zubat, Koffing, & Raticate. Unable to map automatically to an existing trainer constant.
  Movesets: `-Sludge / -Smokescreen / -Tackle / -Toxic` | `-Headbutt / -Curse / -Confusion / -Surf` | `-Rage / -Frustration / -Horn Attack / -Pursuit` | `-Flame Wheel / -Bite / -Smog / -Roar`.

### Mahogany Gym

- **Boarder Ronald2160**: target cells `29 (+4); 30!`. Dewgong is 4 levels higher and in front, Delibird replaces Seel #1, lost 1 Seel. Current mapping: `Boarder` `BOARDER` (RONALD).

- **Skier Clarissa / 2232**: target cells `31 (+3)`. Dewgong is 3 levels higher. Current mapping: `Skier` `SKIER` (CLARISSA).

- **Boarder Brad / 2160**: target cells `30 (+4); 30!`. Swinub #1 is 4 levels higher, Sneasel replaces Swinub #2. Current mapping: `Boarder` `BOARDER` (BRAD).

- **Boarder Douglas2160**: target cells `28 (+4); 28!; 30 (+5)`. Shellder #1 is 4 levels higher, Seel replaces Shellder #2, Cloyser is 5 levels higher. Current mapping: `Boarder` `BOARDER` (DOUGLAS).

- **Skier Roxanne / 2160**: target cells `30 (+2)`. Jynx is now 2 levels higher. Current mapping: `Skier` `SKIER` (ROXANNE).

### Gym Leader Pryce

- **Pryce / (Badge #5) / 3300**: target cells `31 (+2); 32!; 31!; 33 (+2) / Gold Berry`. Pryce now has multiple teams depending on what Gym Badge the player is fighting him for. / Sneasel & Jynx are added, Cloyster as well Badge #6 onward. Dewgong is 2, 5, and 8 levels higher respectively. Piloswine is 2, 4, and 7 levels higher respectively, and has a held Gold Berry. Current mapping: `Pryce` `PRYCE` (PRYCE).
  Movesets: `-Surf / -Spikes / -Aurora Beam / -Rain Dance` | `-Faint Attack / -Metal Claw / -Reflect / -Blizzard` | `-Surf / -Aurora Beam / -Snore / -Rest` | `-Ice Punch / -Psychic / -Shadow Ball / -Lovely Kiss` | `-Headbutt / -Earthquake / -Rock Smash / -Blizzard`.
  Decision: implemented as `PRYCE1`; `PRYCE2` and `PRYCE3` are selected at 5 and 6+ badges.

### Radio Tower

- **Rocket Grunt #1 (Radio 1F) / 1320**: target cells `33 (+9); 33 (+9); 33!`. Raticate’s are 9 levels higher, Raticate #3 is added. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #1 (Radio 2F) / 1400**: target cells `35 (+9); 35!`. Arbok is 9 levels higher, Gloom is added. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #2 (Radio 2F) / 1360**: target cells `34!; 34!; 34!`. Aipom replaces Rattata #1, Aipom replaces Rattata #2, Koffing replaces Rattata #3, lost 2 Rattata. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #3 (Radio 2F) / 1360**: target cells `34!; 34!`. Gligar replaces Zubat #1, Hypno replaces Zubat #2 Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #4 (Radio 2F) / 1320**: target cells `33!; 33 (+8)`. Weezing replaces Grimer #1, Muk is 8 levels higher, lost 1 Grimer. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #1 (Radio 3F) / 1360**: target cells `34!; 34!`. Muk replaces Weezing, Venomoth is added. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #2 (Radio 3F) / 1360**: target cells `34!; 34!; 34!`. Aipom replaces Koffing, Murkrow replaces Zubat, Forretress replaces Rattata, lost 1 Grimer. Unable to map automatically to an existing trainer constant.

- **Scientist Marc / 3700**: target cells `37!`. Omastar replaces Magnemite #1, lost 2 Magnemites. Current mapping: `Scientist` `SCIENTIST` (MARC).

- **Rocket Grunt #3 (Radio 3F) / (Key Card) / 1400**: target cells `35!; 35!`. Tauros replaces Koffing #1, Slowbro replaces Koffing #2. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #1 (Radio 4F) / 1400**: target cells `35!; 35!; 35!`. Exeggutor replaces Zubat, Electrode replaces Golbat, Electabuzz replaces Grimer. Unable to map automatically to an existing trainer constant.

- **Scientist Rich / 4000**: target cells `40 (+10)`. Porygon is 10 levels higher. Current mapping: `Scientist` `SCIENTIST` (RICH).

- **Rocket Grunt #2 (Radio 2F) (Key Card) / 1440**: target cells `36!; 35 (+11); 36!; 36!`. Arbok replaces Ekans #1, Gloom is 11 levels higher and second, Ariados replaces Oddish, Vileplume replaces Ekans #2. Unable to map automatically to an existing trainer constant.

- **Rocket Executive / (Key Card) / 2736**: target cells `38!; 38!; 38!; 39!`. Forretress replaces Golbat, Cloyster, Pupitar, & Magcargo are added. Unable to map automatically to an existing trainer constant.

### Rocket Executive (Imposter)

- **Rocket Executive (Radio Tower) / 2736**: target cells `36; 36 (+4); 37; 37; 38`. Complete team rework. Weezing is 4 levels higher and in 2nd, Muk, Nidoqueen, Nidoking, & Rhydon added, lost 5 Koffing’s. Unable to map automatically to an existing trainer constant.
  Movesets: `-Minimize / -Sludge Bomb / -Pound / -Acid Armor` | `-Tackle / -Sludge Bomb / -Selfdestruct / -Haze` | `-Body Slam / -Sludge Bomb / -Double Kick / -ThunderPunch` | `-Thrash / -Sludge Bomb / -Double Kick / -Ice Punch` | `-Rock Slide / -Earthquake / -Surf / -`.

### Rocket Executive Ariana #2

- **Exec. Ariana (Radio Tower) / 2880**: target cells `39 (+7); 40!; 39 (+4); 40!; 40 (+8)`. Is now named. Arbok is 9 levels higher, Vileplume is 11 levels higher, Murkrow is 12 levels higher, Persian & Gyarados are added. Unable to map automatically to an existing trainer constant.
  Movesets: `-Sludge Bomb / -Screech / -Bite / -Glare` | `-Slash / -Bite / -Screech / -Charm` | `-Giga Drain / -Sleep Powder / -Sludge Bomb` | `-Surf / -Strength / -Twister / -Gust` | `-Fly / -Pursuit / -Toxic / -Night Shade`.

### Rocket Executive Archer #2

- **Exec. Archer (Radio Tower) / 4000**: target cells `39 (+7); 38; 39; 38!; 40!`. Complete team rework. Kangaskhan, Nidoqueen, Persian, Steelix, & Nidoking are added, lost 1 Houndour, Koffing, & Houndoom. Unable to map automatically to an existing trainer constant.
  Movesets: `-Sludge Bomb / -Selfdestruct / -Smog / -Smokescreen` | `-Frustration / -Headbutt / -Rock Smash / -Pursuit` | `-Surf / -Bite / -Strength / -Gust` | `-Flamethrower / -Bite / -Smog / -Roar` | `-Surf / -Confusion / -Curse / -Amnesia`.

### Goldenrod Tunnel

- **Rocket Grunt #1 (Tunnel) / 1480**: target cells `36!; 37!`. Golbat replaces Rattata, Weezing added. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #2 (Tunnel) / 1480**: target cells `36!; 37 (+13)`. Golbat is added and in front, Muk is 13 levels higher. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #3 (Tunnel) / 1480**: target cells `36!; 37!`. Golbat replaces Koffing, Arbok replaces Muk. Unable to map automatically to an existing trainer constant.

- **Burglar Eddie / 3080**: target cells `35!; 35!`. Arcanine replaces Growlithe and in front, Weezing replaces Koffing. Current mapping: `Burglar` `BURGLAR` (EDDIE).

- **Burglar Duncan3080**: target cells `35!; 35 (+10)`. Delibird replaces Koffing #1, Magmar is 10 levels higher, lost 1 Koffing. Current mapping: `Burglar` `BURGLAR` (DUNCAN).

- **Rocket Grunt #4 (Tunnel) / 1440**: target cells `35!; 35!; 35!; 36!`. Vileplume replaces Gloom #1, Pinsir replaces Gloom #2, Arbok & Murkrow are added. Unable to map automatically to an existing trainer constant.

### Goldenrod Warehouse

- **Rocket Grunt #1 (Warehou.) / 1400**: target cells `35!; 35!; 37!`. Weezing replaces Raticate, Hypno replaces Golbat, Gligar is added. Unable to map automatically to an existing trainer constant.

- **Rocket Eto / (Warehouse) / 1440**: target cells `36!; 36!; 36!; 36!; 36!`. Is now named. Poliwrath replaces Grimer, Jynx replaces Weezing,, Electabuzz, Magmar, & Rhydon are added. Unable to map automatically to an existing trainer constant.

- **Rocket Grunt #2 (Warehou.) / 1480**: target cells `37!`. Weezing replaces Koffing #1, lost 1 Koffing. Unable to map automatically to an existing trainer constant.

### Route 44

- **Psychic Phil / 1152**: target cells `36!; 36 (+10); 36!`. Xatu replaces Natu, Kadabra is 10 levels higher, Girafarig is added. Current mapping: `Psychic` `PSYCHIC_T` (PHIL).

- **Fisher Edgar / 1440**: target cells `38!; 36!; 36!`. Octillery replaces Remoraid #1, Gyarados replaces Remoraid #2, Seaking is added. Current mapping: `Fisher` `FISHER` (EDGAR).

- **Cooltrainer Cybil1824**: target cells `40 (+15); 37 (+12); 38!`. Butterfree is 15 levels higher, Bellossom is 12 levels higher, Quagsire added. Current mapping: `CooltrainerF` `COOLTRAINERF` (CYBIL).

- **Cooltrainer Allen1776**: target cells `35 (+8); 37!`. Charmeleon is 8 levels higher, Electabuzz is added. Current mapping: `CooltrainerM` `COOLTRAINERM` (ALLEN).

- **PokeManiac Zach2280**: target cells `40!; 37!; 38!`. Rhydon replaces Rhyhorn, Pupitar & Heracross are added. Current mapping: `Pokemaniac` `POKEMANIAC` (ZACH).

- **Fisher Wilton / 1440**: target cells `38!; 36!; 36 (+11)`. Qwilfish replaces Goldeen #1, Octillery replaces Goldeen #2, Seaking is 11 levels higher. Mapping ambiguous: `Fisher` `FISHER`, `Fisher` `FISHER`, `Fisher` `FISHER`.

- **Bird Keeper Vance / 888**: target cells `36!; 36!; 36!; 37!`. Pidgeot replaces Pidgeotto #1, Xatu replaces Pidgeotto #2, Murkrow & Skarmory are added. Mapping ambiguous: `BirdKeeper` `BIRD_KEEPER`, `BirdKeeper` `BIRD_KEEPER`, `BirdKeeper` `BIRD_KEEPER`.

### Blackthorn Gym

- **Cooltrainer Paul1920**: target cells `34; 40!; 40!; 40!`. Dragonair’s #1 & #2 replace Dratini’s #2 & #3, Dragonair #3 is added. Current mapping: `CooltrainerM` `COOLTRAINERM` (PAUL).

- **Cooltrainer Fran1968**: target cells `41 (+4); 41!; 41!`. Seadra is 4 levels higher, Gyarados & Dragonair are added. Current mapping: `CooltrainerF` `COOLTRAINERF` (FRAN).

- **Cooltrainer Cody2016**: target cells `42 (+6); 41!; 42!; 43!`. Seadra is 6 levels higher and in front, Dragonair #1 replaces Horsea,  Dragonair #2 and… Golduck is added' Current mapping: `CooltrainerM` `COOLTRAINERM` (CODY).

- **Cooltrainer Mike2016**: target cells `42!; 43 (+6); 42!`. Dragonair is 6 levels higher, Gyarados & Vaporeon are added, with Gyarados in front. Current mapping: `CooltrainerM` `COOLTRAINERM` (MIKE).

- **Cooltrainer Lola2016**: target cells `41!; 42!; 41!; 42 (+6)`. Dragonair #1 is 6 levels higher and in back, Dragonair #2 replaces Dratini, Mantine & Lanturn are added. Current mapping: `CooltrainerF` `COOLTRAINERF` (LOLA).

### Gym Leader Clair

- **Clair / 4500**: target cells `42 (+5); 43! / Focus Band; 43! / Mint Berry; 44 (+7) / Gold Berry; 45 (+5) / Leftovers`. Dragonair #1 is 5 levels higher, Dragonair #2 is 7 levels higher and has a held Gold Berry, Gyarados & Lapras are added and have a held Focus Band & Mint Berry respectively, & Kingdra is 5 levels higher and has a held Leftovers. Current mapping: `Clair` `CLAIR` (CLAIR).
  Movesets: `-Thunder Wave / -Thunderbolt / -Flamethrower / -Dragonbreath` | `-Bite / -Waterfall / -Fly / -Twister` | `-Surf / -Ice Beam / -Body Slam / -Rest` | `-Thunder Wave / -Thunderbolt / -Ice Beam / -Dragonbreath` | `-Smokescreen / -Surf / -Hyper Beam / -Dragonbreath`.

### Dragon’s Den

- **Cooltrainer Darin2016**: target cells `42 (+5); 42!; 42!; 42!`. Dragonair #1 is 5 levels higher, 3 Dragonair’s are added. Unable to map automatically to an existing trainer constant.

- **Cooltrainer Cara2016**: target cells `40 (+5); 41!; 42!`. Seadra #1 is 5 levels higher and in front,  Seadra #2 replaces Horsea #1, Gyarados replaces Horsea #2. Unable to map automatically to an existing trainer constant.

- **Twins Lea & Pia840**: target cells `41!; 42!; 42!; 41!`. Dragonair #1 & #2 replace Dratini #1 & #2, & 2 Gyarados’s are added. Unable to map automatically to an existing trainer constant.

### Route 45

- **Hiker Erik / 1184**: target cells `37!; 38!; 37!`. Machoke replaces Machop #1, Golem replaces Graveler, Kangaskhan replaces Machop #2. Current mapping: `Hiker` `HIKER` (ERIK).

- **Cooltrainer Ryan1776**: target cells `37 (+12); 37!; 37!`. Pidgeot is 12 levels higher, Magmar replaces Electabuzz. Current mapping: `CooltrainerM` `COOLTRAINERM` (RYAN).

- **Cooltrainer Kelly1824**: target cells `37!; 37!; 38!; 37!`. Togetic replaces Marill, Ampharos replaces Wartortle #1, Blastoise replaces Wartortle #2. Tangela is added. Current mapping: `CooltrainerF` `COOLTRAINERF` (KELLY).

- **Hiker Parry / 1216**: target cells `38!; 38!; 38!`. Piloswine is added and in front, Steelix replaces Onix, Dugtrio is added. Mapping ambiguous: `Hiker` `HIKER`, `Hiker` `HIKER`, `Hiker` `HIKER`.

- **Black Belt Kenji / 864**: target cells `33!; 36!; 33!; 38!`. Machamp replaces Machoke and in back, Onix, Hitmonlee, & Steelix are added. Mapping ambiguous: `Blackbelt` `BLACKBELT_T`, `Blackbelt` `BLACKBELT_T`, `Blackbelt` `BLACKBELT_T`.

- **Hiker Timothy / 1216**: target cells `38 (+11); 38!; 39!; 38!`. Dugtrio is 11 levels higher and in front, Gligar replaces Diglett, Graveler & Dugtrio is added. Current mapping: `Hiker` `HIKER` (TIMOTHY).

- **Hiker Michael / 1216**: target cells `38!; 38!; 38 (+13)`. Rhyhorn replaces Geodude, Donphan replaces Graveler, Golem is 13 levels higher. Current mapping: `Hiker` `HIKER` (MICHAEL).

- **Camper Quentin760**: target cells `38 (+8); 38 (+8); 38 (+8); 38!`. Fearow, Primeape, & Tauros are 8 levels higher., & Raichu is added. Unable to map automatically to an existing trainer constant.

### Route 46

- **Camper Ted / 800**: target cells `40!; 40!; 40!`. Primeape replaces Mankey and is second, Ursaring & Nidoking are added. Current mapping: `Camper` `CAMPER` (TED).
  Notes: All 3 trainers in Route 46 can actually be reached just after beating the 3rd Gym, as all that is required is the Rock Smash TM. Yes, you can technically reach these trainers before the 4th Gym. Good luck.

- **Picnicker Erin / 800**: target cells `40!; 38!; 38!; 40!`. Rapidash replaces Ponyta #1, Rapidash replaces Ponyta #2, Nidoqueen & Raichu are added. Mapping ambiguous: `Picnicker` `PICNICKER`, `Picnicker` `PICNICKER`, `Picnicker` `PICNICKER`.

- **Hiker Bailey / 1280**: target cells `40!; 40!; 40!; 40!; 40!`. Golems #1, #2, #3, #4, & #5, replace Geodude’s #1, #2, #3, #4, #5. Current mapping: `Hiker` `HIKER` (BAILEY).

### Route 27

- **Cooltrainer Megan2112**: target cells `44!; 44!; 44 (+12); 44!`. Tangela replaces Bulbasaur, Bellossom replaces Ivysaur, Venusaur is 12 levels higher, & Victreebel is added. Current mapping: `CooltrainerF` `COOLTRAINERF` (MEGAN).

- **Cooltrainer Blake2112**: target cells `43 (+10); 44 (+13); 43!; 44!`. Magneton is 10 levels higher, Quagsire is 13 levels higher,  Exeggutor replaces Exeggcute, Piloswine is added. Current mapping: `CooltrainerM` `COOLTRAINERM` (BLAKE).

- **Cooltrainer Brian2064**: target cells `45 (+10); 45!; 44!; 43!`. Sandslash is 10 levels higher, Sneasel, Scizor, & Ursaring are added. Current mapping: `CooltrainerM` `COOLTRAINERM` (BRIAN).

- **Bird Keeper Jose / 1056**: target cells `44!; 43!; 44 (+10); 44!`. Farfetch’d is 10 levels higher, & Fearow, Pidgeot, & Skarmory are added, with Fearow in front. Mapping ambiguous: `BirdKeeper` `BIRD_KEEPER`, `BirdKeeper` `BIRD_KEEPER`, `BirdKeeper` `BIRD_KEEPER`.

- **Psychic Gilbert1408**: target cells `42!; 44!; 44 (+10)`. Xatu #1 replaces Starmie, Exeggutor replaces Exeggcute, Girafarig is 10 levels higher. Current mapping: `Psychic` `PSYCHIC_T` (GILBERT).

- **Cooltrainer Reena / 2160**: target cells `44 (+13); 43 (+10); 44!; 43!; 45 (+14)`. Starmie #1 is 13 levels higher, Nidoqueen is 10 levels higher, Starmie #2 is 14 levels higher, & Vileplume & Electrode are added. Mapping ambiguous: `CooltrainerF` `COOLTRAINERF`, `CooltrainerF` `COOLTRAINERF`, `CooltrainerF` `COOLTRAINERF`.

### Route 26

- **Fisher Scott / 1720**: target cells `45 (+15); 43!; 44 (+10); 43!`. Qwilfish #1 is 15 levels higher, Gyarados replaces Qwilfish #2, Seaking is 10 levels higher, & Quagsire is added. Current mapping: `Fisher` `FISHER` (SCOTT).

- **Psychic Richard1440**: target cells `45 (+9); 45!; 45!`. Espeon is 9 levels higher, Slowking & Mr. Mime are added. Current mapping: `Psychic` `PSYCHIC_T` (RICHARD).

- **Cooltrainer Joyce2160**: target cells `44 (+12); 45!; 45!; 45!; 46!`. Blastoise is 12 levels higher and in front, Raichu replaces Pikachu, Jumpluff, Rhydon, & Tauros are added. Current mapping: `CooltrainerF` `COOLTRAINERF` (JOYCE).

- **Cooltrainer Gaven / 2112**: target cells `45 (+13); 46 (+14); 45 (+13); 45!; 44!`. Victreebel & Flareon are 13 levels higher, Kingler is 14 levels higher, Dragonair & Porygon2 are added. Mapping ambiguous: `CooltrainerM` `COOLTRAINERM`, `CooltrainerM` `COOLTRAINERM`, `CooltrainerM` `COOLTRAINERM`.

- **Cooltrainer / Jake2160**: target cells `45!; 45!; 45!; 47!; 45!`. Cloyster replaces Parasect, Jolteon replaces Golduck, Arcanine, Alakazam, & Pidgeot are added. Current mapping: `CooltrainerM` `COOLTRAINERM` (JAKE).

- **Cooltrainer Beth / 2160**: target cells `45 (+9); 45!; 45!; 45!; 45!`. Rapidash is 9 levels higher, Ampharos, Miltank, Lanturn, & Gengar are added. Mapping ambiguous: `CooltrainerF` `COOLTRAINERF`, `CooltrainerF` `COOLTRAINERF`, `CooltrainerF` `COOLTRAINERF`.

### Elite Four Will

- **Will / 5000**: target cells `48!; 48!; 49 (+8) / Quick Claw; 49!; 50 (+8) / TwistedSpoon`. Girafarig replaces Xatu #1, Espeon replaces Exeggutor, Slowbro is 8 levels higher and has a held Quick Claw, Slowking replaces Jynx, & Xatu #2 is now 8 levels higher and has a held TwistedSpoon. Current mapping: `Will` `WILL` (WILL).
  Movesets: `-Psychic / -Rock Smash / -Agility / -Baton Pass` | `-Psychic / -Shadow Ball / -Reflect / -Headbutt` | `-Curse / -Rock Smash / -Body Slam / -Psychic` | `-Amnesia / -Flamethrower / -Surf / -Psychic` | `-Drill Peck / -Recover / -Confuse Ray / -Psychic`.

### Elite Four Koga

- **Koga / 5200**: target cells `50 (+10) / King’s Rock; 50 (+8) / Leftovers; 51!; 51 (+10); 52 (+8) / BrightPowder`. Ariados is now 10 levels higher and has a held King’s Rock, Muk is now 8 levels and has a held Leftovers, Qwilfish replaces Forretress, Venomoth is now 10 levels higher, & Crobat is now 8 levels higher and has a held Bright Powder. Current mapping: `Koga` `KOGA` (KOGA).
  Movesets: `-Megahorn / -Giga Drain / -Double Team / -Toxic` | `-Minimize / -Fire Blast / -Sludge Bomb / -Toxic` | `-Surf / -Toxic / -Protect / -Sludge Bomb` | `-Leech Life / -Psychic / -Sludge Bomb / -Sleep Powder` | `-Double Team / -Toxic / -Bite / -Confuse Ray`.

### Elite Four Bruno

- **Bruno / Hoo-Hah! / 5400**: target cells `53 (+11) / Scope Lens; 52!; 53 (+11) / Pink Bow; 53!; 54 (+8) / Black Belt`. Hitmonchan is 11 levels higher, in front, and has a held Scope Lens, Hitmonlee is 11 levels higher and has a held Pink Bow, Heracross replaces Hitmontop, Steelix replaces Onix, & Machamp is 8 levels higher and has a held Black Belt. Current mapping: `Bruno` `BRUNO` (BRUNO).
  Movesets: `-Mach Punch / -Pursuit / -Dizzy Punch / -ThunderPunch` | `-Cross Chop / -Megahorn / -Take Down / -Earthquake` | `-Body Slam / -Meditate / -Reversal / -Hi Jump Kick` | `-Crunch / -Earthquake / -Rock Slide / -Iron Tail` | `-Rock Slide / -Fire Punch / -Vital Throw / -Cross Chop`.

### Elite Four Karen

- **Karen / 5500**: target cells `54 (+12) / MiracleBerry; 53 (+11) / Leftovers; 53 (+8); 53 (+9) / Sharp Beak; 55 (+8) / BlackGlasses`. Umbreon is 12 levels higher and has a held MiracleBerry, Vileplume is 11 levels higher and has a held Leftovers, Gengar is 8 levels higher, Murkrow is 9 levels higher and has a held Sharp Beak, & Houndoom is 8 levels higher and has a held BlackGlasses. Current mapping: `Karen` `KAREN` (KAREN).
  Movesets: `-Faint Attack / -Double Team / -Baton Pass / -Moonlight` | `-Sleep Powder / -Giga Drain / -Leech Seed / -Substitute` | `-Shadow Ball / -Hypnosis / -Dream Eater / -Confuse Ray` | `-Drill Peck / -Faint Attack / -Steel Wing / -Haze` | `-Flamethrower / -Crunch / -Iron Tail / -Reversal`.

### Champion Lance

- **Lance / 5600**: target cells `54 (+10) / Leftovers; 55 (+8) / Gold Berry; 54 (+8) / Charcoal; 55! / Magnet; 54 (+8) / Pink Bow; 56 (+6) / MiracleBerry`. Gyarados is 10 levels higher, Dragonite #1 is 8 levels higher, Charizard is 8 levels higher, Aerodactyl is 8 levels higher, Zapdos replaces Dragonite #2, Dragonite #3 is 6 levels higher, and all Pokemon have held items. Current mapping: `Champion` `CHAMPION` (LANCE).
  Movesets: `-Surf / -Rain Dance / -Hyper Beam / -Rock Smash` | `-Blizzard / -Fire Blast / -Thunder / -ExtremeSpeed` | `-Flamethrower / -Wing Attack / -Double Team / -Steel Wing` | `-Drill Peck / -Sky Attack / -Thunderbolt / -Thunder Wave` | `-Wing Attack / -Rock Slide / -Hyper Beam / -Earthquake` | `-Thunder / -Safeguard / -Outrage / -Hyper Beam`.

### S.S. Aqua: First Trip

- **Hiker Noland / 1760**: target cells `55 (+24); 55 (+22)`. Sandlash is 24 levels higher, Golem is 22 levels higher. Current mapping: `Hiker` `HIKER` (NOLAND).

- **PokeFan Colin / 4480**: target cells `56 (+22) / Berry`. Delibird is 22 levels higher. Current mapping: `PokefanM` `POKEFANM` (COLIN).

- **Twins Meg & Peg 1080**: target cells `54!; 54!`. Donphan replaces Phanpy, Ursaring replaces Teddiursa. Mapping ambiguous: `Twins` `TWINS`, `Twins` `TWINS`.

- **Firebreather Lyle 2592**: target cells `54!; 54 (+23); 54!`. Weezing replaces Koffing #1, Flareon is 23 levels higher, Ninetales replaces Koffing #2. Current mapping: `Firebreather` `FIREBREATHER` (LYLE).

- **Sailor Stanly / 2160**: target cells `53!; 53 (+20); 54!`. Qwilfish replaces Machop, Machoke is 20 levels higher, Golduck replaces Psyduck. Current mapping: `Sailor` `SAILOR` (STANLY).

- **Juggler Fritz / 2240**: target cells `54 (+25); 54 (+25); 56 (+27)`. Mr. Mime & Magmar are 25 levels higher, Machoke is 27 levels higher. Current mapping: `Juggler` `JUGGLER` (FRITZ).

- **Sailor Jeff / 2320**: target cells `58 (+26); 58!`. Raticate #1 is 26 levels higher, Furret replaces Raticate #2. Current mapping: `Sailor` `SAILOR` (JEFF).

- **Picnicker Debra / 1160**: target cells `58 (+25)`. Seaking is 25 levels higher. Current mapping: `Picnicker` `PICNICKER` (DEBRA).

### S.S. Aqua: Kanto -> Johto

- **PokeManiac Ethan3660**: target cells `61!; 61 (+30)`. Haunter replaces Rhyhorn, Rhydon is 30 levels higher.. Current mapping: `Pokemaniac` `POKEMANIAC` (ETHAN).

- **Burglar Corey / 5280**: target cells `55 (+30); 58 (+30); 60 (+30); 55 (+30)`. All Pokemon are 30 levels higher. Current mapping: `Burglar` `BURGLAR` (COREY).

- **Bug Catcher Ken992**: target cells `60 (+30); 62 (+30)`. Both Pokemon are 30 levels higher. Current mapping: `BugCatcher` `BUG_CATCHER` (KEN).

- **Guitarist Clyde1952**: target cells `61 (+27)`. Electabuzz is 27 levels higher. Current mapping: `Guitarist` `GUITARIST` (CLYDE).

- **PokeFan Jeremy4640**: target cells `58 (+30) / Berry; 60! / Berry; 58 (+30) / Berry`. Meowth’s #1 & #3 are 30 levels higher, Persian replaces Meowth #2. Current mapping: `PokefanM` `POKEFANM` (JEREMY).

- **PokeFan Georgia4880**: target cells `61 (+38) / Berry; 61 (+38) / Berry; 61 (+38) / Berry; 63 (+35) / Berry; 61 (+38) / Berry`. Sentret’s are all 38 levels higher, Furret is 35 levels higher. Current mapping: `PokefanF` `POKEFANF` (GEORGIA).

- **Sailor Kenneth2320**: target cells `58 (+30); 58!; 58 (+30); 58!`. Machop #1 & Poliwrath are 30 levels higher, Machoke replaces Machop #2, & Machamp replaces Machop #3. Current mapping: `Sailor` `SAILOR` (KENNETH).

- **Teacher Shirley4536**: target cells `61 (+25); 63!`. Jigglypuff is 25 levels higher, Wigglytuff is added. Current mapping: `Teacher` `TEACHER` (SHIRLEY).

- **Schoolboy Nate1984**: target cells `62 (+30); 62 (+30)`. Both Pokemon are 30 levels higher. Current mapping: `Schoolboy` `SCHOOLBOY` (NATE).

- **Schoolboy Ricky1984**: target cells `62 (+30); 62 (+30)`. Both Pokemon are 30 levels higher. Current mapping: `Schoolboy` `SCHOOLBOY` (RICKY).

### S.S. Aqua: Johto -> Kanto

- **Cooltrainer Sean2880**: target cells `60 (+25); 60 (+25); 60 (+25)`. All Pokemon are 25 levels higher. Current mapping: `CooltrainerM` `COOLTRAINERM` (SEAN).

- **Cooltrainer Carol2880**: target cells `60 (+25); 61 (+26); 60 (+25)`. Electrode & Ninetales are 25 levels higher, Starmie is 26 levels higher. Current mapping: `CooltrainerF` `COOLTRAINERF` (CAROL).

- **Gentleman Edward4536**: target cells `63 (+30)`. Persian is 30 levels higher. Current mapping: `Gentleman` `GENTLEMAN` (EDWARD).

- **Beauty Cassie / 5456**: target cells `60 (+32); 62!`. Vileplume is 32 levels higher, Jynx replaces Butterfree. Current mapping: `Beauty` `BEAUTY` (CASSIE).

- **Psychic Rodney2016**: target cells `59 (+30); 63 (+30)`. Both Pokemon are 30 levels higher. Current mapping: `Psychic` `PSYCHIC_T` (RODNEY).

- **Super Nerd Shawn1888**: target cells `57!; 58 (+25); 59!`. Arcanine replaces Magnemite #1, Muk is 25 levels higher, & Magneton replaces Magnemite #2. Current mapping: `SuperNerd` `SUPER_NERD` (SHAWN).

- **Fisher Jonah / 2360**: target cells `55 (+30); 59 (+30); 55 (+30); 59 (+30)`. All Pokemon are 30 levels higher. Current mapping: `Fisher` `FISHER` (JONAH).

- **Sailor Garret / 2560**: target cells `64 (+30)`. Kingler is 30 levels higher. Unable to map automatically to an existing trainer constant.

- **Blackbelt Wai / 1440**: target cells `56!; 58 (+26); 60!`. Machoke #2 is 26 levels higher, Machamp’s #1 & #3 replace Machoke’s #1 & #3. Current mapping: `Blackbelt` `BLACKBELT_T` (WAI).

### Vermilion Gym

- **Juggler Horton2320**: target cells `56 (+23); 57 (+24); 56 (+23); 58 (+25)`. Electrode’s #1 & #3 are 23 levels higher, Electrode #2 is 24 levels higher, & Electrode #4 is 25 levels higher. Current mapping: `Juggler` `JUGGLER` (HORTON).

- **Guitarist Vincent1760**: target cells `57!; 55!; 55!; 57!`. Magneton #1 replaces Magnemite #1, Electrode & Jolteon replace Voltorb & Magnemite #2, Magneton #2 replaces Magnemite #3. Current mapping: `Guitarist` `GUITARIST` (VINCENT).

- **Gentleman Gregory4032**: target cells `57 (+20); 56!`. Pikachu is 20 levels higher, Ampharos replaces Flaaffy. Current mapping: `Gentleman` `GENTLEMAN` (GREGORY).

### Gym Leader Lt. Surge

- **Lt. Surge / 6000**: target cells `57 (+17) / Focus Band; 59 (+19); 58! / Leftovers; 58!; 59 (+13) / Scope Lens; 60 (+16) / Magnet`. Electrode #1 is 17 levels higher, has a held Focus Band, and in front, Magneton is 19 levels higher, Raichu is 16 levels higher and has a held Magnet, Electabuzz is 13 levels higher and has a held Scope Lens, and Lanturn & Ampharos are added, with Lanturn having a held Leftovers. Lost 1 Electrode. Unable to map automatically to an existing trainer constant.
  Movesets: `-Thunder / -Rain Dance / -Thunder Wave / -Explosion` | `-Thunder / -Reflect / -Rain Dance / -Double-Edge` | `-Surf / -Thunderbolt / -Ice Beam / -Confuse Ray` | `-Rain Dance / -Thunder / -Thunder Wave / -Iron Tail` | `-Thunderbolt / -Fire Punch / -Ice Punch / -Submission` | `-Thunder / -Rain Dance / -Body Slam / -Surf`.

### Route 6

- **PokeFan Rex / 4400**: target cells `55! / Berry`. Stantler replaces Phanpy. Unable to map automatically to an existing trainer constant.

- **PokeFan Allan4400**: target cells `55! / Berry`. Granbull replaces Teddiursa. Unable to map automatically to an existing trainer constant.

### Saffron Gym

- **Medium Rebecca / 2320**: target cells `58!; 58!; 58 (+23)`. Hypno #2 replaces Drowzee, Hypno #1 is 23 levels higher, & Jynx is added. Current mapping: `Medium` `MEDIUM` (REBECCA).

- **Psychic Jared / 1856**: target cells `58!; 58 (+26); 58!`. Unown is added and in front, Mr. Mime is 26 levels higher, & Exeggutor replaces Exeggcute. Current mapping: `Psychic` `PSYCHIC_T` (JARED).

- **Medium Doris / 2320**: target cells `58!; 59 (+23); 58!`. Noctowl replaces Slowpoke, Slowbro is 23 levels higher, & Xatu is added. Current mapping: `Medium` `MEDIUM` (DORIS).

- **Psychic Franklin1920**: target cells `60!`. Alakazam replaces Kadabra. Current mapping: `Psychic` `PSYCHIC_T` (FRANKLIN).

### Gym Leader Sabrina

- **Sabrina / 6600**: target cells `65 (+19) / Quick Claw; 64!; 64! / Mint Berry; 64! / Leftovers; 65! / Focus Band; 66 (+18) / TwistedSpoon`. Mr. Mime is 19 levels higher and has a Quick Claw, Jynx, Slowbro, Wobbuffet, & Hypno are added, with Slowbro having a Mint Berry, Wobbuffet a Leftovers, & Hypno a Focus Band, and Alakazam is 18 levels higher and has a TwistedSpoon. Current mapping: `Sabrina` `SABRINA` (SABRINA).
  Movesets: `-Psychic / -Thunder Wave / -Encore / -Ice Punch` | `-Psychic / -Ice Beam / -Lovely Kiss / -BubbleBeam` | `-Rest / -Sleep Talk / -Submission / -Surf` | `-Mirror Coat / -Counter / -Safeguard / -Destiny Bond` | `-Dream Eater / -Hypnosis / -Fire Punch / -Submission` | `-Shadow Ball / -Psychic / -Recover / -ThunderPunch`.

### Celadon Gym

- **Twins Joe & Zoe1160**: target cells `58 (+23); 58 (+23)`. Victreebel & Vileplume are 23 levels higher. Unable to map automatically to an existing trainer constant.

- **Picnicker Tanya1140**: target cells `57!; 57 (+20); 57!`. Exeggutor is 20 levels higher and no longer in front, Bellossom & Sunflora are added. Current mapping: `Picnicker` `PICNICKER` (TANYA).

- **Lass Michelle / 1368**: target cells `57!; 58!; 57 (+23)`. Jumpluff’s #2 & #3 replaces Skiploom & Hoppip, Jumpluff #1 is 23 levels higher. Current mapping: `Lass` `LASS` (MICHELLE).

- **Beauty Julia / 5104**: target cells `58 (+23); 56!; 58!`. Parasect is 23 levels higher and in front, Exeggutor replaces Exeggcute, & Sunflora replaces Paras. Current mapping: `Beauty` `BEAUTY` (JULIA).

### Gym Leader Erika

- **Erika / 6200**: target cells `61 (+20) / Focus Band; 60!; 60!; 61! / Leftovers; 62 (+16) / Poison Barb; 62 (+16) / Miracle Seed`. Jumpluff is 20 levels higher, has a held Focus Band, and is in front, Victreebel & Bellossom are 16 levels higher, with Victreebel holding a Poison Barb, & Bellossom holding a Miracle Seed, Sudowoodo, Exeggutor, & Venusaur are added, with Venusaur having a held Leftovers, lost 1 Tangela. Current mapping: `Erika` `ERIKA` (ERIKA).
  Movesets: `-Giga DraIn / -Sleep Powder / -Encore / -Leech Seed` | `-Rock Slide / -Earthquake / -Faint Attack / -ThunderPunch` | `-Giga Drain / -Psychic / -Stun Spore / -AncientPower` | `-Sunny Day / -Solarbeam / -Sludge Bomb / -Sleep Powder` | `-Sludge Bomb / -Giga Drain / -Swords Dance / -Sleep Powder` | `-Sunny Day / -Synthesis / -Sleep Powder / -Solarbeam`.

### Route 24

- **Rocket Grunt (Route 24) / (Machine Part Quest) / 2320**: target cells `58!; 58!; 58!; 58!; 58!`. Crobat replaces Golbat, Weezing, Marowak, Hypno, & Cloyster are added. Unable to map automatically to an existing trainer constant.

### Route 25

- **Schoolboy Dudley1792**: target cells `56!`. Vileplume replaces Oddish. Current mapping: `Schoolboy` `SCHOOLBOY` (DUDLEY).

- **Lass Ellen / 1320**: target cells `55 (+25); 55 (+21)`. Wigglytuff is 25 levels higher, Granbull is 21 levels higher. Current mapping: `Lass` `LASS` (ELLEN).

- **Schoolboy Joe1792**: target cells `56 (+23); 56 (+23)`. Tangela & Vaporeon are 23 levels higher. Current mapping: `Schoolboy` `SCHOOLBOY` (JOE).

- **Lass Laura / 1320**: target cells `55 (+24); 55!; 55!`. Bellossom is 24 levels higher and in front, Pidgeot replaces Pidgeotto, Politoed replaces Gloom Current mapping: `Lass` `LASS` (LAURA).

- **Camper Lloyd / 1140**: target cells `57 (+23)`. Nidoking is 23 levels higher. Current mapping: `Camper` `CAMPER` (LLOYD).

- **Lass Shannon / 1344**: target cells `56!; 55!; 56 (+24)`. Parasect #2 replaces Paras #1, Tangela replaces Paras #2, & Parasect #1 is 24 levels higher. Current mapping: `Lass` `LASS` (SHANNON).

- **Super Nerd Pat1792**: target cells `56 (+20); 56!; 56!`. Porygon is 20 levels higher, Magneton & Porygon2 are added. Current mapping: `SuperNerd` `SUPER_NERD` (PAT).

- **Cooltrainer Kevin2784**: target cells `58 (+20); 57!; 57!; 58!`. Rhyhorn is 20 levels higher, Lanturn replaces Wartortle, Charizard replaces Charmeleon, & Espeon is added. Current mapping: `CooltrainerM` `COOLTRAINERM` (KEVIN).

### Cerulean Gym

- **Swimmer Parker456**: target cells `57!; 57!; 57 (+22)`. Seadra #2 replaces Horsea #1, Gyarados replaces Horsea #2, & Seadra #1 is 22 levels higher. Current mapping: `SwimmerM` `SWIMMERM` (PARKER).

- **Swimmer Briana1160**: target cells `58 (+23); 58!; 58 (+23)`. Seakings are 23 levels higher, Azumarill is added. Current mapping: `SwimmerF` `SWIMMERF` (BRIANA).

- **Swimmer Diana1140**: target cells `57 (+20); 57!; 57!`. Golduck is 20 levels higher, Cloyster & Corsola are added. Current mapping: `SwimmerF` `SWIMMERF` (DIANA).

### Gym Leader Misty

- **Misty / 6300**: target cells `62 (+20); 62 (+20) / Quick Claw; 61! / Leftovers; 61!; 62 (+18) / NeverMeltIce; 63 (+16) / Mystic Water`. Golduck & Quagsire are 20 levels higher, Lapras is 18 levels higher, Starmie is 16 levels higher, Vaporeon & Kingdra are added. Current mapping: `Misty` `MISTY` (MISTY).
  Movesets: `-Surf / -Psychic / -Hypnosis / -Cross Chop` | `-Surf / -Amnesia / -Earthquake / -Rain Dance` | `-Surf / -Ice Beam / -Acid Armor / -Shadow Ball` | `-Hydro Pump / -Ice Beam / -Rest / -Sleep Talk` | `-Surf / -Ice Beam / -Rain Dance / -Reflect` | `-Surf / -Psychic / -Recover / -Thunderbolt`.

### Route 8

- **Biker Dwayne1920**: target cells `57 (+30); 58 (+30); 59 (+30); 60 (+30)`. Koffing’s are 30 levels higher. Current mapping: `Biker` `BIKER` (DWAYNE).

- **Biker Harris / 1888**: target cells `59 (+25)`. Flareon is 25 levels higher. Current mapping: `Biker` `BIKER` (HARRIS).

- **Biker Zeke / (Von Genbu) / (Also known as the Zekenator!) / 1792**: target cells `58!; 56!`. Crobat replaces Koffing #1, Muk replaces Koffing #2. Current mapping: `Biker` `BIKER` (ZEKE).

- **Super Nerd Sam1984**: target cells `62!`. Porygon2 replaces Grimer, lost 1 Muk. Current mapping: `SuperNerd` `SUPER_NERD` (SAM).

- **Super Nerd Tom1792**: target cells `56 (+24); 56!; 56 (+24)`. Magnemite’s #1 & #3 are 24 levels higher, Steelix replaces Magnemite #2. Current mapping: `SuperNerd` `SUPER_NERD` (TOM).

### Route 9

- **Picnicker Edna1120**: target cells `56!; 56 (+22)`. Nidoqueen replaces Nidorina, Raichu is 22 levels higher. Current mapping: `Picnicker` `PICNICKER` (EDNA).

- **Camper Sid / 1120**: target cells `56 (+24); 55 (+26); 56 (+27)`. Dugtrio is 24 levels higher, Primeape is 26 levels higher, & Poliwrath is 27 levels higher. Current mapping: `Camper` `CAMPER` (SID).

- **Camper Dean / 1140**: target cells `56!; 57!`. Heracross replaces Golduck, Kangaskhan replaces Sandslash. Current mapping: `Camper` `CAMPER` (DEAN).

- **Hiker Tim / 1760**: target cells `55!; 55!; 55!`. Golem replaces Graveler #1, Kabutops replaces Graveler #2, Quagsire replaces Graveler #3. Current mapping: `Hiker` `HIKER` (TIM).

- **Hiker Sidney / 1792**: target cells `56 (+22); 56!`. Dugtrio is 22 levels higher, Steelix replaces Onix. Current mapping: `Hiker` `HIKER` (SIDNEY).

- **Picnicker Heidi1160**: target cells `56!; 58!`. Jumpluff replaces Skiploom #1, Seadra replaces Skiploom #2. Current mapping: `Picnicker` `PICNICKER` (HEIDI).

### Route 10

- **PokeFan Robert4800**: target cells `60! / Berry`. Kangaskhan replaces Quagsire. Current mapping: `PokefanM` `POKEFANM` (ROBERT).

- **Hiker Jim / 1856**: target cells `58 (+23)`. Machamp is 23 levels higher. Current mapping: `Hiker` `HIKER` (JIM).

### Route 11

- **Psychic Herman1760**: target cells `55 (+25); 55!; 55!`. Exeggutor is 25 levels and in front, Xatu replaces Exeggcute #1, and Starmie replaces Exeggcute #2. Current mapping: `Psychic` `PSYCHIC_T` (HERMAN).

- **Youngster Jason880**: target cells `55!; 55 (+22)`. Octillery replaces Sandslash, Crobat is 22 levels higher. Current mapping: `Youngster` `YOUNGSTER` (JASON).

- **Youngster Olwen880**: target cells `55!`. Arcanine replaces Growlithe. Unable to map automatically to an existing trainer constant.

- **Psychic Fidel1728**: target cells `54 (+20)`. Xatu is 20 levels higher. Current mapping: `Psychic` `PSYCHIC_T` (FIDEL).

### Route 12

- **Fisher Kyle / 2360**: target cells `58 (+30); 58 (+27); 59 (+28)`. Seaking #1 is 30 levels higher, Poliwhirl is 27 levels higher, and Seaking #2 is 28 levels higher. Current mapping: `Fisher` `FISHER` (KYLE).

- **Fisher Martin / 2480**: target cells `62 (+30); 62 (+30)`. Remoraid’s are 30 levels higher. Current mapping: `Fisher` `FISHER` (MARTIN).

- **Fisher Stephen2280**: target cells `75!' (+50); 57!; 58 (+27); 57 (+26)`. Magikarp #1 is… 5-50 levels higher!' Gyarados replaces Magikarp #2, Qwilfish is 27 levels higher, and Tentacruel is 26 levels higher. Current mapping: `Fisher` `FISHER` (STEPHEN).

- **Fisher Barney / 2320**: target cells `58 (+28); 58 (+28); 58 (+28)`. Gyarados’s are 28 levels higher. Current mapping: `Fisher` `FISHER` (BARNEY).

### Route 13

- **Bird Keeper Bret1392**: target cells `58!; 58 (+26)`. Skarmory replaces Pidgeotto, Fearow is 26 levels higher. Current mapping: `BirdKeeper` `BIRD_KEEPER` (BRET).

- **Bird Keeper Perry1464**: target cells `61 (+27)`. Farfetch’d is 27 levels higher. Current mapping: `BirdKeeper` `BIRD_KEEPER` (PERRY).

- **PokeFan Joshua4800**: target cells `60 (+37) / Berry; 60 (+37) / Berry; 60 (+37) / Berry`. Pikachu’s are 37 levels higher, lost 3 Pikachu. Current mapping: `PokefanM` `POKEFANM` (JOSHUA).

- **PokeFan Alex4640**: target cells `56 (+27) / Berry; 57 (+28) / Berry; 58 (+29) / Berry`. Nidoking is 27 levels higher, Slowking is 28 levels higher, & Seaking is 29 levels higher. Current mapping: `PokefanM` `POKEFANM` (ALEX).

- **Hiker Kenny / 1888**: target cells `56 (+29); 59 (+30); 57 (+26); 59 (+30)`. Sandslash is 29 levels higher, Gravelers are 30 levels higher, Golem is 26 levels higher. Current mapping: `Hiker` `HIKER` (KENNY).

### Route 14

- **PokeFan Carter5200**: target cells `65! / Berry; 65! / Berry; 65! / Berry`. Chikorita, Cyndaquil, & Totodile replace Bulbasaur, Charmander, & Totodile. Current mapping: `PokefanM` `POKEFANM` (CARTER).

- **Bird Keeper Roy1416**: target cells `59 (+30); 59 (+24)`. Fearow #1 is 30 levels higher, Fearow #2 is 24 levels higher. Current mapping: `BirdKeeper` `BIRD_KEEPER` (ROY).

- **PokeFan Trevor4800**: target cells `60! / Berry`. Scizor replaces Psyduck. Current mapping: `PokefanM` `POKEFANM` (TREVOR).

### Route 15

- **Schoolboy Johnny1888**: target cells `59!; 59 (+26)`. Tauros replaces Bellsprout, Victreebel is 26 levels higher, lost 1 Weepinbell. Current mapping: `Schoolboy` `SCHOOLBOY` (JOHNNY).

- **Teacher Colette4320**: target cells `60 (+24)`. Clefairy is 24 levels higher. Current mapping: `Teacher` `TEACHER` (COLETTE).

- **Schoolboy Billy1920**: target cells `57!; 57!; 60 (+25)`. Parasect replaces Paras #1, Poliwrath replaces Poliwhirl, Ditto is 25 levels higher, lost 1 Paras. Current mapping: `Schoolboy` `SCHOOLBOY` (BILLY).

- **Teacher Hillary4392**: target cells `61 (+29); 61 (+25)`. Aipom is 29 levels higher, & Cubone is 25 levels higher. Current mapping: `Teacher` `TEACHER` (HILLARY).

- **Schoolboy Tommy1856**: target cells `60 (+28); 58 (+26)`. Xatu is 28 levels higher, & Alakazam is 26 levels higher.. Current mapping: `Schoolboy` `SCHOOLBOY` (TOMMY).

- **Schoolboy Kipp1888**: target cells `59!; 59 (+32)`. Electrode replaces Voltorb #1, Magnemite is 32 levels higher, lost 1 Voltorb & 1 Magneton. Current mapping: `Schoolboy` `SCHOOLBOY` (KIPP).

### Fuchsia Gym

- **Lass Linda / 1392**: target cells `58 (+24); 58!; 58!`. Venusaur is 24 levels higher and in front, Muk replaces Bulbasaur, & Qwilfish replaces Ivysaur. Current mapping: `Lass` `LASS` (LINDA).

- **Picnicker Cindy1200**: target cells `57!; 60 (+24)`. Nidoqueen is 24 levels higher and in back, Tentacruel is added. Current mapping: `Picnicker` `PICNICKER` (CINDY).

- **Camper Barry / 1200**: target cells `57!; 60 (+24)`. Nidoking is 24 levels higher and in back, Tentacruel is added. Current mapping: `Camper` `CAMPER` (BARRY).

- **Lass Alice / 1392**: target cells `58!; 59 (+25); 58!`. Vileplumes #1 & #2 replaces Glooms #1 & #2, & Arbok is 25 levels higher. Current mapping: `Lass` `LASS` (ALICE).

### Gym Leader Janine

- **Janine / 6400**: target cells `63 (+27) / Leftovers; 61 / Mystic Water; 62!; 62! / Quick Claw; 63 (+27); 64 (+25) / BrightPowder`. Weezing #1 & Crobat are 27 levels higher & Weezing is in front, Venomoth is 25 levels higher, & Tentacruel, Muk, & Nidoqueen, are added, lost 1 Weezing & Ariados. Current mapping: `Janine` `JANINE` (JANINE).
  Movesets: `-Sludge Bomb / -Fire Blast / -Destiny Bond / -Amnesia` | `-Surf / -Ice Beam / -Toxic / -Confuse Ray` | `-Minimize / -Sludge Bomb / -Toxic / -Acid Armor` | `-Earthquake / -Sludge Bomb / -Thunderbolt / -Submission` | `-Pursuit / -Sludge Bomb / -Toxic / -Confuse Ray` | `-Giga Drain / -Psychic / -Toxic / -Double Team`.

### Route 17

- **Biker Riley / 1920**: target cells `60 (+26)`. Weezing is 26 levels higher. Current mapping: `Biker` `BIKER` (RILEY).

- **Biker Glenn / 1856**: target cells `57 (+29); 55 (+25); 58 (+26)`. Koffing is 29 levels higher, Magmar is 25 levels higher, Weezing is 26 levels higher. Current mapping: `Biker` `BIKER` (GLENN).

- **Biker Joel / 1856**: target cells `58 (+26); 58!`. Magmar #1 is 26 levels higher, Electabuzz replaces Magmar #2. Current mapping: `Biker` `BIKER` (JOEL).

- **Biker Charles / 1792 / (He’s a Heartbreaker… his name… Charles).**: target cells `56!; 56!; 56 (+26)`. Poliwrath replaces Koffing, Charizard replaces Charmeleon, & Weezing is 26 levels higher. Current mapping: `Biker` `BIKER` (CHARLES).

### Route 18

- **Bird Keeper Bob1464**: target cells `61 (+27)`. Noctowl is 27 levels higher. Current mapping: `BirdKeeper` `BIRD_KEEPER` (BOB).

- **Bird Keeper Boris1440**: target cells `60!; 58!; 60 (+28)`. Yanma replaces Doduo #1, Murkrow replaces Doduo #2, & Dodrio is 28 levels higher. Current mapping: `BirdKeeper` `BIRD_KEEPER` (BORIS).

### Pewter Gym

- **Camper Jerry / 1200**: target cells `60!; 58 (+21); 60!`. Sandslash is 21 levels higher and no longer in front, Dugtrio & Donphan are added. Current mapping: `Camper` `CAMPER` (JERRY).

### Gym Leader Brock

- **Brock / 6600**: target cells `66! / Quick Claw; 66! / Hard Stone; 66 (+26) / Focus Band; 66 (+26) / Scope Lens; 66! / Magnet; 66! / Leftovers`. Golem replaces Graveler, Aerodactyl replaces Rhyhorn, Steelix replaces Onix, Omastar & Kabutops are 26 levels higher, & Tyranitar is added, with all Pokemon having held items. Current mapping: `Brock` `BROCK` (BROCK).
  Movesets: `-Curse / -Rock Slide / -Body Slam / -Earthquake` | `-AncientPower / -Sky Attack / -Earthquake / -Fire Blast` | `-AncientPower / -Ice Beam / -Surf / -Toxic` | `-Surf / -AncientPower / -Cut / -Swords Dance` | `-Crunch / -Rock Slide / -Curse / -Thunderbolt` | `-Curse / -Earthquake / -Rock Slide / -Iron Tail`.

### Route 2

- **Bug Catcher Ed960**: target cells `60 (+30); 60 (+30); 60 (+30)`. Beedrills are 30 levels higher. Current mapping: `BugCatcher` `BUG_CATCHER` (ED).

- **Bug Catcher Doug992**: target cells `62 (+28)`. Ariados is 28 levels higher. Current mapping: `BugCatcher` `BUG_CATCHER` (DOUG).

- **Bug Catcher Rob992**: target cells `62 (+30); 62 (+30)`. Beedrill & Butterfree are 30 levels higher. Current mapping: `BugCatcher` `BUG_CATCHER` (ROB).

### Route 3

- **Youngster Warren960**: target cells `60 (+25)`. Fearow is 25 levels higher. Current mapping: `Youngster` `YOUNGSTER` (WARREN).

- **Youngster Jimmy944**: target cells `59 (+26); 59 (+26)`. Raticate & Arbok are 26 levels higher. Current mapping: `Youngster` `YOUNGSTER` (JIMMY).

- **Firebreather Otis2784**: target cells `58 (+29); 60 (+28); 58 (+29)`. Magmars are 29 levels higher, Weezing is 28 levels higher. Current mapping: `Firebreather` `FIREBREATHER` (OTIS).

- **Firebreather Burt2880**: target cells `60!; 60!`. Weezing replaces Koffing, Magcargo replaces Slugma. Current mapping: `Firebreather` `FIREBREATHER` (BURT).

### Route 4

- **Picnicker Hope1220**: target cells `61!`. Ampharos replaces Flaaffy. Current mapping: `Picnicker` `PICNICKER` (HOPE).

- **Bird Keeper Hank1416**: target cells `59!; 59 (+25)`. Murkrow replaces Pidgey, Pidgeot is 25 levels higher. Current mapping: `BirdKeeper` `BIRD_KEEPER` (HANK).

- **Picnicker Sharon1160**: target cells `61 (+30); 58 (+25)`. Furret is 30 levels higher, Rapidash is 25 levels higher. Current mapping: `Picnicker` `PICNICKER` (SHARON).

### Gym Leader Blue

- **Blue / 6900**: target cells `69! / Miracle Berry; 68 (+13) / TwistedSpoon; 67! / Scope Lens; 68 (+10) / Focus Band; 68 (+10) / Leftovers; 69 (+11) / Pink Bow`. Articuno replaces Pidgeot, Alakazam is 13 levels higher, Gyarados & Exeggutor are 10 levels higher, Arcanine is 11 levels higher, Machamp replaces Rhydon, & all Pokemon have held items. Current mapping: `Blue` `BLUE` (BLUE).
  Movesets: `-Ice Beam / -Sky Attack / -Rest / -Toxic` | `-ThunderPunch / -Recover / -Psychic / -ShadowBall` | `-Cross Chop / -Rock Slide / -Earthquake / -Body Slam` | `-Hydro Pump / -Double Team / -Body Slam / -Reversal` | `-Leech Seed / -Sleep Powder / -Psychic / -Giga Drain` | `-Flamethrower / -Curse / -Crunch / -ExtremeSpeed`.

### Route 1

- **Schoolboy Danny1760**: target cells `55 (+24); 55 (+24); 55 (+24)`. Jynx, Magmar, & Electabuzz are 24 levels higher. Current mapping: `Schoolboy` `SCHOOLBOY` (DANNY).

- **Cooltrainer Quinn2784**: target cells `58 (+20); 58 (+20)`. Ivysaur & Starmie are 20 levels higher. Current mapping: `CooltrainerF` `COOLTRAINERF` (QUINN).

### Route 21

- **Swimmer Nikki1160**: target cells `58!; 58!; 58 (+30)`. Dewgong #2 replaces Seel #1, Cloyster replaces Seel #2, Dewgong is 30 levels higher, & lost 1 Seel. Current mapping: `SwimmerF` `SWIMMERF` (NIKKI).

- **Fisher Arnold / 2440**: target cells `61!; 61!`. Lanturn replaces Tentacruel, Quagsire is added. Current mapping: `Fisher` `FISHER` (ARNOLD).

- **Swimmer Seth472**: target cells `59 (+28); 59 (+28); 59!`. Quagsire #1 & Octillery are 28 levels higher, Gyarados replaces Quagsire #2. Current mapping: `SwimmerM` `SWIMMERM` (SETH).

### Route 20

- **Swimmer Cameron512**: target cells `64!`. Azumarill replaces Marill. Current mapping: `SwimmerM` `SWIMMERM` (CAMERON).

- **Swimmer Lori / 1240**: target cells `62 (+30); 62 (+30)`. Starmie’s are 30 levels higher. Current mapping: `SwimmerF` `SWIMMERF` (LORI).

- **Swimmer Nicole1260**: target cells `60!; 63 (+31)`. Mantine replaces Marill #1, Lapras is 31 levels higher, lost 1 Marill. Current mapping: `SwimmerF` `SWIMMERF` (NICOLE).

### Gym Leader Blaine

- **Blaine / 6700**: target cells `66 (+16) / Pink Bow; 65 (+20) / Gold Berry; 66! / Miracle Seed; 65! / Leftovers; 67! / Sharp Beak; 67! / Charcoal`. Rapidash is 16 levels higher and in front, Magmar is 20 levels higher, Houndoom, Ninetales, Moltres, & Arcanine are added, and all Pokemon have held items, lost 1 Magcargo. Current mapping: `Blaine` `BLAINE` (BLAINE).
  Movesets: `-Double-Edge / -Sunny Day / -Fire Blast / -Solarbeam` | `-ThunderPunch / -Fire Blast / -Psychic / -Confuse Ray` | `-Flamethrower / -Sunny Day / -Solarbeam / -Crunch` | `-Fire Blast / -Shadow Ball / -Sunny Day / -Hypnosis` | `-Fire Blast / -Sky Attack / -Solarbeam / -Sunny Day` | `-Crunch / -ExtremeSpeed / -DragonBreath / -Fire Blast`.

### Route 19

- **Swimmer Tucker480**: target cells `60!; 60 (+26)`. Qwilfish replaces Shellder, Cloyster is 26 levels higher. Current mapping: `SwimmerM` `SWIMMERM` (TUCKER).

- **Swimmer Dawn1200**: target cells `60 (+26)`. Seaking is 26 levels higher. Current mapping: `SwimmerF` `SWIMMERF` (DAWN).

- **Swimmer Harold488**: target cells `62!; 61 (+31)`. Octillery replaces Remoraid, Seadra is 31 levels higher. Current mapping: `SwimmerM` `SWIMMERM` (HAROLD).

- **Swimmer Jerome464**: target cells `58!; 58!; 58 (+28)`. Vaporeon replaces Seadra, Seaking replaces Goldeen, & Tentacruel is 28 levels higher, lost 1 Tentacool. Current mapping: `SwimmerM` `SWIMMERM` (JEROME).

### Red

- **PKMN Trainer Red7500**: target cells `93 (+12) / Light Ball; 75 / Leftovers; 77 / Miracle Seed; 77 / Charcoal; 77 / Quick Claw; 75! / MiracleBerry`. Pikachu is 12 levels higher, Mewtwo replaces Espeon, Venusaur, Charizard, & Blastoise are 2 levels lower, and all Pokemon have held items. Current mapping: `Red` `RED` (RED).
  Movesets: `-Thunderbolt / -Surf / -Iron Tail / -Double Team` | `-Amnesia / -Curse / -Body Slam / -Earthquake` | `-Giga Drain / -Body Slam / -Sleep Powder / -Leech Seed` | `-Fire Blast / -Wing Attack / -Outrage / -Steel Wing` | `-Ice Beam / -Hydro Pump / -Body Slam / -Earthquake` | `-Recover / -Submission / -Flamethrower / -Psychic`.

## Deferred Rematch Requirements

These teams are source data for a future rematch feature only. Do not wire these battles in the current patch.

### Johto Gym Leader Rematches

- **Gym Leader Falkner / Falkner / 5500 / (After becoming the Champion)**: target cells `54 / Gold Berry; 53; 53 / Focus Band; 54; 55`.
  Movesets: `-Psychic / -Wing Attack / -Hypnosis / -Dream Eater` | `-Spikes / -Drill Peck / -Mud-Slap / -Steel Wing` | `-Endure / -Flail / -Drill Peck / -Tri Attack` | `-Drill Peck / -Faint Attack / -Haze / -Icy Wind` | `-Sky Attack / -ExtremeSpeed / -Double Team / -Steel Wing`.

- **Gym Leader Bugsy / Bugsy / 5500 / (After becoming the Champion)**: target cells `54 / Focus Band; 53; 53 / Berry Juice; 54; 55 / Scope Lens`.
  Movesets: `-Giga Drain / -Agility / -Baton Pass / -Light Screen` | `-Curse / -Explosion / -Pin Missile / -Spike Cannon` | `-Toxic / -Protect / -Sandstorm / -Wrap` | `-Metal Claw / -Twineedle / -Agility / -Substitute` | `-Slash / -Cut / -Wing Attack / -Swords Dance`.

- **Gym Leader Whitney / Whitney / 5500 / (After becoming the Champion)**: target cells `53; 54 / Mint Berry; 53; 54; 55 / Pink Bow`.
  Movesets: `-Ice Punch / -Fire Punch / -ThunderPunch / -Encore` | `-Strength / -Earthquake / -Rest / -Metal Claw` | `-Egg Bomb / -Attract / -Softboiled / -Light Screen` | `-Thrash / -Earthquake / -Rage / -Pursuit` | `-Iron Tail / -Attract / -Body Slam / -Milk Drink`.

- **Gym Leader Morty / Morty / 5500 / (After becoming the Champion)**: target cells `54; 53 / Pink Bow; 54 / Spell Tag; 53; 55 / Gold Berry`.
  Movesets: `-Shadow Ball / -Destiny Bond / -Mean Look / -Confuse Ray` | `-Shadow Ball / -Headbutt / -Hypnosis / -Dream Eater` | `-Shadow Ball / -Giga Drain / -Sludge Bomb / -Psychic` | `-Shadow Ball / -Mean Look / -Pain Split / -Perish Song` | `-Shadow Ball / -Hypnosis / -Thunderbolt / -Dream Eater`.

- **Gym Leader Chuck / Chuck / 5500 / (After becoming the Champion)**: target cells `54 / Scope Lens; 53; 53; 54; 55 / Gold Berry`.
  Movesets: `-Triple Kick / -Double Kick / -Dig / -Pursuit` | `-Rock Slide / -ThunderPunch / -LowKick / -Faint Attack` | `-Submission / -Twineedle / -Strength / -Swords Dance` | `-Cross Chop / -ThunderPunch / -Rock Slide / -Meditate` | `-Surf / -DynamicPunch / -Belly Drum / -Body Slam`.

- **Gym Leader Jasmine / Jasmine / 5500 / (After becoming the Champion)**: target cells `53; 54; 53; 55 / Focus Band; 55 / Quick Claw`.
  Movesets: `-Spikes / -Drill Peck / -Swagger / -Steel Wing` | `-Double-Edge / -Substitute / -Rain Dance / -Thunder` | `-Rain Dance / -Surf / -Recover / -AncientPower` | `-Twineedle / -Swords Dance / -Steel Wing / -Light Screen` | `-Crunch / -Earthquake / -Rock Slide / -Iron Tail`.

- **Gym Leader Pryce / Pryce / 5500 / (After becoming the Champion)**: target cells `54; 53 / MiracleBerry; 53; 54; 55 / Soft Sand`.
  Movesets: `-Faint Attack / -Metal Claw / -Beat Up / -Blizzard` | `-Surf / -Ice Beam / -Rest / -Encore` | `-Ice Beam / -Psychic / -Shadow Ball / -Lovely Kiss` | `-Surf / -Ice Beam / -Body Slam / -Confuse Ray` | `-Strength / -Earthquake / -Rock Smash / -Blizzard`.

- **Gym Leader Clair / Clair / 5500 / (After becoming the Champion)**: target cells `54 / Gold Berry; 53 / Focus Band; 53 / Mint Berry; 54 / Gold Berry; 55 / Leftovers`.
  Movesets: `-Thunder Wave / -Thunderbolt / -Flamethrower / -Dragonbreath` | `-Bite / -Surf / -Fly / -Twister` | `-Surf / -Ice Beam / -Body Slam / -Rest` | `-Thunder Wave / -Thunderbolt / -Ice Beam / -Dragonbreath` | `-Agility / -Hydro Pump / -Ice Beam / -Dragonbreath`.

### Indigo Plateau Rematches

- **Elite Four Will / Will / 6800 / (After obtaining 16 Gym Badges)**: target cells `66 / Scope Lens; 67 / Leftovers; 67 / Quick Claw; 67 / MiracleBerry; 67 / Charcoal; 68 / Leftovers`.
  Movesets: `-Double-Edge / -Reflect / -Earthquake / -Hidden Power` | `-Rest / -Sleep Talk / -Surf / -Flamethrower` | `-Flamethrower / -Rock Smash / -Earthquake / -Curse` | `-Sleep Powder / -Ancientpower / -Dream Eater / -Softboiled` | `-Fire Blast / -Shadow Ball / -Confuse Ray / -Iron Tail` | `-Future Sight / -Protect / -Fly / -Confuse Ray`.

- **Elite Four Koga / Koga / 6800 / (After obtaining 16 Gym Badges)**: target cells `67 / Mint Berry; 67 / Leftovers; 67 / Quick Claw; 67 / BrightPowder; 67 / Scope Lens; 68 / Leftovers`.
  Movesets: `-Waterfall / -Rest / -Blizzard / -Giga Drain` | `-Minimize / -Fire Blast / -Sludge Bomb / -Toxic` | `-Lovely Kiss / -Fire Blast / -Surf / -Earthquake` | `-Fire Punch / -Thunder Wave / -Psychic / -Shadow Ball` | `-Earthquake / -Iron Tail / -Sludge Bomb / -Faint Attack` | `-Protect / -Toxic / -Fly / -Confuse Ray`.

- **Elite Four Bruno / Bruno / 6800 / (After obtaining 16 Gym Badges)**: target cells `67 / Quick Claw; 68 / Scope Lens; 67 / Quick Claw; 68 / Scope Lens; 67 / Pink Bow; 68 / Leftovers`.
  Movesets: `-Crunch / -Earthquake / -Explosion / -Rock Slide` | `-Submission / -Hydro Pump / -Psychic / -Blizzard` | `-Cross Chop / -Megahorn / -Reversal / -Earthquake` | `-Curse / -Earthquake / -Ancientpower / -Rock Smash` | `-Hidden Power / -Crunch / -Rest / -Snore` | `-Rock Slide / -Earthquake / -Body Slam / -Cross Chop`.

- **Elite Four Karen / Karen / 6900 / (After obtaining 16 Gym Badges)**: target cells `68 / MiracleBerry; 67 / Scope Lens; 68 / Focus Band; 68 / Sharp Beak; 67 / Spell Tag; 69 / BlackGlasses`.
  Movesets: `-Growth / -Hidden Power / -Shadow Ball / -Baton Pass` | `-Slash / -Hypnosis / - Iron Tail / -Cut` | `-Shadow Ball / -Psychic / -Destiny Bond / -Giga Drain` | `-Sky Attack / -Pursuit / -Swagger / -Psych Up` | `-Psychic / -Softboiled / -Attract / -Zap Cannon` | `-Flamethrower / -Crunch / -Iron Tail / -Hidden Power`.

- **Champion Lance / Lance / 7000 / (After obtaining 16 Gym Badges)**: target cells `69 / Magnet; 68 / MiracleBerry; 69 / Quick Claw; 69 / Leftovers; 69 / Scope Lens; 70 / Pink Bow`.
  Movesets: `-Crunch / -Rock Slide / -Earthquake / -Thunderbolt` | `-Blizzard / -Fire Blast / -Thunder / -Rest` | `-Hidden Power / -Hyper Beam / -Hydro Pump / -Fire Blast` | `-Fire Blast / -Crunch / -Earthquake / -Swords Dance` | `-Sky Attack / -Rock Slide / -Earthquake / -Iron Tail` | `-Iron Tail / -Curse / -ExtremeSpeed / -Hyper Beam`.

### Trainer Rematches

- **Trainer Rematches / Youngster Joey #2 / (After reaching Goldenrod City)**: target cells `27 (+12) / Pink Bow`.

- **Trainer Rematches / Youngster Joey #3 / (After reaching Olivine City)**: target cells `30! / Pink Bow`.

- **Trainer Rematches / Youngster Joey #4 / (After clearing Radio Tower)**: target cells `40! / Pink Bow`.

- **Trainer Rematches / Youngster Joey #5 / (After becoming the Champion)**: target cells `65! / Pink Bow`.

- **Trainer Rematches / Bug Catcher Wade #2 / (After reaching Goldenrod City)**: target cells `20!; 20!`.

- **Trainer Rematches / Bug Catcher Wade #3 / (After reaching Mahogany Tow.)**: target cells `25 (+11); 25 (+10); 25!`.

- **Trainer Rematches / Bug Catcher Wade #4 / (After clearing Radio Tower)**: target cells `35 (+11); 35 (+10); 35!; 35!`.

- **Trainer Rematches / Bug Catcher Wade #5 / (After becoming the Champion)**: target cells `46 (+16); 45 (+13); 46!; 45!; 47!`.

- **Trainer Rematches / Picnicker Liz #2 / (After reaching Ecruteak City)**: target cells `24 (+9); 25 (+10)`.

- **Trainer Rematches / Picnicker Liz #3 / (After clearing Rocket HQ)**: target cells `29 (+10); 29 (+10); 30 (+9)`.

- **Trainer Rematches / Picnicker Liz #4 / (After clearing Radio Tower)**: target cells `34!; 36!; 36 (+10)`.

- **Trainer Rematches / Picnicker Liz #5 / (After becoming the Champion)**: target cells `50!; 52 (+20); 53 (+21)`.

- **Trainer Rematches / Fisher Ralph #2 / (After reaching Ecruteak City)**: target cells `24 (+7)`.

- **Trainer Rematches / Fisher Ralph / #3 / (After reaching Lake of Rage)**: target cells `28 (+11); 28!`.

- **Trainer Rematches / Fisher Ralph / #4 / (After becoming the Champion)**: target cells `45 (+15); 48!; 45!`.

- **Trainer Rematches / Fisher Ralph / #5 / (After returning Machine Part)**: target cells `55 (+20); 58!; 55!`.

- **Trainer Rematches / Hiker Anthony / #2 / (After reaching Olivine City)**: target cells `25!; 25!`.

- **Trainer Rematches / Hiker Anthony / #3 / (After clearing Radio Tower)**: target cells `35 (+10); 34 (+5); 35 (+8)`.

- **Trainer Rematches / Hiker Anthony / #4 / (After becoming the Champion)**: target cells `48!; 50!; 48!`.

- **Trainer Rematches / Hiker Anthony / #5 / (After returning Machine Part)**: target cells `56!; 54!; 56 (+20)`.

- **Trainer Rematches / Picnicker Gina #2 / (After reaching Mahogany Tow.)**: target cells `25!; 25!; 27 (+2)`.

- **Trainer Rematches / Picnicker Gina #3 / (After clearing Radio Tower)**: target cells `36!; 36!; 35 (+6)`.

- **Trainer Rematches / Picnicker Gina #4 / (After becoming the Champion**: target cells `45 (+15); 45 (+15); 48!`.

- **Trainer Rematches / Picnicker Gina #5 / (After returning Machine Part**: target cells `52 (+19); 52 (+19); 55 (+17)`.

- **Trainer Rematches / Camper Todd / #2 / (After reaching Cianwood City)**: target cells `25!; 22 (+5); 24 (+1)`.

- **Trainer Rematches / Camper Todd / #3 / (After reaching Blackthorn City)**: target cells `36!; 35!; 35!`.

- **Trainer Rematches / Camper Todd / #4 / (After becoming the Champion)**: target cells `46!; 45!; 46!; 45!`.

- **Trainer Rematches / Camper Todd / #5 / (After returning Machine Part)**: target cells `56!; 55!; 56 (+22); 55 (+19)`.

- **Trainer Rematches / Bug Catcher Arnie #2 / (After reaching Lake of Rage)**: target cells `28!; 28 (+9)`.

- **Trainer Rematches / Bug Catcher Arnie #3 / (After reaching Blackthorn City)**: target cells `38 (+10); 37!; 38!`.

- **Trainer Rematches / Bug Catcher Arnie #4 / (After becoming the Champion)**: target cells `48 (+12); 47!; 48!; 48!`.

- **Trainer Rematches / Bug Catcher Arnie #5 / (After returning Machine Part)**: target cells `58 (+18); 56!; 57!; 56!`.

- **Trainer Rematches / Schoolboy Alan #2 / (After reaching Olivine City)**: target cells `24 (+7); 25!`.

- **Trainer Rematches / Schoolboy Alan #3 / (After reaching Blackthorn City)**: target cells `30 (+10); 35 (+13); 33 (+13); 32!`.

- **Trainer Rematches / Schoolboy Alan #4 / (After becoming the Champion)**: target cells `27; 27; 30; 30; Will be edited in the future.`.

- **Trainer Rematches / Schoolboy Alan #5 / (After returning Machine Part)**: target cells `45 (+10); 45 (+13); 43 (+8); 44!`.

- **Trainer Rematches / Lass Dana #2 / (After reaching Cianwood City)**: target cells `25 (+4); 25 (+4)`.

- **Trainer Rematches / Lass Dana #3 / (After clearing Radio Tower)**: target cells `37!; 37 (+8)`.

- **Trainer Rematches / Lass Dana #4 / (After becoming the Champion)**: target cells `44!; 45 (+13)`.

- **Trainer Rematches / Lass Dana #5 / (After returning Machine Part)**: target cells `54 (+18); 55 (+19)`.

- **Trainer Rematches / Schoolboy Chad #2 / (After reaching Mahogany Tow.)**: target cells `28 (+9); 26 (+7)`.

- **Trainer Rematches / Schoolboy Chad #3 / (After clearing Radio Tower)**: target cells `37 (+10); 35 (+4)`.

- **Trainer Rematches / Schoolboy Chad #4 / (After becoming the Champion)**: target cells `46 (+16); 44 (+10)`.

- **Trainer Rematches / Schoolboy Chad #5 / (After returning Machine Part)**: target cells `46 (+16); 44 (+10)`.

- **Trainer Rematches / Sailor Huey #2 / (After clearing Radio Tower)**: target cells `28; 28; Will be edited in the future.`.

- **Trainer Rematches / Sailor Huey #3 / (After becoming the Champion)**: target cells `34; 34; Will be edited in the future.`.

- **Trainer Rematches / Sailor Huey #4 / (After returning Machine Part)**: target cells `38; 38; Will be edited in the future.`.

- **Trainer Rematches / Fisher Tully #2 / (After clearing Radio Tower)**: target cells `24; Will be edited in the future.`.

- **Trainer Rematches / Fisher Tully #3 / (After becoming the Champion)**: target cells `42; 45 (+13); 42`.

- **Trainer Rematches / Fisher Tully #4 / (After returning Machine Part)**: target cells `52 (+18); 55 (+18); 52 (+18)`.

- **Trainer Rematches / Picnicker Tiffany #2 / (After clearing Radio Tower)**: target cells `34!; 34!`.

- **Trainer Rematches / Picnicker Tiffany #3 / (After becoming the Champion)**: target cells `37!; Will be edited in the future.`.

- **Trainer Rematches / Picnicker Tiffany #4 / (After returning Machine Part)**: target cells `53!; 54!`.

- **Trainer Rematches / PokeManiac Brent #2 / (After clearing Rocket HQ)**: target cells `33 (+8)`.

- **Trainer Rematches / PokeManiac Brent #3 / (After becoming the Champion)**: target cells `46 (+10)`.

- **Trainer Rematches / PokeManiac Brent #4 / (After returning Machine Part)**: target cells `53 (+12)`.

- **Trainer Rematches / Fisher Wilton #2 / (After becoming the Champion)**: target cells `48!; 46!; 46 (+14)`.

- **Trainer Rematches / Fisher Wilton #3 / (After returning Machine Part**: target cells `58!; 56!; 56 (+22)`.

- **Trainer Rematches / Bird Keeper Vance #2 / (After becoming the Champion)**: target cells `46!; 37!; 48!; 49!`.

- **Trainer Rematches / Bird Keeper Vance #3 / (After returning Machine Part)**: target cells `55 (+18); 54!; 56!; 55!`.

- **Trainer Rematches / Hiker Parry #2 / (After becoming the Champion)**: target cells `45!; 45!; 48!`.

- **Trainer Rematches / Hiker Parry #3 / (After returning Machine Part))**: target cells `50 (+15); 50 (+15); 50 (+12)`.

- **Trainer Rematches / Black Belt Kenji #2 & #3 / (After becoming the Champion)**: target cells `33!; 36!; 33!; 38!; Will be edited in the future.`.

- **Trainer Rematches / Schoolboy Jack #2 / (After reaching Olivine City)**: target cells `24!; 23 (+6)`.

- **Trainer Rematches / Schoolboy Jack #3 / (After clearing Radio Tower)**: target cells `28; 31; Will be edited in the future.`.

- **Trainer Rematches / Schoolboy Jack #4 / (After becoming the Champion)**: target cells `40!; 43!; 43 (+10)`.

- **Trainer Rematches / Schoolboy Jack #5 / (After returning Machine Part)**: target cells `35; 35; 37; Will be edited in the future.`.

- **Trainer Rematches / Picnicker Erin / #2 / (After becoming the Champion)**: target cells `44!; 42!; 42!; 44!`.

- **Trainer Rematches / Picnicker Erin / #2 / (After becoming the Champion)**: target cells `44!; 42!; 42!; 44!`.

- **Trainer Rematches / Picnicker Erin / #3 / (After returning Machine Part)**: target cells `44!; 42!; 40 (+6); 44!; Will be edited in the future.`.

- **Trainer Rematches / Bird Keeper Jose #2 / (After becoming the Champion)**: target cells `45!; 45!; 45 (+9); 45!`.

- **Trainer Rematches / Bird Keeper Jose #3 / (After returning Machine Part)**: target cells `48!; 48!; 48 (+8); 48!; 48!`.

- **Trainer Rematches / Cooltrainer Reena #2 / (After becoming the Champion)**: target cells `48 (+14); 47 (+11); 48!; 47!; 49 (+15)`.

- **Trainer Rematches / Cooltrainer Reena #3 / (After returning Machine Part)**: target cells `55 (+17); 55 (+15); 54!; 56!; 57 (+19)`.

- **Trainer Rematches / Cooltrainer Gaven #2 / (After becoming the Champion)**: target cells `50 (+15); 50 (+15); 50 (+15); 50!; 50!`.

- **Trainer Rematches / Cooltrainer Gaven #3 / (After returning Machine Part)**: target cells `55 (+16); 55 (+16); 55 (+16); 55!; 55!`.

- **Trainer Rematches / Cooltrainer Beth #2 / (After becoming the Champion)**: target cells `50 (+11); 50!; 50!; 50!; 50!`.

- **Trainer Rematches / Cooltrainer Beth #2 / (After becoming the Champion)**: target cells `50 (+11); 50!; 50!; 50!; 50!`.

- **Trainer Rematches / Cooltrainer Beth #3 / (After returning Machine Part)**: target cells `55 (+12); 55!; 55!; 55!; 55!`.

## Excluded Current Custom Gym Entries

These source rows are not in the pending implementation list because the current repo already has custom teams in the same gym leader slots. They need a merge/overwrite decision before any change:

- **Gym Leader Falkner / Falkner / 1000**: source says `Noctowl replaces Pidgeotto, and Noctowl now has a held Berry.`; current repo has a custom `Falkner` party already.
- **Gym Leader Bugsy / Bugsy / 1600**: source says `Pineco replaces Metapod. Ledian replaces Kakuna, Scyther now has a held Berry Juice.`; current repo has a custom `Bugsy` party already.

## Automatic Mapping Problems

The entries below did not map cleanly to one existing trainer party by class/name. Before implementation, resolve each against the map script or add/rename trainer constants as needed.

- `Rival Battles` / **Rival #2 (Chikorita) / 1080**: unmapped. Change: Zubat is 1 level higher and now in front, Larvitar replaces Gastly, Bayleef, Quilava, or Croconaw respectively are 2 levels higher.
- `Rival Battles` / **Rival #3 (Chikorita) / 1440**: unmapped. Change: Team rework. Golbat replaces Zubat, Starter Pokemon are 2 levels higher, Larvitar & either Remoraid, Weepinbell, or Houndour are added, lost Haunter & Magnemite.
- `Rival Battles` / **Rival #4 (Chikorita) / 2400**: unmapped. Change: Team rework. Golbat is 9 levels higher, Meganium & Feraligatr are 8 levels higher, Pupitar & either Octillery & Houndoom, Victreebel & Octillery, or Houndoom & Victreebel are added, lost  Magnemite, Haunter, & Sneasel, Typhlosion replaces Quilava in Rival (Cyndaquil).
- `Rival Battles` / **Rival #5 (Chikorita) / 2880**: unmapped. Change: Team rework. Golbat & Starter Pokemon are 9 levels higher, Ursaring, Tyranitar, & either Octillery & Houndoom,Victreebel & Octillery, or Houndoom & Victreebel are added, lost Sneasel, Magneton, Haunter, & Kadabra, and some Pokemon have held items.
- `Rival Battles` / **Rival #6 (Chikorita) / 6400**: unmapped. Change: Team rework. Starter Pokemon are 19 levels higher, Ursaring, Crobat, Tyranitar, & either Octillery & Houndoom, Victreebel & Octillery, or Houndoom & Victreebel are added, lost Sneasel, Golbat, Magneton, Haunter, & Kadabra, and all Pokemon have held items.
- `Rival Battles` / **Rival #7 (Chikorita) / 6800**: unmapped. Change: Team rework. Starter Pokemon are 18 levels higher, Crobat is 20 levels higher, Ursaring, Tyranitar, & either Octillery & Houndoom, Victreebel & Octillery, or Houndoom & Victreebel are added, lost Sneasel, Magneton, Haunter, & Kadabra, and all Pokemon have held items.
- `Route 31` / **Bug Catcher Wade / 80**: ambiguous. Change: Pineco replaces Caterpie, lost 2 Caterpie.
- `Route 32` / **Fisher Ralph320**: ambiguous. Change: Goldeen is 2 levels lower.
- `Union Cave` / **Hiker Russel / 256**: unmapped. Change: Geodude is 1 level higher, Cubone replaces Geodude #2, lost 1 Geodude.
- `Slowpoke Well` / **Rocket Grunt #1 (Slowpoke) / 360**: unmapped. Change: Zubat replaces Rattata #2.
- `Slowpoke Well` / **Rocket Eto / (Slowpoke) / 440**: unmapped. Change: Is now named. Elekid replaces Rattata, Smoochum replaces Zubat #1, Magby replaces Zubat #2.
- `Slowpoke Well` / **Rocket Grunt #3 (Slowpoke) / 600**: unmapped. Change: Koffing is 2 levels lower, Slowpoke & Houndour are added.
- `Azalea Gym` / **Twins Amy & May240**: ambiguous. Change: Ledyba & Spinarak are 2 levels higher.
- `Ilex Forest` / **Bug Catcher Wayne240**: unmapped. Change: Paras is now 5 levels higher and in front, Oddish replaces Ledyba.
- `Route 34` / **Picnicker Gina / 280**: ambiguous. Change: Skiploom replaces Hoppip, Bulbasaur is 2 levels higher, Lost 1 Hoppip.
- `Route 34` / **Camper Todd / 300**: ambiguous. Change: Azumarill replaces Psyduck.
- `Goldenrod Tunnel` / **Super Nerd Eric480**: ambiguous. Change: Grimer is 5 levels higher, Cubone replaces Grimer #2.
- `Route 35` / **Juggler Irwin / 640**: ambiguous. Change: Voltorbs are 2 levels higher, Pineco replaces Voltorb #2, lost 1 Voltorb.
- `Route 35` / **Bug Catcher Arnie / 288**: ambiguous. Change: Venonat is 3 levels higher and not in front, & Yanma is added.
- `National Park` / **PokeFan Beverly1600**: ambiguous. Change: Snubbull is 6 levels higher.
- `National Park` / **Schoolboy Jack / 544**: ambiguous. Change: Sunflora replaces Oddish, Voltorb is 2 levels higher.
- `Route 36` / **Schoolboy Alan / 640**: ambiguous. Change: Tangela is 4 levels higher, Growlithe is added.
- `Route 37` / **Twins Ann & Anne360**: ambiguous. Change: Clefairy is 2 levels higher and in front, Furret replaces Jigglypuff.
- `Ecruteak City` / **Kimono Girl Naoko1512 / Kimono Girl Sayo1512 / Kimono Girl Zuki1512 / Kimono Girl Kuni1512 / Kimono Girl Miki1512**: unmapped. Change: Eeveelutions are 4 levels higher.
- `Ecruteak City` / **Sage Gaku / 1280**: unmapped. Change: Noctowl & Flareon are 8 levels higher, Victreebel is added.
- `Ecruteak City` / **Sage Masa / 1280**: unmapped. Change: Noctowl & Jolteon are 8 levels higher, Victreebel is added.
- `Ecruteak City` / **Sage Koji / 1280**: unmapped. Change: Noctowl & Vaporeon are 8 levels higher, Victreebel is added.
- `Route 38` / **Lass Dana / 480**: ambiguous. Change: Flaaffy is 1 level higher, Psyduck is 2 levels higher.
- `Route 38` / **Schoolboy Chad / 704**: ambiguous. Change: Mr. Mime is now 3 levels higher, Magnemite is added.
- `Route 38` / **Beauty Olivia / 1848**: unmapped. Change: Corsola is now 2 levels higher.
- `Route 39` / **PokeFan Derek1760**: ambiguous. Change: Pikachu is 5 levels higher, & Ponyta is added.
- `Route 39` / **PokeFan Jaime1600**: unmapped. Change: Umbreon replaces Meowth.
- `Olivine Lighthouse` / **Sailor Huey / 880**: ambiguous. Change: Poliwhirl is now in front, Machop replaces Poliwag.
- `Olivine Lighthouse` / **Lass Connie / 528**: ambiguous. Change: Ponyta replaces Marill, Weepinbell is added.
- `Eusine` / **Mysticalman Eusine2700**: unmapped. Change: Politoed replaces Haunter and is now in front, Flaaffy replaces Electrode, Hypno replaces Drowzee.
- `Route 42` / **Fisher Tully / 960**: unmapped. Change: Qwilfish is 6 levels higher.
- `Mt. Mortar` / **PokeManiac Miller1200**: unmapped. Change: Pokemon are 3 levels higher.
- `Route 43` / **Picnicker Tiffany / 580**: ambiguous. Change: Clefable replaces Clefairy.
- `Route 43` / **PokeManiac Brent / 1560**: ambiguous. Change: Lickitung is 7 levels higher, Ivysaur is added.
- `Team Rocket Hideout` / **Rocket Guard #1 1040**: unmapped. Change: Drowzee is 9 levels higher, Gligar replaces Zubat.
- `Team Rocket Hideout` / **Rocket Guard #21080**: unmapped. Change: Golbat replaces Zubat, Ariados replaces Grimer, Raticate replaces Rattata.
- `Team Rocket Hideout` / **Rocket Grunt #1 (HQ B1F) / 1120**: unmapped. Change: Kangaskhan replaces Rattata #1, lost 4 Rattata.
- `Team Rocket Hideout` / **Rocket Grunt #1 (HQ B2F) / 1240**: unmapped. Change: Venomoth replaces Venonat #1, lost 1 Venonat.
- `Team Rocket Hideout` / **Rocket Grunt #2 (HQ B2F) / 1160**: unmapped. Change: Golbat is 11 levels higher.
- `Team Rocket Hideout` / **Rocket Grunt #3 (HQ B2F) / 1040**: unmapped. Change: Raticate replaces Rattata #1, Golbat replaces Zubat, Grimer replaces Rattata #2.
- `Rocket Executive Ariana #1` / **Exec. Ariana (Rocket HQ) / 2232**: unmapped. Change: Is now named. Arbok is 8 levels higher, Meowth is added, Murkrow is 6 levels higher, Vileplume replaces Gloom.
- `Rocket Executive Ariana #1` / **Rocket Grunt #1 (HQ B3F) / 1120**: unmapped. Change: Arbok replaces Ekans, Sneasel replaces Gloom.
- `Rocket Executive Ariana #1` / **Rocket Eto / (Rocket HQ) / 1120**: unmapped. Change: Is now named. Jynx replaces Raticate, Electabuzz, Magmar, & Poliwhirl are added.
- `Rocket Executive Archer #1` / **Exec. Archer (Rocket HQ) / 3000**: unmapped. Change: Is now named. Complete team rework. Weezing, Slowbro, Tauros & Houndoom are added, lost 1 Zubat, Koffing, & Raticate.
- `Radio Tower` / **Rocket Grunt #1 (Radio 1F) / 1320**: unmapped. Change: Raticate’s are 9 levels higher, Raticate #3 is added.
- `Radio Tower` / **Rocket Grunt #1 (Radio 2F) / 1400**: unmapped. Change: Arbok is 9 levels higher, Gloom is added.
- `Radio Tower` / **Rocket Grunt #2 (Radio 2F) / 1360**: unmapped. Change: Aipom replaces Rattata #1, Aipom replaces Rattata #2, Koffing replaces Rattata #3, lost 2 Rattata.
- `Radio Tower` / **Rocket Grunt #3 (Radio 2F) / 1360**: unmapped. Change: Gligar replaces Zubat #1, Hypno replaces Zubat #2
- `Radio Tower` / **Rocket Grunt #4 (Radio 2F) / 1320**: unmapped. Change: Weezing replaces Grimer #1, Muk is 8 levels higher, lost 1 Grimer.
- `Radio Tower` / **Rocket Grunt #1 (Radio 3F) / 1360**: unmapped. Change: Muk replaces Weezing, Venomoth is added.
- `Radio Tower` / **Rocket Grunt #2 (Radio 3F) / 1360**: unmapped. Change: Aipom replaces Koffing, Murkrow replaces Zubat, Forretress replaces Rattata, lost 1 Grimer.
- `Radio Tower` / **Rocket Grunt #3 (Radio 3F) / (Key Card) / 1400**: unmapped. Change: Tauros replaces Koffing #1, Slowbro replaces Koffing #2.
- `Radio Tower` / **Rocket Grunt #1 (Radio 4F) / 1400**: unmapped. Change: Exeggutor replaces Zubat, Electrode replaces Golbat, Electabuzz replaces Grimer.
- `Radio Tower` / **Rocket Grunt #2 (Radio 2F) (Key Card) / 1440**: unmapped. Change: Arbok replaces Ekans #1, Gloom is 11 levels higher and second, Ariados replaces Oddish, Vileplume replaces Ekans #2.
- `Radio Tower` / **Rocket Executive / (Key Card) / 2736**: unmapped. Change: Forretress replaces Golbat, Cloyster, Pupitar, & Magcargo are added.
- `Rocket Executive (Imposter)` / **Rocket Executive (Radio Tower) / 2736**: unmapped. Change: Complete team rework. Weezing is 4 levels higher and in 2nd, Muk, Nidoqueen, Nidoking, & Rhydon added, lost 5 Koffing’s.
- `Rocket Executive Ariana #2` / **Exec. Ariana (Radio Tower) / 2880**: unmapped. Change: Is now named. Arbok is 9 levels higher, Vileplume is 11 levels higher, Murkrow is 12 levels higher, Persian & Gyarados are added.
- `Rocket Executive Archer #2` / **Exec. Archer (Radio Tower) / 4000**: unmapped. Change: Complete team rework. Kangaskhan, Nidoqueen, Persian, Steelix, & Nidoking are added, lost 1 Houndour, Koffing, & Houndoom.
- `Goldenrod Tunnel` / **Rocket Grunt #1 (Tunnel) / 1480**: unmapped. Change: Golbat replaces Rattata, Weezing added.
- `Goldenrod Tunnel` / **Rocket Grunt #2 (Tunnel) / 1480**: unmapped. Change: Golbat is added and in front, Muk is 13 levels higher.
- `Goldenrod Tunnel` / **Rocket Grunt #3 (Tunnel) / 1480**: unmapped. Change: Golbat replaces Koffing, Arbok replaces Muk.
- `Goldenrod Tunnel` / **Rocket Grunt #4 (Tunnel) / 1440**: unmapped. Change: Vileplume replaces Gloom #1, Pinsir replaces Gloom #2, Arbok & Murkrow are added.
- `Goldenrod Warehouse` / **Rocket Grunt #1 (Warehou.) / 1400**: unmapped. Change: Weezing replaces Raticate, Hypno replaces Golbat, Gligar is added.
- `Goldenrod Warehouse` / **Rocket Eto / (Warehouse) / 1440**: unmapped. Change: Is now named. Poliwrath replaces Grimer, Jynx replaces Weezing,, Electabuzz, Magmar, & Rhydon are added.
- `Goldenrod Warehouse` / **Rocket Grunt #2 (Warehou.) / 1480**: unmapped. Change: Weezing replaces Koffing #1, lost 1 Koffing.
- `Route 44` / **Fisher Wilton / 1440**: ambiguous. Change: Qwilfish replaces Goldeen #1, Octillery replaces Goldeen #2, Seaking is 11 levels higher.
- `Route 44` / **Bird Keeper Vance / 888**: ambiguous. Change: Pidgeot replaces Pidgeotto #1, Xatu replaces Pidgeotto #2, Murkrow & Skarmory are added.
- `Dragon’s Den` / **Cooltrainer Darin2016**: unmapped. Change: Dragonair #1 is 5 levels higher, 3 Dragonair’s are added.
- `Dragon’s Den` / **Cooltrainer Cara2016**: unmapped. Change: Seadra #1 is 5 levels higher and in front,  Seadra #2 replaces Horsea #1, Gyarados replaces Horsea #2.
- `Dragon’s Den` / **Twins Lea & Pia840**: unmapped. Change: Dragonair #1 & #2 replace Dratini #1 & #2, & 2 Gyarados’s are added.
- `Route 45` / **Hiker Parry / 1216**: ambiguous. Change: Piloswine is added and in front, Steelix replaces Onix, Dugtrio is added.
- `Route 45` / **Black Belt Kenji / 864**: ambiguous. Change: Machamp replaces Machoke and in back, Onix, Hitmonlee, & Steelix are added.
- `Route 45` / **Camper Quentin760**: unmapped. Change: Fearow, Primeape, & Tauros are 8 levels higher., & Raichu is added.
- `Route 46` / **Picnicker Erin / 800**: ambiguous. Change: Rapidash replaces Ponyta #1, Rapidash replaces Ponyta #2, Nidoqueen & Raichu are added.
- `Route 27` / **Bird Keeper Jose / 1056**: ambiguous. Change: Farfetch’d is 10 levels higher, & Fearow, Pidgeot, & Skarmory are added, with Fearow in front.
- `Route 27` / **Cooltrainer Reena / 2160**: ambiguous. Change: Starmie #1 is 13 levels higher, Nidoqueen is 10 levels higher, Starmie #2 is 14 levels higher, & Vileplume & Electrode are added.
- `Route 26` / **Cooltrainer Gaven / 2112**: ambiguous. Change: Victreebel & Flareon are 13 levels higher, Kingler is 14 levels higher, Dragonair & Porygon2 are added.
- `Route 26` / **Cooltrainer Beth / 2160**: ambiguous. Change: Rapidash is 9 levels higher, Ampharos, Miltank, Lanturn, & Gengar are added.
- `S.S. Aqua: First Trip` / **Twins Meg & Peg 1080**: ambiguous. Change: Donphan replaces Phanpy, Ursaring replaces Teddiursa.
- `S.S. Aqua: Johto -> Kanto` / **Sailor Garret / 2560**: unmapped. Change: Kingler is 30 levels higher.
- `Gym Leader Lt. Surge` / **Lt. Surge / 6000**: unmapped. Change: Electrode #1 is 17 levels higher, has a held Focus Band, and in front, Magneton is 19 levels higher, Raichu is 16 levels higher and has a held Magnet, Electabuzz is 13 levels higher and has a held Scope Lens, and Lanturn & Ampharos are added, with Lanturn having a held Leftovers. Lost 1 Electrode.
- `Route 6` / **PokeFan Rex / 4400**: unmapped. Change: Stantler replaces Phanpy.
- `Route 6` / **PokeFan Allan4400**: unmapped. Change: Granbull replaces Teddiursa.
- `Celadon Gym` / **Twins Joe & Zoe1160**: unmapped. Change: Victreebel & Vileplume are 23 levels higher.
- `Route 24` / **Rocket Grunt (Route 24) / (Machine Part Quest) / 2320**: unmapped. Change: Crobat replaces Golbat, Weezing, Marowak, Hypno, & Cloyster are added.
- `Route 11` / **Youngster Olwen880**: unmapped. Change: Arcanine replaces Growlithe.

## Source Notes

- The requirements were extracted from the Google Doc HTML export because the plain-text export drops image-only Pokemon cells.
- Temporary parser exports were removed after generation; this file is the durable planning artifact.
