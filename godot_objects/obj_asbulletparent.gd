# Auto-converted from GameMaker: obj_asbulletparent
extends Node2D

func _gm_event_7_17():
	if(GS.flag[501] < 3) {
	    dmg= 10
	    if(GS.hope == 1) dmg= 7
	    thishp= GS.hp
	    thisinvc= GS.invc
	    scr_damagestandard_x()
	    if(GS.invc > thisinvc) {
	        if(abs(GS.hp - thishp) < 3) GS.hp= thishp - 3
	        if(GS.hope == 1 and thishp > 1 and GS.hp <= 1) GS.hp= 1
	        if(GS.hp <= 0) GS.hp= 0
	    }
	    if(GS.hope == 2) GS.hp= 1
	} else  {
	    if(GS.hp >= 14) dmg= 9
	    if(GS.hp <= 14) dmg= 7
	    if(GS.hp <= 9) dmg= 6
	    if(GS.hp <= 5) dmg= 1
	    scr_damagestandard_x()
	    if(GS.hp < 1) GS.hp= 1
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
