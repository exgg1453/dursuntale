# Auto-converted from GameMaker: obj_sleepdog
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	y= GS.idealborder[3] - sprite_height
	x= (GS.idealborder[0] + GS.idealborder[1]) / 2 - sprite_width / 2
	image_speed= 0.1
	dmg= 5
	myself= 0
	hmove= 0

func _gm_event_1_0():
	GS.turntimer= -1
	GS.mnfight= 3

func _gm_event_2_4():
	frame= 0

func _gm_event_2_3():
	instance_create(x + 20, y + 8, 642/* blt_barkbullet */)

func _gm_event_2_2():
	frame= 1
	instance_create(x + 20, y + 8, 642/* blt_barkbullet */)
	$Alarm3.start((8) / 30.0)
	$Alarm4.start((20) / 30.0)
	$Alarm2.start((40) / 30.0)

func _process(delta: float):
	if(obj_heart.x != obj_heart.xprevious or obj_heart.y != obj_heart.yprevious)
	    hmove++
	if(hmove > 7) {
	    hmove= -99999
	    sprite_index= 86/* spr_wakedog */
	    image_speed= 0
	    frame= 0
	    $Alarm2.start((2) / 30.0)
	}
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
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
