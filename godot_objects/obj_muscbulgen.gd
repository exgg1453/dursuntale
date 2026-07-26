# Auto-converted from GameMaker: obj_muscbulgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	firingspeed= GS.firingrate + 1
	$Alarm0.start((1) / 30.0)
	g= floor(random(2))
	if(g == 1) side= -1
	if(g == 0) side= 1
	dmg= 8
	siner= 0
	offset= 0

func _on_destroy():
	if(side == 1) {
	    if(offset == 0)
	        blt= instance_create(GS.idealborder[0] + 4, GS.idealborder[3] + 12, 674/* blt_muscbul */)
	    if(offset == 1)
	        blt= instance_create(GS.idealborder[0] - 34, GS.idealborder[3] + 12, 674/* blt_muscbul */)
	}
	if(side == -1) {
	    if(offset == 0)
	        blt= instance_create(GS.idealborder[1] - 4, GS.idealborder[3] + 12, 674/* blt_muscbul */)
	    if(offset == 1)
	        blt= instance_create(GS.idealborder[1] + 34, GS.idealborder[3] + 12, 674/* blt_muscbul */)
	}
	blt.dmg= dmg
	blt.offset= offset
	if(side == -1) side= 1
	else  side= -1
	$Alarm0.start((firingspeed) / 30.0)
	firingspeed-= 2

func _gm_event_7_0():
	if(instance_exists(674/* blt_muscbul */))
	    blt_muscbul.velocity.y-= 0.02
	siner++

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
