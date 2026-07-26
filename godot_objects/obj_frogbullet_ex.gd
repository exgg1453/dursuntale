# Auto-converted from GameMaker: obj_frogbullet_ex
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	$Alarm0.start((20) / 30.0)
	rotation_degrees= 0
	active= 0
	side= 0
	lazy= 0

func _on_destroy():
	if(active == 0) {
	    if(side == 0) {
	        move_towards_point(obj_heart.x + 36, obj_heart.y, 6)
	        gravity= 0.16
	        gravity_direction= 180
	    }
	    if(side == 1) {
	        move_towards_point(obj_heart.x + 15, obj_heart.y + 36, 6)
	        gravity= 0.16
	        gravity_direction= 90
	    }
	    if(side == 2) {
	        move_towards_point(obj_heart.x - 26, obj_heart.y + 10, 6)
	        gravity= 0.16
	        gravity_direction= 0
	    }
	    if(side == 3) {
	        move_towards_point(obj_heart.x, obj_heart.y - 26, 6)
	        gravity= 0.16
	        gravity_direction= 270
	    }
	    sprite_index= 474/* spr_frogbullet_go */
	}
	active= 1

func _process(delta: float):
	if(active == 1) {
	    if(x < GS.idealborder[0] + 15) {
	        active= 0
	        side= 1
	        x= GS.idealborder[0] + 20
	        gravity= 0
	        speed= 0
	        sprite_index= 473/* spr_frogbullet_stop */
	        rotation_degrees= -90
	        $Alarm0.start((8) / 30.0)
	        if(lazy == 1) $Alarm0.start((20) / 30.0)
	    }
	    if(y < GS.idealborder[2] + 15) {
	        active= 0
	        side= 2
	        y= GS.idealborder[2] + 20
	        gravity= 0
	        speed= 0
	        sprite_index= 473/* spr_frogbullet_stop */
	        rotation_degrees= 180
	        $Alarm0.start((8) / 30.0)
	        if(lazy == 1) $Alarm0.start((20) / 30.0)
	    }
	    if(x > GS.idealborder[1] - 15) {
	        active= 0
	        side= 3
	        x= GS.idealborder[1] - 20
	        gravity= 0
	        speed= 0
	        sprite_index= 473/* spr_frogbullet_stop */
	        rotation_degrees= 90
	        $Alarm0.start((8) / 30.0)
	        if(lazy == 1) $Alarm0.start((20) / 30.0)
	    }
	    if(y > GS.idealborder[3] - 15) {
	        active= 0
	        side= 0
	        y= GS.idealborder[3] - 20
	        gravity= 0
	        speed= 0
	        sprite_index= 473/* spr_frogbullet_stop */
	        rotation_degrees= 0
	        $Alarm0.start((8) / 30.0)
	        if(lazy == 1) $Alarm0.start((20) / 30.0)
	    }
	}

func _on_alarm_0_timeout():
	scr_damagestandard(0, 3, 0, 0, 0)

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
