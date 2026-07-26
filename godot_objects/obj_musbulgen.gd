# Auto-converted from GameMaker: obj_musbulgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	dmg= 7
	if(obj_shyren.emotion > 0) {
	    caster_pause(GS.batmusic)
	    // obj_shyren
	    with(259) caster_play(longnote[0], 1, 1)
	}
	rate= GS.firingrate
	$Alarm0.start((rate) / 30.0)
	longnote= 0
	offset= 0

func _gm_event_1_0():
	caster_resume(GS.batmusic)
	if(instance_exists(259/* obj_shyren */)) {
	    if(obj_shyren.emotion == 2) obj_shyren.emotion= 1
	    // obj_shyren
	    with(259) {
	        caster_stop(longnote[0])
	        caster_stop(longnote[1])
	    }
	}

func _on_destroy():
	g= instance_create(x, y, 664/* blt_musbul1 */)
	$Alarm0.start((rate) / 30.0)
	longnote++
	if(longnote == 12) {
	    // obj_shyren
	    with(259) caster_play(longnote[1], 1, 1)
	}
	if(longnote == 24) {
	    // obj_shyren
	    with(259) caster_play(longnote[0], 1, 1)
	    longnote= 0
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
