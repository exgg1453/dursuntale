# Auto-converted from GameMaker: obj_mouthbeam
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	snd_play(180/* mus_sfx_rainbowbeam_1 */)
	nowx= x
	nowy= y
	factor= 0
	visible= 0
	hits= 0
	obj_floweyx_flipeye.con= 10

func _process(delta: float):
	x= nowx + random(3) - random(3)
	y= nowy + random(3) - random(3)
	if(factor == 1) visible= 1
	factor++
	if(factor > 20) {
	    modulate.a-= 0.1
	    if(modulate.a < 0.2) {
	        instance_destroy()
	        obj_floweyx_flipeye.con= 6
	    }
	}
	if(instance_exists(1582/* obj_vsflowey_shaker */))
	    instance_create(0, 0, 1582/* obj_vsflowey_shaker */)

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
