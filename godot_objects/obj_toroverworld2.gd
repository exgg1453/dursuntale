# Auto-converted from GameMaker: obj_toroverworld2
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
	facing= 3
	conversation= 0
	direction= 270
	path_start(5/* path_torielwalk1 */, 0, 0, 1/* path_action_restart */)
	if(GS.plot > 1) instance_destroy()

func _gm_event_2_5():
	if(obj_mainchara.y > y + 80) {
	    path_speed= 0
	    direction= 270
	    image_speed= 0
	    frame= 0
	    t= 0
	}

func _process(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(obj_mainchara.y > y + 80) {
	    if(t == 0) {
	        $Alarm5.start((30) / 30.0)
	        t= 1
	    }
	} else  {
	    $Alarm5.start((24) / 30.0)
	    path_speed= 2
	    if(obj_mainchara.y < y + 65) path_speed= 3
	    if(obj_mainchara.y < y + 50) path_speed= 4
	    image_speed= 0.2
	}
	scr_npcdir(0)

func _on_alarm_0_timeout():
	GS.plot= 2
	instance_create(147, 440, 1339/* obj_stalkerflowey */)
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
