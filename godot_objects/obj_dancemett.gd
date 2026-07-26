# Auto-converted from GameMaker: obj_dancemett
extends Node2D

func _ready():
	image_speed= 0
	flasher= 0
	flash= 0
	velocity.y= 3
	siner= 0
	timer= 0

func _gm_event_2_4():
	flash++

func _process(delta: float):
	if(y > GS.idealborder[2] - 80 and flash == 0) {
	    sprite_index= 525/* spr_tinydancemett_tell */
	    flash= 1
	}
	if(flash == 1) {
	    timer+= velocity.y
	    image_speed= timer / 60
	    if(timer > 60) flash= 2
	}
	if(flash == 2) {
	    frame= 0
	    sprite_index= 524/* spr_tinydancemett */
	    flash= 3
	    image_speed= 0.5
	}
	if(flash == 3 and frame == 2) flash= 4
	if(flash == 4) {
	    i= 0
	    repeat(2)  {
	        lt= instance_create(x + 10, y + 10, 434/* obj_kissybullet_pl */)
	        lt.speed= 1
	        lt.sprite_index= 523/* spr_tinysparkle */
	        lt.direction= i * 180
	        lt.velocity.y= -1
	        lt.gravity= 0.1 + random(0.05)
	        lt.velocity.x+= velocity.x + random(0.5) - 0.25
	        i++
	    }
	    flash= 5
	}
	if(flash == 5 and frame == 6) flash= 6
	if(flash == 6) {
	    repeat(1)  {
	        lt= instance_create(x + 10, y + 10, 434/* obj_kissybullet_pl */)
	        lt.speed= 2
	        lt.sprite_index= 523/* spr_tinysparkle */
	        lt.direction= i * 180 + 90
	        lt.velocity.y= -1.5 + random(0.5) - 0.25
	        lt.gravity= 0.1 + random(0.05)
	        lt.velocity.x+= velocity.x + random(0.5) - 0.25
	        i++
	    }
	    flash= 9
	}
	if(flash == 9) {
	    flash= 10
	    $Alarm4.start((40) / 30.0)
	}
	if(y > get_viewport_rect().size.y) instance_destroy()
	if(collision_rectangle(x + 2, y + 2, x + 22, y + 22, 739, 0, 1)) {
	    g= collision_rectangle(x + 2, y + 2, x + 22, y + 22, 739, 0, 1)
	    with(g) instance_destroy()
	    bp= instance_create(x - 15, y - 6, 425/* obj_brokenpiece */)
	    bp.sprite_index= sprite_index
	    bp.frame= frame
	    bp.z_index= z_index + 1
	    instance_destroy()
	}
	siner++
	x= xstart + sin(siner / 6) * 10

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
