# Auto-converted from GameMaker: obj_floweybattler2
extends Node2D

func _ready():
	GS.interact= 3
	$Alarm4.start((4) / 30.0)
	heartdraw= 0
	on= 0
	clap= 0
	depp= -600
	claptimer= 2
	GS.transtype= 0
	$Alarm5.start((50) / 30.0)
	hearts= 0
	fader= 0

func _gm_event_2_8():
	fader= 1

func _gm_event_2_7():
	// obj_transheart_fake
	with(1573) {
	    if(clapper == 1) event_user(0)
	}
	$Alarm6.start((50) / 30.0)
	$Alarm8.start((35) / 30.0)
	snd_play(105/* snd_battlefall */)

func _gm_event_2_6():
	room_goto_next()

func _gm_event_2_5():
	GS.transtype++
	instance_create(0, 0, 1573/* obj_transheart_fake */)
	hearts++
	if(hearts < 6) $Alarm5.start((8) / 30.0)
	else  $Alarm7.start((20) / 30.0)

func _gm_event_2_4():
	if(on == 0 and heartdraw == 1) {
	    heartdraw= 0
	    on= 1
	    clap++
	}
	$Alarm4.start((4) / 30.0)

func _on_outside_room():
	if(clap < 3) obj_mainchara_fake.z_index= depp
	if(heartdraw == 1 and clap < 3)
	    draw_sprite_ext(2270/* spr_ourheart */, 0, obj_mainchara_fake.x + 5, obj_mainchara_fake.y + 17, 0.5, 0.5, 0, 16777215, 1)
	if(clap != 99 and on == 0 and heartdraw == 0) {
	    snd_play(106/* snd_noise */)
	    on= 1
	    heartdraw= 1
	}
	on= 0
	if(clap == 3) {
	    instance_create(obj_mainchara_fake.x + 5, obj_mainchara_fake.y + 17, 1573/* obj_transheart_fake */)
	    heartdraw= 0
	    obj_mainchara_fake.visible= 0
	    clap= 99
	}
	if(fader == 1) {
	    // obj_transheart_fake
	    with(1573) {
	        if(clapper == 1) modulate.a-= 0.2
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
