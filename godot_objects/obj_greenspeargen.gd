# Auto-converted from GameMaker: obj_greenspeargen
extends Node2D

func _ready():
	$Alarm0.start((5) / 30.0)
	rating= 8
	spearmax= -1
	spearno= 0
	speedmod[0]= 1
	speardir[0]= 0
	speartype[0]= 0
	timemod[0]= 0
	done= 0
	dmg= 7
	object0= 263

func _gm_event_2_1():
	if(rating > 8) rating--
	$Alarm1.start((300) / 30.0)

func _on_destroy():
	$Alarm0.start((rating * timemod[spearno]) / 30.0)
	if(speartype[spearno] == 0) {
	    b= instance_create(0, 0, 265/* obj_blockbullet */)
	    b.dmg= dmg
	}
	if(speartype[spearno] == 1) {
	    b= instance_create(0, 0, 266/* obj_blockbullet2 */)
	    b.dmg= dmg
	}
	if(speartype[spearno] == 2) {
	    $Alarm0.start((rating * 2) / 30.0)
	    b= instance_create(0, 0, 266/* obj_blockbullet2 */)
	    b.site= timemod[spearno]
	    b.dmg= dmg
	    b= instance_create(0, 0, 265/* obj_blockbullet */)
	    b.site= speardir[spearno]
	    b.dmg= dmg
	}
	b.speedmod= speedmod[spearno]
	b.site= speardir[spearno]
	spearno++
	if(spearno > spearmax) {
	    $Alarm0.start((-1) / 30.0)
	    done= 1
	}

func _gm_event_7_0():
	if(GS.debug == 1 and Input.is_key_pressed(17))
	    rating--
	if(GS.turntimer < 1) instance_destroy()

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
