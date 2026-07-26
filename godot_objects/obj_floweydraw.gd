# Auto-converted from GameMaker: obj_floweydraw
extends Node2D

func _ready():
	GS.inbattle= 1
	GS.flag[201]= GS.kills
	if(room == 308) GS.border= 1

func _on_outside_room():
	if(instance_exists(759/* obj_uborder */)) {
	    z_index= 5
	    draw_set_color(0)
	    draw_rectangle(obj_uborder.x + 5, obj_uborder.y + 5, obj_rborder.x, obj_dborder.y, 0)
	}
	draw_sprite(15/* spr_hpname */, 0, 270, 400)
	draw_set_color(255)
	draw_rectangle(310, 400, 310 + GS.maxhp * 1.2, 420, 0)
	draw_set_color(65535)
	draw_rectangle(310, 400, 310 + GS.hp * 1.2, 420, 0)
	draw_set_color(16777215)
	draw_set_font(7)
	hpwrite= string(GS.hp)
	if(GS.hp < 10) hpwrite= "0" + string(GS.hp)
	draw_text(200, 400, "LV " + string(GS.lv))
	draw_text(330 + GS.maxhp * 1.2, 400, hpwrite + " / " + string(GS.maxhp))

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
