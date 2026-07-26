# Auto-converted from GameMaker: obj_hoopgen1
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	firingspeed= GS.firingrate
	bullettype= 0
	$Alarm0.start(1 / 30.0)

func _gm_event_2_2():
	iii= instance_create(x, y, 616/* blt_hoopbullet1 */)
	if(is_instance_valid(iii)) {
	    iii.dmg= GS.monsteratk[myself]
	    iii.bullettype= 2
	}

func _gm_event_2_1():
	iii= instance_create(x, y, 616/* blt_hoopbullet1 */)
	if(is_instance_valid(iii)) {
	    iii.dmg= GS.monsteratk[myself]
	    iii.bullettype= 1
	}

func _on_destroy():
	r= round(random(1)) + 2
	script_execute(125/* SCR_BORDER */, r, 2)
	x= xx
	y= yy
	if(bullettype == 0) {
	    iii= instance_create(x, y, 616/* blt_hoopbullet1 */)
	    if(is_instance_valid(iii)) {
	        iii.dmg= GS.monsteratk[myself]
	        iii.bullettype= 0
	    }
	} else  {
	    r= round(random(3))
	    script_execute(125/* SCR_BORDER */, r, 8)
	    iii= instance_create(x, y, 620/* blt_hoopbullet2 */)
	    if(is_instance_valid(iii))
	        iii.dmg= GS.monsteratk[myself]
	}
	$Alarm0.start((firingspeed) / 30.0)

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
