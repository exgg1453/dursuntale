# Auto-converted from GameMaker: obj_face_papyrus
# GM parent: obj_torface
extends Node2D

func _ready():
	event_inherited()
	image_speed= 0.25
	if(instance_exists(776/* obj_face_sans */)) {
	    // obj_face_sans
	    with(776) instance_destroy()
	}
	if(instance_exists(777/* obj_face_undyne */)) {
	    // obj_face_undyne
	    with(777) instance_destroy()
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
	if(instance_exists(773/* obj_face_mettaton */)) {
	    // obj_face_mettaton
	    with(773) instance_destroy()
	}
	if(GS.faceemotion == 0 and sprite_index != real(2008))
	    sprite_index= real(2008)
	if(GS.faceemotion == 1 and sprite_index != real(2010))
	    sprite_index= real(2010)
	if(GS.faceemotion == 2 and sprite_index != real(2012))
	    sprite_index= real(2012)
	if(GS.faceemotion == 3 and sprite_index != real(2013))
	    sprite_index= real(2013)
	if(GS.faceemotion == 4 and sprite_index != real(2011))
	    sprite_index= real(2011)
	if(GS.faceemotion == 5 and sprite_index != real(2013))
	    sprite_index= real(2009)
	if(GS.faceemotion == 6 and sprite_index != real(2014))
	    sprite_index= real(2014)
	if(GS.faceemotion == 7 and sprite_index != real(2015))
	    sprite_index= real(2015)
	if(GS.faceemotion == 8 and sprite_index != real(2016))
	    sprite_index= real(2016)
	if(GS.faceemotion == 9 and sprite_index != real(2017))
	    sprite_index= real(2017)

func _process(delta: float):
	if(GS.faceemotion == 0 and sprite_index != real(2008))
	    sprite_index= real(2008)
	if(GS.faceemotion == 1 and sprite_index != real(2010))
	    sprite_index= real(2010)
	if(GS.faceemotion == 2 and sprite_index != real(2012))
	    sprite_index= real(2012)
	if(GS.faceemotion == 3 and sprite_index != real(2013))
	    sprite_index= real(2013)
	if(GS.faceemotion == 4 and sprite_index != real(2011))
	    sprite_index= real(2011)
	if(GS.faceemotion == 5 and sprite_index != real(2009))
	    sprite_index= real(2009)
	if(GS.faceemotion == 6 and sprite_index != real(2014))
	    sprite_index= real(2014)
	if(GS.faceemotion == 7 and sprite_index != real(2015))
	    sprite_index= real(2015)
	if(GS.faceemotion == 8 and sprite_index != real(2016))
	    sprite_index= real(2016)
	if(GS.faceemotion == 9 and sprite_index != real(2017))
	    sprite_index= real(2017)
	if(instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.halt != 0) image_speed= 0
	    else  image_speed= 0.25
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
