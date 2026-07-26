# Auto-converted from GameMaker: obj_groundtorch
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	image_speed= 0.5
	glow= 0
	scr_depth()

func _process(delta: float):
	if(myinteract == 1) {
	    if(snd_isplaying(112/* snd_movemenu */) == 0) snd_play(112/* snd_movemenu */)
	    if(sprite_index == 1597) {
	        sprite_index= 1598/* spr_groundtorch_on */
	        glow= 1
	    } else  {
	        sprite_index= 1597/* spr_groundtorch_off */
	        glow= 0
	    }
	    myinteract= 0
	}
	if(instance_exists(1106/* obj_torchpuzzle */) and glow == 1)
	    obj_torchpuzzle.h++

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
