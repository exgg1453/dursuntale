# Auto-converted from GameMaker: obj_toroverworld6
# GM parent: obj_toroverworld1
extends Node2D

func _ready():
	scr_depth(0, 0, 0, 0, 0)
	t= 0
	image_speed= 0
	dsprite= 1103
	usprite= 1112
	lsprite= 1108
	rsprite= 1107
	dtsprite= 1105
	utsprite= 1111
	ltsprite= 1110
	rtsprite= 1109
	myinteract= 0
	facing= 0
	conversation= 0
	direction= 0
	path_start(13/* path_torielwalk5 */, 0, 0, 1/* path_action_restart */)

func _gm_event_2_5():
	if(obj_mainchara.y < x - 40) {
	    path_speed= 0
	    direction= 180
	    image_speed= 0
	    frame= 0
	    t= 0
	}

func _process(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(obj_mainchara.x < x - 40) {
	    if(t == 0) {
	        $Alarm5.start((30) / 30.0)
	        t= 1
	    }
	} else  {
	    $Alarm5.start((24) / 30.0)
	    path_speed= 2
	    if(obj_mainchara.x > x - 25) path_speed= 3
	    if(obj_mainchara.x > x - 10) path_speed= 5
	    image_speed= 0.2
	}
	scr_npcdir(0)
	if(path_position == 1) {
	    instance_create(x, y, 873/* obj_torinteractable5 */)
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	GS.plot= 2
	instance_destroy()

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
