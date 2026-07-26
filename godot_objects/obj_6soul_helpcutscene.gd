# Auto-converted from GameMaker: obj_6soul_helpcutscene
extends Node2D

func _ready():
	x= obj_floweyx_tv.x + 80
	y= obj_floweyx_tv.y + 90
	radius= 0
	siner= 0
	sinerspeed= 1
	con= 0
	counter= 0

func _on_outside_room():
	siner+= 2
	counter++
	i= 0
	while(i < 6) {
	    draw_sprite(sprite_index, i, x + lengthdir_x(radius, siner + i / 6 * 360), y + lengthdir_y(radius, siner + i / 6 * 360))
	    i++
	}
	if(counter > 60 and counter < 90)
	    radius+= 0.6
	if(counter == 120) velocity.y= 2
	if(counter > 120 and counter < 235) radius++
	if(counter == 235) {
	    velocity.y= 0
	    times= 0
	}
	if(counter == 285) {
	    i= 0
	    while(i < 6) {
	        heal= instance_create(x + lengthdir_x(radius, siner + i / 6 * 360), y + lengthdir_y(radius, siner + i / 6 * 360), 1606/* obj_6heal */)
	        with(heal)
	            move_towards_point(obj_vsflowey_heart.x + 8, obj_vsflowey_heart.y + 8, 3)
	        if(i == 0) {
	            heal.sprite_index= 2231/* spr_6bandage_big */
	            heal.scale.x= 1
	            heal.scale.y= 1
	        }
	        if(i == 1) {
	            heal.sprite_index= 2209/* spr_6thumbsup_small */
	            heal.scale.x= 2
	            heal.scale.y= 2
	        }
	        if(i == 2) {
	            heal.sprite_index= 2219/* spr_6shoe_musicnote */
	            heal.scale.x= 2
	            heal.scale.y= 2
	        }
	        if(i == 3) {
	            heal.sprite_index= 2210/* spr_6hope */
	            heal.scale.x= 2
	            heal.scale.y= 2
	        }
	        if(i == 4) {
	            heal.sprite_index= 2222/* spr_6pan_egg */
	            heal.scale.x= 2
	            heal.scale.y= 2
	        }
	        if(i == 5) {
	            heal.sprite_index= 2214/* spr_6gun_flower */
	            heal.scale.x= 2
	            heal.scale.y= 2
	        }
	        i++
	    }
	    times++
	}
	if(counter == 325 and times < 5) counter= 283
	if(counter > 360) radius+= 4
	if(counter > 460) instance_destroy()

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
