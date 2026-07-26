# Auto-converted from GameMaker: obj_boardride_a
extends Node2D

func _ready():
	if(room == 91 and GS.plot > 108) {
	    instance_create(x, y, 2/* obj_solidsmall */)
	    instance_destroy()
	}
	interacted= 0
	active= 1
	finalx= 1000

func _gm_event_2_2():
	active++

func _process(delta: float):
	if(active == 1 and GS.interact == 0 and collision_rectangle(x + 16, y + 2, x + 24, y + 18, 1570, 0, 1)) {
	    scr_tempsave()
	    GS.interact= 1
	    GS.phasing= 1
	    velocity.x= 3
	    obj_mainchara.velocity.x= 3
	    obj_mainchara.image_speed= 0
	    scr_musfadeout(0.006)
	    GS.currentsong= caster_load("music/ambientwater.ogg")
	    caster_loop(GS.currentsong, 0, 0.9)
	    scr_musfadein(0.005)
	    active= 2
	}
	if(active == 2 and x >= 1000) {
	    x= 1000
	    velocity.x= 0
	    obj_mainchara.image_speed= 0.25
	    $Alarm2.start((8) / 30.0)
	    active= 3
	}
	if(active == 4) {
	    obj_mainchara.velocity.x= 0
	    obj_mainchara.image_speed= 0
	    GS.interact= 0
	    active= 5
	    velocity.x= -3
	    GS.phasing= 0
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
