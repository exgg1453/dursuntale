# Auto-converted from GameMaker: obj_astigmatism_bullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	siner= 0
	asiner= random(300)
	kid= instance_create(x, y, 392/* obj_sonbullet */)
	kid.x= x + sin(asiner / 16) * 14
	kid.y= y + cos(asiner / 16) * 14
	kid2= instance_create(x, y, 392/* obj_sonbullet */)
	kid2.sprite_index= 481/* spr_circlebulletsm_ex */
	kid2.x= x + sin(asiner / 16) * 28
	kid2.y= y + cos(asiner / 16) * 28
	velocity.y= -1 + random(2)
	if(y > GS.idealborder[3] - 50 and velocity.y > 0) {
	    velocity.y*= -1
	    if(abs(velocity.y) < 0.3) velocity.y*= 2
	}
	if(y < GS.idealborder[2] + 50 and velocity.y < 0) {
	    velocity.y*= -1
	    if(abs(velocity.y) < 0.3) velocity.y*= 2
	}
	velocity.x= -3 - random(1)
	av= (0.7 + random(0.5)) * choose(1, -1)
	modulate.a= 0
	off= 0
	dmg= 8
	modulate.a= 0
	sum= scr_monstersum()
	factor1= 22
	factor2= 40
	if(sum > 1) {
	    factor1= 18
	    factor2= 36
	    av= (0.7 + random(0.5)) * choose(1, -1)
	}
	if(sum > 2) {
	    velocity.x= -2.5 - random(1)
	    factor1= 16
	    factor2= 32
	    av= (0.6 + random(0.5)) * choose(1, -1)
	}

func _gm_event_1_0():
	with(kid) instance_destroy()
	with(kid2) instance_destroy()

func _process(delta: float):
	siner++
	y+= cos(siner / 3) * 0.6
	asiner+= av
	if(is_instance_valid(kid)) {
	    kid.x= -2 + x + sin(asiner / 16) * factor1
	    kid.y= y + cos(asiner / 16) * factor1
	}
	if(is_instance_valid(kid2)) {
	    kid2.x= x + sin(asiner / 16) * factor2
	    kid2.y= y + cos(asiner / 16) * factor2
	}
	if(x < 0) instance_destroy()
	if(modulate.a < 1 and off == 0)
	    modulate.a+= 0.1
	if(x < GS.idealborder[0] - 30) off= 1
	if(off == 1) modulate.a-= 0.05
	if(modulate.a < 0.1 and off == 1) instance_destroy()

func _on_alarm_0_timeout():
	if(modulate.a >= 1) scr_damagestandard(0, 3, 0, 0, 0)

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
