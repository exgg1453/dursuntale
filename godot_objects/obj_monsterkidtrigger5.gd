# Auto-converted from GameMaker: obj_monsterkidtrigger5
extends Node2D

func _ready():
	if(GS.flag[91] < 4) con= 0
	else  con= 99
	if(GS.plot > 112) {
	    instance_destroy()
	    exit
	} else  {
	    if(GS.entrance == 1) {
	        mkid= instance_create(obj_mainchara.x - 8, obj_mainchara.y, 1115/* obj_mkid_actor */)
	        mkid.sprite_index= mkid.dsprite
	        mkid.follow= 2.1
	    }
	    if(GS.entrance == 2) {
	        mkid= instance_create(obj_mainchara.x, obj_mainchara.y + 8, 1115/* obj_mkid_actor */)
	        mkid.sprite_index= mkid.lsprite
	        mkid.follow= 2.1
	    }
	    scale.x= 9
	    scale.y= 9
	    exit
	}

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0 and GS.flag[91] < 4) {
	    GS.interact= 1
	    con= 1
	    mkid.sprite_index= mkid.dtsprite
	    mkid.image_speed= 0.25
	    remember= mkid.follow
	    mkid.follow= 0
	    mkid.speed= 0
	    GS.flag[91]= 4
	    GS.facechoice= 0
	    if(obj_mainchara.y > 908) obj_mainchara.y= 908
	    if(obj_mainchara.y < 864) obj_mainchara.y= 864
	    GS.msg[0]= "* Ummm^1, maybe she wouldn\'t beat&  up the teachers.../"
	    GS.msg[1]= "* She\'s too cool to ever&  hurt an innocent person!/%%"
	    scr_regulartext()
	}
	if(con == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(obj_mainchara.y > 908) obj_mainchara.y= 908
	    if(obj_mainchara.y < 864) obj_mainchara.y= 864
	    mkid.follow= remember
	    GS.interact= 0
	    con= 2
	    mkid.image_speed= 0
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
