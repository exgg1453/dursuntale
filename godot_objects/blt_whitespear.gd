# Auto-converted from GameMaker: blt_whitespear
# GM parent: blt_bluespear
extends Node2D

func _ready():
	dmg= 0
	rr= round(random(1))
	y= GS.idealborder[2] + 7
	if(rr == 1) {
	    x= GS.idealborder[1] + 20
	    velocity.x= -7
	    gravity= 0.13
	    gravity_direction= 0
	}
	if(rr == 0) {
	    x= GS.idealborder[0] - 20
	    velocity.x= 7
	    gravity= 0.13
	    gravity_direction= 180
	}

func _on_alarm_0_timeout():
	if(GS.invc < 1) {
	    dmgamt= round(dmg - (GS.df + GS.adef) / 5)
	    if(dmgamt < 1) dmgamt= 1
	    GS.hp-= dmgamt
	    snd_play(53/* snd_hurt1 */)
	    GS.hshake= 2
	    GS.shakespeed= 2
	    GS.vshake= 2
	    instance_create(0, 0, 184/* obj_shaker */)
	    GS.invc= GS.inv
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
