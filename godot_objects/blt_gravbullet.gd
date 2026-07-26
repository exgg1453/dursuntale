# Auto-converted from GameMaker: blt_gravbullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	if(instance_exists(597/* obj_parsnik */)) sprite_index= 56/* spr_carrotbullet_snake */
	dmg= 0
	image_speed= 0
	frame= round(random(5))
	y-= 8
	velocity.y= -0.5
	gravity= 0.25
	gravity_direction= 270
	if(x < GS.idealborder[0] + 15) x+= 15
	green= 0

func _process_end(delta: float):
	if(GS.turntimer < 1) instance_destroy()

func _on_alarm_0_timeout():
	if(green == 0) scr_damagestandard_x()
	if(green == 1) {
	    instance_destroy()
	    snd_play(155/* snd_heal_c */)
	    if(GS.hp < GS.maxhp) GS.hp++
	    // obj_vegetoid
	    with(208) {
	        if(eat == 1) {
	            ate= 1
	            mercymod= 90
	        }
	    }
	    // obj_parsnik
	    with(597) {
	        if(eat == 1) {
	            ate= 1
	            mercymod= 90
	        }
	    }
	}

func _gm_event_7_0():
	queue_free()

func _on_outside_room():
	if(green == 1) {
	    sprite_index= 58/* spr_carrotbullet_gr */
	    if(instance_exists(597/* obj_parsnik */)) sprite_index= 57/* spr_carrotbullet_snake_gr */
	}
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
