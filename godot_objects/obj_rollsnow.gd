# Auto-converted from GameMaker: obj_rollsnow
extends Node2D

func _ready():
	size= 2
	angle= 0
	friction= 0.1
	bonk= 0
	falling= 0
	specialy= 0
	golf= 0
	t= 0
	shrinko= 30
	rolltime= 0
	timeincrease= 0
	murder= 0
	if(GS.flag[203] >= 16) murder= 1
	if(murder == 1) instance_destroy()

func _process(delta: float):
	if(falling == 0)
	    z_index= 50000 - y * 10 + sprite_height * 4
	if(instance_exists(1570/* obj_mainchara */)) {
	    if(velocity.y > 0.1) z_index= obj_mainchara.z_index - 1
	    if(velocity.y < -0.1) z_index= obj_mainchara.z_index + 1
	}
	if(falling > 0) z_index= 1000
	xchange= abs(velocity.x)
	ychange= abs(velocity.y)
	tchange= xchange + ychange
	angle+= tchange * 30 / size * 10
	scale.x= size
	scale.y= size
	if(falling == 1) {
	    friction= -0.1
	    velocity.y= 3
	    falling= 2
	}
	if(falling == 2 and y > specialy) {
	    y= specialy
	    friction= 0.1
	    velocity.y= 0
	    falling= 0
	}
	if(t == 1 or t == 2) {
	    if(velocity.x == 0 and velocity.y == 0) t= 1
	    else  t= 2
	}
	golf= 0
	if(t == 1) {
	    if(shrinko > 0) shrinko--
	    else  size-= 0.01
	}
	if(size < 0.2) {
	    instance_destroy()
	    // obj_rollsnowgen
	    with(1014) $Alarm0.start((10) / 30.0)
	}
	if(timeincrease == 1) rolltime++
	if(falling == 5 and size >= 0.2) {
	    size-= 0.05
	    z_index= 900000
	}

func _on_alarm_0_timeout():
	if(golf == 0 and falling == 0) {
	    y= yprevious
	    x= xprevious
	    if(speed <= 0.06) speed= 0
	    else  speed-= 0.05
	    if(other.bbox_right < bbox_left) {
	        x+= 2
	        velocity.x= -velocity.x
	    }
	    if(other.bbox_left > bbox_right) {
	        x-= 2
	        velocity.x= -velocity.x
	    }
	    if(other.bbox_top > bbox_bottom) {
	        y-= 2
	        velocity.y= -velocity.y
	    }
	    if(other.bbox_bottom < bbox_top) {
	        y+= 2
	        velocity.y= -velocity.y
	    }
	    golf= 1
	}

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, size, size, angle, 16777215, 1)

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
