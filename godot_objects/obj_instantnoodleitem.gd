# Auto-converted from GameMaker: obj_instantnoodleitem
extends Node2D

func _ready():
	con= 1
	GS.flag[21]= 1
	GS.msg[1]= "* You put some water in&  the pot and place it on&  the heat./"
	GS.msg[2]= "* You wait for the water&  to boil.../"
	GS.msg[3]= "* ..^4.&* ..^4.&* .../"
	GS.msg[4]= "* It\'^2s boiling./"
	GS.msg[5]= "* You place the noodle^1s&  into the pot./"
	GS.msg[6]= "* 4^3 minutes lef^3t until&  the noodle^2s are finished./"
	GS.msg[7]= "* 3^3 minutes lef^3t until&  the noodle^2s are finished./"
	GS.msg[8]= "* 2^3 minutes lef^3t until&  the noodle^2s are finished./"
	GS.msg[9]= "* 1^3 minute lef^3t until&  the noodle^2s are finished./"
	GS.msg[10]= "* The noodle^3s are finished./"
	GS.msg[11]= "* ... they don\'t taste very&  good./"
	GS.msg[12]= "* You add the flavor packet./"
	GS.msg[13]= "* That\'s better./"
	GS.msg[14]= "* Not great^1, but better./"
	GS.msg[15]= "  %%"
	script_execute(146/* scr_writetext */, 0, "* You remove the Instant&  Noodles from their&  packaging./", 0, 0)

func _process(delta: float):
	if(instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.stringno == 3 and con == 1) {
	        caster_pause(GS.batmusic)
	        con= 2
	    }
	    if(con == 2 and OBJ_WRITER.stringno == 15) {
	        caster_resume(GS.batmusic)
	        con= 3
	        GS.flag[21]= 0
	        // OBJ_WRITER
	        with(782) instance_destroy()
	        GS.msg[0]= "* You ate the Instant Noodles."
	        script_execute(64/* scr_recoitem */, 4)
	        instance_create(0, 0, 91/* obj_foodsound */)
	    }
	} else  instance_destroy()

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
