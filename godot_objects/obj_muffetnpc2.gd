# Auto-converted from GameMaker: obj_muffetnpc2
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1219
	usprite= 1219
	lsprite= 1219
	rsprite= 1219
	dtsprite= 1219
	utsprite= 1219
	ltsprite= 1219
	rtsprite= 1219
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	if(scr_murderlv() >= 12) instance_destroy()
	kk= 0
	if(GS.flag[397] != 0) kk= 1
	if(GS.plot < 165) kk= 1
	if(kk == 1) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* There you are^1, dearie^1.&* You are always welcome in&  my parlor!/"
	GS.msg[1]= "* Just stay on your best&  behavior^1~&* Ueee hee hee hee~/%%"
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* Bonjour^1, dearie^1~&* I just finished tallying up&  all of our donations!/"
	    GS.msg[1]= "* We\'ve finally raised enough&  to rescue all the spiders&  inside of the RUINS./"
	    GS.msg[2]= "* And we\'ll also be able to&  afford...!/"
	    GS.msg[3]= "* ... nothing^1, because we&  only sold one donut./"
	    GS.msg[4]= "* What\'s wrong with everyone^1?&* Don\'t they like spiders~/%%"
	    if(GS.flag[59] >= 1)
	        GS.msg[3]= "* 4 pairs of stylish sunglasses&  for every spider!/%%"
	    if(GS.flag[59] >= 13)
	        GS.msg[3]= "* 4 pairs of waterproof booties&  for every spider!/%%"
	    if(GS.flag[59] >= 25)
	        GS.msg[3]= "* 4 pairs of stylish heels for&  every spider!/%%"
	    if(GS.flag[59] >= 40)
	        GS.msg[3]= "* A spider baseball field^1!&* We\'ve already got the baseball&  donuts ready~/%%"
	    if(GS.flag[59] >= 70)
	        GS.msg[3]= "* A spider football stadium^1!&* We\'ll play with 4 balls on the&  field at once!/%%"
	    if(GS.flag[59] >= 100) {
	        GS.msg[3]= "* A brand new bakery^1!&* Thank you so much^1, dearie!/"
	        GS.msg[4]= "* It\'s all because of you^2 &* (r money)./%%"
	    }
	    if(GS.flag[59] >= 9000) {
	        GS.msg[3]= "* A vacation anywhere in the&  entire world!/"
	        GS.msg[4]= "* Should we go to the tropics^1?&* Or a creepy abandoned house^1?&* We can\'t decide~/%%"
	    }
	}
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
