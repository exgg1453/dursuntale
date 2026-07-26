# Auto-converted from GameMaker: obj_face_floweytalk
# GM parent: obj_floface
extends Node2D

func _ready():
	event_inherited()
	image_speed= 0.25
	if(GS.faceemotion == 0 and sprite_index != real(166))
	    sprite_index= real(166)
	if(GS.faceemotion == 1 and sprite_index != real(170))
	    sprite_index= real(170)
	if(GS.faceemotion == 2 and sprite_index != real(171))
	    sprite_index= real(171)
	if(GS.faceemotion == 3 and sprite_index != real(172))
	    sprite_index= real(172)
	if(GS.faceemotion == 4 and sprite_index != real(179))
	    sprite_index= real(179)
	if(GS.faceemotion == 5 and sprite_index != real(175))
	    sprite_index= real(175)

func _process(delta: float):
	if(GS.faceemotion == 0 and sprite_index != real(166))
	    sprite_index= real(166)
	if(GS.faceemotion == 1 and sprite_index != real(170))
	    sprite_index= real(170)
	if(GS.faceemotion == 2 and sprite_index != real(171))
	    sprite_index= real(171)
	if(GS.faceemotion == 3 and sprite_index != real(172))
	    sprite_index= real(172)
	if(GS.faceemotion == 4 and sprite_index != real(179))
	    sprite_index= real(179)
	if(GS.faceemotion == 5 and sprite_index != real(175))
	    sprite_index= real(175)
	if(room == 43) {
	    if(GS.faceemotion == 6 and sprite_index != real(175))
	        sprite_index= real(176)
	    if(GS.faceemotion == 7 and sprite_index != real(175))
	        sprite_index= real(177)
	    if(GS.faceemotion == 8 and sprite_index != real(175))
	        sprite_index= real(167)
	}
	if(instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.halt != 0) {
	        image_speed= 0
	        frame= 0
	    } else  image_speed= 0.2
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
