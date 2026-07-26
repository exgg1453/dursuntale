# Auto-converted from GameMaker: obj_carrotstargen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	pop= scr_monstersum()
	if(pop > 1) mode= 1
	else  mode= 0
	side= 0
	oldside= 0
	dmg= 9
	shake= 0
	rate= GS.firingrate

func _gm_event_2_1():
	side= floor(random(3))
	if(side == oldside) side++
	if(side >= 3) side= 0
	oldside= side
	cshot= instance_create(276 + side * 30, GS.idealborder[2], 698/* obj_stardrop */)
	cshot.dmg= dmg
	if(shake == 1) {
	    cshot.shake= 1
	    cshot.$Alarm0.start((2) / 30.0)
	}
	$Alarm1.start((rate / 2) / 30.0)
	if(mode == 1) {
	    cshot2= instance_create(336 - side * 30, GS.idealborder[3], 698/* obj_stardrop */)
	    cshot2.gravity= -cshot.gravity
	    cshot2.velocity.x= -cshot.velocity.x
	    cshot2.dmg= dmg
	    $Alarm1.start((rate) / 30.0)
	}

func _on_destroy():
	cshot= instance_create(305, GS.idealborder[2], 697/* obj_carrotshot */)
	if(is_instance_valid(cshot)) {
	    cshot.dmg= dmg
	    if(shake == 1) {
	        cshot.shake= 1
	        cshot.$Alarm0.start((2) / 30.0)
	    }
	    $Alarm0.start((rate / 3) / 30.0)
	    if(mode == 1) {
	        cshot2= instance_create(305, GS.idealborder[3], 697/* obj_carrotshot */)
	        if(is_instance_valid(cshot2)) {
	            cshot2.gravity= -cshot.gravity
	            cshot2.velocity.x= -cshot.velocity.x
	            cshot2.dmg= dmg
	        }
	        $Alarm0.start((rate) / 30.0)
	    }
	}

func _process(delta: float):
	if(x > xstart - 40 and Input.is_action_pressed("move_left"))
	    x-= 4
	if(x < xstart + 40 and Input.is_action_pressed("move_right"))
	    x+= 4
	if(Input.is_action_pressed("move_up")) y-= 4
	if(Input.is_action_pressed("move_down")) y+= 4
	if(GS.mnfight != 2) instance_destroy()

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
