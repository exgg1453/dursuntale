# Auto-converted from GameMaker: obj_encounterer_ruins3
# GM parent: obj_encountererparent
extends Node2D

func _ready():
	alldead= 0
	GS.encounter= 0
	script_execute(101/* scr_steps */, 60, 60, 20, 202)

func _process(delta: float):
	if(GS.encounter > steps and GS.interact == 0) {
	    script_execute(101/* scr_steps */, 290, 100, 20, 202)
	    if(GS.flag[6] == 1) script_execute(101/* scr_steps */, 120, 60, 20, 202)
	    GS.encounter= 0
	    battlegroup= random(20)
	    if(battlegroup <= 5) GS.battlegroup= 6
	    if(battlegroup > 5) GS.battlegroup= 7
	    if(battlegroup > 10) GS.battlegroup= 8
	    if(battlegroup > 15) GS.battlegroup= 9
	    if(battlegroup > 18) GS.battlegroup= 10
	    if(GS.flag[6] == 1) {
	        if(battlegroup <= 5) GS.battlegroup= 125
	        if(battlegroup > 5) GS.battlegroup= 126
	        if(battlegroup > 10) GS.battlegroup= 123
	        if(battlegroup > 15) GS.battlegroup= 122
	        if(battlegroup > 18) GS.battlegroup= 124
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
