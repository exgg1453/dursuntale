# Auto-converted from GameMaker: obj_shopmouth1
extends Node2D

func _ready():
	image_speed= 0
	if(room == 311) x= obj_shop1.shx + 27
	else  instance_destroy()
	y= 50
	GS.faceemotion= 0
	an= 0
	facespr[0]= 876
	facespr[1]= 881
	facespr[2]= 880
	facespr[3]= 882
	facespr[4]= 879
	facespr[5]= 878
	facespr[6]= 877
	if(scr_murderlv() >= 7) instance_destroy()

func _process(delta: float):
	d= 0
	if(instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt == 0) {
	    d= 1
	    image_speed= 0.2
	}
	if(d == 0) {
	    image_speed= 0
	    frame= 0
	}

func _on_outside_room():
	if(GS.faceemotion == 0)
	    draw_sprite(sprite_index, frame, x, y)
	if(GS.faceemotion > 0) {
	    xx= obj_shop1.shx + 20
	    yy= 36
	    if(GS.faceemotion > 6) GS.faceemotion= 6
	    draw_sprite(facespr[GS.faceemotion], frame, xx, yy)
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
