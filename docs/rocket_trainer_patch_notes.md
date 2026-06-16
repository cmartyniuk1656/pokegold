# Rocket Trainer Patch Notes

Implemented in `data/trainers/parties.asm` as a best-effort Rocket-only pass. No new trainer classes, names, events, scripts, or rematch systems were added.

## Implemented mappings

### Slowpoke Well

- `GRUNTM, GRUNTM_29` (`maps/SlowpokeWellB1F.asm`): Rocket Grunt #1. Rattata/Zubat at level 9.
- `GRUNTM, GRUNTM_2` (`maps/SlowpokeWellB1F.asm`): Rocket Eto row mapped to existing male grunt. Elekid/Smoochum/Magby at level 11.
- `GRUNTM, GRUNTM_1` (`maps/SlowpokeWellB1F.asm`): Rocket Grunt #3. Koffing level 12, Slowpoke level 13, Houndour level 15.

### Team Rocket HQ

- `GRUNTM, GRUNTM_20` (`maps/TeamRocketBaseB1F.asm`): Rocket Guard #1. Drowzee/Gligar at level 26.
- `GRUNTM, GRUNTM_21` (`maps/TeamRocketBaseB1F.asm`): Rocket Guard #2. Golbat/Ariados/Raticate at level 27.
- `GRUNTM, GRUNTM_16` (`maps/TeamRocketBaseB1F.asm`): HQ B1F Rattata grunt collapsed to level 28 Kangaskhan.
- `GRUNTM, GRUNTM_19` (`maps/TeamRocketBaseB2F.asm`): HQ B2F Venonat grunt collapsed to level 31 Venomoth.
- `GRUNTM, GRUNTM_17` (`maps/TeamRocketBaseB2F.asm`): HQ B2F Golbat grunt raised to level 29.
- `GRUNTM, GRUNTM_18` (`maps/TeamRocketBaseB2F.asm`): HQ B2F Rattata/Zubat/Rattata grunt mapped to Raticate/Golbat/Grimer.
- `EXECUTIVEF, EXECUTIVEF_2` (`maps/TeamRocketBaseB2F.asm`): Ariana #1 mapped to existing female executive, with explicit moves.
- `GRUNTF, GRUNTF_5` (`maps/TeamRocketBaseB3F.asm`): HQ B3F female grunt mapped to Arbok/Sneasel.
- `GRUNTM, GRUNTM_28` (`maps/TeamRocketBaseB3F.asm`): Rocket Eto row mapped to existing male grunt. Jynx/Electabuzz/Magmar/Poliwhirl at level 28.
- `EXECUTIVEM, EXECUTIVEM_4` (`maps/TeamRocketBaseB3F.asm`): Archer #1 mapped to existing male executive, with explicit moves.

### Radio Tower

- `GRUNTM, GRUNTM_3` (`maps/RadioTower1F.asm`): three level 33 Raticate.
- `GRUNTF, GRUNTF_2` (`maps/RadioTower2F.asm`): Arbok/Gloom at level 35.
- `GRUNTM, GRUNTM_5` (`maps/RadioTower2F.asm`): Aipom/Aipom/Koffing at level 34.
- `GRUNTM, GRUNTM_6` (`maps/RadioTower2F.asm`): Gligar/Hypno at level 34.
- `GRUNTM, GRUNTM_4` (`maps/RadioTower2F.asm`): Weezing/Muk at level 33.
- `GRUNTM, GRUNTM_8` (`maps/RadioTower3F.asm`): Muk/Venomoth at level 34.
- `GRUNTM, GRUNTM_7` (`maps/RadioTower3F.asm`): Aipom/Murkrow/Forretress at level 34.
- `GRUNTM, GRUNTM_9` (`maps/RadioTower3F.asm`): Tauros/Slowbro at level 35.
- `GRUNTM, GRUNTM_10` (`maps/RadioTower4F.asm`): Exeggutor/Electrode/Electabuzz at level 35.
- `GRUNTF, GRUNTF_4` (`maps/RadioTower4F.asm`): Arbok/Gloom/Ariados/Vileplume.
- `EXECUTIVEM, EXECUTIVEM_2` (`maps/RadioTower4F.asm`): key-card executive mapped to Forretress/Cloyster/Pupitar/Magcargo.
- `EXECUTIVEM, EXECUTIVEM_3` (`maps/RadioTower5F.asm`): imposter executive mapped with explicit moves.
- `EXECUTIVEF, EXECUTIVEF_1` (`maps/RadioTower5F.asm`): Ariana #2 mapped with explicit moves.
- `EXECUTIVEM, EXECUTIVEM_1` (`maps/RadioTower5F.asm`): Archer #2 species/levels applied only.

