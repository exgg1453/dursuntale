# Auto-converted from GameMaker: obj_darknesslantern
# GM parent: obj_readable
extends Node2D

func _ready():
	myinteract= 0
	image_speed= 0
	glow= 0
	scr_depth()
	glowup= 0
	glowtimer= 0

func _process(delta: float):
	if(myinteract == 1 and glowtimer <= 0) {
	    if(snd_isplaying(13/* snd_spearappear */) == 0) snd_play(13/* snd_spearappear */)
	    myinteract= 0
	    glowtimer= 30
	    glowup= 1
	}
	glowtimer--
	if(glowtimer <= 0) glowup= 0
	if(glowup == 1 and obj_darknesspuzzle.glowamt > 0)
	    obj_darknesspuzzle.glowamt-= 0.07
	if(myinteract == 1) myinteract= 0

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
