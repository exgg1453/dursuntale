# Auto-converted from GameMaker: blt_pblueattack
# GM parent: blt_parent
extends Node2D

func _ready():
	dmg= 0
	if(scr_monstersum() > 1) speartype= 1
	else  speartype= 0
	y= GS.idealborder[2] + floor(random(120))
	x= GS.idealborder[1] + 20
	velocity.x= -3 + random(-3)

func _process_end(delta: float):
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
	}
	if(x < GS.idealborder[0] - 40) instance_destroy()
	GS.turntimer++

func _on_alarm_0_timeout():
	if((abs(obj_heart.xprevious - obj_heart.x) > 0.01 or abs(obj_heart.yprevious - obj_heart.y) > 0.01) and GS.invc < 1) {
	    GS.turntimer-= 40
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

func _on_outside_room():
	draw_self_border()

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
