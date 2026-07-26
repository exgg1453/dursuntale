# Auto-converted from GameMaker: obj_encounterer_tundra1
# GM parent: obj_encountererparent
extends Node2D

func _ready():
	alldead= 0
	GS.encounter= 0
	script_execute(101/* scr_steps */, 120, 30, 16, 203)
	if(GS.flag[203] == 0 and GS.plot > 100) instance_destroy()

func _process(delta: float):
	if(GS.encounter > steps) {
	    if(GS.phasing == 0) {
	        if(GS.interact == 0) {
	            script_execute(101/* scr_steps */, 140, 280, 16, 203)
	            GS.encounter= 0
	            battlegroup= floor(random(15))
	            if(battlegroup >= 0) GS.battlegroup= 30
	            if(battlegroup >= 8) GS.battlegroup= 32
	            if(GS.flag[70] == 0) GS.battlegroup= 30
	            if(GS.flag[70] == 1) GS.battlegroup= 32
	            if(GS.flag[70] == 2 and GS.plot < 42)
	                GS.battlegroup= choose(30, 32)
	            if(GS.flag[70] == 2 and GS.plot >= 42) {
	                GS.battlegroup= 24
	                GS.flag[70]= 4
	            }
	            if(scr_murderlv() >= 2 and GS.flag[70] == 2) {
	                GS.battlegroup= 24
	                GS.flag[70]= 4
	            }
	            if(GS.flag[70] < 2) GS.flag[70]++
	            if(alldead == 2) GS.battlegroup= 19
	            if(alldead == 1) {
	                GS.flag[222]= 1
	                GS.battlegroup= 19
	                alldead= 2
	            } else  instance_create(0, 0, 140/* obj_battleblcon */)
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
