# Auto-converted from GameMaker: obj_diamondkid
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	dsprite= 1219
	usprite= 1219
	lsprite= 1219
	rsprite= 1219
	dtsprite= 1219
	utsprite= 1219
	ltsprite= 1219
	rtsprite= 1219
	myinteract= 0
	facing= 0
	direction= 0
	talkedto= 0
	image_speed= 0
	if(scr_murderlv() >= 12) instance_destroy()
	if(GS.flag[400] == 0) instance_destroy()
	if(x > 160) sprite_index= 1676/* spr_diamondtallboy */

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "\\W* My fave Mettaton Moment(TM)^1?&* Right \\Ywhen everything looks the&  baddest^1, he poses dramatically\\W./"
	GS.msg[1]= "* Like when he\'s on a cooking&  show and the eggs don\'t turn&  out right./%%"
	if(talkedto > 0) {
	    GS.msg[0]= "* But^1!&* Then he says!/"
	    GS.msg[1]= "\\W* Even if you suck at cooking^1,&  you can always \\Ybuy an&  MTT-brand Glamburger\\W!/"
	    GS.msg[2]= "\\W* Then he \\Yeats one^1!\\W &* Everyone loves it!/"
	    GS.msg[3]= "* ... How does he eat it&  without a mouth?/"
	    GS.msg[4]= "* Uhhh... well..^1.&* Watch the show!/%%"
	}
	if(GS.flag[425] == 1) {
	    GS.msg[0]= "* That finale was really..^1.&* That was really sad!/"
	    GS.msg[1]= "* And Mettaton\'s schedule&  doesn\'t show any other&  shows.../%%"
	}
	if(GS.flag[7] == 1)
	    GS.msg[0]= "* I\'ve been thinking about&  getting a sick skateboard./%%"
	if(x > 160) {
	    GS.msg[0]= "\\W* My fave Mettaton Moment(TM)&  is when he beats up the&  \\Yheel-turning villains\\W!/"
	    GS.msg[1]= "* Even if it\'s during what\'s&  supposed to be a quiz show./%%"
	    if(talkedto > 0) {
	        GS.msg[0]= "* Oh^1! And I like when he tries&  on all kinds of different&  fashionable outfits!/"
	        GS.msg[1]= "* Even if it\'s during what\'s&  supposed to be a newscast./%%"
	    }
	    if(GS.flag[425] == 1) {
	        GS.msg[0]= "* Did Mettaton retire...?/"
	        GS.msg[1]= "* Can\'t he unretire...?/%%"
	    }
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* On the surface we\'ll be able&  to watch all kinds of TV.../"
	        GS.msg[1]= "* But^1, I bet none of those&  shows are as good as&  Mettaton\'s!/%%"
	    }
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
