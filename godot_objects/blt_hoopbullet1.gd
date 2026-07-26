# Auto-converted from GameMaker: blt_hoopbullet1
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	bullettype= 0
	if(x < GS.idealborder[0] + 20) velocity.x= 2
	else  velocity.x= -2
	gravitystart= 0.1 + random(0.2)
	gravity= gravitystart
	gravitywave= 1
	r= round(random(1))
	if(r == 0) gravity_direction= 270
	if(r == 1) gravity_direction= 90
	$Alarm0.start((10) / 30.0)
	$Alarm1.start((1) / 30.0)
	$Alarm2.start((4) / 30.0)
	$Alarm3.start((8) / 30.0)
	sterile= 0
	if(y > GS.idealborder[3] - 20) y-= 20
	if(y < GS.idealborder[2] + 20) y+= 20

func _gm_event_2_3():
	if(sterile == 0) {
	    iii= instance_create(xstart, ystart, 616/* blt_hoopbullet1 */)
	    iii.dmg= dmg
	    iii.bullettype= 2
	    iii.gravity= gravitystart
	    iii.gravity_direction= gravity_direction
	    iii.sterile= 1
	}

func _gm_event_2_2():
	if(sterile == 0) {
	    iii= instance_create(xstart, ystart, 616/* blt_hoopbullet1 */)
	    iii.dmg= dmg
	    iii.bullettype= 1
	    iii.gravity= gravitystart
	    iii.gravity_direction= gravity_direction
	    iii.sterile= 1
	}

func _gm_event_2_1():
	if(bullettype == 1) sprite_index= 151/* spr_circlebulletmd1 */
	if(bullettype == 2) sprite_index= 149/* spr_circlebulletsm */
	if(velocity.x > 0) x+= sprite_width / 2
	if(velocity.x < 0) x-= sprite_width / 2
	visible= 1

func _process(delta: float):
	gravity-= gravitywave * 0.1
	if(abs(gravity) > 0.5) gravitywave= -gravitywave

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
