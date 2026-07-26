# Auto-converted from GameMaker: obj_amalgam_fridge
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	con= 0
	alpha= 0
	amalgam= 0
	anim= 0
	myinteract= 0
	scr_depth()
	talkedto= 0
	if(GS.flag[482] == 1) {
	    x= 170
	    y= 138
	    sprite_index= 2110/* spr_leverkey */
	    image_speed= 0.2
	    image_blend= 16711680
	}
	if(GS.flag[482] > 1) instance_destroy()

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(GS.flag[490] == 1) {
	    GS.msg[0]= "* (It\'s a refrigerator.^1)&* (It\'s empty.)/%%"
	    con= 1
	} else 
	    GS.msg[0]= "* (It\'s some sort of cold^1,&  rectangular object.)/%%"
	if(GS.flag[482] == 1) {
	    GS.msg[0]= "* (You found a blue key on&  the ground.^1)&* (You put it on your keychain.)/%%"
	    con= 10
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _on_outside_room():
	if(alpha < 1)
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, image_blend, 1)
	if(amalgam == 1)
	    draw_sprite_ext(2147/* spr_amalgam_fridge */, floor(anim), x, y, 1, 1, 0, 16777215, alpha)
	if(con == 1 and (obj_mainchara.x < 122 or obj_mainchara.x > 220) and GS.interact == 0) {
	    con= 2
	    caster_pause(GS.currentsong)
	    GS.interact= 1
	    if(obj_mainchara.x < 160) GS.facing= 1
	    if(obj_mainchara.x > 200) GS.facing= 3
	    tr= caster_load("music/sfx_generate.ogg")
	    caster_play(tr, 0.8, 1)
	}
	if(con == 2) {
	    amalgam= 1
	    frame= 0
	    image_speed= 0
	    con= 3.1
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 3.1) {
	    GS.interact= 1
	    if(obj_mainchara.x < 160) GS.facing= 1
	    if(obj_mainchara.x > 200) GS.facing= 3
	    if(alpha < 1) alpha+= 0.1
	}
	if(con == 4.1) {
	    caster_play(tr, 0.8, 0.7)
	    con= 4
	}
	if(con == 4) {
	    anim+= 0.5
	    if(anim >= 8) {
	        anim= 8
	        image_speed= 0
	        con= 5
	        $Alarm4.start((50) / 30.0)
	    }
	}
	if(con == 6) {
	    caster_free(tr)
	    GS.battlegroup= 84
	    GS.mercy= 1
	    GS.border= 0
	    GS.flag[16]= 0
	    instance_create(0, 0, 142/* obj_battler */)
	    con= 7
	    $Alarm4.start((32) / 30.0)
	}
	if(con == 8) {
	    GS.interact= 0
	    GS.mercy= 0
	    caster_resume(GS.currentsong)
	    myinteract= 0
	    image_blend= 16711680
	    sprite_index= 2110/* spr_leverkey */
	    myinteract= 0
	    GS.flag[482]= 1
	    image_speed= 0.1
	    scr_tempsave()
	    con= 9
	    amalgam= 0
	    alpha= 0
	    x= 170
	    y= 138
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 0
	    GS.flag[482]= 2
	    instance_destroy()
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
