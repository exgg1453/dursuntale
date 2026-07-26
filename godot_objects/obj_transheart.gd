# Auto-converted from GameMaker: obj_transheart
extends Node2D

func _ready():
	xx= view_xview[view_current]
	yy= view_yview[view_current]
	mode= 0
	$Alarm0.start((0) / 30.0)
	mychoicex= xx + 20
	mychoicey= yy + 223
	if(room == 5 or room == 77) {
	    mychoicex= xx + 154
	    mychoicey= yy + 156
	}
	if(room == 134 or room == 135 or room == 136 or room == 137) {
	    mychoicex= xx + 156
	    mychoicey= yy + 116
	}
	spdr= distance_to_point(mychoicex, mychoicey) / 17
	move_towards_point(mychoicex, mychoicey, spdr)
	snd_play(105/* snd_battlefall */)
	if(GS.flag[16] == 1) {
	    x= xstart
	    y= ystart
	    mychoicex= xx + 154
	    mychoicey= yy + 156
	    spdr= distance_to_point(mychoicex, mychoicey) / 8
	    move_towards_point(mychoicex, mychoicey, spdr)
	    snd_play(105/* snd_battlefall */)
	}

func _on_destroy():
	xx= view_xview[view_current]
	yy= view_yview[view_current]
	mode= 0
	mychoicex= xx + 20
	mychoicey= yy + 223
	if(room == 5 or room == 77) {
	    mychoicex= xx + 154
	    mychoicey= yy + 156
	}
	if(room == 134) {
	    mychoicex= xx + 154
	    mychoicey= yy + 110
	}
	spdr= distance_to_point(mychoicex, mychoicey) / 17
	move_towards_point(mychoicex, mychoicey, spdr)
	if(GS.flag[16] == 1) {
	    mychoicex= xx + 154
	    mychoicey= yy + 156
	    spdr= distance_to_point(mychoicex, mychoicey) / 8
	    move_towards_point(mychoicex, mychoicey, spdr)
	}

func _process(delta: float):
	if(abs(x - mychoicex) < speed and abs(y - mychoicey) < speed) {
	    x= mychoicex
	    y= mychoicey
	    speed= 0
	}

func _gm_event_7_5():
	queue_free()

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
