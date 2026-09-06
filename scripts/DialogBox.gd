# GML msg[] formatını anlayan Undertale diyalog motoru
# Kullanım (herhangi bir script'ten):
#
#   GS.msg[0] = "* Merhaba!/"
#   GS.msg[1] = "* Nasılsın?/%%"
#   GS.typer = 5          # 5=toriel, 4=papyrus, 18=sans, vb
#   GS.facechoice = 1     # 0=yok, 1=toriel, 2=flowey, vb
#   GS.msc = 0
#   DialogBox.open()

extends CanvasLayer

signal dialog_finished

# ─── Typer → ses + font eşlemesi ──────────────────────────────────────
const TYPER_INFO := {
	0:  {"name": "???",      "color": Color.WHITE},
	4:  {"name": "PAPYRUS",  "color": Color.WHITE},        # büyük font
	5:  {"name": "Toriel",   "color": Color.WHITE},
	10: {"name": "",         "color": Color.WHITE},         # sans (küçük büyük karışık)
	16: {"name": "Flowey",   "color": Color.WHITE},
	17: {"name": "",         "color": Color.WHITE},
	18: {"name": "Sans",     "color": Color.WHITE},
	27: {"name": "Mettaton", "color": Color.WHITE},
	37: {"name": "Undyne",   "color": Color.WHITE},
	47: {"name": "Alphys",   "color": Color.WHITE},
}

# ─── Yüz → görsel ─────────────────────────────────────────────────────
const FACE_PATHS := {
	0: "",
	1: "res://faces/toriel.png",
	2: "res://faces/flowey.png",
	3: "res://faces/sans.png",
	4: "res://faces/papyrus.png",
	5: "res://faces/undyne.png",
	6: "res://faces/alphys.png",
	7: "res://faces/mettaton.png",
	8: "res://faces/asgore.png",
}

# ─── Renk kodları (\R, \G, vb) ────────────────────────────────────────
const COLOR_CODES := {
	"R": Color(1,    0.2,  0.2),   # kırmızı
	"G": Color(0.4,  1,    0.4),   # yeşil
	"W": Color.WHITE,
	"Y": Color(1,    1,    0.4),   # sarı
	"B": Color(0.4,  0.4,  1),     # mavi
	"O": Color(1,    0.6,  0.2),   # turuncu
	"P": Color(1,    0.4,  1),     # mor
	"X": Color.BLACK,
}

# ─── Nodes ────────────────────────────────────────────────────────────
@onready var panel      : Panel           = $Panel
@onready var face_rect  : TextureRect     = $Panel/Face
@onready var lbl        : RichTextLabel   = $Panel/Text
@onready var arrow      : Label           = $Panel/Arrow

# ─── Durum ────────────────────────────────────────────────────────────
var _active     := false
var _lines      : Array[String] = []   # işlenmiş satırlar
var _line_idx   := 0
var _full       := ""    # geçerli kutu içeriği (BBCode)
var _revealed   := ""    # şu ana kadar gösterilen ham metin
var _raw_chars  : Array  = []   # karakter + meta listesi
var _char_idx   := 0
var _timer      := 0.0
var _waiting    := false  # Enter bekliyor
var _speed      := 0.035  # saniye/karakter

func _ready() -> void:
	panel.visible = false
	arrow.text = "▼"
	arrow.visible = false

# ─── Dışarıdan çağrılır ───────────────────────────────────────────────
func open() -> void:
	# GS.msg[] dizisini oku, "/" ile bölünmüş satırları al
	_lines.clear()
	for i in range(GS.msg.size()):
		var s: String = str(GS.msg[i])
		if s.is_empty() or s == "%%%": break
		# Bir msg birden fazla kutu içerebilir: "/" ile böl
		var boxes := s.split("/")
		for b in boxes:
			if b.strip_edges() != "":
				_lines.append(b.strip_edges())

	if _lines.is_empty():
		return

	_line_idx = 0
	_active = true
	panel.visible = true
	_update_face()
	_start_box()

func is_active() -> bool:
	return _active

# ─── İç işleyiş ───────────────────────────────────────────────────────
func _start_box() -> void:
	if _line_idx >= _lines.size():
		_close()
		return

	var raw := _lines[_line_idx]

	# Bitiş belirteci: %% veya % ile başlayan son kutu
	if raw.begins_with("%%") or raw == "%":
		_close()
		return

	# Ham metni karakter listesine dönüştür (özel kodlar dahil)
	_raw_chars = _parse_to_chars(raw)
	_revealed = ""
	_char_idx = 0
	_timer = 0.0
	_waiting = false
	arrow.visible = false
	lbl.text = ""

func _parse_to_chars(raw: String) -> Array:
	# Özel kodları işle, karakter listesi üret
	# Her eleman: {"c": String, "color": Color, "pause": float}
	var result := []
	var cur_color := Color.WHITE
	var i := 0
	while i < raw.length():
		var ch := raw[i]

		# \ = escape/renk kodu
		if ch == "\\":
			i += 1
			if i >= raw.length(): break
			var code := raw[i]
			if code == "C":   # \C devam (eski format ignore)
				pass
			elif COLOR_CODES.has(code):
				cur_color = COLOR_CODES[code]
			i += 1
			continue

		# ^ = duraklama kodu (^1 = 10 frame = ~0.33s)
		if ch == "^":
			i += 1
			if i < raw.length():
				var n := raw[i].to_int()
				result.append({"c": "", "color": cur_color, "pause": n * 0.33})
			i += 1
			continue

		# & = satır sonu
		if ch == "&":
			result.append({"c": "\n", "color": cur_color, "pause": 0.0})
			i += 1
			continue

		# % = son kutu işareti (parse sırasında atla)
		if ch == "%":
			i += 1
			continue

		result.append({"c": ch, "color": cur_color, "pause": 0.0})
		i += 1
	return result

func _process(delta: float) -> void:
	if not _active: return

	if _waiting:
		if Input.is_action_just_pressed("ui_confirm"):
			_line_idx += 1
			_start_box()
		return

	# Hız: basılı tutunca 4x
	var spd := _speed * 0.25 if Input.is_action_pressed("ui_confirm") else _speed

	_timer += delta
	while _timer >= spd and _char_idx < _raw_chars.size():
		_timer -= spd
		var entry : Dictionary = _raw_chars[_char_idx]
		_char_idx += 1

		if entry["pause"] > 0.0:
			_timer -= entry["pause"]   # basit duraklama
			continue

		if entry["c"] != "":
			_revealed += entry["c"]

		# BBCode ile renkli metin güncelle
		_render_bbcode()

	if _char_idx >= _raw_chars.size():
		_waiting = true
		arrow.visible = true

func _render_bbcode() -> void:
	# RichTextLabel için BBCode oluştur (renk desteği)
	# Basit versiyon: sadece son rengi uygula
	lbl.text = _revealed

func _update_face() -> void:
	var fc := GS.facechoice
	if FACE_PATHS.has(fc) and FACE_PATHS[fc] != "":
		var path: String = FACE_PATHS[fc]
		if ResourceLoader.exists(path):
			face_rect.texture = load(path)
			face_rect.visible = true
			return
	face_rect.visible = false

func _close() -> void:
	_active = false
	panel.visible = false
	emit_signal("dialog_finished")
