# Auto-converted from GameMaker: obj_switch_room
# GM parent: obj_interactable
extends Node2D

func _ready():
	on= 0
	myinteract= 0
	if(room == 149 and GS.flag[374] == 1) event_user(0)
	if(room == 151 and GS.flag[375] == 1) event_user(0)
	if(room == 208 and GS.flag[419] == 1) event_user(0)
	if(room == 208) z_index= 700000

func _process(delta: float):
	if(myinteract == 1) {
	    if(on == 0) event_user(0)
	    else  event_user(1)
	    myinteract= 0
	    snd_play(132/* snd_switchpull_n */)
	}

func _gm_event_7_11():
	on= 0
	image_speed= 0.25
	sprite_index= 1853/* spr_onoffswitch_off */
	if(room == 149) GS.flag[374]= 0
	if(room == 151) GS.flag[375]= 0
	if(room == 208) {
	    GS.flag[419]= 1
	    sprite_index= 1854/* spr_onoffswitch_on */
	}

func _gm_event_7_10():
	on= 1
	image_speed= 0.25
	sprite_index= 1854/* spr_onoffswitch_on */
	if(room == 149) GS.flag[374]= 1
	if(room == 151) GS.flag[375]= 1
	if(room == 208) {
	    GS.flag[419]= 1
	    scr_tempsave()
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
