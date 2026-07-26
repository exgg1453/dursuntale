# Auto-converted from GameMaker: obj_asgore_firehit
extends Node2D

func _ready():
	con= 0
	GS.faceemotion= 2
	$Alarm4.start((60) / 30.0)
	onoff= 0
	firetimer= 0

func _gm_event_2_4():
	con++

func _on_outside_room():
	if(con < 3) {
	    draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, image_blend, 1)
	    draw_sprite_ext(604/* spr_asgore_bface */, GS.faceemotion, x + 138, y - 12, 2, 2, 0, 16777215, 1)
	}
	if(con == 1) {
	    if(onoff == 0) onoff= 1
	    else  onoff= 0
	    if(onoff == 0)
	        draw_sprite_ext(66/* spr_torielflame */, 0, x + 360, y + 100, 2, 2, 0, image_blend, 1)
	    firetimer++
	    if(firetimer > 40) {
	        snd_play(106/* snd_noise */)
	        kk= 0
	        firetimer= 0
	        con= 1.5
	        $Alarm4.start((40) / 30.0)
	    }
	}
	if(con == 1.5) {
	    GS.faceemotion= 3
	    kk++
	    draw_sprite_ext(66/* spr_torielflame */, floor(kk / 4), x + 360 - firetimer * 10, y + 100, 2, 2, 0, image_blend, 1)
	}
	if(con == 2.5) con= 2
	if(con == 2) {
	    firetimer++
	    draw_sprite_ext(66/* spr_torielflame */, floor(firetimer / 4), x + 360 - firetimer * 20, y + 100, 2, 2, 0, image_blend, 1)
	    if(firetimer > 9) {
	        snd_play(51/* snd_damage */)
	        con= 3
	        $Alarm4.start((120) / 30.0)
	    }
	}
	if(con == 3) {
	    velocity.x= -20
	    velocity.y= -4
	    gravity= 10
	    gravity_direction= 270
	    rotation_degrees+= 3
	    draw_sprite_ext(2293/* spr_asgore_hit */, frame, x, y, 2, 2, rotation_degrees, image_blend, 1)
	}
	if(con == 4) instance_destroy()

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
