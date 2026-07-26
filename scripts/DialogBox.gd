# Undertale tarzı diyalog sistemi
# Kullanım:
#   DialogBox.show_dialog([
#     {"text": "* Merhaba!", "face": "toriel", "sound": "toriel"},
#     {"text": "* Nasılsın?", "face": "toriel"},
#   ])
extends CanvasLayer

signal dialog_finished

const CHAR_SPEED_NORMAL := 0.04   # saniye/harf
const CHAR_SPEED_FAST   := 0.01

@onready var panel       : Panel      = $Panel
@onready var face_rect   : TextureRect = $Panel/FaceRect
@onready var text_label  : RichTextLabel = $Panel/TextLabel
@onready var arrow       : Label      = $Panel/Arrow
@onready var anim        : AnimationPlayer = $AnimationPlayer

var _lines     : Array = []
var _line_index: int   = 0
var _full_text : String = ""
var _displayed : String = ""
var _char_index: int   = 0
var _timer     : float = 0.0
var _active    : bool  = false
var _finished_line: bool = false

# Yüz görselleri (res://faces/ klasörüne koy)
const FACES := {
	"toriel":  "res://faces/toriel.png",
	"sans":    "res://faces/sans.png",
	"papyrus": "res://faces/papyrus.png",
	"flowey":  "res://faces/flowey.png",
	"none":    "",
}

func _ready() -> void:
	panel.visible = false
	arrow.text = "▼"

func show_dialog(lines: Array) -> void:
	if lines.is_empty(): return
	_lines = lines
	_line_index = 0
	_active = true
	panel.visible = true
	_start_line()

func _start_line() -> void:
	if _line_index >= _lines.size():
		_end_dialog()
		return
	var line: Dictionary = _lines[_line_index]
	_full_text = _parse_text(line.get("text", ""))
	_displayed = ""
	_char_index = 0
	_finished_line = false
	arrow.visible = false

	# Yüz görseli
	var face_key: String = line.get("face", "none")
	if face_key != "none" and FACES.has(face_key):
		var tex = load(FACES[face_key]) if ResourceLoader.exists(FACES[face_key]) else null
		face_rect.texture = tex
		face_rect.visible = tex != null
	else:
		face_rect.visible = false

	text_label.text = ""

func _parse_text(raw: String) -> String:
	# Undertale özel kodlarını temizle veya dönüştür
	# ^1 ^2 vb → yavaşlatma (basit versiyon: sadece çıkar)
	var result := raw
	result = result.replace("^1", "")
	result = result.replace("^2", "")
	result = result.replace("^3", "")
	result = result.replace("%%", "")
	result = result.replace("/%%", "")
	result = result.replace("/%", "")
	result = result.replace("/", "\n")   # / = satır sonu
	result = result.replace("&", " ")   # & = boşluk/devam
	result = result.strip_edges()
	return result

func _process(delta: float) -> void:
	if not _active: return

	if not _finished_line:
		_timer += delta
		var speed := CHAR_SPEED_FAST if Input.is_action_pressed("ui_confirm") else CHAR_SPEED_NORMAL
		while _timer >= speed and _char_index < _full_text.length():
			_timer -= speed
			_displayed += _full_text[_char_index]
			_char_index += 1
			text_label.text = _displayed

		if _char_index >= _full_text.length():
			_finished_line = true
			arrow.visible = true
	else:
		# Z / Enter bekle
		if Input.is_action_just_pressed("ui_confirm"):
			_line_index += 1
			_start_line()

func _end_dialog() -> void:
	_active = false
	panel.visible = false
	_lines = []
	emit_signal("dialog_finished")

func is_active() -> bool:
	return _active
