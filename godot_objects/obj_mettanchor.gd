# Auto-converted from GameMaker: obj_mettanchor
extends Node2D

func _ready():
	mysprite[0]= 1764
	mysprite[1]= 1761
	mysprite[2]= 1762
	mysprite[3]= 1759
	mysprite[4]= 1763
	mysprite[5]= 1765
	mysprite[6]= 1757
	mysprite[7]= 1760
	mysprite[8]= 1758
	j= 0
	stayx= xstart - view_xview[0]
	stayy= ystart - view_yview[0]
	on= 1
	image_speed= 0.2
	thischara= 1570
	siner= 0

func _process_end(delta: float):
	if(GS.flag[20] <= 9 and GS.flag[20] > 0) j= GS.flag[20]
	sprite_index= mysprite[j - 1]
	if(not instance_exists(184/* obj_shaker */) and on == 1) {
	    view_xview[0]= round(obj_mainchara.x - view_wview[0] / 2 + 10)
	    view_yview[0]= round(obj_mainchara.y - view_hview[0] / 2 + 10)
	    if(view_yview[0] <= 0) view_yview[0]= 0
	}
	if(on == 1) {
	    x= view_xview[0] + stayx
	    y= view_yview[0] + stayy
	}
	if(on == 2) {
	    adjust= 0
	    if(x > view_xview[0] + view_wview[0] - 50) {
	        x-= 4
	        adjust= 1
	    }
	    if(y > view_yview[0] + view_hview[0] - 80) {
	        y-= 4
	        adjust= 1
	    }
	    if(adjust == 0) {
	        siner++
	        x+= cos(siner / 2) * 0.5
	        y+= sin(siner / 6)
	    }
	}
	if(view_yview[0] <= 0) view_yview[0]= 0

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
