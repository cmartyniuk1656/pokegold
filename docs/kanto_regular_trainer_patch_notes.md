# Kanto Regular Trainer Patch Notes

Implemented in `data/trainers/parties.asm` as the first Kanto regular-trainer sweep.

## First Kanto Sweep

Included exact non-rematch mappings for:

- Vermilion Gym trainers: Gregory, Vincent, and Horton.
- Saffron Gym trainers: Rebecca, Franklin, Doris, and Jared.
- Celadon Gym trainers: Tanya, Michelle, and Julia.
- Route 25 trainers: Dudley, Ellen, Joe, Laura, Lloyd, Shannon, Pat, and Kevin.
- Cerulean Gym trainers: Diana, Briana, and Parker.

## Routes 8-15 Sweep

Implemented exact non-rematch mappings for:

- Route 8: Dwayne, Harris, Zeke, Sam, and Tom.
- Route 9: Edna, Sid, Dean, Tim, Sidney, and Heidi.
- Route 10: Robert and Jim.
- Route 11: Herman, Jason, Owen, and Fidel.
- Route 12: Kyle, Martin, Stephen, and Barney.
- Route 13: Bret, Perry, Joshua, Alex, and Kenny.
- Route 14: Carter, Roy, and Trevor.
- Route 15: Johnny, Colette, Billy, Hillary, Tommy, and Kipp.

## Fuchsia And Cycling Road Sweep

Implemented exact non-rematch mappings for:

- Fuchsia Gym trainers: Linda, Cindy, Barry, and Alice.
- Route 17: Riley, Glenn, Joel, and Charles.
- Route 18: Bob and Boris.

## Pewter And Early Kanto Land Routes Sweep

Implemented exact non-rematch mappings for:

- Pewter Gym trainer: Jerry.
- Route 2: Ed, Doug, and Rob.
- Route 3: Warren, Jimmy, Otis, and Burt.
- Route 4: Hope, Hank, and Sharon.
- Route 1: Danny and Quinn.

## Kanto Water Routes Sweep

Implemented exact non-rematch mappings for:

- Route 21: Nikki, Arnold, and Seth.
- Route 20: Cameron, Lori, and Nicole.
- Route 19: Tucker, Dawn, Harold, and Jerome.

## Implementation Notes

- Kanto gym leaders were already implemented in the boss-trainer pass and were not touched here.
- `GRUNTM, GRUNTM_31` on Route 24 was already implemented in the Rocket trainer pass and was not touched here.
- Source Vaporeon/Jolteon/Espeon references were mapped to this repo's local constants: `LILPOREON`, `JOLTLE`, and `LITEON`.
- The source rows in this sweep did not provide custom movesets, so existing affected trainers remain `TRAINERTYPE_NORMAL`.
- Fisher Stephen's level 75 Magikarp was preserved as written in the source row.
- PokeFan Carter was interpreted as the Johto starter trio: `CHIKORITA`, `CYNDAQUIL`, and `TOTODILE`.

## Deferred

- Route 6 PokeFan Rex and PokeFan Allan remain unresolved with no map-bound candidates.
- Celadon Gym Twins Joe & Zoe remain deferred because both paired constants match the source species and the row is marked ambiguous.
- Remaining Kanto items are unresolved or ambiguous rows only.
