# Auto-converted from GameMaker: obj_torielbody
# GM parent: obj_friendparent
extends Node2D

func _ready():
	shock= 0
	pause= 0

func _on_outside_room():
	scale.x= 2
	scale.y= 2
	draw_sprite_ext(sprite_index, frame, x, y, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)
	if(shock == 0) {
	    facespr= 1986
	    if(GS.faceemotion == 0) facespr= 1986
	    if(GS.faceemotion == 1) facespr= 1990
	    if(GS.faceemotion == 2) facespr= 1991
	    if(GS.faceemotion == 3) facespr= 1996
	    if(GS.faceemotion == 4) facespr= 2004
	    if(GS.faceemotion == 5) facespr= 1993
	    if(GS.faceemotion == 6) facespr= 2285
	    if(GS.faceemotion == 7) facespr= 2283
	    if(GS.faceemotion == 9) facespr= 2284
	    if(GS.faceemotion == 10) facespr= 2288
	    if(GS.faceemotion == 11) facespr= 2282
	    if(GS.faceemotion == 12) facespr= 2287
	    if(GS.faceemotion == 13) facespr= 2289
	    if(GS.faceemotion == 14) facespr= 2286
	    if(GS.faceemotion == 15) facespr= 2290
	    draw_sprite_ext(facespr, 0, x + 40, y - 52, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)
	}
	if(shock == 1)
	    draw_sprite_ext(2312/* spr_face_torieldie */, 0, x + 40, y - 52, scale.x, scale.y, rotation_degrees, image_blend, modulate.a)

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
