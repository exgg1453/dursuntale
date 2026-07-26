# Auto-converted from GameMaker: obj_monsterkidtrigger1
extends Node2D

func _ready():
	if(GS.plot > 103) {
	    // obj_townnpc_monsterkid1
	    with(1481) instance_destroy()
	    instance_destroy()
	} else  {
	    conversation= 0
	    scale.y= 999
	}

func _process(delta: float):
	if(conversation == 1) {
	    t= 0
	    mkid= 1481
	    if(obj_mainchara.x > mkid.x + 40) t= 1
	    if(obj_mainchara.x < mkid.x - 40) t= 2
	    if(t == 1) {
	        mkid.velocity.x= 3
	        mkid.sprite_index= mkid.rsprite
	        mkid.image_speed= 0.2
	    }
	    if(t == 2) {
	        if(mkid.x > mkid.xstart - 40) {
	            mkid.velocity.x= -3
	            mkid.sprite_index= mkid.lsprite
	            mkid.image_speed= 0.2
	        } else  t= 0
	    }
	    if(t == 0) {
	        if(mkid.sprite_index == mkid.rsprite) mkid.frame= 0
	        mkid.velocity.x= 0
	        mkid.image_speed= 0
	        mkid.sprite_index= mkid.dtsprite
	        if(obj_mainchara.x - mkid.x > 16) {
	            mkid.sprite_index= mkid.rtsprite
	            mkid.con= 1
	        }
	        if(obj_mainchara.x - mkid.x < -10) {
	            mkid.sprite_index= mkid.ltsprite
	            mkid.con= 2
	        }
	        if(mkid.myinteract == 3) mkid.image_speed= 0.2
	    }
	}

func _on_alarm_0_timeout():
	if(conversation == 0) conversation= 1

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
