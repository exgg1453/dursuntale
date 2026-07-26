# Auto-converted from GameMaker: obj_dialoguer
extends Node2D

func _ready():
	count= 0
	side= 0
	GS.facechange= 1
	xx= view_xview[view_current]
	yy= view_yview[view_current]
	if(instance_exists(1570/* obj_mainchara */)) {
	    if(obj_mainchara.y > yy + 130) {
	        side= 0
	        if(GS.facechoice != 0) {
	            writer= instance_create(xx + 68, yy - 5, 782/* OBJ_WRITER */)
	            script_execute(144/* scr_facechoice */)
	        } else  writer= instance_create(xx + 10, yy - 5, 782/* OBJ_WRITER */)
	    } else  {
	        side= 1
	        if(GS.facechoice != 0) {
	            writer= instance_create(xx + 68, yy + 150, 782/* OBJ_WRITER */)
	            script_execute(144/* scr_facechoice */)
	        } else  writer= instance_create(xx + 10, yy + 150, 782/* OBJ_WRITER */)
	    }
	}

func _gm_event_1_0():
	if(not instance_exists(774/* obj_face */)) {
	    // obj_face
	    with(774) instance_destroy()
	}

func _process(delta: float):
	if(not is_instance_valid(writer)) instance_destroy()
	else  {
	    if(keyboard_multicheck_pressed(1/* ANYKEY */)) {
	        if(writer.halt == 0 and GS.typer != 10) {
	            GS.flag[25]++
	            writer.stringpos= string_length(writer.originalstring)
	        }
	        keyboard_clear(16/* SHIFT */)
	    }
	}
	if(GS.facechange == 2) GS.facechange= 0
	if(GS.facechange == 1 and GS.facechoice == 0) {
	    if(is_instance_valid(writer)) {
	        writer.x= xx + 30
	        writer.writingx= writer.x
	    }
	    if(not instance_exists(774/* obj_face */)) {
	        // obj_face
	        with(774) instance_destroy()
	    }
	    GS.facechange= 2
	}
	if(GS.facechange == 1 and is_instance_valid(writer)) {
	    writer.x= xx + 68
	    writer.writingx= writer.x + 20
	    if(GS.facechoice == 1 and not instance_exists(765/* obj_face_torieltalk */) and not instance_exists(767/* obj_face_torielblink */))
	        script_execute(144/* scr_facechoice */)
	    if(GS.facechoice == 2 and not instance_exists(768/* obj_face_floweytalk */))
	        script_execute(144/* scr_facechoice */)
	    if(GS.facechoice == 3 and not instance_exists(776/* obj_face_sans */))
	        script_execute(144/* scr_facechoice */)
	    if(GS.facechoice == 4 and not instance_exists(775/* obj_face_papyrus */))
	        script_execute(144/* scr_facechoice */)
	    if(GS.facechoice == 5 and not instance_exists(777/* obj_face_undyne */))
	        script_execute(144/* scr_facechoice */)
	    if(GS.facechoice == 6 and not instance_exists(770/* obj_face_alphys */))
	        script_execute(144/* scr_facechoice */)
	    if(GS.facechoice == 7 and not instance_exists(771/* obj_face_asgore */))
	        script_execute(144/* scr_facechoice */)
	    if(GS.facechoice == 8 and not instance_exists(773/* obj_face_mettaton */))
	        script_execute(144/* scr_facechoice */)
	    if(GS.facechoice == 9 and not instance_exists(772/* obj_face_asriel */))
	        script_execute(144/* scr_facechoice */)
	    GS.facechange= 2
	}

func _on_outside_room():
	if(side == 0) {
	    yy= view_yview[view_current]
	    if(is_instance_valid(writer) and writer.writingy > yy + 80)
	        writer.writingy-= 155
	    if(instance_exists(774/* obj_face */) and obj_face.y > yy + 80)
	        obj_face.y-= 155
	    draw_set_color(16777215)
	    draw_rectangle(view_xview[view_current] + 16, view_yview[view_current] + 5, view_xview[view_current] + 304, view_yview[view_current] + 80, 0)
	    draw_set_color(0)
	    draw_rectangle(view_xview[view_current] + 19, view_yview[view_current] + 8, view_xview[view_current] + 301, view_yview[view_current] + 77, 0)
	} else  {
	    yy= view_yview[view_current]
	    if(is_instance_valid(writer) and writer.writingy < yy + 80)
	        writer.writingy+= 155
	    if(instance_exists(774/* obj_face */) and obj_face.y < yy + 80)
	        obj_face.y+= 155
	    draw_set_color(16777215)
	    draw_rectangle(view_xview[view_current] + 16, view_yview[view_current] + 160, view_xview[view_current] + 304, view_yview[view_current] + 235, 0)
	    draw_set_color(0)
	    draw_rectangle(view_xview[view_current] + 19, view_yview[view_current] + 163, view_xview[view_current] + 301, view_yview[view_current] + 232, 0)
	}
	count= 1

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
