# Auto-converted from GameMaker: obj_shopkeeper2
extends Node2D

func _ready():
	image_speed= 0
	pos= 0
	armx= 0

func _process(delta: float):
	d= 0
	go= 0
	if(instance_exists(782/* OBJ_WRITER */) and OBJ_WRITER.halt == 0)
	    go= 1
	if(pos >= 6) go= 1
	if(go == 1) {
	    if(pos >= 3) {
	        y= ystart + 2
	        armx= 2
	    }
	    if(pos >= 6) {
	        y= ystart + 4
	        armx= 4
	    }
	    if(pos >= 9) {
	        y= ystart + 2
	        armx= 2
	    }
	    if(pos >= 12) {
	        y= ystart
	        pos= 0
	        armx= 0
	    }
	    pos++
	}

func _on_outside_room():
	draw_sprite(872/* spr_shop2_bg */, 0, 0, 0)
	draw_sprite(864/* spr_shopkeeper2_arm */, 0, xstart - 30 + armx, ystart + 24 + armx / 2)
	draw_sprite(868/* spr_shopkeeper2_body */, 0, xstart + 16, ystart + 40)
	draw_sprite(870/* spr_shopkeeper2_mouthbottom */, 0, xstart + 12, ystart + 31)
	draw_sprite(869/* spr_shopkeeper2_mouthtop */, 0, x, y)
	draw_sprite(871/* spr_shopkeeper2_eyes */, GS.faceemotion, x, y + 15)

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
