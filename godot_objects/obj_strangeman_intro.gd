# Auto-converted from GameMaker: obj_strangeman_intro
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	image_speed= 0.1
	y= GS.idealborder[3] - sprite_height + 15
	x= GS.idealborder[1] - sprite_width + 19
	con= 0
	velocity.x= -1
	shake= 0
	nowx= 0
	nowy= 0

func _gm_event_2_5():
	if(instance_number(537) < 40)
	    instance_create(x - 30 + random(60), y - 50 - random(40), 537/* obj_strangeman_butterfly */)
	$Alarm5.start((3) / 30.0)

func _gm_event_2_4():
	con++

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, 1)
	draw_set_color(0)
	draw_rectangle(GS.idealborder[1] + 1, GS.idealborder[2], GS.idealborder[1] + 100, GS.idealborder[3], 0)
	if(x < GS.idealborder[1] - sprite_width + 20 and con == 0) {
	    nowx= x
	    nowy= y
	    velocity.x= 0
	    frame= 0
	    image_speed= 0
	    con= 1
	}
	if(con == 1) {
	    con= 2
	    $Alarm5.start((60) / 30.0)
	    $Alarm4.start((130) / 30.0)
	}
	if(con == 3) {
	    shake= 1
	    sprite_index= 699/* spr_strangeman_poseb */
	    con= 4
	    $Alarm4.start((80) / 30.0)
	}
	if(con == 5) {
	    nowy+= 14
	    shake= 2
	    sprite_index= 698/* spr_strangeman_pose */
	    y+= 14
	    con= 6
	}
	if(shake > 0) {
	    shake+= 0.03
	    x= nowx + random(shake) - random(shake)
	    y= nowy + random(shake) - random(shake)
	}
	if(GS.turntimer < 1) instance_destroy()

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
