# Auto-converted from GameMaker: obj_orangeattackNPC
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1353
	usprite= 1362
	lsprite= 1367
	rsprite= 1363
	dtsprite= 1353
	utsprite= 1362
	ltsprite= 1367
	rtsprite= 1363
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* That skeleton over there&  just told me how to dodge&  " + chr(ord('"')) + "orange attacks." + chr(ord('"')) + "/"
	GS.msg[1]= "* What did he say...?&* Something like.../"
	GS.msg[2]= "* " + chr(ord('"')) + "Traffic lights have three&  lights on them." + chr(ord('"')) + "/"
	GS.msg[3]= "* " + chr(ord('"')) + "The third light^1, the green&  one^1, means GO." + chr(ord('"')) + "/"
	GS.msg[4]= "* " + chr(ord('"')) + "The first light^1, the red&  one^1, means STOP." + chr(ord('"')) + "/"
	GS.msg[5]= "* " + chr(ord('"')) + "The second light^1, the yellow&  one^1, means YIELD." + chr(ord('"')) + "/"
	GS.msg[6]= "* " + chr(ord('"')) + "In order to dodge an&  orange attack^1, you must&  be moving." + chr(ord('"')) + "/"
	GS.msg[7]= "* " + chr(ord('"')) + "So^1, just think of it&  this way..." + chr(ord('"')) + "/"
	GS.msg[8]= "* " + chr(ord('"')) + "Red and yellow lights together&  make orange." + chr(ord('"')) + "/"
	GS.msg[9]= "* " + chr(ord('"')) + "Then you obey the rule&  of the leftover green&  light^1, which means GO." + chr(ord('"')) + "/"
	GS.msg[10]= "* " + chr(ord('"')) + "Easy^1, huh?" + chr(ord('"')) + "/"
	GS.msg[11]= "* " + chr(ord('"')) + "Just think of a red and yellow&  traffic light which is&  actually green." + chr(ord('"')) + "/"
	GS.msg[12]= "* Yeah.../"
	GS.msg[13]= "* Then he started talking about&  plaid attacks.../%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()

func _spawn(scene_name: String, px: float, py: float) -> Node:
	var scene = load("res://godot_objects/" + scene_name + ".tscn")
	if scene:
		var inst = scene.instantiate()
		inst.position = Vector2(px, py)
		get_parent().add_child(inst)
		return inst
	return null

func _play_sound(snd: String) -> void:
	var p := AudioStreamPlayer.new()
	add_child(p)
	var s = load("res://sound/audio/" + snd + ".ogg")
	if not s: s = load("res://sound/audio/" + snd + ".wav")
	if s:
		p.stream = s; p.play()
		p.finished.connect(p.queue_free)

func _stop_sound(_snd: String) -> void:
	pass  # TODO: track AudioStreamPlayer by name
