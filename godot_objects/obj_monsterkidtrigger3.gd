# Auto-converted from GameMaker: obj_monsterkidtrigger3
extends Node2D

func _ready():
	if(GS.plot > 113) {
	    instance_destroy()
	    exit
	} else  {
	    con= 0
	    mkid= instance_create(x + 20, y, 1115/* obj_mkid_actor */)
	    mkid.image_speed= 0
	    scale.y= 10
	    numero= 0
	    if(GS.flag[90] > 0) numero= 1
	    if(GS.entrance == 2) $Alarm2.start((2) / 30.0)
	    exit
	}

func _gm_event_2_4():
	con++

func _gm_event_2_2():
	if(numero < 2) {
	    con= 6
	    x= 60
	    mkid.follow= 2.1
	    mkid.x= obj_mainchara.x - 8
	    mkid.y= obj_mainchara.y + 8
	    mkid.sprite_index= mkid.usprite
	    numero= 2
	}

func _process(delta: float):
	if(con == 1) {
	    GS.facechoice= 0
	    GS.typer= 5
	    GS.msc= 0
	    if(GS.flag[90] == 3) GS.msg[0]= "* Yo.../%%"
	    if(GS.flag[90] == 2) {
	        if(GS.flag[85] == 0) {
	            GS.msg[0]= "* Yo..^1./"
	            GS.msg[1]= "* Where\'s the umbrella...^1?&* Ha... ha.../%%"
	            GS.flag[90]= 3
	        }
	        if(GS.flag[85] == 1) GS.msg[0]= "* Yo^1!&* Ready yet?/%%"
	    }
	    if(GS.flag[90] == 1) {
	        if(GS.flag[85] == 0) GS.msg[0]= "* Yo^1!&* Ready yet?/%%"
	        if(GS.flag[85] == 1) {
	            GS.msg[0]= "* Yo^1!&* You got us an umbrella?/"
	            GS.msg[1]= "* You\'re the best!/%%"
	            GS.flag[90]= 2
	        }
	    }
	    if(GS.flag[90] == 0) {
	        if(GS.flag[85] == 1) {
	            GS.msg[0]= "* Yo^1, you got an umbrella?/"
	            GS.msg[1]= "* Awesome!/%%"
	            GS.flag[90]= 2
	        }
	        if(GS.flag[85] == 0) {
	            GS.msg[0]= "* Yo^1! You can\'t hold an&  umbrella either?/"
	            GS.msg[1]= "* If you\'re walking anyway^1,&  I guess I\'ll go with you^1,&  haha.../%%"
	            GS.flag[90]= 1
	        }
	    }
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 2
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    with(mkid) {
	        follow= 1
	        sprite_index= dsprite
	    }
	    GS.interact= 1
	    con= 3
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 4 and is_instance_valid(mkid) and mkid.follow == 3) {
	    GS.msc= 0
	    with(mkid) sprite_index= rtsprite
	    with(mkid) image_speed= 0.25
	    GS.msg[0]= "* Let\'s go!/%%"
	    GS.typer= 5
	    GS.interact= 1
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 5
	}
	if(not instance_exists(782/* OBJ_WRITER */) and con == 5) {
	    con= 6
	    GS.interact= 0
	    with(mkid) sprite_index= rsprite
	    x= 60
	}
	if(con == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 8
	    mkid.follow= 0
	    mkid.velocity.x= 8
	    mkid.sprite_index= mkid.rsprite
	    mkid.image_speed= 0.5
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 9) {
	    with(mkid) instance_destroy()
	    GS.interact= 0
	    t= instance_create(xstart, ystart, 1122/* obj_monsterkidtrigger3 */)
	    t.numero= 2
	    instance_destroy()
	}

func _on_alarm_0_timeout():
	if(con == 0 and GS.interact == 0) {
	    other.x= other.xprevious
	    other.y= other.yprevious
	    GS.interact= 1
	    con= 1
	    mkid.sprite_index= mkid.dtsprite
	    mkid.image_speed= 0.25
	    GS.msc= 0
	    GS.typer= 5
	}
	if(con == 6 and GS.interact == 0) {
	    con= 7
	    GS.interact= 1
	    other.x= other.xprevious
	    other.y= other.yprevious
	    mkid.sprite_index= mkid.ltsprite
	    mkid.image_speed= 0.25
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.typer= 5
	    GS.msg[0]= "* Yo^1, I already looked^1,&  Undyne\'s not over here./"
	    GS.msg[1]= "* So I guess I\'ll see&  ya later^1, haha./%%"
	    if(numero > 0) GS.msg[0]= "* See ya later!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
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
