# Auto-converted from GameMaker: obj_adate_papyrus
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	y= 230
	x= 300
	velocity.y= -2
	con= 0
	$Alarm4.start((95) / 30.0)

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) velocity.y= 0
	if(con == 2) {
	    snd_play(20/* snd_arrow */)
	    velocity.y= -16
	    gravity= 1
	    con= 3
	}
	if(con == 3) {
	    if(velocity.y >= 0) z_index= 80
	    if(y >= obj_adate_trashcan.y + 10 - sprite_height) {
	        snd_play(21/* snd_impact */)
	        gravity= 0
	        velocity.y= 0
	        y= obj_adate_trashcan.y + 10 - sprite_height
	        con= 4
	    }
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
