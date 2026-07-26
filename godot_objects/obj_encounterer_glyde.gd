# Auto-converted from GameMaker: obj_encounterer_glyde
# GM parent: obj_encountererparent
extends Node2D

func _ready():
	alldead= 0
	GS.encounter= 0
	script_execute(101/* scr_steps */, 3600, 150, 16, 203)
	if(GS.flag[203] == 0 and GS.plot > 100) instance_destroy()
	if(GS.flag[7] == 1) instance_destroy()
	if(GS.flag[283] == 1) instance_destroy()

func _process(delta: float):
	if(GS.encounter > steps and GS.phasing == 0) {
	    if(GS.interact == 0) {
	        script_execute(101/* scr_steps */, 840, 680, 16, 203)
	        GS.encounter= 0
	        GS.battlegroup= 135
	        if(alldead == 2) GS.battlegroup= 19
	        if(alldead == 1) {
	            GS.flag[222]= 1
	            GS.battlegroup= 19
	            alldead= 2
	        } else  {
	            instance_create(0, 0, 140/* obj_battleblcon */)
	            instance_destroy()
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
