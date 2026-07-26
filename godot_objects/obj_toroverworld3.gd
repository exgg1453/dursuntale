# Auto-converted from GameMaker: obj_toroverworld3
# GM parent: obj_toroverworld1
extends Node2D

func _ready():
	$Alarm0.timeout.connect(_on_alarm_0_timeout)

func _process_begin(delta: float):
	script_execute(113/* scr_depth */)
	z_index+= 50

func _process(delta: float):
	if(phone != 2) {
	    if(instance_exists(763/* obj_torface */)) {
	        myinteract= 1
	        if(instance_exists(765/* obj_face_torieltalk */))
	            frame= obj_face_torieltalk.frame
	        else  frame= 0
	    } else  {
	        myinteract= 0
	        if(path_position == 1) {
	            frame= 0
	            image_speed= 0
	        } else  {
	            if(path_speed != 0) image_speed= 0.2
	        }
	        if(speed > 0) image_speed= 0.2
	    }
	    scr_npcdir(0)
	    if(phone == 1) sprite_index= 1102/* spr_toriel_d_phone */
	}
	if(sprite_index == 1122 and frame >= 2) {
	    image_speed= 0
	    sprite_index= 1123/* spr_toriel_hug2 */
	    dsprite= 1123
	}

func _on_alarm_0_timeout():
	queue_free()

func _gm_event_7_7():
	if(sprite_index == 1124) {
	    obj_mainchara.visible= 1
	    image_speed= 0
	    sprite_index= 1103/* spr_toriel_d */
	    dsprite= 1103
	}

func _gm_event_7_4():
	if(room != 41) {
	    direction= 270
	    if(GS.plot > 2) instance_destroy()
	}
	donk= 0

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
