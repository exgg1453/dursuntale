# Auto-converted from GameMaker: obj_alabdoor_l
# GM parent: obj_interactable
extends Node2D

func _ready():
	buffer= 0
	active= 1
	doorx= 0
	open= -1
	side= 0
	if(room == 139) {
	    sprite_index= 1874/* spr_labdoor_hang */
	    if(GS.entrance == 5) {
	        open= 1
	        doorx= 8
	    }
	    if(GS.flag[492] == 1) {
	        instance_create(x + 0, y + 52, 2/* obj_solidsmall */)
	        active= 0
	        doorx= 0
	    } else  instance_create(x + 0, y + 50, 809/* obj_doorCmusicfade */)
	} else  {
	    side= 1
	    if(GS.entrance == 4) {
	        open= 1
	        doorx= 8
	    }
	    if(GS.flag[492] == 1) {
	        instance_create(x + 15, y + 51, 2/* obj_solidsmall */)
	        active= 0
	        doorx= 0
	    } else  instance_create(x + 0, y + 50, 810/* obj_doorDmusicfade */)
	}
	con= 0
	myinteract= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	buffer--
	if(myinteract == 1 and buffer > 0) myinteract= 0
	if(myinteract == 1 and GS.flag[492] == 1) {
	    h= 0
	    scr_itemcheck(56)
	    if(haveit == 1) h= 1
	    scr_itemcheck(57)
	    if(haveit == 1) h= 1
	    if(h == 0) {
	        GS.msc= 0
	        GS.facechoice= 0
	        GS.typer= 5
	        GS.msg[0]= "* (There\'s no response.)/%%"
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    if(h == 1) {
	        GS.msc= 825
	        GS.facechoice= 0
	        GS.typer= 5
	        instance_create(0, 0, 779/* obj_dialoguer */)
	    }
	    GS.interact= 1
	    myinteract= 2
	}
	if(myinteract == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    buffer= 4
	    myinteract= 0
	    GS.interact= 0
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    i= 0
	    while(i < 9) {
	        if(GS.item[i] == 56 or GS.item[i] == 57)
	            script_execute(66/* scr_itemshift */, i, 0)
	        i++
	    }
	    GS.interact= 1
	    caster_stop(GS.currentsong)
	    chainsaw= caster_load("music/sfx_chainsaw.ogg")
	    con= 2.1
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 3.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.typer= 47
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.msg[0]= "* (...)/"
	    GS.msg[1]= "* (O^1-oh n^1-no^1, is that another&  letter...?)/"
	    GS.msg[2]= "* (I don\'t want to open it...^1)&* (C-^1can\'t I just slide it&  back out...?)/"
	    GS.msg[3]= "* (...)/"
	    GS.msg[4]= "* (N..^1. no..^1. I can\'t keep doing&  this.^1)&* (I\'ll read this one.)/"
	    GS.msg[5]= "* (...)/"
	    GS.msg[6]= "* (Um...^1)&* (I-it\'s shut k-kind of&  strongly^1, isn\'t it?)/"
	    GS.msg[7]= "* (Wait a second...)/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 3
	}
	if(con == 3 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 3.2
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 2.1) GS.interact= 1
	if(con == 4.2) {
	    con= 5
	    $Alarm4.start((110) / 30.0)
	    caster_play(chainsaw, 0.8, 1)
	}
	if(con == 6) {
	    alphys= scr_marker(x + 2, y + 35, 1650)
	    alphys.z_index= z_index + 10
	    if(side == 1) alphys.sprite_index= 1643/* spr_alphys_r */
	    open= 1
	    con= 7
	    $Alarm4.start((25) / 30.0)
	}
	if(con == 8) {
	    GS.facechoice= 6
	    GS.typer= 47
	    GS.faceemotion= 9
	    GS.flag[430]= 0
	    GS.msg[0]= "* Hey^1, if this is a&  joke^1, it\'s.../"
	    GS.msg[1]= "\\E1* .../"
	    GS.msg[2]= "\\E3* Oh My God?/"
	    GS.msg[3]= "\\E5* Did YOU write this&  letter?/"
	    GS.msg[4]= "\\E6* It wasn\'t signed^1, so^1,&  I had no idea who&  could have.../"
	    GS.msg[5]= "\\E8* Oh my god^1.&* Oh no./"
	    GS.msg[6]= "\\E7* That\'s adorable.../"
	    GS.msg[7]= "\\E5* And I h-had no idea&  you^1, um^1, wrote that way!/"
	    GS.msg[8]= "\\E9* It\'s surprising^1, too..^1.&* After all the gross&  stuff I did.../"
	    GS.msg[9]= "\\E8* I don\'t really deserve&  to be forgiven./"
	    GS.msg[10]= "\\E4* Much less^1, um.../"
	    GS.msg[11]= "\\E5* This?/"
	    GS.msg[12]= "\\E1* And so passionately^1,&  too./"
	    GS.msg[13]= "\\E2* .../"
	    GS.msg[14]= "\\E0* You know what^1, okay^1!&* I\'ll do it!/"
	    GS.msg[15]= "\\E5* It\'s the least I can&  do to make it up&  to you!/"
	    GS.msg[16]= "\\W*\\E7 Y-yeah^1!&* \\WLet\'s \\Rgo on a date\\W!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 9
	}
	if(con == 9 and not instance_exists(782/* OBJ_WRITER */)) {
	    instance_create(0, 0, 143/* obj_battlerflowey */)
	    con= 10
	}

func _on_outside_room():
	if(side == 0) {
	    if(active == 1 and instance_exists(1570/* obj_mainchara */)) {
	        if(distance_to_object(1570) < 40) {
	            if(open == 0) caster_play(121, 1, 1)
	            open= 1
	        }
	        if(distance_to_object(1570) > 50) {
	            if(open == 1) caster_play(120, 1, 1)
	            open= 0
	        }
	    }
	    if(open == -1) open= 0
	    if(doorx < 7)
	        draw_sprite_part(1873, 0, 0, 0, 8 - doorx, 61, x, y + 4)
	    if(doorx < 7)
	        draw_sprite_part(1873, 0, doorx, 0, 8 - doorx, 61, x + 6 + doorx, y + 10)
	    if(open == 1 and doorx < 8) doorx++
	    if(open == 0 and doorx > 0) doorx--
	    draw_sprite(1874/* spr_labdoor_hang */, 0, x, y)
	}
	if(side == 1) {
	    if(active == 1 and instance_exists(1570/* obj_mainchara */)) {
	        if(distance_to_object(1570) < 30) {
	            if(open == 0) caster_play(121, 1, 1)
	            open= 1
	        }
	        if(distance_to_object(1570) > 50) {
	            if(open == 1) caster_play(120, 1, 1)
	            open= 0
	        }
	    }
	    if(open == -1) open= 0
	    if(doorx < 7)
	        draw_sprite_part(1870, 0, 0, 0, 8 - doorx, 61, x + 19, y + 10)
	    if(doorx < 7)
	        draw_sprite_part(1870, 0, doorx, 0, 8 - doorx, 61, x + 25 + doorx, y + 4)
	    if(open == 1 and doorx < 8) doorx++
	    if(open == 0 and doorx > 0) doorx--
	    draw_sprite(1875/* spr_labdoor_hang_r */, 0, x, y)
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
