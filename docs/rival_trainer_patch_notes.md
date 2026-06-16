# Rival Trainer Patch Notes

Implemented the source Rival #2 through Rival #7 rows in `data/trainers/parties.asm`.

Scope:
- Rival #1, the initial level-5 starter fight, was left unchanged because the source requirements begin at Rival #2.
- All starter-dependent rival constants for Rival #2 through Rival #7 were updated.
- Per user direction, each starter branch uses the water-starter team path with Croconaw/Feraligatr.

Implementation notes:
- Rival #2 through Rival #4 use source species, levels, and move rows from the parsed mapping plan.
- Rival #5 through Rival #7 were converted to `TRAINERTYPE_ITEM_MOVES` to support held items.
- The source item cells are image-derived and appear starter-branch dependent. Held items were assigned to the water-branch team where they made practical sense: Victreebel keeps `MIRACLE_SEED`, Feraligatr uses `NEVERMELTICE` in the level 64/68 fights, and Tyranitar uses `QUICK_CLAW`.
