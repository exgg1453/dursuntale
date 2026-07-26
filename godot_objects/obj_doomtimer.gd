# Auto-converted from GameMaker: obj_doomtimer
extends Node2D

func _ready():
	doomtime= 0
	dx= 0
	finaltimer= 0
	dr= 0
	truezero= 0

func _process(delta: float):
	if(dx < 120) doomtime++
	if(dx < 90) doomtime+= 0.3
	if(dx > 100) doomtime-= 0.3
	if(dx > 110) doomtime-= 0.5
	if(dx >= 120 and instance_exists(401/* obj_battlebomb */) and obj_battlebomb.defuse == 0 and obj_battlebomb.mypart1.got == 0 and dr == 0) {
	    dr= 1
	    GS.flag[288]= 1
	    obj_battlebomb_body.type= 99
	    obj_battlebomb_body.bombtype= 99
	    obj_battlebomb_body.speed= 0
	    obj_battlebomb.failure= 1
	    obj_battlebomb.con= 1001
	}
	if(dx >= 120 and GS.inbattle == 0 and GS.interact == 0) {
	    finaltimer++
	    if(finaltimer > 5) {
	        // obj_mettnewsevent
	        with(1224) failure= 1
	        // obj_mettnewsevent
	        with(1224) con= 160
	        instance_destroy()
	    }
	}
	if(view_yview[0] <= 0) view_yview[0]= 0

func _on_outside_room():
	dx= floor(doomtime / 30)
	dx2= floor(doomtime / 180)
	if(GS.inbattle == 1) {
	    draw_set_font(1)
	    draw_set_color(65535)
	    if(dx >= 120) truezero= 1
	    if(truezero == 0) draw_text(500, 20, "TIME:" + string(120 - dx))
	    else  {
	        draw_set_color(255)
	        draw_text(500, 20, "TIME:0")
	    }
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
