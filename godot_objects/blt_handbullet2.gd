# Auto-converted from GameMaker: blt_handbullet2
# GM parent: blt_parent
extends Node2D

func _ready():
	image_speed= 0
	if(y < GS.idealborder[2] + 60) frame= 1
	path_start(3/* path_hand2 */, 0.2, 0, 0/* path_action_stop */)
	dmg= 0
	rot= 0
	$Alarm0.start((8) / 30.0)
	inactive= 0

func _gm_event_1_0():
	GS.turntimer= -1
	GS.mnfight= 3

func _gm_event_2_1():
	instance_destroy()

func _on_destroy():
	if(inactive == 0) {
	    if(x == 0) iii= instance_create(x + 22, y + 5, 611/* blt_chasefire1 */)
	    else  iii= instance_create(x + 22, y + 5, 613/* blt_chasefire2 */)
	    if(is_instance_valid(iii)) {
	        if(GS.hp < 8) {
	            with(iii) dmg= 2
	        }
	        if(GS.hp < 6) {
	            with(iii) dmg= 1
	        }
	    }
	    snd_play(106/* snd_noise */)
	    $Alarm0.start((4) / 30.0)
	} else  $Alarm1.start((70) / 30.0)
	if(GS.hp < 8) dmg= 2
	if(GS.hp < 6) dmg= 1

func _process_end(delta: float):
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
	}
	if(path_position < 0.5) path_speed+= 0.2
	if(path_position > 0.5) path_speed-= 0.1
	if(path_position == 1) {
	    path_end()
	    speed= 0
	    gravity= 0
	    inactive= 1
	}
	if(GS.hp <= 2) GS.turntimer= -100

func _on_outside_room():
	draw_self_border()

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
