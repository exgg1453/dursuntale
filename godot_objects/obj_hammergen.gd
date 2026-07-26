# Auto-converted from GameMaker: obj_hammergen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	odd= 0

func _on_destroy():
	hnum= ceil((obj_rborder.x - obj_lborder.x) / 22) - 1
	if(odd == 1) {
	    a= instance_create(obj_heart.x - 12, 0, 371/* obj_knighthammer */)
	    a.side= 0
	    odd= 0
	} else  {
	    gg= floor(random(hnum)) * 22
	    a= instance_create(GS.idealborder[0] + gg, 0, 371/* obj_knighthammer */)
	    a.side= 0
	    odd= 1
	}
	gg= floor(random(hnum)) * 22
	b= instance_create(GS.idealborder[0] + gg, 0, 371/* obj_knighthammer */)
	b.side= 1
	gg= floor(random(hnum)) * 22
	c= instance_create(GS.idealborder[0] + gg, 0, 371/* obj_knighthammer */)
	c.side= 1
	if(c.x == b.x) b.x+= 22
	gg= floor(random(hnum)) * 22
	d= instance_create(GS.idealborder[0] + gg, 0, 371/* obj_knighthammer */)
	if(d.x == b.x or d.x == c.x) d.x+= 22
	d.side= 0
	gg= floor(random(hnum)) * 22
	e= instance_create(GS.idealborder[0] + gg, 0, 371/* obj_knighthammer */)
	if(e.x == b.x or e.x == c.x or e.x == d.x)
	    e.x+= 22
	e.side= 1
	$Alarm0.start((33) / 30.0)

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
