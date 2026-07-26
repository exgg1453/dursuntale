# Auto-converted from GameMaker: obj_4sidegen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	firingspeed= GS.firingrate
	bullettype= 0
	$Alarm0.start(1 / 30.0)

func _on_destroy():
	script_execute(126/* SCR_BORDER_X */, floor(random(4)), 0, 0)
	x= xx
	y= yy
	if(bullettype == 0) {
	    script_execute(126/* SCR_BORDER_X */, floor(random(4)), 14, 50)
	    x= xx
	    y= yy
	    iii= instance_create(x, y, 646/* blt_clawbullet_white */)
	    if(is_instance_valid(iii)) {
	        iii.dmg= GS.monsteratk[myself]
	        with(iii) parent= 1
	    }
	}
	if(bullettype == 1) {
	    script_execute(127/* SCR_BORDER_X_X */, floor(random(4)), 14, 0)
	    x= xx
	    y= yy
	    iii= instance_create(x, y, 647/* blt_4sidebullet */)
	    if(is_instance_valid(iii)) {
	        iii.dmg= GS.monsteratk[myself]
	        with(iii) parent= 1
	    }
	}
	$Alarm0.start((firingspeed) / 30.0)

func _process_end(delta: float):
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    GS.mnfight= 3
	    if(instance_exists(272/* obj_undyneboss */)) GS.mnfight= 4
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
