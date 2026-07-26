# Auto-converted from GameMaker: obj_friendlypellet
extends Node2D

func _ready():
	image_speed= 0.5
	attackratio= 0
	direction= instance_number(609) * 30
	speed= 4
	$Alarm0.start((35) / 30.0)
	attackyou= 0
	blonicx= 0
	blonicy= 0

func _on_destroy():
	action_move("000010000", 0)
	blonicx= x
	blonicy= y

func _process(delta: float):
	if(attackyou == 1) {
	    attackratio++
	    move_towards_point(obj_fakeheart.x, obj_fakeheart.y, 0.1 * attackratio * attackratio * attackratio + random(0.5))
	    direction+= random(4) - random(2)
	    z_index= -500
	    attackyou= 2
	    friction= -0.04 * attackratio
	}
	if(attackyou == 3) instance_destroy()

func _on_alarm_0_timeout():
	if(GS.invc < 1) {
	    GS.hp-= 19
	    snd_play(53/* snd_hurt1 */)
	    GS.hshake= 8
	    GS.shakespeed= 1.5
	    GS.vshake= 2
	    instance_create(0, 0, 184/* obj_shaker */)
	    GS.invc= 30
	    obj_floweybattle1.conversation= 10
	    obj_friendlypellet.attackyou= 3
	    if(instance_exists(782/* OBJ_WRITER */)) {
	        // OBJ_WRITER
	        with(782) instance_destroy()
	    }
	    if(instance_exists(187/* obj_blconwdflowey */)) {
	        // obj_blconwdflowey
	        with(187) instance_destroy()
	    }
	}

func _gm_event_7_0():
	if(attackyou != 3) {
	    if(obj_floweybattle1.conversation == 3) obj_floweybattle1.conversation= 5
	    if(obj_floweybattle1.conversation == 8) obj_floweybattle1.conversation= 9
	    if(obj_floweybattle1.conversation == 9.4)
	        obj_floweybattle1.conversation= 9.5
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
