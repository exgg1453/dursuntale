# Auto-converted from GameMaker: obj_freakbullet
# GM parent: obj_amalgambul_parent
extends Node2D

func _ready():
	image_speed= 0
	scale.x= 2
	scale.y= 2
	modulate.a= 0
	con= 0
	sz= 2
	sz2= 2
	dmg= 9

func _gm_event_2_4():
	con++

func _process_end(delta: float):
	if(frame >= 3 and frame <= 8 and collision_rectangle(bbox_left, bbox_top, bbox_right, bbox_bottom, 743, 0, 1))
	    event_user(6)
	if(GS.turntimer <= 0) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
	}

func _process(delta: float):
	if(con == 0) {
	    modulate.a+= 0.05
	    if(modulate.a >= 1) {
	        con= 1
	        $Alarm4.start((20) / 30.0)
	    }
	}
	if(con == 2) {
	    image_speed= 0.5
	    sz= 2 + random(0.1)
	    sz2= 2 + random(0.1)
	    if(frame > 9) modulate.a-= 0.1
	    if(modulate.a < 0.3) instance_destroy()
	}
	scale.x= sz
	scale.y= sz2

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
