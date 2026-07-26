# Auto-converted from GameMaker: obj_asgoreb_body
extends Node2D

func _ready():
	partx[7]= 68
	party[7]= 0
	partx[6]= 0
	party[6]= 28
	partx[5]= 16
	party[5]= 70
	partx[4]= 168
	party[4]= 70
	partx[3]= 50
	party[3]= 130
	partx[2]= 54
	party[2]= 156
	partx[1]= 32
	party[1]= 210
	partx[0]= -48
	party[0]= 62
	part[7]= 612
	part[6]= 613
	part[5]= 610
	part[4]= 611
	part[3]= 614
	part[2]= 615
	part[1]= 616
	part[0]= 608
	fakeanim= 0
	siner= 0
	moving= 1
	pause= 0

func _on_outside_room():
	i= 0
	while(i < 8) {
	    draw_sprite_ext(part[i], fakeanim, x + partx[i], y + party[i], 2, 2, 0, 16777215, 1)
	    i++
	}
	siner++
	fakeanim+= 0.1
	if(moving == 1) {
	    party[7]+= sin(siner / 15) * 0.3
	    party[6]+= sin(siner / 15) * 0.2
	    party[5]+= cos(siner / 15) * 0.1
	    party[4]+= cos(siner / 15) * 0.1
	    party[3]+= sin(siner / 15) * 0.1
	    party[0]+= sin(siner / 15) * 0.05
	}
	part[7]= 612
	part[6]= 613
	part[5]= 610
	part[4]= 611
	part[3]= 614
	part[2]= 615
	part[1]= 616
	part[0]= 608

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
