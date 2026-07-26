# Auto-converted from GameMaker: obj_pollener
extends Node2D

func _ready():
	i= 0
	while(i < 100) {
	    pollenalpha[i]= 0
	    pollenx[i]= random(get_viewport_rect().size.x)
	    polleny[i]= random(get_viewport_rect().size.y)
	    pollensize[i]= random(3) + 1
	    pollenvelocity.x[i]= random(2) - 1
	    pollenvelocity.y[i]= random(2) - 1
	    i++
	}

func _on_outside_room():
	draw_set_circle_precision(0)
	draw_set_color(65535)
	i= 0
	while(i < 100) {
	    pollenalpha[i]+= 0.03
	    truepollenalpha[i]= pollenalpha[i]
	    if(pollenalpha[i] >= 2)
	        truepollenalpha[i]= 4 - pollenalpha[i]
	    pollenx[i]+= pollenvelocity.x[i] * truepollenalpha[i] / 4
	    polleny[i]+= pollenvelocity.y[i] * truepollenalpha[i] / 4
	    if(truepollenalpha[i] <= 0) {
	        pollenx[i]= random(get_viewport_rect().size.x)
	        polleny[i]= random(get_viewport_rect().size.y)
	        pollensize[i]= random(3) + 1
	        pollenvelocity.x[i]= random(2) - 1
	        pollenvelocity.y[i]= random(2) - 1
	        pollenalpha[i]= 0
	    }
	    draw_set_alpha(truepollenalpha[i])
	    draw_circle(pollenx[i], polleny[i], pollensize[i], 0)
	    i++
	}
	draw_set_alpha(1)

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
