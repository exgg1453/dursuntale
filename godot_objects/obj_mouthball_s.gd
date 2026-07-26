# Auto-converted from GameMaker: obj_mouthball_s
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	siner= 0
	nowsize= 0
	size= 0.8
	xprev3= x
	yprev3= y
	xprev2= x
	yprev2= y
	xprev4= xprev3
	yprev4= yprev3
	parent= id
	num= 0
	mb= 48278432
	dont= 0
	image_blend= merge_color(32768, 16777215, 0.3)

func _on_destroy():
	mb= instance_create(x, y, 1632/* obj_mouthball_s */)
	mb.num= num - 1
	mb.parent= id
	mb.size= size - 0.1
	mb.siner= siner + 1
	if(mb.num > 0) {
	    with(mb) $Alarm0.start((1) / 30.0)
	}

func _process(delta: float):
	if(nowsize < size) nowsize+= 0.1
	if(nowsize > size) nowsize= size
	scale.x= nowsize + sin(siner / 6) * 0.1
	scale.y= nowsize + sin(siner / 6) * 0.1
	if(dont == 0) {
	    xprev4= xprev3
	    yprev4= yprev3
	    xprev3= xprev2
	    yprev3= yprev2
	    xprev2= xprevious
	    yprev2= yprevious
	    x= parent.xprev4
	    y= parent.yprev4
	}
	if(dont == 1) instance_destroy()
	siner++

func _gm_event_7_17():
	if(is_instance_valid(mb)) {
	    with(mb) event_user(7)
	}
	dont= 1
	event_user(8)

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
