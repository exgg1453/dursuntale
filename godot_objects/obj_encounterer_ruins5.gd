# Auto-converted from GameMaker: obj_encounterer_ruins5
# GM parent: obj_encountererparent
extends Node2D

func _ready():
	alldead= 0
	GS.encounter= 0
	script_execute(101/* scr_steps */, 120, 140, 20, 202)

func _process(delta: float):
	if(GS.encounter > steps and GS.interact == 0) {
	    script_execute(101/* scr_steps */, 130, 160, 20, 202)
	    if(GS.flag[6] == 1) script_execute(101/* scr_steps */, 120, 60, 20, 202)
	    GS.encounter= 0
	    battlegroup= random(15)
	    if(battlegroup <= 2) GS.battlegroup= 18
	    if(battlegroup > 2) GS.battlegroup= 11
	    if(battlegroup > 9) GS.battlegroup= 13
	    if(GS.flag[6] == 1) {
	        battlegroup= random(20)
	        if(battlegroup <= 4) GS.battlegroup= 128
	        if(battlegroup > 4) GS.battlegroup= 129
	        if(battlegroup > 8) GS.battlegroup= 130
	        if(battlegroup > 12) GS.battlegroup= 121
	        if(battlegroup > 16) GS.battlegroup= 124
	        if(battlegroup > 19) GS.battlegroup= 132
	    }
	    if(alldead == 2) GS.battlegroup= 19
	    if(alldead == 1) {
	        GS.battlegroup= 19
	        alldead= 2
	    } else  instance_create(0, 0, 140/* obj_battleblcon */)
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