### Goldenrod Underground and Warehouse

- `GRUNTM, GRUNTM_13` (`maps/GoldenrodUndergroundSwitchRoomEntrances.asm`): tunnel Rattata grunt mapped to Golbat/Weezing.
- `GRUNTM, GRUNTM_25` (`maps/GoldenrodUndergroundSwitchRoomEntrances.asm`): tunnel Muk/Koffing grunt mapped to Golbat/Muk.
- `GRUNTM, GRUNTM_11` (`maps/GoldenrodUndergroundSwitchRoomEntrances.asm`): tunnel Muk/Koffing/Rattata grunt mapped to Golbat/Arbok.
- `GRUNTF, GRUNTF_3` (`maps/GoldenrodUndergroundSwitchRoomEntrances.asm`): tunnel female grunt mapped to Vileplume/Pinsir/Arbok/Murkrow.
- `GRUNTM, GRUNTM_14` (`maps/GoldenrodUndergroundWarehouse.asm`): warehouse grunt mapped to Weezing/Hypno/Gligar.
- `GRUNTM, GRUNTM_15` (`maps/GoldenrodUndergroundWarehouse.asm`): Rocket Eto row mapped to existing male grunt. Poliwrath/Jynx/Electabuzz/Magmar/Rhydon.
- `GRUNTM, GRUNTM_24` (`maps/GoldenrodUndergroundWarehouse.asm`): warehouse Koffing grunt collapsed to level 37 Weezing.

### Route 24

- `GRUNTM, GRUNTM_31` (`maps/Route24.asm`): Machine Part Rocket mapped to Crobat/Weezing/Marowak/Hypno/Cloyster at level 58.

## Rocket-adjacent story trainers

Implemented in the follow-up Rocket-adjacent pass:

- `SCIENTIST, JED` (`maps/TeamRocketBaseB1F.asm`): Magnemite raised to level 28, Porygon replaces the extra Magnemite.
- `SCIENTIST, ROSS` (`maps/TeamRocketBaseB3F.asm`): Koffing raised to level 28, Raichu replaces the second Koffing.
- `SCIENTIST, MITCH` (`maps/TeamRocketBaseB3F.asm`): Electrode replaces Ditto at level 28.
- `SCIENTIST, MARC` (`maps/RadioTower3F.asm`): Omastar replaces the Magnemite trio at level 37.
- `SCIENTIST, RICH` (`maps/RadioTower4F.asm`): Porygon raised to level 40; existing moves were preserved.
- `BURGLAR, DUNCAN` (`maps/GoldenrodUndergroundSwitchRoomEntrances.asm`): Delibird/Magmar at level 35.
- `BURGLAR, EDDIE` (`maps/GoldenrodUndergroundSwitchRoomEntrances.asm`): Arcanine/Weezing at level 35; converted to `TRAINERTYPE_NORMAL` because the source only specified species/levels.

## Deliberate skips and uncertainties

- Renamed Rocket characters were not added. Rows named "Rocket Eto", "Ariana", or "Archer" were mapped onto existing Rocket trainers where possible.
- `GRUNTF, GRUNTF_1` in Slowpoke Well was left unchanged. The source has fewer confident Slowpoke Well Rocket rows than this repo has map-bound Rocket trainers.
- `GRUNTM_12`, `GRUNTM_22`, `GRUNTM_23`, `GRUNTM_26`, `GRUNTM_27`, and `GRUNTM_30` were left unchanged because they are unused or not confidently tied to a source-row requirement in this pass.
- `EXECUTIVEM, EXECUTIVEM_1` uses source species/levels only. The captured source movesets conflict with the species list for Archer #2, so the trainer was converted to `TRAINERTYPE_NORMAL`.
- `EXECUTIVEM, EXECUTIVEM_2` uses source species/levels only because no reliable explicit move list was available in the parsed notes.
- Other non-Rocket trainers in these areas remain for later ordinary trainer passes unless explicitly listed above.
