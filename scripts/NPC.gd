# Diyalog NPC — GML msg[] formatı ile
# Inspector'dan npc_id seç, sahneye ekle, Area2D alt node'u ekle
extends Node2D

@export_enum(
	"npc_001:Köylü",
	"toriel_ev:Toriel",
	"sans_sentry:Sans",
	"papyrus_puzzle:Papyrus",
	"levha:Levha"
) var npc_id: String = "npc_001"

var _near := false
var _talking := false

func _ready() -> void:
	var area := $Area2D if has_node("Area2D") else null
	if area:
		area.body_entered.connect(func(b): if b.is_in_group("player"): _near = true)
		area.body_exited.connect(func(b):  if b.is_in_group("player"): _near = false)

func _process(_d) -> void:
	if _near and not _talking and not DialogBox.is_active():
		if Input.is_action_just_pressed("ui_confirm"):
			_talk()

func _talk() -> void:
	_talking = true
	_setup_dialog(npc_id)
	DialogBox.open()
	DialogBox.dialog_finished.connect(func(): _talking = false, CONNECT_ONE_SHOT)

# ══════════════════════════════════════════════════════════════════════
#  BURAYA KENDİ DİYALOGLARINI EKLE
#  Format: GML ile birebir aynı
#    /   = kutu sonu, Enter bekler, devam eder
#    /%  = son kutu (Enter'da kapanır)
#    /%% = hemen kapan
#    &   = yeni satır
#    ^1  = 10 frame duraklama (~0.33s)
#    \R \G \Y \W = renk (kırmızı yeşil sarı beyaz)
#
#  GS.typer değerleri:
#    5=Toriel  4=Papyrus  18=Sans  37=Undyne  47=Alphys  27=Mettaton
#
#  GS.facechoice değerleri:
#    0=yok  1=Toriel  2=Flowey  3=Sans  4=Papyrus  5=Undyne
# ══════════════════════════════════════════════════════════════════════
func _setup_dialog(id: String) -> void:
	match id:

		"npc_001":
			GS.typer = 5
			GS.facechoice = 0
			GS.msg[0] = "* Merhaba yolcu!/"
			GS.msg[1] = "* Bu topraklara hoş geldin.&Buradaki herkes seni bekliyor./"
			GS.msg[2] = "* Dikkatli ol./%%"

		"toriel_ev":
			GS.typer = 5
			GS.facechoice = 1       # Toriel yüzü
			GS.msg[0] = "* Evladım^1, sana söylemem&gereken bir şey var./"
			GS.msg[1] = "* \\RDışarı çıkma.\\W&Çok tehlikeli./"
			GS.msg[2] = "* Söz veriyor musun?/%%"

		"sans_sentry":
			GS.typer = 18
			GS.facechoice = 3       # Sans yüzü
			GS.msg[0] = "* hey./"
			GS.msg[1] = "* nasılsın.&* iyi misin.&  okay./"
			GS.msg[2] = "* harika. devam et./%%"

		"papyrus_puzzle":
			GS.typer = 4
			GS.facechoice = 4       # Papyrus yüzü
			GS.msg[0] = "* NYEH HEH HEH!/"
			GS.msg[1] = "* BU BULMACAYI ÇÖZMEDEN&GEÇEMEZSİN!/"
			GS.msg[2] = "* BEN^1 BÜYÜK PAPYRUS^1&BUNU SÖYLÜYORUM!/%%"

		"levha":
			GS.typer = 0
			GS.facechoice = 0
			GS.msg[0] = "Ormana hoş geldiniz.&İçeri girenler çıkamaz./%%"

		_:
			GS.msg[0] = ".../%%" 
