# Auto-converted from GameMaker: blt_chasefire2
# GM parent: blt_parent
extends Node2D

func _ready():
	instance_create(x + sprite_width / 2 - 8, y + sprite_width / 2 - 8, 682/* blt_gen */)
	dmg= 5
	if(GS.hp < 7) dmg= 2
	image_speed= 0.5
	goof= 0

func _process(delta: float):
	if(instance_exists(614/* blt_handbullet1 */) and blt_handbullet1.path_position == 1 and goof == 0) {
	    move_towards_point(obj_heart.x + 2, obj_heart.y + 2, 0.6)
	    goof= 1
	    friction= -0.1
	}
	if(y > GS.idealborder[3] + 4) instance_destroy()

func _on_alarm_0_timeout():
	velocity.y= -velocity.y
	friction= 0.08

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
