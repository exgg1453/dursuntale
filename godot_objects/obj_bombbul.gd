# Auto-converted from GameMaker: obj_bombbul
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	type= choose(0, 1, 2, 3)
	if(type == 0 or type == 2) {
	    velocity.x= 2 + random(3)
	    velocity.x*= choose(-1, 1)
	    if(type == 0) {
	        gravity_direction= 270
	        y= GS.idealborder[2] - 20
	    }
	    if(type == 2) {
	        rotation_degrees= 180
	        gravity_direction= 90
	        y= GS.idealborder[3] + 20
	    }
	}
	if(type == 1 or type == 3) {
	    y= (GS.idealborder[2] + GS.idealborder[3]) / 2 + 50 - random(100)
	    velocity.y= 2 + random(4)
	    velocity.y*= choose(-1, 1)
	    if(type == 1) {
	        rotation_degrees= 90
	        gravity_direction= 0
	        x= GS.idealborder[0] - 20
	    }
	    if(type == 3) {
	        rotation_degrees= 270
	        gravity_direction= 180
	        x= GS.idealborder[1] + 20
	    }
	}
	gravity= 0.18
	friction= 0.03
	bounce= 0
	on= 0
	flash= 0
	expl= 0
	image_speed= 0

func _on_destroy():
	b= instance_create(x, y, 344/* obj_blastbul */)
	b.dmg= dmg
	instance_destroy()

func _process(delta: float):
	if(type == 0 and y > GS.idealborder[3] - 10) {
	    if(bounce == 1) {
	        on= 1
	        gravity= 0
	        velocity.y= 0
	    }
	    if(bounce == 0) {
	        y-= velocity.y
	        velocity.y= -1.5
	        bounce= 1
	    }
	}
	if(type == 1 and x > GS.idealborder[1] - 10) {
	    if(bounce == 1) {
	        on= 1
	        gravity= 0
	        velocity.x= 0
	    }
	    if(bounce == 0) {
	        x-= velocity.x
	        velocity.x= -1.5
	        bounce= 1
	    }
	}
	if(type == 2 and y < GS.idealborder[2] + 10) {
	    if(bounce == 1) {
	        on= 1
	        gravity= 0
	        velocity.y= 0
	    }
	    if(bounce == 0) {
	        y-= velocity.y
	        velocity.y= 1.5
	        bounce= 1
	    }
	}
	if(type == 3 and x < GS.idealborder[0] + 10) {
	    if(bounce == 1) {
	        on= 1
	        gravity= 0
	        velocity.x= 0
	    }
	    if(bounce == 0) {
	        x-= velocity.x
	        velocity.x= 1.5
	        bounce= 1
	    }
	}
	if((type == 0 or type == 2) and (x > GS.idealborder[1] - 15 or x < GS.idealborder[0] + 15)) {
	    x= xprevious
	    velocity.x= -velocity.x
	}
	if((type == 1 or type == 3) and (y > GS.idealborder[3] - 15 or y < GS.idealborder[2] + 15)) {
	    y= yprevious
	    velocity.y= -velocity.y
	}
	if(bounce == 1) {
	    flash++
	    if(flash > 14) {
	        flash= 14
	        if(expl == 0) {
	            $Alarm0.start((15) / 30.0)
	            expl= 1
	        }
	    }
	    image_speed= 1 / (3 - flash / 10)
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
