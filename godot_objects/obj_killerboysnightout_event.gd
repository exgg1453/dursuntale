# Auto-converted from GameMaker: obj_killerboysnightout_event
extends Node2D

func _ready():
	scale.x= 3
	if(GS.plot > 163 or scr_murderlv() < 12) {
	    instance_destroy()
	    exit
	} else  {
	    bunny= scr_marker(154, 80, 1837)
	    dragon= scr_marker(184, 80, 1838)
	    with(bunny) scr_depth()
	    with(dragon) scr_depth()
	    con= 0
	    exit
	}

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    caster_pause(GS.currentsong)
	    bunny.sprite_index= 1835/* spr_royalguard_rabbit_d */
	    dragon.sprite_index= 1840/* spr_royalguard_dragon_d */
	    con= 0.1
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 1.1) {
	    GS.msc= 0
	    GS.msg[0]= "* ... you\'re here./"
	    GS.msg[1]= "* So that means Undyne..^1.&* She\'s.../"
	    GS.msg[2]= "* Like^1, Undyne^1!&* We\'ll avenge you!/%%"
	    scr_regulartext()
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.battlegroup= 49
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 3
	    $Alarm4.start((33) / 30.0)
	}
	if(con == 4) {
	    GS.mercy= 0
	    GS.interact= 0
	    caster_resume(GS.currentsong)
	    if(GS.flag[12] == 1) GS.flag[402]= 1
	    con= 17
	    GS.plot= 164
	    // obj_npc_marker
	    with(1363) instance_destroy()
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    con= 1
	    GS.interact= 1
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
