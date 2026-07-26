# Auto-converted from GameMaker: obj_gyftgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	firingspeed= GS.firingrate
	bullettype= 0
	$Alarm0.start(1 / 30.0)

func _on_destroy():
	slot= floor(random(6))
	myx= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 6 * slot
	myy= GS.idealborder[2] - 20
	iii= instance_create(myx, myy, 630/* blt_gravbullet */)
	if(is_instance_valid(iii)) {
	    if(obj_heart.x + 8 < myx) iii.velocity.x= -0.5
	    if(obj_heart.x + 8 > myx) iii.velocity.x= 0.5
	    iii.sprite_index= 150/* spr_circlebullet_noc */
	    iii.dmg= GS.monsteratk[myself]
	}
	$Alarm0.start((firingspeed) / 30.0)

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
