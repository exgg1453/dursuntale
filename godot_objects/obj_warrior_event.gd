# Auto-converted from GameMaker: obj_warrior_event
extends Node2D

func _ready():
	con= 0
	GS.flag[200]= 205
	if(GS.flag[419] == 1) instance_destroy()
	if(GS.flag[8] == 1 or GS.flag[7] == 1) instance_destroy()

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(obj_mainchara.x > 220 and GS.flag[421] == 0 and con == 0 and GS.interact == 0) {
	    GS.interact= 1
	    GS.flag[421]= 1
	    con= 5
	}
	if(obj_mainchara.x > 360 and GS.flag[421] == 1 and con == 0 and GS.interact == 0) {
	    GS.interact= 1
	    GS.flag[421]= 2
	    con= 5
	}
	if(obj_mainchara.x > 480 and GS.flag[421] == 2 and con == 0 and GS.interact == 0) {
	    GS.interact= 1
	    GS.flag[421]= 3
	    con= 5
	}
	if(con == 5) {
	    snd_play(34/* snd_hurtloox */)
	    dm= instance_create(obj_mainchara.x + 40, 220, 1260/* obj_darkman_actor */)
	    dm.velocity.y= -3
	    con= 6
	}
	if(con == 6 and dm.y < 130) {
	    dm.velocity.y= 0
	    con= 7
	    $Alarm4.start((30) / 30.0)
	    snd_play(30/* snd_break2 */)
	}
	if(con == 8) {
	    GS.mercy= 1
	    if(GS.flag[421] == 1) GS.battlegroup= 64
	    if(GS.flag[421] == 2) GS.battlegroup= 68
	    if(GS.flag[421] == 3) GS.battlegroup= 67
	    con= 9
	    GS.flag[15]= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    $Alarm4.start((34) / 30.0)
	}
	if(con == 10) {
	    GS.mercy= 0
	    GS.interact= 0
	    // obj_darkman_actor
	    with(1260) instance_destroy()
	    con= 0
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
