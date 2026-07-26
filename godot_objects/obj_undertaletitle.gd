# Auto-converted from GameMaker: obj_undertaletitle
extends Node2D

func _ready():
	ii= caster_load("music/intronoise.ogg")
	caster_play(ii, 1, 1)
	$Alarm4.start((150) / 30.0)
	ok= 0
	jok= 0
	rot= 0
	con= 0

func _gm_event_2_4():
	con++
	$Alarm4.start((150) / 30.0)
	if(con < 3) caster_play(ii, 1, 1)

func _gm_event_5_39():
	if(GS.debug == 999 and not instance_exists(782/* OBJ_WRITER */) and GS.kills == 0)
	    rot++

func _gm_event_5_37():
	if(GS.debug == 999 and not instance_exists(782/* OBJ_WRITER */) and GS.kills == 0)
	    rot--

func _on_outside_room():
	if(con == 0)
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rot, 16777215, 1)
	if(con == 1) {
	    draw_set_color(16777215)
	    draw_set_font(1)
	    draw_text_transformed(90, 90, "By Toby Fox", 1, 1, 0)
	}
	if(con == 3) {
	    GS.entrance= 1
	    GS.facing= 1
	    GS.phone[0]= 0
	    GS.phone[1]= 0
	    GS.phone[2]= 0
	    GS.phone[3]= 0
	    GS.phone[4]= 0
	    GS.phone[5]= 0
	    GS.phone[6]= 0
	    GS.phone[7]= 0
	    GS.phone[0]= 206
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    get_tree().change_scene_to_file("res://godot_rooms/44.tscn")
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
