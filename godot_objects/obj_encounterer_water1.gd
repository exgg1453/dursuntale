# Auto-converted from GameMaker: obj_encounterer_water1
# GM parent: obj_encountererparent
extends Node2D

func _ready():
	alldead= 0
	GS.encounter= 0
	factor= 360
	desto= 0
	if(room == 90) factor= 110
	if(room == 88) factor= 340
	if(room == 88 and GS.flag[357] == 0 and GS.entrance == 1) {
	    factor= 20
	    desto= 1
	}
	script_execute(101/* scr_steps */, factor, 30, 18, 204)
	if(GS.flag[204] == 0 and GS.plot > 121) instance_destroy()

func _process(delta: float):
	if(GS.encounter > steps) {
	    if(GS.phasing == 0) {
	        if(GS.interact == 0) {
	            script_execute(101/* scr_steps */, 340, 380, 18, 204)
	            if(room == 90) script_execute(101/* scr_steps */, 1040, 380, 18, 204)
	            GS.encounter= 0
	            battlegroup= floor(random(15))
	            if(battlegroup < 15) GS.battlegroup= 43
	            if(battlegroup < 11) GS.battlegroup= 53
	            if(battlegroup < 7) GS.battlegroup= 40
	            if(battlegroup < 4) GS.battlegroup= 54
	            if(GS.flag[357] == 0) GS.battlegroup= 40
	            if(GS.flag[357] == 1) GS.battlegroup= 43
	            if(GS.flag[357] == 2) GS.battlegroup= 53
	            GS.flag[357]++
	            if(alldead == 2) GS.battlegroup= 19
	            if(alldead == 1) {
	                GS.flag[223]= 1
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
