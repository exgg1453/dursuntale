# Auto-converted from GameMaker: obj_battlerflowey
# GM parent: obj_battler
extends Node2D

func _ready():
	GS.interact= 3
	$Alarm2.start((40) / 30.0)
	$Alarm4.start((1) / 30.0)
	heartdraw= 0
	on= 0
	clap= 0
	depp= -600
	instance_create(0, 0, 146/* obj_tempblack */)

func _gm_event_2_4():
	if(on == 0 and heartdraw == 1) {
	    heartdraw= 0
	    on= 1
	    clap++
	}
	if(on == 0 and heartdraw == 0) {
	    snd_play(106/* snd_noise */)
	    on= 1
	    heartdraw= 1
	}
	on= 0
	if(clap > 2) {
	    instance_create(obj_mainchara.x + 5, obj_mainchara.y + 17, 141/* obj_transheart */)
	    heartdraw= 0
	    obj_mainchara.z_index= 100
	} else  $Alarm4.start((2) / 30.0)

func _gm_event_2_3():
	GS.currentroom= room
	instance_create(0, 0, 147/* obj_fader */)
	if(room == 5) {
	    get_tree().change_scene_to_file("res://godot_rooms/307.tscn")
	    room_persistent= 1
	}
	if(room == 77) get_tree().change_scene_to_file("res://godot_rooms/317.tscn")
	if(instance_exists(1307/* obj_alabdoor_l */)) get_tree().change_scene_to_file("res://godot_rooms/318.tscn")

func _gm_event_2_2():
	$Alarm3.start((1) / 30.0)

func _gm_event_7_5():
	instance_destroy()

func _on_outside_room():
	if(clap < 3) {
	    obj_mainchara.z_index= depp
	    if(instance_exists(147/* obj_fader */)) {
	        // obj_fader
	        with(147) instance_destroy()
	    }
	}
	if(heartdraw == 1)
	    draw_sprite(49/* spr_heartsmall */, 0, obj_mainchara.x + 5, obj_mainchara.y + 17)

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
