# Auto-generated global state (GameMaker global.* variables)
# Proje genelindeki global değişkenler (GML global.x → GS.x)
extends Node

# Karakter stats
var hp: int = 20
var maxhp: int = 20
var en: int = 20
var maxen: int = 20
var at: int = 10
var df: int = 10
var adef: int = 0
var sp: int = 4
var asp: int = 4
var hb: int = 5
var gt: int = 5
var km: int = 0
var ph: int = 0
var gold: int = 0
var xp: int = 0
var lv: int = 1
var area: int = 0
var charname: String = "CHARA"

# Flags (GML global.flag_* değişkenleri buraya ekleyin)
var debug: int = 0

# Envanter
var inventory: Array = []
var storage: Array = []

func _ready() -> void:
	print("[GS] GameState hazır")
