; Loader of resources.

; :SHOULDDO automatically generate this with a program::

.include "includes/import_export.inc"
.include "includes/registers.inc"
.include "includes/structure.inc"

.include "maploader.h"
.include "metatileproperties.h"
.include "interactive-metatiles/standing-event-tile.h"

.include "routines/resourceloader.h"

TILESET_CASTLE_PLATFORMER = 0
PALETTE_CASTLE_PLATFORMER = 0
TILES_CASTLE_PLATFORMER   = 0

.segment "BANK1"

MapsTable:
	.faraddr	Level01
	.byte		TILESET_CASTLE_PLATFORMER
	.word		0
	.word		0
	.addr		Level01_InteractiveTilesStruct


PalettesTable:
	.faraddr	CastlePlatformer_Palette
	.byte	128


VramTable:
	.faraddr	CastlePlatformer_Tiles


MetaTilesTable:
	.faraddr	CastlePlatformer_MetaTiles
	.faraddr	CastlePlatformer_MetaTilePropertyTable
	.word		PALETTE_CASTLE_PLATFORMER
	.word		TILES_CASTLE_PLATFORMER


; Interactive tile tables for the levels
.segment "BANK1"
InteractiveTilesStructBank = .bankbyte(*)
StandingEventsTableBank = .bankbyte(*)
	.include "resources/metatilemaps/level_01.inc"


.segment "BANK2"

Level01:
	.incbin "resources/metatilemaps/level_01.metamap1x16"


.segment "BANK3"

CastlePlatformer_Palette:
	.incbin	"resources/metatilesets/castle_platformer.clr", 0, 256

CastlePlatformer_Tiles:
	.byte	VramDataFormat::UNCOMPRESSED
	.word	CastlePlatformer_Tiles_End - CastlePlatformer_Tiles - 3
	.incbin	"resources/metatilesets/castle_platformer.4bpp"
CastlePlatformer_Tiles_End:

CastlePlatformer_MetaTiles:
	.byte	MapDataFormat::UNCOMPRESSED
	.word	CastlePlatformer_MetaTiles_End - CastlePlatformer_MetaTiles - 3
	.incbin	"resources/metatilesets/castle_platformer.metatile1x16"
CastlePlatformer_MetaTiles_End:


	.include "resources/metatilesets/castle_platformer.inc"

