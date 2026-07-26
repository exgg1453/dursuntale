# Auto-converted from GameMaker: obj_amalgam_save
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	con= 0
	myinteract= 0
	dt= scr_marker(175, 0, 2132)
	dt.z_index= 1000
	image_speed= 0.2
	scr_depth()
	if(GS.flag[489] > 0) instance_destroy()

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(myinteract == 1 and con == 0) {
	    GS.interact= 1
	    myinteract= 0
	    con= 2
	}
	if(con == 2) {
	    caster_pause(GS.currentsong)
	    snd_play(109/* snd_power */)
	    sprite_index= 2149/* spr_amalgam_save */
	    frame= 0
	    image_speed= 0
	    con= 2.9
	    $Alarm4.start((45) / 30.0)
	}
	if(con == 3.9) {
	    tr= caster_load("music/sfx_generate.ogg")
	    caster_play(tr, 0.9, 0.7)
	    con= 4
	}
	if(con == 4) {
	    image_speed= 0.334
	    if(frame >= 8) {
	        frame= 8
	        image_speed= 0
	        con= 5
	        $Alarm4.start((50) / 30.0)
	    }
	}
	if(con == 6) {
	    caster_free(tr)
	    GS.battlegroup= 82
	    GS.mercy= 1
	    GS.border= 0
	    GS.flag[16]= 0
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 7
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 8) {
	    GS.interact= 0
	    GS.mercy= 0
	    caster_resume(GS.currentsong)
	    myinteract= 0
	    GS.flag[489]= 1
	    scr_tempsave()
	    instance_destroy()
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
