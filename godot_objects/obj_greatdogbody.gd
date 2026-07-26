# Auto-converted from GameMaker: obj_greatdogbody
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	image_speed= 0.1
	scale.x= 2
	scale.y= 2
	gq= 0

func _process(delta: float):
	if(instance_exists(224/* obj_greatdog */)) {
	    if(obj_greatdog.dogignore == 0) {
	        scale.x= 2
	        scale.y= 2
	        x= xstart
	        y= ystart
	    }
	    if(obj_greatdog.dogignore == 1) {
	        scale.x= 3
	        scale.y= 3
	        x= xstart - 0.2 * sprite_width
	        y= ystart + 30
	    }
	    if(obj_greatdog.dogignore == 2) {
	        scale.x= 4
	        scale.y= 4
	        x= xstart - 0.25 * sprite_width
	        y= ystart + 70
	    }
	    if(obj_greatdog.dogignore == 3) {
	        scale.x= 5
	        scale.y= 5
	        x= xstart - 0.333333333333333 * sprite_width
	        y= obj_uborder.y - 85
	    }
	}
	if(GS.debug == 1 and Input.is_action_pressed("ui_accept"))
	    obj_greatdog.dogignore= 3

func _on_outside_room():
	g= 0
	if(instance_exists(224/* obj_greatdog */) and obj_greatdog.dogignore <= 2) {
	    draw_self_custom_x(0, 999, 0, 250)
	    g= 1
	}
	if(g == 0)
	    draw_sprite_part_ext(sprite_index, frame, 43, 0, 17, (250 - y) / scale.y, x + 44 * scale.x, y, scale.x, scale.y, 16777215, 1)

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
