# Auto-converted from GameMaker: obj_mettaton_dress2
# GM parent: obj_solidsmall
extends Node2D

func _ready():
	arm= 0
	animimg= 0
	xoff= 0
	yoff= 0
	phase= 0

func _on_alarm_0_timeout():
	if(obj_mainchara.x > x)
	    obj_mainchara.x+= velocity.x
	if(obj_mainchara.x < x)
	    obj_mainchara.x+= velocity.x
	if(obj_mainchara.bbox_top < bbox_bottom and obj_mainchara.bbox_bottom > bbox_bottom)
	    obj_mainchara.y+= velocity.y
	if(obj_mainchara.bbox_bottom > bbox_top and obj_mainchara.bbox_top < bbox_top)
	    obj_mainchara.y+= velocity.y
	obj_playmovement.touch++

func _on_outside_room():
	draw_sprite(sprite_index, 0, x, y)
	animimg+= 0.25
	z_index= 50000 - y * 10
	if(arm == 0)
	    draw_sprite(1721/* spr_metthand_clasped */, animimg, x - 19 + xoff, y - 26 + yoff)
	if(arm == 1)
	    draw_sprite(1727/* spr_metthand_broad */, animimg, x - 19 + xoff, y - 26 - 8 + yoff)
	if(arm == 2)
	    draw_sprite(1725/* spr_metthand_tragedy */, animimg, x - 19 - 10 + xoff, y - 26 - 10 + yoff)
	if(arm == 3)
	    draw_sprite(1722/* spr_metthand_cry */, animimg, x - 19 + xoff, y - 26 - 10 + yoff)
	if(arm == 4)
	    draw_sprite(1723/* spr_metthand_facescratch */, animimg, x - 19 - 5 + xoff, y - 26 - 9 + yoff)
	if(arm == 5)
	    draw_sprite(1724/* spr_metthand_shrug */, animimg, x - 19 - 18 + xoff, y - 26 - 5 + yoff)
	if(arm == 6)
	    draw_sprite(1726/* spr_metthand_nailfile */, animimg, x - 19 - 1 + xoff, y - 26 + 4 + yoff)
	if(arm == 7)
	    draw_sprite(1730/* spr_metthand_nailfile2 */, animimg, x - 19 - 1 + xoff, y - 26 + 1 + yoff)
	if(arm == 8)
	    draw_sprite(1728/* spr_metthand_up */, animimg, x - 19 - 14 + xoff, y - 26 - 11 + yoff)
	if(arm == 9)
	    draw_sprite(1729/* spr_metthand_headpat */, animimg, x - 19 - 17 + xoff, y - 26 - 7 + yoff)
	if(arm == 10)
	    draw_sprite(1731/* spr_metthand_assrummage */, animimg, x - 19 - 14 + xoff, y - 26 - 8 + yoff)
	if(arm == 11)
	    draw_sprite(1732/* spr_metthand_telething */, animimg, x - 19 - 14 + xoff, y - 26 - 11 + yoff)
	if(arm == 12)
	    draw_sprite(1733/* spr_metthand_telepoke */, 2, x - 19 - 14 + xoff, y - 26 - 11 + yoff)

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
