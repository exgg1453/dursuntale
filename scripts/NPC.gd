# Diyalog tetikleyen NPC
# NPC.tscn'e bu scripti ekle
extends Node2D

@export var npc_id: String = "npc_001"

# ══════════════════════════════════════════════════════
# BURAYA KENDİ DİYALOGLARINI EKLE
# ══════════════════════════════════════════════════════
const DIALOGS: Dictionary = {
	# ─ Örnek NPC diyalogu ─
	"npc_001": [
		{"text": "* Merhaba, yolcu!", "face": "none"},
		{"text": "* Bu topraklara hoş geldin.\nBuradaki herkes seni bekliyor.", "face": "none"},
		{"text": "* Dikkatli ol.", "face": "none"},
	],

	# ─ Toriel tarzı diyalog ─
	"toriel_ev": [
		{"text": "* Evladım, sana söylemem gereken\nbir şey var.", "face": "toriel"},
		{"text": "* Bu odadan dışarı çıkma.\nÇok tehlikeli.", "face": "toriel"},
		{"text": "* Söz veriyor musun?", "face": "toriel"},
	],

	# ─ Sans tarzı diyalog ─
	"sans_sentry": [
		{"text": "* hey.", "face": "sans"},
		{"text": "* nasılsın.\n* iyi misin.\nokay.", "face": "sans"},
		{"text": "* harika. devam et.", "face": "sans"},
	],

	# ─ Genel uyarı levhası ─
	"levha_giris": [
		{"text": "Ormana hoş geldiniz.\nİçeri girenler çıkamaz.", "face": "none"},
	],
}
# ══════════════════════════════════════════════════════

@onready var dialog_box : CanvasLayer = get_node_or_null("/root/DialogBox")
var _player_near: bool = false
var _talking: bool = false

func _ready() -> void:
	# Etkileşim alanı sinyali
	var area := $Area2D if has_node("Area2D") else null
	if area:
		area.body_entered.connect(_on_body_entered)
		area.body_exited.connect(_on_body_exited)

func _process(_delta: float) -> void:
	if _player_near and not _talking and Input.is_action_just_pressed("ui_confirm"):
		_start_dialog()

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("player"):
		_player_near = true

func _on_body_exited(body: Node) -> void:
	if body.is_in_group("player"):
		_player_near = false

func _start_dialog() -> void:
	if not DIALOGS.has(npc_id): return
	if not dialog_box: return
	if dialog_box.is_active(): return

	_talking = true
	dialog_box.show_dialog(DIALOGS[npc_id])
	dialog_box.dialog_finished.connect(_on_dialog_done, CONNECT_ONE_SHOT)

func _on_dialog_done() -> void:
	_talking = false
