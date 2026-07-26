# Auto-converted from GameMaker: obj_encount_fire1
# GM parent: obj_encountererparent
extends Node2D

func _ready():
	if(GS.flag[8] == 1 or GS.flag[7] == 1) instance_destroy()
	alldead= 0
	GS.encounter= 0
	factor= 220
	desto= 0
	if(room == 144 and GS.flag[408] < 1) factor= 80
	if(room == 145 and GS.flag[408] < 2) factor= 120
	if(room == 159 and GS.flag[408] < 3) factor= 80
	if(room == 174 and GS.flag[408] < 4) factor= 20
	script_execute(101/* scr_steps */, factor, 30, 40, 205)
	if(scr_enemynpc3() == 1) instance_destroy()
	if(room == 174 and GS.flag[400] != 0) instance_destroy()

func _process(delta: float):
	if(GS.encounter > steps) {
	    if(GS.phasing == 0) {
	        if(GS.interact == 0) {
	            script_execute(101/* scr_steps */, 340, 380, 40, 205)
	            if(room == 144) script_execute(101/* scr_steps */, 1040, 680, 40, 205)
	            GS.encounter= 0
	            battlegroup= floor(random(15))
	            if(battlegroup < 15) GS.battlegroup= 50
	            if(battlegroup < 10) GS.battlegroup= 78
	            if(battlegroup < 6) GS.battlegroup= 77
	            if(GS.flag[8] == 1 or GS.flag[7] == 1) instance_destroy()
	            if(GS.flag[408] == 0) GS.battlegroup= 51
	            if(GS.flag[408] == 1) GS.battlegroup= 50
	            if(GS.flag[408] == 2) GS.battlegroup= 52
	            if(GS.flag[408] == 3) GS.battlegroup= 77
	            if(GS.flag[408] == 4) GS.battlegroup= 78
	            GS.flag[408]++
	            if(alldead == 2) GS.battlegroup= 19
	            if(alldead == 1) {
	                GS.flag[224]= 1
	                GS.battlegroup= 19
	                alldead= 2
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
