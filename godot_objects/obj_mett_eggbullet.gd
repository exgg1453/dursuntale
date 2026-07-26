# Auto-converted from GameMaker: obj_mett_eggbullet
extends Node2D

func _ready():
	insanity= 1
	modulate.a= 0.4
	velocity.y= -random(1)
	velocity.x= random(3) * choose(1, -1)
	friction= 0.05
	gravity= 0.2
	ang= 1 + random(5) * choose(1, -1)
	col= 0

func _process(delta: float):
	if(modulate.a < 1) modulate.a+= 0.2
	rotation_degrees+= ang
	if(y > view_yview[0] + 245) instance_destroy()
	if(x < view_xview[0] - 4) instance_destroy()
	if(x > view_xview[0] + 324) instance_destroy()

func _on_alarm_0_timeout():
	if(col == 0) {
	    // other
	    with(-2) {
	        if(eligible == 1) event_user(0)
	    }
	    snd_play(106/* snd_noise */)
	    event_user(1)
	}

func _gm_event_7_11():
	if(col == 0) {
	    egg= instance_create(x, y, 1175/* obj_failegg */)
	    egg.rotation_degrees= rotation_degrees
	    egg.ang= ang
	    egg.velocity.y= velocity.y
	    egg.velocity.x= velocity.x
	    egg.friction= 0.05
	    sprite_index= 1701/* spr_mett_failegg */
	    col= 1
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
