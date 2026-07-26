# Auto-converted from GameMaker: obj_carrybird
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	facing= 0
	direction= 270
	talkedto= 0
	image_speed= 0.1
	carry= 0
	sinoid= 0
	clamp_r= 0
	right= 0
	if(GS.flag[7] == 0) birdsong= caster_load("music/birdsong.ogg")
	if(GS.entrance == 20 and GS.plot > 115) {
	    x= 100
	    right= 1
	}
	if(scr_murderlv() >= 10 and GS.flag[27] == 0) y= 900

func _gm_event_2_4():
	carry++

func _on_destroy():
	myinteract= 3
	GS.msc= 254
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	GS.msg[0]= "* Isn\'t my little Cinnamon&  just the cutest?/"
	GS.msg[1]= "* Bun-buns are so adorable..^1.&* Tee hee!/%%"
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	if(talkedto > 0) GS.msg[0]= "* Bun-bun-bun-bun-bun.../%%"
	talkedto++

func _process_begin(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	if(carry == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    if(GS.flag[7] == 0) scr_musfadepause(0.05)
	    GS.interact= 1
	    $Alarm4.start((20) / 30.0)
	    carry= 2
	    GS.phasing= 1
	}
	if(carry == 2) GS.interact= 1
	if(carry == 3) {
	    voli= 0
	    if(GS.flag[7] == 0) caster_loop(birdsong, 0.2, 1.1)
	    sprite_index= 1596/* spr_smallbird_fly */
	    image_speed= 0.25
	    hdist= obj_mainchara.x - x
	    vdist= obj_mainchara.y - 10 - y
	    velocity.x= hdist / 30
	    velocity.y= vdist / 30
	    $Alarm4.start((30) / 30.0)
	    carry= 4
	}
	if(carry == 4) {
	    voli+= 0.02
	    if(GS.flag[7] == 0) caster_set_volume(birdsong, voli)
	}
	if(carry == 5) {
	    x= obj_mainchara.x
	    y= obj_mainchara.y - 10
	    velocity.y= 0
	    velocity.x= 0
	    sinoid= 0
	    carry= 6
	    $Alarm4.start((25) / 30.0)
	}
	if(carry == 7) {
	    velocity.y= -0.5
	    carry= 8
	    $Alarm4.start((10) / 30.0)
	}
	if(carry == 9) {
	    clamp_r= 1
	    $Alarm4.start((100) / 30.0)
	    carry= 10
	    sinoid= 2
	}
	if(carry == 11) {
	    velocity.y= 0
	    velocity.x= -0.4
	    if(right == 1) velocity.x= 0.4
	    carry= 12
	    $Alarm4.start((360) / 30.0)
	}
	if(right == 0 and carry == 12 and x > 100 and alarm[4] < 5)
	    alarm[4]++
	if(right == 1 and carry == 12 and x < 240 and alarm[4] < 5)
	    alarm[4]++
	if(carry == 13) {
	    velocity.y= 0.5
	    velocity.x= 0
	    $Alarm4.start((100) / 30.0)
	    carry= 14
	}
	if(carry == 14 and y < 90 and alarm[4] < 5)
	    alarm[4]++
	if(carry == 14 and y > 90 and alarm[4] > 5)
	    alarm[4]--
	if(carry == 14) {
	    if(voli > 0) voli-= 0.008
	    if(GS.flag[7] == 0) caster_set_volume(birdsong, voli)
	}
	if(carry == 15) {
	    if(GS.flag[7] == 0) caster_stop(birdsong)
	    sinoid= 0
	    clamp_r= 0
	    carry= 16
	    $Alarm4.start((20) / 30.0)
	}
	if(carry == 17) {
	    velocity.y= 0
	    velocity.x= 1
	    if(right == 1) velocity.x= -1
	    $Alarm4.start((30) / 30.0)
	    carry= 18
	    scr_musfaderesume(0.05)
	}
	if(carry == 19) {
	    velocity.x= 0
	    velocity.y= 1
	    $Alarm4.start((10) / 30.0)
	    carry= 20
	}
	if(carry == 21) {
	    // obj_mainchara
	    with(1570) uncan= 0
	    velocity.y= 0
	    x= round(x)
	    y= round(y)
	    sprite_index= 1594/* spr_smallbird */
	    image_speed= 0.25
	    carry= 0
	    if(right == 0) right= 1
	    else  right= 0
	    GS.phasing= 0
	    GS.interact= 0
	}
	if(sinoid == 1) {
	    x+= sin(x) / 2
	    y+= cos(y) / 2
	}
	if(sinoid == 2) {
	    x+= random(1) - 0.5
	    y+= random(1) - 0.5
	}
	if(clamp_r == 1) {
	    obj_mainchara.x= round(x)
	    obj_mainchara.y= round(y + 15)
	}

func _gm_event_7_5():
	if(GS.flag[7] == 0) caster_free(birdsong)

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
