# Unresolved Trainer Inference Notes

Implemented inferred non-rematch leftovers:
- Dance Theater Kimono Girls: Naoko, Sayo, Zuki, Kuni, and Miki are exact map-bound constants in `maps/DanceTheater.asm`; each Eeveelution was raised from level 17 to 21.
- Celadon Gym Twins Jo & Zoe: both `TWINS, JOANDZOE1` and `TWINS, JOANDZOE2` are map-bound to the same encounter event in `maps/CeladonGym.asm`; both paired orders were raised from level 35 to 58.

Skipped after review:
- Ilex Forest Wayne: no map-bound trainer calls in `maps/IlexForest.asm`.
- Ecruteak Sage Gaku/Masa/Koji: no matching Sage constants or map-bound trainers found; Dance Theater candidates correspond to the Kimono Girl row.
- Eusine: no Eusine/Mysticalman trainer class, party constant, or map-bound battle exists in this repo.
- Dragon's Den Darin/Cara/Lea & Pia: Dragon's Den maps do not contain trainer calls for those rows.
- Route 45 Camper Quentin: no Camper/Quentin map-bound trainer exists; available Route 45 trainers were already used by exact/late-Johto mappings and do not match the source party.
- Route 6 Rex/Allan: no map-bound trainer calls in `maps/Route6.asm`; the PokeFan object is script-only.
