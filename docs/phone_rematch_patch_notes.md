# Phone Rematch Patch Notes

Implemented clear existing phone-rematch constants from `docs/trainer_change_requirements.md`.

Scope:
- This repo usually has the base fight plus two follow-up rematch constants, while the source document often lists up to four follow-up rematches. Only existing constants were edited.
- Rows with fully unreadable image-only species and no reliable base-team inference were left unchanged.
- When a source rematch clearly reused an already-implemented base team shape, the rematch constants were updated to that same species set with the source rematch levels.

Implemented:
- Youngster Joey: `JOEY2`, `JOEY3`.
- Bug Catcher Wade: `WADE2`, `WADE3`.
- Schoolboy Jack: `JACK2`; `JACK3` already matched the source level-only row that was marked future-edit.
- Picnicker Liz: `LIZ2`, `LIZ3`.
- Fisher Ralph: `RALPH2`, `RALPH3`.
- Hiker Anthony: `ANTHONY1`, `ANTHONY3`.
- Lass Dana: `DANA2`.
- Schoolboy Chad: `CHAD2`, `CHAD3`.
- Picnicker Gina: `GINA2`, `GINA3`.
- Camper Todd: `TODD2`, `TODD3`.
- Bug Catcher Arnie: `ARNIE2`, `ARNIE3`.
- Schoolboy Alan: `ALAN2`, `ALAN3`.
- Lass Dana's later rematch: `DANA3`.
- Picnicker Tiffany: `TIFFANY2`, `TIFFANY3`.
- PokeManiac Brent: `BRENT2`, `BRENT3`.
- Bird Keeper Vance: `VANCE2`, `VANCE3`.
- Bird Keeper Jose: `JOSE1`, `JOSE3`; the unknown fifth source species for the last rematch was omitted.
- Fisher Wilton: `WILTON2`, `WILTON3`.
- Hiker Parry: `PARRY1`, `PARRY2`.
- Black Belt Kenji: `KENJI1`, `KENJI2`.
- Picnicker Erin: `ERIN2`, `ERIN3`.
- Cooltrainer Reena: `REENA2`, `REENA3`.
- Cooltrainer Gaven: `GAVEN1`, `GAVEN2`.
- Cooltrainer Beth: `BETH2`, `BETH3`.

Already matched the source rematch level rows and was left unchanged:
- Sailor Huey: `HUEY2`, `HUEY3`.

Skipped for now:
- Later unavailable source stages for Joey/Liz/Ralph/Anthony/Gina/Todd/Arnie/Alan/Dana/Chad.
- Fisher Tully source rematches: no matching Tully phone trainer constants exist in this repo.
