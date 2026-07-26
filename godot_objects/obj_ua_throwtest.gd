# Auto-converted from GameMaker: obj_ua_throwtest
extends Node2D

func _ready():
	con= 0
	drawnum= 0
	image_speed= 0.05

func _gm_event_2_4():
	con++

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, modulate.a)
	if(con == 1) sprite_index= 796/* spr_ua_hold */
	if(con == 3) {
	    snd_play(106/* snd_noise */)
	    sprite_index= 797/* spr_ua_lift1 */
	    con= 4
	    $Alarm4.start((3) / 30.0)
	}
	if(con == 5) {
	    sprite_index= 798/* spr_ua_lift2 */
	    con= 6
	    $Alarm4.start((70) / 30.0)
	}
	if(con == 7) {
	    sprite_index= 797/* spr_ua_lift1 */
	    con= 8
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 9) {
	    snd_play(20/* snd_arrow */)
	    velocity.y= -15
	    gravity= 2
	    sprite_index= 798/* spr_ua_lift2 */
	    con= 10
	}
	if(con == 10 and velocity.y >= -12) {
	    sprite_index= 799/* spr_ua_throw */
	    instance_create(x + 70, y + 30, 171/* obj_alphys_fly */)
	    con= 11
	}
	if(con == 11 and y > ystart - 2) {
	    y= ystart
	    gravity= 0
	    velocity.y= 0
	    con= 12
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
