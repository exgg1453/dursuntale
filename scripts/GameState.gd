# Auto-generated global state (GameMaker global.* variables)
# Proje genelindeki global değişkenler (GML global.x → GS.x)
extends Node

# ─── Karakter İstatistikleri ───────────────────────────────────────────
var hp: int = 20
var maxhp: int = 20
var my_hp: int = 20
var testhp: int = 20
var en: int = 20
var maxen: int = 20
var at: int = 10
var df: int = 10
var adef: int = 0
var sp: int = 4
var asp: int = 4
var hb: int = 5        # half-border
var gt: int = 5        # grace timer
var km: int = 0        # kills (murderer flag)
var ph: int = 0
var gold: int = 0
var xp: int = 0
var lv: int = 1
var kills: int = 0
var hope: int = 0
var floss: int = 0

# ─── Silah / Zırh ──────────────────────────────────────────────────────
var weapon: int = 0
var armor: int = 0
var wstrength: int = 0

# ─── Envanter ──────────────────────────────────────────────────────────
var inv: Array = []        # main inventory slots (8)
var invc: int = 0          # inventory count
var item: int = 0
var itemname: String = ""
var itemnameb: String = ""
var itemused: int = 0
var my_inv: Array = []
var testinv: Array = []

# ─── Alan / Oda ────────────────────────────────────────────────────────
var area: int = 0
var areapop: int = 0
var currentroom: int = 0
var entrance: int = 0
var facing: int = 2        # 0=up, 1=right, 2=down, 3=left

# ─── Karakter / Hikaye ─────────────────────────────────────────────────
var charname: String = "CHARA"
var plot: int = 0
var fplot: int = 0         # flowey plot
var phase: int = 0
var phasing: int = 0
var hardmode: int = 0
var debug: int = 0
var osflavor: int = 0      # OS / platform int
var steam_int: int = 0
var stretch: int = 0
var starton9: int = 0

# ─── Bayrak Dizisi (flag array) ────────────────────────────────────────
var flag: Array = []       # bool/int flags indexed by number

func _init_flags() -> void:
	flag.resize(500)
	for i in range(500):
		flag[i] = 0

# ─── Mesaj / Diyalog ───────────────────────────────────────────────────
var msg: Array = ["", "", "", "", "", "", "", "", "", ""]
var rmsg: Array = ["", "", "", "", "", "", "", "", "", ""]
var tmsg: Array = ["", "", "", "", "", "", "", "", "", ""]
var typer: int = 0
var msc: int = 0
var talked: int = 0
var interact: int = 0

# ─── Yüz / Animasyon ───────────────────────────────────────────────────
var facechoice: int = 0
var facechange: int = 0
var faceemotion: int = 0
var facemotion: int = 0
var hurtanim: int = 0

# ─── Müzik / Ses ───────────────────────────────────────────────────────
var currentsong: int = 0
var currentsong2: int = 0
var batmusic: int = 0
var batmusic2: int = 0
var endsong: int = 0
var dontfade: int = 0

# ─── Savaş Sistemi ─────────────────────────────────────────────────────
var inbattle: int = 0
var battlephase: int = 0
var battlegroup: int = 0
var seriousbattle: int = 0
var specialbattle: int = 0
var actfirst: int = 0

var damage: int = 0
var damagetimer: int = 0
var specialdam: int = 0
var fivedamage: int = 0
var hshake: int = 0
var vshake: int = 0

var turn: int = 0
var turntimer: int = 0
var attacktype: int = 0
var attackspeed: float = 1.0
var attackspeedr: float = 1.0
var firingrate: float = 1.0
var bulletappearance: int = 0
var bulletvariable: int = 0
var vaporspeed: float = 1.0
var shakespeed: float = 1.0

var mercy: int = 0
var mercyuse: int = 0
var failure: int = 0
var healno: int = 0
var soul_rescue: int = 0

# ─── Canavar / Düşman ──────────────────────────────────────────────────
var monster: int = 0
var monstername: String = ""
var monstersprite: String = ""
var monstertype: int = 0
var monsterhp: int = 0
var monstermaxhp: int = 0
var monsteratk: int = 0
var monsterdef: int = 0
var monsterinstance = null
var encounter: int = 0

# ─── Menü ──────────────────────────────────────────────────────────────
var menuchoice: int = 0
var menucoord: int = 0
var menuno: int = 0
var bmenuno: int = 0
var bmenucoord: int = 0
var choice: int = 0
var choices: int = 0
var filechoice: int = 0

# ─── Savaş Menü Eylemleri ──────────────────────────────────────────────
var mnfight: int = 0
var mntrg: int = 0
var myfight: int = 0
var mytarget = null
var myxb: float = 0.0
var myyb: float = 0.0

# ─── Çeşitli ───────────────────────────────────────────────────────────
var border: int = 0
var idealborder: int = 0
var transtype: int = 0
var movement: int = 0
var colliding: int = 0
var ratings: int = 0
var extraintro: int = 0
var awfultest: int = 0
var cast_type: int = 0
var phone: int = 0
var phonename: String = ""
var tempvalue: int = 0
var goldreward: int = 0
var xpreward: int = 0

# ─── Analog / Joypad ───────────────────────────────────────────────────
var analog_sense: float = 0.5
var analog_sense_sense: float = 0.5
var joy_dir: int = 0
var joypad_dir: int = 0

# ─── Flowey ────────────────────────────────────────────────────────────
var floweyhp: int = 0
var floweymaxhp: int = 0
var heard: int = 0

# ─── Depolama (Storage) ────────────────────────────────────────────────
var storage: Array = []

func _ready() -> void:
	_init_flags()
	inv.resize(8)
	for i in range(8):
		inv[i] = 0
	my_inv.resize(8)
	for i in range(8):
		my_inv[i] = 0
	testinv.resize(8)
	for i in range(8):
		testinv[i] = 0
	print("[GS] GameState hazır")
