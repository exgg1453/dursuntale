# Auto-converted from GameMaker: obj_stick
# GM parent: obj_readable
extends Node2D

func _ready():
	if(GS.plot >= 35) instance_destroy()
	else  {
	    snap= caster_load("music/sticksnap.ogg")
	    broken= 0
	    if(GS.flag[47] >= 2) {
	        frame= 1
	        broken= 1
	    }
	    if(GS.flag[275] >= 1) {
	        frame= 1
	        broken= 1
	    }
	    image_speed= 0
	    instance_create(2650, 0, 988/* obj_creeptree_sansmaker */)
	    instance_create(2725, 0, 987/* obj_creeptree_stickbreak */)
	    instance_create(3400, 0, 986/* obj_creeptree1 */)
	    instance_create(3440, 0, 986/* obj_creeptree1 */)
	    instance_create(4040, 0, 986/* obj_creeptree1 */)
	}
	myinteract= 0

func _gm_event_2_2():
	caster_free(snap)

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* (It\'s a tough-looking branch.)&* (It\'s too heavy to pick up.)/%%"
	if(broken == 1)
	    GS.msg[0]= "* (It\'s been smashed like it&  was nothing...)/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _on_alarm_0_timeout():
	if(broken == 0 and GS.flag[275] == 0) {
	    broken= 1
	    frame= 1
	    GS.flag[47]= 2
	    if(GS.flag[275] < 1) GS.flag[275]= 1
	    caster_set_panning(snap, -0.8)
	    caster_play(snap, 1, 0.9)
	    $Alarm2.start((80) / 30.0)
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
