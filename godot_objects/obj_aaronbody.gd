# Auto-converted from GameMaker: obj_aaronbody
# GM parent: obj_monsterparent
extends Node2D

func _ready():
	bull= 0
	image_speed= 0.1
	scale.x= 2
	scale.y= 2
	siny= 0
	yo= y
	if(instance_exists(291/* obj_tembattle */)) {
	    modulate.a= 0
	    alphaup= 1
	} else  alphaup= 0
	shake= 0
	shack= 0

func _process(delta: float):
	if(bull == 0) {
	    siny++
	    y= yo + sin(siny / 30) * 9
	    yo+= velocity.y
	    if(alphaup == 1 and modulate.a < 1)
	        modulate.a+= 0.05
	}
	if(shake > 0) {
	    shack++
	    if(shack == 2) {
	        x= xstart + (random(shake) * 2 - shake) / 2
	        y= ystart + (random(shake) * 2 - shake) / 2
	        shack= 0
	    }
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
