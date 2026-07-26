# Auto-converted from GameMaker: obj_frogbullet_gen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	dmg= 1
	sum= scr_monstersum()
	$Alarm0.start((1) / 30.0)
	fr1= instance_create(GS.idealborder[0] + c_borderwidth(0) / 2, GS.idealborder[3] - 20, 383/* obj_frogbullet_ex */)
	fr1.side= 0
	fr1.rotation_degrees= 0
	fr1.lazy= 0
	if(sum == 4) {
	    no2= choose(1, 2, 3)
	    fr2= instance_create(GS.idealborder[0] + c_borderwidth(0) / 2, GS.idealborder[2] + 20, 383/* obj_frogbullet_ex */)
	    fr2.side= no2
	    fr2.rotation_degrees= no2 * -90
	    if(no2 == 2) {
	        fr2.x= GS.idealborder[0] + c_borderwidth(0) / 2
	        fr2.y= GS.idealborder[2] + 20
	    }
	    if(no2 == 1) {
	        fr2.x= GS.idealborder[0] + 20
	        fr2.y= GS.idealborder[2] + c_borderheight(0) / 2
	    }
	    if(no2 == 3) {
	        fr2.x= GS.idealborder[1] - 20
	        fr2.y= GS.idealborder[2] + c_borderheight(0) / 2
	    }
	    if(no2 == 3) no3= choose(1, 2)
	    if(no2 == 1) no3= choose(2, 3)
	    if(no2 == 2) no3= choose(1, 3)
	    if(no2 == 99) {
	        if(no2 != 1) no3= 1
	        fr3= instance_create(320, 270, 383/* obj_frogbullet_ex */)
	        fr3.side= no3
	        fr3.rotation_degrees= no3 * -90
	        if(no3 == 2) {
	            fr3.x= 300
	            fr3.y= 270
	        }
	        if(no3 == 1) {
	            fr3.x= 270
	            fr3.y= 320
	        }
	        if(no3 == 3) {
	            fr3.x= 380
	            fr3.y= 320
	        }
	    }
	}

func _on_destroy():
	obj_frogbullet_ex.dmg= dmg

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
