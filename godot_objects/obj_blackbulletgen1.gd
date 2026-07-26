# Auto-converted from GameMaker: obj_blackbulletgen1
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	x= GS.idealborder[0]
	y= GS.idealborder[2] - 40
	velocity.x= 4

func _on_destroy():
	$Alarm0.start((GS.firingrate) / 30.0)
	bx= instance_create(x, y, 675/* obj_blackboxtest */)
	bx.velocity.y= 8
	obj_blackboxtest.dmg= floor(GS.hp / 2)
	if(GS.hp < 2) {
	    GS.turntimer= -1
	    // obj_blackboxtest
	    with(675) instance_destroy()
	}

func _process(delta: float):
	if(GS.mnfight != 2) instance_destroy()
	if(x > GS.idealborder[1] - 20 or x < GS.idealborder[0]) {
	    x= xprevious
	    velocity.x= -velocity.x
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
