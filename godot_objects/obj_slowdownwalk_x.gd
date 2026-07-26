# Auto-converted from GameMaker: obj_slowdownwalk_x
extends Node2D

func _ready():
	sl= 0
	scale.x= 19
	scale.y= 20
	onner= 0
	doom= 0
	if(GS.plot > 164) {
	    instance_destroy()
	    exit
	} else  exit

func _process_end(delta: float):
	if(sl == 1) {
	    fc= 2
	    if(GS.tempvalue[11] == 0 and GS.flag[396] == 5) doom= 1
	    if(GS.flag[396] == 6) doom= 2
	    if(doom == 1) {
	        if(onner == 1) fc= 3
	        if(onner == 0) onner= 1
	        else  onner= 0
	    }
	    if(obj_mainchara.xprevious == obj_mainchara.x - 3 or obj_mainchara.xprevious == obj_mainchara.x - 2) {
	        obj_mainchara.x-= fc
	        obj_mainchara.moving= 1
	    }
	    if(obj_mainchara.xprevious == obj_mainchara.x + 3 or obj_mainchara.xprevious == obj_mainchara.x + 2) {
	        obj_mainchara.x+= fc
	        obj_mainchara.moving= 1
	    }
	    if(obj_mainchara.yprevious == obj_mainchara.y - 3 or obj_mainchara.yprevious == obj_mainchara.y - 2) {
	        obj_mainchara.y-= fc
	        obj_mainchara.moving= 1
	    }
	    if(obj_mainchara.yprevious == obj_mainchara.y + 3 or obj_mainchara.yprevious == obj_mainchara.y + 2) {
	        obj_mainchara.y+= fc
	        obj_mainchara.moving= 1
	    }
	    if(doom == 2) {
	        obj_mainchara.x= obj_mainchara.xprevious
	        obj_mainchara.y= obj_mainchara.yprevious
	    }
	}
	obj_mainchara.cutscene= 1
	view_xview[0]= obj_mainchara.x - 150

func _on_alarm_0_timeout():
	sl= 1

func _on_outside_room():
	if(sl == 1) {
	    if(doom == 0)
	        draw_sprite(1798/* spr_webgunk_1 */, obj_mainchara.frame, obj_mainchara.x, obj_mainchara.y)
	    if(doom == 1)
	        draw_sprite(1799/* spr_webgunk_2 */, obj_mainchara.frame, obj_mainchara.x, obj_mainchara.y)
	    if(doom == 2)
	        draw_sprite(1800/* spr_webgunk_3 */, obj_mainchara.frame, obj_mainchara.x, obj_mainchara.y)
	}
	sl= 0

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
