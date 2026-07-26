# Auto-converted from GameMaker: obj_face_alphys
# GM parent: obj_torface
extends Node2D

func _ready():
	event_inherited()
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
	image_speed= 0.25
	u[0]= 2046
	u[1]= 2049
	u[2]= 2050
	u[3]= 2051
	u[4]= 2052
	u[5]= 2053
	u[6]= 2054
	u[7]= 2055
	u[8]= 2056
	u[9]= 2057
	u[10]= 2058
	u[11]= 2059
	u[12]= 2060
	u[13]= 2061
	u[14]= 2062
	u[15]= 2063
	u[16]= 2064
	u[17]= 2065
	u[18]= 2066
	u[19]= 2067
	u[20]= 2068
	u[21]= 2069
	u[22]= 2070
	u[23]= 2071
	u[24]= 2072
	u[25]= 2073
	sprite_index= u[GS.faceemotion]
	if(GS.flag[430] == 1)
	    sprite_index= u[GS.faceemotion + 10]
	if(GS.flag[430] == 2)
	    sprite_index= u[GS.faceemotion + 15]
	if(GS.flag[430] == 4) {
	    frame= GS.faceemotion
	    sprite_index= 2045/* spr_alphysface_new */
	}

func _process(delta: float):
	if(GS.flag[430] == 0) sprite_index= u[GS.faceemotion]
	if(instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.halt != 0) {
	        image_speed= 0
	        frame= 0
	    } else  image_speed= 0.25
	}
	if(GS.flag[430] == 1)
	    sprite_index= u[GS.faceemotion + 10]
	if(GS.flag[430] == 2)
	    sprite_index= u[GS.faceemotion + 15]
	if(GS.flag[430] == 3) {
	    sprite_index= u[GS.faceemotion]
	    if(GS.faceemotion == 7) sprite_index= u[24]
	    if(GS.faceemotion == 0) sprite_index= u[25]
	}
	if(GS.flag[7] == 1) {
	    sprite_index= u[GS.faceemotion]
	    if(GS.faceemotion == 1) sprite_index= 2047/* spr_alphysface_laugh */
	    if(GS.faceemotion == 2) sprite_index= 2048/* spr_alphysface_smarmy */
	    if(GS.faceemotion == 8) sprite_index= 2050/* spr_alphysface_2 */
	    if(GS.faceemotion == 9) sprite_index= u[24]
	}
	if(GS.flag[430] == 4) {
	    frame= GS.faceemotion
	    sprite_index= 2045/* spr_alphysface_new */
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
