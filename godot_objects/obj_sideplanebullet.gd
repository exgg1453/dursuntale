# Auto-converted from GameMaker: obj_sideplanebullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	image_speed= 0
	y+= 40 + random(40)
	velocity.x= 6 + random(2)
	velocity.x*= choose(-1, 1)
	if(velocity.x < 0) {
	    frame= 1
	    x= GS.idealborder[1] + 40
	}
	if(velocity.x > 0) {
	    x= GS.idealborder[0] - 40
	    frame= 0
	}
	$Alarm0.start((10) / 30.0)

func _on_destroy():
	g= instance_create(x + 15, y + 10, 324/* obj_incendiarybomb */)
	if(is_instance_valid(g)) g.dmg= dmg
	$Alarm0.start((12) / 30.0)
	pop= scr_monstersum()
	if(pop > 1) $Alarm0.start((18) / 30.0)

func _process(delta: float):
	if(x > obj_heart.x + 400 or x < obj_heart.x - 400)
	    instance_destroy()

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
