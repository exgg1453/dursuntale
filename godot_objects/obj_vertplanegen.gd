# Auto-converted from GameMaker: obj_vertplanegen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((5) / 30.0)
	green= 0
	dmg= 0
	parent= 327
	rate= GS.firingrate

func _on_destroy():
	gen= instance_create(GS.idealborder[0] + 20 + random(c_borderwidth(0) - 70), 50, 321/* obj_vertplanebullet */)
	if(is_instance_valid(gen)) {
	    gen.dmg= dmg
	    gen.parent= parent
	    gen.green= green
	}
	if(green == 1) {
	    with(gen) event_user(0)
	}
	$Alarm0.start((rate) / 30.0)
	if(green == 1) alarm[0]+= 10

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
