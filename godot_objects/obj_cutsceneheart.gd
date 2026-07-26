# Auto-converted from GameMaker: obj_cutsceneheart
extends Node2D

func _ready():
	con= 0
	rotatenoise= caster_load("music/rotate.ogg")
	createnoise= caster_load("music/create.ogg")
	image_speed= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 0) {
	    caster_loop(rotatenoise, 1, 1)
	    con= 1
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 1) rotation_degrees+= 3
	if(con == 2) {
	    caster_stop(rotatenoise)
	    con= 3
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 4) {
	    caster_play(createnoise, 1, 1)
	    instance_create(x, y, 741/* obj_growheart */)
	    sprite_index= 2093/* spr_heartyellow_center */
	    con= 5
	    $Alarm4.start((60) / 30.0)
	}
	if(con == 6) {
	    obj_heart.movement= 1
	    obj_heart.x= x - 8
	    obj_heart.y= y - 8
	    obj_heart.shot= 1
	    obj_heart.sprite_index= 2094/* spr_heartyellow_flip */
	    obj_mettatonb_second.con= 15
	    instance_destroy()
	}
	if(con > 4 and Input.is_action_pressed("ui_confirm") and instance_number(739) < 3) {
	    instance_create(x - 4, y + 2, 739/* obj_heartshot */)
	    snd_play(116/* snd_heartshot */)
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
