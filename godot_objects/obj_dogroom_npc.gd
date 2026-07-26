# Auto-converted from GameMaker: obj_dogroom_npc
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= sprite_index
	usprite= sprite_index
	lsprite= sprite_index
	rsprite= sprite_index
	dtsprite= sprite_index
	utsprite= sprite_index
	ltsprite= sprite_index
	rtsprite= sprite_index
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0
	if(GS.flag[55] == 1) instance_destroy()

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(GS.flag[55] == 0) {
	    if(GS.plot < 67) {
	        GS.msg[0]= "* That dog considers itself&  an artist^1, but doesn\'t ever&  know what to create./"
	        GS.msg[1]= "* It probably doesn\'t help&  that its brain is the size&  of a piece of kibble./%%"
	    } else  {
	        GS.msg[0]= "* That dog from earlier...^1?&* It\'s at Grillby\'s^1.&* I think./"
	        GS.msg[1]= "* After work^1, all of the dogs&  go there to play cards&  together./"
	        GS.msg[2]= "* But that dog doesn\'t really&  know how to express it/"
	        GS.msg[3]= "* So^1, it ends up playing alone^1,&  instead of introducing&  itself to the others.../%%"
	    }
	}
	if(GS.flag[55] == 2) {
	    GS.msg[0]= "* A dog just rushed in here^1,&  filled with inspiration./"
	    GS.msg[1]= "* It kept trying to build&  a snowdog that expressed&  its own emotions.../"
	    GS.msg[2]= "* But^1, as it built^1, it&  kept getting more excited&  about the sculpture.../"
	    GS.msg[3]= "* Its neck got longer and&  longer^1, and it added more&  and more snow^1, until.../"
	    GS.msg[4]= "* It was rather sad to watch^1,&  but I couldn\'t turn away./%%"
	}
	if(GS.flag[7] == 1) {
	    GS.msg[0]= "* We\'re all free?/"
	    GS.msg[1]= "* OK^1, OK..^1.&* I\'ll stop lounging around^1.&* Does that dog know?/"
	    GS.msg[2]= "* ... it probably doesn\'t^1,&  does it...?/%%"
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	scr_npc_anim()

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
