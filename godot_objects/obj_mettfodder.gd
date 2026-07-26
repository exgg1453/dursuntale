# Auto-converted from GameMaker: obj_mettfodder
# GM parent: obj_metttestbulletparent
extends Node2D

func _ready():
	image_speed= 0
	flasher= 0
	flash= 0
	velocity.y= 4
	type= 0
	early= 20

func _gm_event_2_4():
	flash++

func _process(delta: float):
	if(y > GS.idealborder[2] - early - 15 and flash == 0) {
	    flash= 1
	    $Alarm4.start((20) / 30.0)
	}
	if(flash == 1 and early <= 20 and velocity.y > 1.5)
	    velocity.y-= 0.15
	if(early > 20 and y > GS.idealborder[2] - 20 - 15 and velocity.y > 1.5)
	    velocity.y-= 0.15
	if(flash == 2) {
	    flash= 3
	    $Alarm4.start((30) / 30.0)
	}
	if(flash == 3 and alarm[4] < 26) image_speed= 0.5
	if(flash == 4) {
	    lt= instance_create(x + 10, y + 10, 434/* obj_kissybullet_pl */)
	    lt.speed= 5
	    lt.direction= point_direction(lt.x, lt.y, obj_heart.x + 10, obj_heart.y + 10)
	    flash= 5
	}
	if(flash == 5) {
	    flash= 1
	    $Alarm4.start((30) / 30.0)
	    if(type == 2) {
	        flash= 9
	        if(x < get_viewport_rect().size.x / 2) {
	            gravity_direction= 180
	            gravity= 0.5
	            friction= 0.2
	        }
	        if(x > get_viewport_rect().size.x / 2) {
	            gravity_direction= 0
	            gravity= 0.5
	            friction= 0.2
	        }
	    }
	}
	if(y > get_viewport_rect().size.y) instance_destroy()
	if(collision_rectangle(x + 2, y + 2, x + 22, y + 22, 739, 0, 1)) {
	    g= collision_rectangle(x + 2, y + 2, x + 22, y + 22, 739, 0, 1)
	    with(g) instance_destroy()
	    snd_play(128/* snd_mtt_burst */)
	    if(instance_exists(402/* obj_ratingsmaster */))
	        GS.ratings+= 20
	    bp= instance_create(x - 20, y - 23, 425/* obj_brokenpiece */)
	    bp.sprite_index= sprite_index
	    bp.frame= frame
	    bp.z_index= z_index + 1
	    instance_destroy()
	}
	if(frame > 16 and image_speed > 0) {
	    frame= 0
	    image_speed= 0
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
