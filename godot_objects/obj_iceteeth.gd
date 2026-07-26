# Auto-converted from GameMaker: obj_iceteeth
# GM parent: blt_bluespear
extends Node2D

func _ready():
	pop= scr_monstersum()
	if(instance_exists(217/* obj_jerry */) and obj_jerry.ditch == 0)
	    pop--
	y= y - 120 + random(40)
	velocity.y= 4.2
	friction= 0.1
	dmg= 0
	tootvelocity.x= -0.1
	toothdist= 265
	if(pop == 2) {
	    y-= 25
	    toothdist+= 50
	}
	if(pop == 3) {
	    y-= 35
	    toothdist+= 70
	}
	seed= random(40)
	i= 0
	while(GS.idealborder[0] + i * 5 < GS.idealborder[1]) {
	    toothxx[i]= GS.idealborder[0] + i * 5
	    maxi= i
	    i++
	}
	factor= 12.5663706143592 / maxi
	i= 0
	while(GS.idealborder[0] + i * 5 < GS.idealborder[1]) {
	    toothyy[i]= y + sin(seed + i * factor) * 30
	    i++
	}

func _gm_event_7_11():
	if(GS.invc < 1) {
	    dmgamt= round(dmg - (GS.df + GS.adef) / 5)
	    if(dmgamt < 1) dmgamt= 1
	    GS.hp-= dmgamt
	    snd_play(53/* snd_hurt1 */)
	    GS.hshake= 2
	    GS.shakespeed= 2
	    GS.vshake= 2
	    instance_create(0, 0, 184/* obj_shaker */)
	    GS.invc= GS.inv * 2
	}

func _on_outside_room():
	draw_set_color(16777215)
	i= 0
	while(GS.idealborder[0] + i * 5 < GS.idealborder[1]) {
	    toothyy[i]= y + sin(seed + i * factor) * 30
	    toothxx[i]+= tootvelocity.x
	    if(toothxx[i] > GS.idealborder[1])
	        toothxx[i]= GS.idealborder[0]
	    if(toothxx[i] < GS.idealborder[0])
	        toothxx[i]= GS.idealborder[0]
	    if(toothyy[i] > GS.idealborder[2])
	        draw_line(toothxx[i], GS.idealborder[2], toothxx[i], toothyy[i])
	    if(toothyy[i] + toothdist < GS.idealborder[3])
	        draw_line(toothxx[i], GS.idealborder[3], toothxx[i], toothyy[i] + toothdist)
	    if(collision_line(toothxx[i], GS.idealborder[2], toothxx[i], toothyy[i] - 3, 743, 0, 1))
	        event_user(1)
	    if(collision_line(toothxx[i], GS.idealborder[3], toothxx[i], toothyy[i] + toothdist + 3, 743, 0, 1))
	        event_user(1)
	    i++
	}
	toothdist-= velocity.y * 2.15
	if(tootvelocity.x < 2.4) tootvelocity.x+= 0.08

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
