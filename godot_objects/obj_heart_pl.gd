# Auto-converted from GameMaker: obj_heart_pl
extends Node2D

func _ready():
	GS.idealborder[0]= 240
	GS.idealborder[1]= 400
	GS.idealborder[2]= 240
	GS.idealborder[3]= 400
	charge= 0
	shot= 0
	GS.testinv= 0
	image_speed= 0

func _process(delta: float):
	if(x > GS.idealborder[0] and Input.is_action_pressed("move_left"))
	    x-= 4
	if(x < GS.idealborder[1] - 16 and Input.is_action_pressed("move_right"))
	    x+= 4
	if(y > GS.idealborder[2] and Input.is_action_pressed("move_up"))
	    y-= 4
	if(y < GS.idealborder[3] - 16 and Input.is_action_pressed("move_down"))
	    y+= 4
	shot= 0
	if(not instance_exists(739/* obj_heartshot */) or charge < 0)
	    shot= 1
	if(Input.is_action_pressed("ui_confirm") and shot == 1) {
	    instance_create(x + 4, y + 2, 739/* obj_heartshot */)
	    charge= 30
	}
	charge--
	GS.testinv--
	if(GS.testinv > 0) image_speed= 1
	else  {
	    image_speed= 0
	    frame= 0
	}

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	draw_set_color(16777215)
	draw_rectangle(GS.idealborder[0], GS.idealborder[2], GS.idealborder[1], GS.idealborder[3], 1)
	draw_set_color(255)
	if(shot == 1)
	    draw_rectangle(x + 6, y + 23, x + 10, y + 26, 0)

func _gm_event_9_45():
	room_restart()

func _gm_event_9_35():
	GS.attacktype++
	room_restart()

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
