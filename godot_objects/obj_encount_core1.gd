# Auto-converted from GameMaker: obj_encount_core1
# GM parent: obj_encountererparent
extends Node2D

func _ready():
	if(GS.flag[8] == 1 or GS.flag[7] == 1) instance_destroy()
	GS.flag[15]= 1
	alldead= 0
	GS.encounter= 0
	factor= 240
	desto= 0
	if(GS.flag[423] < 2 and GS.flag[426] < 4) factor= 80
	if(scr_murderlv() >= 12) factor= 70
	script_execute(101/* scr_steps */, factor, 50, 40, 205)
	if(scr_enemynpc3() == 1) instance_destroy()

func _process(delta: float):
	GS.flag[15]= 1
	if(GS.encounter > steps) {
	    if(GS.phasing == 0) {
	        if(GS.interact == 0) {
	            script_execute(101/* scr_steps */, 340, 380, 40, 205)
	            if(room == 144) script_execute(101/* scr_steps */, 1040, 680, 40, 205)
	            if(scr_murderlv() >= 12) script_execute(101/* scr_steps */, 70, 120, 40, 205)
	            GS.encounter= 0
	            battlegroup= floor(random(15))
	            if(battlegroup <= 15) GS.battlegroup= 66
	            if(battlegroup <= 12) GS.battlegroup= 64
	            if(battlegroup <= 9) GS.battlegroup= 65
	            if(battlegroup == 4 or battlegroup == 5 or battlegroup == 6)
	                GS.battlegroup= 68
	            if(battlegroup == 3 or battlegroup == 2) GS.battlegroup= 67
	            if(battlegroup == 1) GS.battlegroup= 60
	            if(battlegroup == 0) GS.battlegroup= 59
	            if(GS.flag[8] == 1 or GS.flag[7] == 1) instance_destroy()
	            if(GS.flag[426] == 0) GS.battlegroup= 62
	            if(GS.flag[426] == 1) GS.battlegroup= 64
	            if(GS.flag[426] == 2) GS.battlegroup= 65
	            if(GS.flag[426] == 3) GS.battlegroup= 66
	            if(GS.flag[426] == 4) GS.battlegroup= 68
	            GS.flag[426]++
	            if(alldead == 2) GS.battlegroup= 19
	            if(alldead == 1) {
	                GS.battlegroup= 19
	                alldead= 2
	                GS.flag[225]= 1
	            } else  {
	                instance_create(0, 0, 140/* obj_battleblcon */)
	                if(desto == 1) instance_destroy()
	            }
	        }
	    } else  steps= 0
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
