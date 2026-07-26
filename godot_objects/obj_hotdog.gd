# Auto-converted from GameMaker: obj_hotdog
extends Node2D

func _ready():
	xoffspeed= 0
	yoffspeed= 0
	friction= 1
	on= 1
	parent= id
	fally= 0
	fall= 0
	$Alarm0.start((1) / 30.0)
	relative= 0

func _process_end(delta: float):
	if(on == 1) {
	    if(parent.x != parent.xprevious) {
	        velocity.x= parent.x - parent.xprevious
	        if(velocity.x > 0) velocity.x+= friction
	        if(velocity.x < 0) velocity.x-= friction
	    }
	    y= parent.y - relative
	}
	if(x < parent.x - 2 and on == 1) {
	    on= 0
	    velocity.x= -4
	    fall= 1
	    g= instance_create(x, y, 1272/* obj_failuredog */)
	    g.fally= parent.y + 30
	    g.fall= fall
	    g.friction= friction
	    g.velocity.x= velocity.x
	    instance_destroy()
	}
	if(x > parent.x + 18 and on == 1) {
	    velocity.x= 4
	    on= 0
	    fall= 6
	    g= instance_create(x, y, 1272/* obj_failuredog */)
	    g.friction= friction
	    g.fally= parent.y + 30
	    g.fall= fall
	    g.velocity.x= velocity.x
	    instance_destroy()
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
