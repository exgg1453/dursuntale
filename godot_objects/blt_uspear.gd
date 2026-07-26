# Auto-converted from GameMaker: blt_uspear
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	speed= 6
	friction= -0.3
	direction= 260 + random(20)
	visible= 1
	dmg= 8

func _on_alarm_0_timeout():
	if(GS.invc < 1) {
	    dmgamt= round(dmg - (GS.df + GS.adef) / 5)
	    dmgamt= 4
	    if(GS.plot > 110 and GS.hp <= 10) dmgamt= 3
	    if(dmgamt < GS.maxhp / 7) dmgamt= floor(GS.maxhp / 7)
	    GS.hp-= dmgamt
	    snd_play(53/* snd_hurt1 */)
	    GS.hshake= 2
	    GS.shakespeed= 2
	    GS.vshake= 2
	    instance_create(0, 0, 184/* obj_shaker */)
	    GS.invc= GS.inv * 2
	    if(GS.battlegroup == 22 and GS.hp < 1)
	        obj_torielboss.sprite_index= 726/* spr_torielboss_mouthcover */
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
