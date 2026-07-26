# Auto-converted from GameMaker: obj_lavafiregen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((5) / 30.0)
	lavatime= 1
	dmg= 9
	rate= GS.firingrate

func _on_destroy():
	$Alarm0.start((rate) / 30.0)
	g= instance_create(GS.idealborder[0] - 40, GS.idealborder[3], 333/* obj_sidelava */)
	if(is_instance_valid(g)) g.dmg= dmg
	g= instance_create(GS.idealborder[1] - 10, GS.idealborder[3], 333/* obj_sidelava */)
	if(is_instance_valid(g)) g.dmg= dmg
	lavatime++
	if(lavatime == 2) {
	    g= instance_create(GS.idealborder[0] + 10, (GS.idealborder[2] + GS.idealborder[3]) / 2 + 60 - random(120), 332/* obj_lavabullet */)
	    if(is_instance_valid(g)) g.dmg= dmg
	}
	if(lavatime == 4) {
	    g= instance_create(GS.idealborder[1] - 10, (GS.idealborder[2] + GS.idealborder[3]) / 2 + 60 - random(120), 332/* obj_lavabullet */)
	    if(is_instance_valid(g)) g.dmg= dmg
	    lavatime= 0
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
