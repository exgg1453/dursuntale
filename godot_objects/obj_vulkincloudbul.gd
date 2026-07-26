# Auto-converted from GameMaker: obj_vulkincloudbul
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	firetime= 0
	$Alarm0.start((2) / 30.0)
	firing= 2
	dmg= 1
	siner= 0
	mysp= GS.sp
	rate= GS.firingrate

func _gm_event_2_1():
	speed= 0
	towarddir= point_direction(x + 30, y + 30, obj_heart.x + 10, obj_heart.y + 10)
	initdir= floor(random(30))
	i= 0
	while(i < 7) {
	    blt= instance_create(x + 30, y + 30, 330/* obj_vulkinlightning */)
	    if(is_instance_valid(blt))
	        blt.direction= towarddir - 110 + initdir + i * 30
	    i++
	}
	firetime++
	if(firetime < 5) $Alarm1.start((rate) / 30.0)
	else  {
	    direction= towarddir - 110 - random(50)
	    speed= 2
	}

func _on_destroy():
	firing++
	$Alarm0.start((15) / 30.0)
	if(firing > 3) {
	    firing= 0
	    firetime= 0
	    $Alarm1.start((2) / 30.0)
	}

func _process_end(delta: float):
	if(x < obj_lborder.x + 4) {
	    x+= 4
	    velocity.x= 0
	}
	if(y < obj_uborder.y + 4) {
	    y+= 4
	    velocity.y= 0
	}
	if(x > obj_rborder.x - 4) {
	    x-= 4
	    velocity.x= 0
	}
	if(y > obj_dborder.y - 4) {
	    y-= 4
	    velocity.y= 0
	}
	if(GS.turntimer < 1) {
	    GS.sp= mysp
	    GS.turntimer= -1
	    GS.mnfight= 3
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	scr_damagestandard_x()

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
