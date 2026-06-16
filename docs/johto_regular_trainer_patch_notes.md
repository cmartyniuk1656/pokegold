# Johto Regular Trainer Patch Notes

Implemented in `data/trainers/parties.asm` as the first regular-trainer sweep. This pass covers clear Johto non-rematch mappings from Route 30 through Route 44, including non-leader gym trainers and ordinary map trainers.

## Included areas

- Route 30, Route 31, Sprout Tower, Violet Gym trainers, Route 32, Union Cave.
- Azalea Gym trainers, Route 34, Goldenrod Underground, Goldenrod Gym trainers.
- Route 35, National Park, Route 36, Route 37.
- Ecruteak Gym trainers, Route 38, Route 39, Olivine Lighthouse.
- Route 40, Route 41, Cianwood Gym trainers.
- Route 42, Mt. Mortar Kiyo, Route 43, Lake of Rage.
- Mahogany Gym trainers and Route 44.

## Implementation notes

- Regular phone/rematch follow-up constants were left unchanged.
- Paired Twin constants that are both map-bound to the same encounter event were updated together, even where the generated mapping notes called the second entry a rematch.
- Source Vaporeon/Jolteon/Flareon/Eevee references were mapped to this repo's local constants: `LILPOREON`, `JOLTLE`, `FLITTLE`, and `LITTLE`.
- Trainers with existing explicit move rows kept valid move rows when species were changed or added. Where the source only supplied species/levels and moves could not be inferred cleanly, some trainers were converted to `TRAINERTYPE_NORMAL`.

## Deferred from the first sweep

- Rival battles.
- Rematch-only trainer entries.
- Unresolved or no-candidate rows from the mapping notes, including Ilex Forest Wayne, Ecruteak City Kimono/Sage rows, Route 38 Olivia, Route 39 Jaime, Eusine, Route 42 Tully, and Mt. Mortar Miller.
- Blackthorn Gym, Dragon's Den, Route 45 onward, S.S. Aqua, and Kanto regular trainers.

## Late Johto Follow-Up

Implemented in the late-Johto regular-trainer pass:

- Blackthorn Gym trainers: Paul, Cody, Mike, Fran, and Lola.
- Route 45 trainers: Kenji, Erik, Michael, Parry, Timothy, Ryan, and Kelly.
- Route 46 trainers: Ted, Erin, and Bailey.
- Route 27 trainers: Jose, Blake, Brian, Reena, Megan, and Gilbert.
- Route 26 trainers: Jake, Gaven, Joyce, Beth, Richard, and Scott.

For phone trainers whose map scripts use a later-numbered constant for the initial fight, the initial map-bound constant was updated and later rematch constants were left unchanged. This affects Kenji, Parry, Jose, and Gaven.

Still deferred after this follow-up, before the S.S. Aqua pass:

- Dragon's Den unresolved rows.
- Route 45 Camper Quentin, which remains unmapped with confidence.
- S.S. Aqua and Kanto regular trainers.

## S.S. Aqua Follow-Up

Implemented all clear S.S. Aqua non-rematch mappings:

- First Trip: Noland, Colin, Meg & Peg 1, Lyle, Stanly, Fritz, Jeff, and Debra.
- Kanto -> Johto: Ethan, Corey, Ken, Clyde, Jeremy, Georgia, Kenneth, Shirley, Nate, and Ricky.
- Johto -> Kanto: Sean, Carol, Edward, Cassie, Rodney, Shawn, Jonah, Garrett, and Wai.

`TWINS, MEGANDPEG2` was left unchanged as the regular duplicate/rematch-side entry. `TWINS, MEGANDPEG1` was updated because it is the mapped base fight.

Still deferred after this follow-up:

- Dragon's Den unresolved rows.
- Route 45 Camper Quentin, which remains unmapped with confidence.
- Kanto regular trainers.
