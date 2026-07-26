# Auto-converted from GameMaker: obj_face_mettaton
# GM parent: obj_torface
extends Node2D

func _ready():
	event_inherited()
	image_speed= 0.25
	if(instance_exists(776/* obj_face_sans */)) {
	    // obj_face_sans
	    with(776) instance_destroy()
	}
	if(instance_exists(775/* obj_face_papyrus */)) {
	    // obj_face_papyrus
	    with(775) instance_destroy()
	}
	if(instance_exists(770/* obj_face_alphys */)) {
	    // obj_face_alphys
	    with(770) instance_destroy()
	}
	if(instance_exists(771/* obj_face_asgore */)) {
	    // obj_face_asgore
	    with(771) instance_destroy()
	}
	if(instance_exists(765/* obj_face_torieltalk */)) {
	    // obj_face_torieltalk
	    with(765) instance_destroy()
	}
	if(instance_exists(767/* obj_face_torielblink */)) {
	    // obj_face_torielblink
	    with(767) instance_destroy()
	}
	if(instance_exists(764/* obj_torbody */)) {
	    // obj_torbody
	    with(764) instance_destroy()
	}
	frame= GS.faceemotion

func _process(delta: float):
	frame= GS.faceemotion
	if(GS.facechoice == 0) instance_destroy()

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
