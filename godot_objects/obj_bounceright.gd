# Auto-converted from GameMaker: obj_bounceright
# GM parent: obj_bouncetileparent
extends Node2D

func _ready():
	bounced= 0
	btime= -1
	con= 0
	$Alarm1.start((1) / 30.0)
	if(not instance_exists(1530/* obj_bouncetilecontoller */))
	    instance_create(0, 0, 1530/* obj_bouncetilecontoller */)
	event_user(0)
	gold= 0
	goldshift= 0
	image_speed= 0.2

func _gm_event_2_11():
	gold= 1

func _gm_event_2_10():
	if(con == 0) {
	    mydirection+= 90
	    myfacing++
	    if(myfacing >= 4) myfacing-= 4
	    if(mydirection >= 360) mydirection-= 360
	    if(myfacing == 0) sprite_index= 1821/* spr_venter_d */
	    if(myfacing == 1) sprite_index= 1824/* spr_venter_r */
	    if(myfacing == 2) sprite_index= 1823/* spr_venter_u */
	    if(myfacing == 3) sprite_index= 1822/* spr_venter_l */
	}
	$Alarm10.start((fliptime) / 30.0)

func _gm_event_2_9():
	if(con == 0) {
	    mydirection+= 180
	    myfacing+= 2
	    if(myfacing >= 4) myfacing-= 4
	    if(mydirection >= 360) mydirection-= 360
	    if(myfacing == 0) sprite_index= 1821/* spr_venter_d */
	    if(myfacing == 1) sprite_index= 1824/* spr_venter_r */
	    if(myfacing == 2) sprite_index= 1823/* spr_venter_u */
	    if(myfacing == 3) sprite_index= 1822/* spr_venter_l */
	}
	$Alarm9.start((fliptime) / 30.0)

func _gm_event_2_4():
	con++

func _gm_event_2_1():
	if(con == 0) instance_create(x, y, 1529/* obj_bouncersteam */)
	$Alarm1.start((10) / 30.0)

func _process(delta: float):
	btime--
	if(con == 1) {
	    // obj_mainchara
	    with(1570) scr_moveideal(3)
	}
	if(con == 2) {
	    GS.facing= myfacing
	    obj_mainchara.image_speed= 0
	    con= 3
	    $Alarm4.start((10) / 30.0)
	    if(room == 171 or room == 163) $Alarm4.start((5) / 30.0)
	}
	if(con == 4) {
	    fakegrav= 0.95
	    fakevelocity.y= 10
	    GS.facing= myfacing
	    obj_mainchara.direction= mydirection
	    obj_mainchara.speed= 6
	    if(room == 163) obj_mainchara.speed= 4
	    con= 5
	    faceoff= -2
	    $Alarm4.start((20) / 30.0)
	    if(room == 171) {
	        $Alarm4.start((10) / 30.0)
	        fakevelocity.y= 10
	        fakegrav= 1.8
	    }
	    snd_play(91/* snd_vaporized */)
	}
	if(con == 5) {
	    b= instance_create(x, y, 1529/* obj_bouncersteam */)
	    b.speed= 7
	    b.direction= (90 + mydirection) / 2
	    if(mydirection < 300 and mydirection > 200) {
	        b.direction= 180
	        b.speed= 2
	    }
	    faceoff++
	    if(room == 171) faceoff++
	    if(floor(faceoff / 4) >= 1) {
	        GS.facing++
	        faceoff= 0
	    }
	    if(GS.facing > 3) GS.facing= 0
	    fakevelocity.y-= fakegrav
	    obj_mainchara.y-= fakevelocity.y
	}
	if(con == 6) {
	    if(instance_exists(1542/* obj_rtile */)) obj_rtile.faketime= 4
	    obj_mainchara.speed= 0
	    obj_mainchara.y= floor(obj_mainchara.y)
	    con= 7
	    $Alarm4.start((1) / 30.0)
	}
	if(con == 8) {
	    if(mydirection == 180 or mydirection == 0)
	        obj_mainchara.y= y - 15
	    obj_bouncetilecontoller.bounce= 2
	    $Alarm1.start((20) / 30.0)
	    GS.phasing= 0
	    GS.interact= 0
	    con= 0
	}
	if(goldshift == 1 and gold == 1) event_user(2)

func _on_alarm_0_timeout():
	if(GS.interact == 0 and obj_bouncetilecontoller.bounce == 0 and con == 0) {
	    obj_bouncetilecontoller.bounce= 1
	    GS.phasing= 1
	    con= 1
	    obj_mainchara.image_speed= 0.334
	    $Alarm4.start((5) / 30.0)
	    GS.interact= 1
	    obj_mainchara.ideal= id
	    // obj_mainchara
	    with(1570) scr_getideal(ideal.x, ideal.y - 15)
	}
	if(GS.interact == 0 and obj_bouncetilecontoller.bounce == 2 and con == 0) {
	    obj_bouncetilecontoller.bounce= 1
	    GS.phasing= 1
	    con= 4
	    obj_mainchara.image_speed= 0.334
	    GS.interact= 1
	    obj_mainchara.ideal= id
	}
	obj_bouncetilecontoller.btime= 3

func _gm_event_7_12():
	if(mydirection == 270 and myfacing == 0 and goldshift == 1) {
	    goldshift= 0
	    y-= 40
	    mydirection= 90
	    myfacing= 2
	    sprite_index= 1823/* spr_venter_u */
	}
	if(mydirection == 0 and myfacing == 1 and goldshift == 1) {
	    goldshift= 0
	    x-= 40
	    mydirection= 180
	    myfacing= 3
	    sprite_index= 1822/* spr_venter_l */
	}
	if(mydirection == 180 and myfacing == 3 and goldshift == 1) {
	    goldshift= 0
	    x+= 40
	    mydirection= 0
	    myfacing= 1
	    sprite_index= 1824/* spr_venter_r */
	}
	if(mydirection == 90 and myfacing == 2 and goldshift == 1) {
	    goldshift= 0
	    y+= 40
	    mydirection= 270
	    myfacing= 0
	    sprite_index= 1821/* spr_venter_d */
	}

func _gm_event_7_10():
	myfacing= 1
	mydirection= 0

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
