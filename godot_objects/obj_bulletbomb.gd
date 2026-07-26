# Auto-converted from GameMaker: obj_bulletbomb
# GM parent: obj_metttestbulletparent
extends Node2D

func _ready():
	shot= 0
	shot2= 0
	image_speed= 0
	playdo= 0

func _gm_event_1_0():
	if(playdo == 1) _stop_sound("myloop")

func _process(delta: float):
	if(shot > 0) {
	    x= nowx
	    y= nowy
	    image_speed= 1
	    shot2++
	    if(shot2 >= 5) {
	        playdo= 0
	        _stop_sound("myloop")
	        snd_play(125/* snd_bomb */)
	        if(not instance_exists(184/* obj_shaker */)) scr_shake(3, 3, 2)
	        instance_create(x, y, 441/* obj_plusbomb_explosion */)
	        visible= 0
	        shot2= -1
	        shot= -1
	    }
	}

func _on_alarm_0_timeout():
	if(visible == 1) event_user(11)

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
