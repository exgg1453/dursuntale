# Auto-converted from GameMaker: obj_face_torielblink
# GM parent: obj_torface
extends Node2D

func _ready():
	event_inherited()
	image_speed= 0
	frame= 0
	$Alarm0.start((20 + round(random(30))) / 30.0)
	if(instance_exists(776/* obj_face_sans */)) {
	    // obj_face_sans
	    with(776) instance_destroy()
	}
	if(instance_exists(777/* obj_face_undyne */)) {
	    // obj_face_undyne
	    with(777) instance_destroy()
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
	if(GS.faceemotion == 99) {
	    instance_create(x, y, 766/* obj_face_torglasses */)
	    GS.faceemotion= 0
	}
	if(GS.faceemotion == 0 and sprite_index != 2005)
	    sprite_index= 2005/* spr_face_torielhappyblink */
	if(GS.faceemotion == 1 and sprite_index != 2007)
	    sprite_index= 2007/* spr_face_torielblinkside */
	if(GS.faceemotion == 2 and sprite_index != 2006)
	    sprite_index= 2006/* spr_face_torielblink */
	if(GS.faceemotion == 3 and sprite_index != real(1999))
	    sprite_index= real(1999)
	if(GS.faceemotion == 4 and sprite_index != real(2000))
	    sprite_index= real(2000)
	if(GS.faceemotion == 6 and sprite_index != real(1991))
	    sprite_index= real(1991)
	if(GS.faceemotion == 7 and sprite_index != real(1993))
	    sprite_index= real(1993)
	if(GS.faceemotion == 8 and sprite_index != real(1996))
	    sprite_index= real(1996)
	if(GS.faceemotion == 9 and sprite_index != real(1987))
	    sprite_index= real(1987)

func _on_destroy():
	image_speed= 0.25
	$Alarm0.start((30 + round(random(60))) / 30.0)

func _process(delta: float):
	if(frame == 0 and instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt == 0)
	    instance_change(765, 1)
	if(GS.faceemotion == 0 and sprite_index != 2005)
	    sprite_index= 2005/* spr_face_torielhappyblink */
	if(GS.faceemotion == 1 and sprite_index != 2007)
	    sprite_index= 2007/* spr_face_torielblinkside */
	if(GS.faceemotion == 2 and sprite_index != real(2006))
	    sprite_index= real(2006)
	if(GS.faceemotion == 3 and sprite_index != real(1999))
	    sprite_index= real(1999)
	if(GS.faceemotion == 4 and sprite_index != real(2000))
	    sprite_index= real(2000)
	if(GS.faceemotion == 5 and sprite_index != real(1997))
	    sprite_index= real(1997)
	if(GS.faceemotion == 6 and sprite_index != real(1991))
	    sprite_index= real(1992)
	if(GS.faceemotion == 7 and sprite_index != real(1993))
	    sprite_index= real(1995)
	if(GS.faceemotion == 8 and sprite_index != real(1996))
	    sprite_index= real(1996)
	if(GS.faceemotion == 9 and sprite_index != real(1987))
	    sprite_index= real(1987)

func _gm_event_7_7():
	frame= 0
	image_speed= 0

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
