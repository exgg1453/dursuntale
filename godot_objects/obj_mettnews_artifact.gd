# Auto-converted from GameMaker: obj_mettnews_artifact
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	scale.x= 1
	scale.y= 1
	image_speed= 0
	bomb= 0
	type= 1
	$Alarm9.start((1) / 30.0)
	image_speed= 0.25
	bombsprite= 1522
	con= 0
	talkedto= 0
	gtfo= 0

func _gm_event_2_9():
	event_user(0)

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 27
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Error Baby%%"
	if(type > 0 and type < 7) {
	    basic= 716 + type * 4
	    if(talkedto > 0) basic+= 2
	    GS.msc= basic
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	mydialoguer.side= 0
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(con == 2) {
	    if(collision_line(x + sprite_width / 2, y + sprite_height - 5, x + sprite_width / 2, y + sprite_height + 20, 1570, 0, 1))
	        con= 3
	    else  con= 20
	}
	if(con == 3) {
	    if(obj_mainchara.x < x) {
	        velocity.x= 2
	        $Alarm4.start((9) / 30.0)
	        con= 4
	    } else  {
	        velocity.x= -2
	        $Alarm4.start((9) / 30.0)
	        con= 4
	    }
	}
	if(con == 5) {
	    velocity.x= 0
	    con= 20
	}
	if(gtfo == 1) velocity.y= 5

func _gm_event_7_11():
	sprite_index= bombsprite

func _gm_event_7_10():
	if(type == 1) {
	    sprite_index= 1523/* spr_tobdogl_still */
	    bombsprite= 1522
	}
	if(type == 2) {
	    sprite_index= 1774/* spr_glassofwater */
	    bombsprite= 1775
	}
	if(type == 3) {
	    sprite_index= 1768/* spr_script */
	    bombsprite= 1769
	}
	if(type == 4) {
	    sprite_index= 1776/* spr_basketball */
	    bombsprite= 1777
	}
	if(type == 5) {
	    sprite_index= 1772/* spr_regpresent */
	    bombsprite= 1773
	}
	if(type == 6) {
	    sprite_index= 1770/* spr_videogame */
	    bombsprite= 1771
	}

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
