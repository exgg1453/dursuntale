# Auto-converted from GameMaker: blt_splinterbig
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	velocity.y= 2
	$Alarm0.start((20 + random(20)) / 30.0)
	script_execute(122/* scr_edge */, 6, 10)

func _on_destroy():
	i= 0
	while(i < 9) {
	    blt= instance_create(x + 3, y + 3, 623/* blt_splinter */)
	    blt.dmg= dmg
	    blt.direction= i * 40
	    i++
	}
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
