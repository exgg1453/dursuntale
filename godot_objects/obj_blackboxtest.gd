# Auto-converted from GameMaker: obj_blackboxtest
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	angle= 0
	modulate.a= 0
	dmg= 0

func _process(delta: float):
	rotation_degrees+= 10
	if(modulate.a < 1) modulate.a+= 0.1
	if(y > GS.idealborder[3] and velocity.y > 0) {
	    modulate.a-= 0.2
	    if(modulate.a < 0.1) instance_destroy()
	}
	if(collision_rectangle(x - 10, y - 10, x + 10, y + 10, 739, 0, 1))
	    event_user(0)

func _gm_event_7_10():
	i= 0
	while(i < 4) {
	    gel= instance_create(x, y, 676/* obj_blackboxpart */)
	    gel.rotation_degrees= rotation_degrees + i * 90
	    i++
	}
	snd= choose(0, 1, 2)
	if(snd == 0) snd_play(150/* snd_breaka */)
	if(snd == 1) snd_play(151/* snd_breakb */)
	if(snd == 2) snd_play(152/* snd_breakc */)
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
