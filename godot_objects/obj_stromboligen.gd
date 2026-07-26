# Auto-converted from GameMaker: obj_stromboligen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	dmg= 0
	rate= GS.firingrate
	spd= 2
	sum= scr_monstersum()
	if(sum > 1) spd= 1.5

func _gm_event_2_2():
	room_restart()

func _on_destroy():
	wall_l= GS.idealborder[0]
	wall_r= GS.idealborder[1]
	wall_d= GS.idealborder[3]
	wall_u= GS.idealborder[2]
	vside= choose(0, 1)
	hside= choose(0, 1)
	peepee= instance_create(x, y, 389/* obj_stromboli */)
	if(is_instance_valid(peepee)) {
	    if(vside == 0) {
	        peepee.y= wall_u - 60
	        peepee.velocity.y= spd
	    }
	    if(vside == 1) {
	        peepee.y= wall_d + 40
	        peepee.velocity.y= -spd
	    }
	    if(hside == 0) {
	        peepee.x= wall_l - 40
	        peepee.velocity.x= spd
	    }
	    if(hside == 1) {
	        peepee.x= wall_r + 40
	        peepee.velocity.x= -spd
	    }
	    if(hside == 1)
	        peepee.x+= random(wall_r - wall_l - 20) - 100
	    if(hside == 0)
	        peepee.x-= random(wall_r - wall_l - 20) - 100
	    peepee.friction= -0.05
	    peepee.dmg= dmg
	}
	$Alarm0.start((rate) / 30.0)

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
