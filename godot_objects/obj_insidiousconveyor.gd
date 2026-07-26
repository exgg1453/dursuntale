# Auto-converted from GameMaker: obj_insidiousconveyor
extends Node2D

func _ready():
	active= 1
	collide= 0
	if(GS.plot > 167) {
	    active= 0
	    collide= -1
	}
	ss= 0

func _process(delta: float):
	if(active == 1) {
	    if(collide == 1) {
	        GS.interact= 1
	        collide= 2
	        timer= 0
	        obj_mainchara.phasing= 1
	    }
	    if(collide == 2) {
	        if(obj_mainchara.x < 340) obj_mainchara.x++
	        if(obj_mainchara.y < 104.5) obj_mainchara.y++
	        if(obj_mainchara.y > 105.5) obj_mainchara.y--
	        timer++
	        if(obj_mainchara.x >= 339) {
	            obj_mainchara.x= 340
	            obj_mainchara.y= 105
	            tileguy= instance_create(obj_mainchara.x, obj_mainchara.y, 1212/* obj_tileguy */)
	            obj_mainchara.visible= 0
	            collide= 3
	        }
	    }
	    if(GS.plot > 167) active= 0
	}

func _on_alarm_0_timeout():
	if(collide == 0 and GS.interact == 0 and active == 1) {
	    GS.interact= 1
	    collide= 1
	}

func _on_outside_room():
	if(active == 1) ss++
	i= 0
	while(i < 7) {
	    draw_sprite(1828/* spr_conveyorbelt_r */, ss / 4, x + 20 * i, y)
	    i++
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
