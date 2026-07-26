# Auto-converted from GameMaker: obj_encounterer_water2
# GM parent: obj_encountererparent
extends Node2D

func _ready():
	alldead= 0
	GS.encounter= 0
	script_execute(101/* scr_steps */, 360, 30, 18, 204)
	if(scr_murderlv() >= 10 and GS.flag[27] == 0) script_execute(101/* scr_steps */, 60, 20, 18, 204)
	if(GS.flag[204] == 0 and GS.plot > 121) instance_destroy()

func _process(delta: float):
	if(GS.encounter > steps) {
	    if(GS.phasing == 0) {
	        if(GS.interact == 0) {
	            script_execute(101/* scr_steps */, 640, 380, 18, 204)
	            if(scr_murderlv() >= 10 and GS.flag[27] == 0) script_execute(101/* scr_steps */, 120, 50, 18, 204)
	            GS.encounter= 0
	            battlegroup= floor(random(15))
	            if(battlegroup < 15) GS.battlegroup= 54
	            if(battlegroup < 10) GS.battlegroup= 55
	            if(battlegroup < 4) GS.battlegroup= 41
	            if(GS.flag[358] == 0) GS.battlegroup= 41
	            if(GS.flag[358] == 1) GS.battlegroup= 42
	            if(GS.flag[358] == 2) GS.battlegroup= 54
	            if(GS.flag[358] == 3) GS.battlegroup= 55
	            GS.flag[358]++
	            if(alldead == 2) GS.battlegroup= 19
	            if(alldead == 1) {
	                GS.flag[223]= 1
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
