# Auto-converted from GameMaker: obj_disembodiedfoxhead
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	animanim= 0
	siner= 0
	tt= 0
	if(scr_murderlv() >= 12) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* The door leading through&  the area is closed^1?&* So I tried the puzzle?/"
	GS.msg[1]= "* But I kept running out of&  ammo^1, and it kept restarting?/"
	GS.msg[2]= "* And my two co-workers won\'t&  help^1? It\'s like they don\'t&  even wanna go to work?/%%"
	if(tt > 0)
	    GS.msg[0]= "* Why don\'t you try^1?&* Try using the console?/%%"
	if(GS.flag[375] == 1) {
	    GS.msg[0]= "* Wow^1?&* You solved it?/"
	    GS.msg[1]= "* I\'m impressed^1?&* You must be a total nerd?/%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* So we\'re all gonna go&  free...?/"
	    GS.msg[1]= "* Does that mean I don\'t&  get to go to work?/%%"
	}
	if(GS.flag[425] == 1)
	    GS.msg[0]= "* Maybe I don\'t want to go&  to work anymore...?/%%"
	tt++
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _on_outside_room():
	if(myinteract > 0 and instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.halt == 0) animanim+= 0.2
	    siner+= 0.5
	} else  {
	    animanim= 0
	    if(sin(siner / 2) * 2 < 1.9) siner+= 0.5
	}
	ss= sin(siner / 2) * 2
	draw_set_color(0)
	draw_rectangle(x + 5 - ss * 2, y + 20 + ss / 2, x + sprite_width - 8 + ss * 2, y + sprite_height + 1, 0)
	draw_sprite(sprite_index, animanim, x, y - 6 + sin(siner / 2) * 6)

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
