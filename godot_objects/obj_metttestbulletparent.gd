# Auto-converted from GameMaker: obj_metttestbulletparent
extends Node2D

func _process_end(delta: float):
	if(GS.turntimer < 1) instance_destroy()

func _gm_event_7_21():
	if(GS.invc <= 0) {
	    dmg= 9
	    if(not instance_exists(420/* obj_mettheart_parent */)) {
	        if(GS.attacktype == 37)
	            GS.specialdam[0]++
	        if(GS.attacktype == 39)
	            GS.specialdam[1]++
	        if(GS.attacktype == 43)
	            GS.specialdam[2]++
	        if(GS.hp >= 30) dmg= 10
	        else  {
	            if(GS.hp >= 20) dmg= 9
	            else  {
	                if(GS.hp >= 5) dmg= 8
	                else  dmg= 6
	            }
	        }
	        scr_damagestandard_x()
	        if(GS.hp <= 0) GS.hp= 0
	    } else  {
	        taken= 0
	        if(not instance_exists(424/* obj_mettheart_4 */)) {
	            if(GS.hp >= 24 and taken == 0) {
	                taken= 1
	                dmg= 9
	            }
	            if(GS.hp >= 16 and taken == 0) {
	                taken= 1
	                dmg= 8
	            }
	            if(GS.hp >= 8 and taken == 0) {
	                taken= 1
	                dmg= 7
	            }
	            if(GS.hp >= 3 and taken == 0) {
	                taken= 1
	                dmg= 6
	            }
	            if(GS.hp >= 0 and taken == 0) {
	                taken= 1
	                dmg= 5
	            }
	        } else  {
	            if(GS.hp >= 30 and taken == 0) {
	                taken= 1
	                dmg= 9
	            }
	            if(GS.hp >= 20 and taken == 0) {
	                taken= 1
	                dmg= 8
	            }
	            if(GS.hp >= 12 and taken == 0) {
	                taken= 1
	                dmg= 7
	            }
	            if(GS.hp >= 4 and taken == 0) {
	                taken= 1
	                dmg= 6
	            }
	            if(GS.hp >= 0 and taken == 0) {
	                taken= 1
	                dmg= 5
	            }
	        }
	        scr_damagestandard_x()
	        if(GS.hp <= 0) GS.hp= 0
	    }
	    GS.failure[GS.attacktype]++
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
