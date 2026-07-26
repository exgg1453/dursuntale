# Auto-converted from GameMaker: obj_papyrus_hisroom
# GM parent: obj_papyrusparent
extends CharacterBody2D

func _ready():
	if(GS.flag[67] == 1) {
	    instance_destroy()
	    exit
	} else  {
	    dsprite= 1313
	    usprite= 1325
	    lsprite= 1330
	    rsprite= 1328
	    dtsprite= 1316
	    utsprite= 1327
	    ltsprite= 1334
	    rtsprite= 1335
	    myinteract= 0
	    facing= 0
	    direction= 270
	    talkedto= 0
	    image_speed= 0
	    fun= 0
	    intro= 0
	    if(GS.flag[88] >= 4) {
	        instance_destroy()
	        exit
	    } else  exit
	}

func _on_destroy():
	if(intro < 4) {
	    myinteract= 3
	    GS.msc= 563
	    GS.typer= 19
	    GS.facechoice= 4
	    GS.faceemotion= 0
	    GS.msg[0]= "TAKE A LOOK&AROUND!/%%"
	    mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	    talkedto++
	}

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(fun == 0) {
	    if(instance_exists(775/* obj_face_papyrus */))
	        frame= obj_face_papyrus.frame
	    else  {
	        if(speed == 0 and path_speed == 0) frame= 0
	    }
	}
	if(speed == 0) scr_npc_watch(0)
	if(intro == 0) {
	    intro= 1
	    velocity.y= -5
	    sprite_index= 1325/* spr_papyrus_u */
	    image_speed= 0.25
	}
	if(intro == 1 and y < 110) {
	    intro= 2
	    velocity.y= 0
	    velocity.x= -5
	    sprite_index= 1330/* spr_papyrus_l */
	}
	if(intro == 2 and x < 150) {
	    velocity.x= 0
	    sprite_index= 1316/* spr_papyrus_dt */
	    intro= 3
	}
	if(intro == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_create(0, 0, 143/* obj_battlerflowey */)
	    GS.interact= 1
	    intro= 5
	}
	if(intro == 5) GS.interact= 1

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
