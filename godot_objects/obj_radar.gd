# Auto-converted from GameMaker: obj_radar
# GM parent: obj_graphparent
extends Node2D

func _ready():
	siner= 0
	radardogalpha= 1
	radardogx= random(40) - 30
	radardogy= random(40) - 30
	die= 0

func _on_outside_room():
	r= 40
	draw_set_color(16777215)
	draw_circle(x, y, r + 2, 1)
	draw_circle(x, y, r + 3, 1)
	draw_set_color(65280)
	i= 0
	while(i < 10) {
	    draw_set_alpha((i + 1) / 10)
	    draw_line_width(x + sin((siner + i) / 10) * r, y + cos((siner + i) / 10) * r, x, y, 3)
	    i++
	}
	siner++
	draw_sprite_ext(787/* spr_dogradar */, 0, x + radardogx, y + radardogy, 1, 1, 0, 16777215, radardogalpha)
	radardogalpha-= 0.05
	if(radardogalpha < -0.6) {
	    radardogalpha= 1
	    radardogx= random(40) - 30
	    radardogy= random(40) - 30
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
