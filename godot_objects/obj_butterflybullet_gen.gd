# Auto-converted from GameMaker: obj_butterflybullet_gen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	$Alarm0.start((1) / 30.0)
	dmg= 0
	green= 0

func _on_destroy():
	if(green == 1) j= floor(random(16))
	i= 0
	while(i < 18) {
	    if(green == 1)
	        blt= instance_create(GS.idealborder[0] + c_borderwidth(0) / 2, -20 + GS.idealborder[2] + c_borderheight(0) / 2, 399/* obj_butterflybullet */)
	    if(green == 0)
	        blt= instance_create(GS.idealborder[0] + c_borderwidth(0) / 2, GS.idealborder[2] + c_borderheight(0) / 2, 399/* obj_butterflybullet */)
	    if(is_instance_valid(blt)) {
	        blt.frame= i * 0.2
	        blt.siner= i * 20
	        blt.dmg= dmg
	    }
	    if(green == 1 and (i == j or i == j + 1)) {
	        blt.green= 1
	        if(is_instance_valid(blt)) blt.sprite_index= 484/* spr_butterflybullet_green */
	    }
	    i++
	}
	if(green == 1) {
	    obj_butterflybullet.s2factor= 0
	    obj_butterflybullet.sineradd= 6
	    sum= scr_monstersum()
	    if(sum > 1) obj_butterflybullet.sineradd= 4
	    if(sum > 2) {
	        obj_butterflybullet.sineradd= 3
	        obj_butterflybullet.sinerfactor+= 2
	    }
	}
	if(green == 0) {
	    obj_butterflybullet.sinerfactor+= 8
	    sum= scr_monstersum()
	    if(instance_exists(380/* obj_megaflybulletgen */) and sum < 3) {
	        obj_butterflybullet.y+= 15
	        obj_butterflybullet.sinerfactor-= 8
	    }
	    if(sum > 2)
	        obj_butterflybullet.sinerfactor+= 8
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
