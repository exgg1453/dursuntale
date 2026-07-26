# Auto-converted from GameMaker: obj_cfiregen
extends Node2D

func _ready():
	$Alarm0.start((10) / 30.0)
	diff= 0

func _on_destroy():
	choseang= random(360)
	if(diff == 0) {
	    choseangspeed= 0
	    i= 0
	    repeat(36)  {
	        cc= instance_create(0, 0, 473/* obj_cfire */)
	        cc.ang= choseang + i * 8
	        cc.rspeed= 4
	        cc.r= 300
	        cc.angspeed= choseangspeed
	        i++
	    }
	    $Alarm0.start((35) / 30.0)
	}
	if(diff == 1) {
	    choseangspeed= -2 + random(4)
	    i= 0
	    repeat(36)  {
	        cc= instance_create(0, 0, 473/* obj_cfire */)
	        cc.ang= choseang + i * 8
	        cc.rspeed= 6
	        cc.r= 300
	        cc.angspeed= choseangspeed
	        i++
	    }
	    $Alarm0.start((30) / 30.0)
	}
	if(diff == 2) {
	    choseangspeed= -4 + random(8)
	    i= 0
	    repeat(36)  {
	        cc= instance_create(0, 0, 473/* obj_cfire */)
	        cc.ang= choseang + i * 8
	        cc.rspeed= 4
	        cc.r= 300
	        cc.angspeed= choseangspeed
	        i++
	    }
	    $Alarm0.start((30) / 30.0)
	}
	if(diff == 3) {
	    choseangspeed= -6 + random(12)
	    i= 0
	    repeat(33)  {
	        cc= instance_create(0, 0, 473/* obj_cfire */)
	        cc.ang= choseang + i * 8
	        cc.rspeed= 6
	        cc.r= 300
	        cc.angspeed= choseangspeed
	        i++
	    }
	    $Alarm0.start((25) / 30.0)
	}

func _process_end(delta: float):
	if(GS.turntimer < 0) instance_destroy()

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
