# Auto-converted from GameMaker: blt_dogspear
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	dmg= 7
	bb= 1
	blut= round(random(35))
	blue= 0
	image_speed= 0
	frame= 0
	x= GS.idealborder[1] - 16
	y= GS.idealborder[3] + 4
	velocity.y= -4
	stage= 0

func _process(delta: float):
	blut++
	if(blut > 21) {
	    frame= 1
	    blue= 1
	}
	if(blut > 42) {
	    blut= 0
	    blue= 0
	    frame= 0
	}
	if(stage == 0 and y < GS.idealborder[2]) {
	    stage= 1
	    y= GS.idealborder[2]
	    velocity.y= 0
	    velocity.x= -4
	}

func _on_alarm_0_timeout():
	bb= 1
	if(blue == 1) {
	    if(obj_heart.xprevious != obj_heart.x or obj_heart.yprevious != obj_heart.y)
	        bb= 1
	    else  {
	        bb= 0
	        blut= 2
	    }
	}
	if(GS.invc < 1 and bb == 1) {
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
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
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
