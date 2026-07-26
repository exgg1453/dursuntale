# Auto-converted from GameMaker: obj_ropebul
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	type= 0
	$Alarm0.start((1) / 30.0)
	go= 0
	velocity.x= -4
	arb= GS.idealborder[2] - 50
	arb2= GS.idealborder[2] - sprite_height + 10

func _on_destroy():
	visible= 1
	if(type == 0) {
	    y= arb2 + 1 + random(arb - arb2 - 2)
	    velocity.y= 1 + random(2)
	    velocity.y*= choose(1, -1)
	    rope= instance_create(x, y + 170, 339/* obj_ropebul */)
	    if(is_instance_valid(rope)) {
	        rope.dmg= dmg
	        rope.type= 1
	        rope.velocity.y= velocity.y
	    }
	    go= 1
	    i= 0
	    while(i < 3) {
	        fire= instance_create(x, y + 120 + i * 14, 338/* obj_orangefire */)
	        if(is_instance_valid(fire)) {
	            fire.parent= id
	            fire.dmg= dmg
	            with(fire) event_user(0)
	        }
	        i++
	    }
	}

func _process(delta: float):
	if(type == 0 and go == 1 and (y > arb or y < arb2)) {
	    y= yprevious
	    velocity.y= -velocity.y
	    with(rope) {
	        y= yprevious
	        velocity.y= -velocity.y
	    }
	}
	if(x < GS.idealborder[0] - 20) instance_destroy()

func _on_outside_room():
	draw_self_border_e()

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
