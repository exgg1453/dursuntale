# Auto-converted from GameMaker: obj_quicheguilt
extends Node2D

func _ready():
	qtimer= 0
	$Alarm0.start((60) / 30.0)
	guilt= 0
	check= 0
	nowroom= room

func _on_destroy():
	$Alarm0.start((2) / 30.0)
	if(GS.inbattle == 0 and nowroom != room and GS.interact == 0 and GS.flag[17] == 0 and instance_exists(1570/* obj_mainchara */)) {
	    qtimer++
	    if(qtimer > 90) {
	        guilt= 1
	        $Alarm0.start((-1) / 30.0)
	    }
	}

func _process(delta: float):
	if(GS.inbattle == 0) {
	    if(guilt == 1 and GS.interact == 0 and GS.flag[17] == 0 and instance_exists(1570/* obj_mainchara */))
	        check++
	    else  check= 0
	    if(check >= 80 and guilt == 1) {
	        GS.msg[0]= "* Somewhere^1, a quiche\'s worst&  fear becomes reality./%%"
	        scr_regulartext()
	        guilt= 2
	        GS.interact= 1
	    }
	    if(guilt == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	        GS.interact= 0
	        instance_destroy()
	    }
	    if(guilt == 6 and GS.interact == 0) {
	        GS.msg[0]= "* A quiche in another timeline./%%"
	        scr_regulartext()
	        guilt= 2
	        GS.interact= 1
	    }
	}

func _on_outside_room():
	if(GS.debug == 1) {
	    draw_set_color(16754964)
	    draw_text(obj_mainchara.x, obj_mainchara.y - 10, check)
	    draw_text(obj_mainchara.x, obj_mainchara.y - 20, qtimer)
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
