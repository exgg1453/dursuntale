# Auto-converted from GameMaker: obj_dogboat_thing
# GM parent: obj_interactable
extends Node2D

func _ready():
	view_yview[0]= 0
	reg= 1
	up= 0
	if(room == 70 == 1) up= 1
	if(GS.plot < 122) {
	    instance_destroy()
	    exit
	} else  {
	    if(GS.entrance == 1) {
	        if(GS.flag[460] % 2 == 1) GS.flag[461]= 1
	        else  GS.flag[461]= 0
	    }
	    if(GS.flag[461] == 1) reg= 0
	    else  reg= 1
	    image_speed= 0
	    con= 0
	    siner= 0
	    dogy= 0
	    if(reg == 1) sprite_index= 1528/* spr_regboat */
	    cc= 0
	    bgspeed= 0
	    lapbg= 0
	    rman= instance_create(x + 20, y - 15, 1073/* obj_riverman */)
	    z_index= rman.z_index + 10
	    snapper= 999999
	    myinteract= 0
	    type= 0
	    if(room == 316 and type == 0) {
	        myinteract= 99
	        type= 1
	        z_index= 900000
	        obj_mainchara.cutscene= 1
	        view_object[0]= -4
	        view_xview[0]= 0
	        x= 340
	        lapbg= 1
	        con= 6
	        if(GS.flag[461] == 0) reg= 1
	        else  reg= 0
	        if(reg == 0) sprite_index= 1527/* spr_dogboat */
	        if(reg == 1) sprite_index= 1528/* spr_regboat */
	        snapper= 1570
	        GS.interact= 1
	        if(reg == 0) bgspeed= 8
	        if(reg == 1) bgspeed= 4
	    }
	    if(type == 0 and GS.entrance == 24) {
	        snapper= 1570
	        myinteract= 99
	        type= 1
	        lapbg= 0
	        z_index= 900000
	        obj_mainchara.cutscene= 1
	        view_object[0]= -4
	        view_xview[0]= 0
	        x= 340
	        con= 50
	        if(GS.flag[461] == 0) reg= 1
	        else  reg= 0
	        if(reg == 0) sprite_index= 1527/* spr_dogboat */
	        if(reg == 1) sprite_index= 1528/* spr_regboat */
	    }
	    if(lapbg == 1) {
	        tilex= -320
	        tile_layer_shift(1000000, -320, 0)
	    }
	    if(up == 1) z_index= 950000
	    view_yview[0]= 0
	    exit
	}

func _gm_event_2_5():
	$Alarm5.start((5) / 30.0)
	p= instance_create(x + 78, y + 40 + dogy, 1075/* obj_dogboat_pillar */)
	p.velocity.x= velocity.x + 7

func _gm_event_2_4():
	con++

func _on_outside_room():
	if(myinteract == 1 and GS.interact == 0) {
	    GS.interact= 1
	    rman.image_speed= 0.1
	    GS.typer= 5
	    GS.msc= 770
	    GS.facechoice= 0
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    myinteract= 2
	}
	if(myinteract == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    rman.image_speed= 0
	    rman.frame= 0
	    if(con == 0) {
	        myinteract= 0
	        GS.interact= 0
	    } else  myinteract= 3
	}
	if(reg == 1) {
	    siner++
	    dogy= sin(siner / 10) * 1 + 1
	}
	if(con == 0) {
	    siner++
	    dogy= sin(siner / 10) * 1 + 1
	}
	if(con == 0.1 and not instance_exists(782/* OBJ_WRITER */)) {
	    obj_mainchara.image_speed= 0.25
	    con= 0.2
	}
	if(con == 0.2) {
	    GS.phasing= 1
	    if(obj_mainchara.x < x + 54) {
	        GS.facing= 1
	        obj_mainchara.x+= 2
	    }
	    if(obj_mainchara.x > x + 58) {
	        GS.facing= 3
	        obj_mainchara.x-= 2
	    }
	    if(obj_mainchara.x >= x + 54 and obj_mainchara.x <= x + 58)
	        con= 0.3
	}
	if(con == 0.3) {
	    GS.phasing= 1
	    obj_mainchara.x= x + 56
	    z_index= 960000
	    GS.facing= 0
	    if(up == 0) {
	        GS.facing= 0
	        if(obj_mainchara.y < y + dogy - 8 + adjust)
	            obj_mainchara.y+= 2
	        else  con= 0.4
	    }
	    if(up == 1) {
	        GS.facing= 2
	        if(obj_mainchara.y > y + dogy - 8 + adjust)
	            obj_mainchara.y-= 2
	        else  con= 0.4
	    }
	}
	if(con == 0.4) {
	    GS.facing= 3
	    con= 1.1
	    $Alarm4.start((10) / 30.0)
	    snapper= 1570
	}
	if(con == 2.1) {
	    con= 1
	    if(reg == 1) {
	        con= 2
	        $Alarm4.start((10) / 30.0)
	    }
	}
	if(con == 1) {
	    if(dogy > -10) dogy-= 0.5
	    else  {
	        dogy= -10
	        con= 2
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con == 3) {
	    velocity.x= -5
	    $Alarm5.start((1) / 30.0)
	    if(reg == 1) {
	        velocity.x= -2
	        $Alarm5.start((-1) / 30.0)
	    }
	    image_speed= 0.334
	    con= 4
	}
	if(con == 4 and x < -80) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    con= 4.1
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 5.1) {
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    con= 99
	    GS.entrance= 24
	    get_tree().change_scene_to_file("res://godot_rooms/316.tscn")
	}
	if(con == 6) {
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    view_xview[0]= 0
	    x= 340
	    GS.facing= 3
	    GS.interact= 1
	    dogy= -10
	    $Alarm5.start((1) / 30.0)
	    if(reg == 1) {
	        dogy= 0
	        velocity.x= -2
	        $Alarm5.start((-1) / 30.0)
	    }
	    image_speed= 0.334
	    velocity.x= -2
	    con= 7
	}
	if(con == 7 and x < view_xview[0] + 120) {
	    con= 8
	    velocity.x= 0
	}
	if(con == 8) {
	    con= 9
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 9) GS.interact= 1
	if(con == 10) {
	    GS.msc= 0
	    GS.typer= 5
	    rr= floor(random(31))
	    if(GS.flag[460] == 1) rr= 17
	    GS.msg[0]= "* Tra la la^1.&* The waters are wild today^1.&* That\'s good luck.../%%"
	    GS.msg[1]= "* Tra la la./%%"
	    if(rr == 1)
	        GS.msg[0]= "* Tra la la^1.&* The waters are wild today^1.&* That\'s bad luck.../%%"
	    if(rr == 2) {
	        GS.msg[0]= "* Tra la la^1.&* Eat a mushroom everyday./"
	        GS.msg[1]= "* Why^1?&* Then I know you\'re listening&  to me.../%%"
	    }
	    if(rr == 3)
	        GS.msg[0]= "* Tra la la^1.&* Remember to take a break&  every-so-often.../%%"
	    if(rr == 4)
	        GS.msg[0]= "* Tra la la^1.&* Did you ever hear the old&  song coming from the sea?/%%"
	    if(rr == 5)
	        GS.msg[0]= "* Tra la la^1.&* What\'s inside an acorn^1?&* It\'s really just a mystery./%%"
	    if(rr == 6)
	        GS.msg[0]= "* Tra la la^1.&* Dancing on a boat is danger^1.&* But good exercise.../%%"
	    if(rr == 7)
	        GS.msg[0]= "* Tra la la^1.&* I heard ASGORE has a favorite&  food./%%"
	    if(rr == 8) {
	        GS.msg[0]= "* Tra la la^1.&* I heard spiders have a&  favorite food./"
	        GS.msg[1]= "* It\'s spiders./%%"
	    }
	    if(rr == 9) {
	        GS.msg[0]= "* Tra la la^1.&* The piano plays the&  tinkling song./"
	        GS.msg[1]= "* Hmm..^1. tinkling./%%"
	    }
	    if(rr == 10) {
	        GS.msg[0]= "* Tra la la^1.&* You can never have too&  many hot-dogs./"
	        GS.msg[1]= "* ... sadly^1, that\'s not true./%%"
	    }
	    if(rr == 11) {
	        GS.msg[0]= "* Tra la la^1.&* Don\'t snoop behind people\'s&  houses.../"
	        GS.msg[1]= "* You might be mistaken for&  a trash-can./%%"
	    }
	    if(rr == 12)
	        GS.msg[0]= "* Tra la la^1.&* The angel is coming..^1.&* Tra la la./%%"
	    if(rr == 13)
	        GS.msg[0]= "* Hum hum hum^1. Hum hum hum^1.&* I\'m having a little concert./%%"
	    if(rr == 14) {
	        GS.msg[0]= "* Pet pet pet..^1.&* The neck stretches infinitely&  into the cosmos./"
	        GS.msg[1]= "* ... don\'t worry about it./%%"
	    }
	    if(rr == 15) GS.msg[0]= "* Ah,/%%"
	    if(rr == 16) {
	        GS.msg[0]= "* Tra la la^1.&* What\'s a game you can play&  with a dog?/"
	        GS.msg[1]= "* Asking for a friend.../%%"
	    }
	    if(rr == 17) {
	        GS.msg[0]= "* Tra la la^1.&* Temmie Village.../"
	        GS.msg[1]= "* ... the room before the&  darkening lantern room./%%"
	    }
	    if(rr == 18)
	        GS.msg[0]= "* Tra la la^1.&* Why don\'t you sing with me^1.&* Tra la la./%%"
	    if(rr == 19)
	        GS.msg[0]= "* Tra la la^1.&* Uh oh^1.&* Suddenly^1, feeling tropical.../%%"
	    if(rr == 20) {
	        GS.msg[0]= "* Tra la la^1.&* Hmmm.../"
	        GS.msg[1]= "* I should have worn a few&  more pairs of pants today./%%"
	    }
	    if(rr == 21) {
	        GS.msg[0]= "* Tra la la^1.&* Hmmm.../"
	        GS.msg[1]= "* I should have worn a few&  million more pairs of pants&  today./%%"
	    }
	    if(rr == 22)
	        GS.msg[0]= "* Tra la la^1.&* Tri li li^1.&* Tre le le./%%"
	    if(rr == 23) {
	        weekday= current_weekday
	        day= "Error"
	        if(weekday == 0) day= "Sunday"
	        if(weekday == 1) day= "Monday"
	        if(weekday == 2) day= "Tuesday"
	        if(weekday == 3) day= "Wednesday"
	        if(weekday == 4) day= "Thursday"
	        if(weekday == 5) day= "Friday"
	        if(weekday == 6) day= "Saturday"
	        if(weekday == 7) day= "Sunday"
	        GS.msg[0]= "* Tra la la^1.&* Somewhere^1, it\'s " + day + "^1.&* So be careful./%%"
	    }
	    if(rr == 24)
	        GS.msg[0]= "* Tra la la^1.&* If it\'s hot or cold^1, you&  can count on me./%%"
	    if(rr == 25)
	        GS.msg[0]= "* Tra la la^1.&* The water is very wet today./%%"
	    if(rr == 26)
	        GS.msg[0]= "* Tra la la^1.&* The water is very dry today./%%"
	    if(rr == 27)
	        GS.msg[0]= "* Tra la la^1.&* What\'s my name^1?&* ... It doesn\'t really matter./%%"
	    if(rr == 28)
	        GS.msg[0]= "* Tra la la^1.&* Humans^1, monsters^1...&* Flowers./%%"
	    if(rr == 29)
	        GS.msg[0]= "* Tra la la^1.&* Beware of the man who&  speaks in hands./%%"
	    if(rr == 30)
	        GS.msg[0]= "* Tra la la^1.&* Beware of the man who came&  from the other world./%%"
	    scr_regulartext()
	    con= 11
	}
	if(con == 11 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 12
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 13) con= 15
	if(con == 15) {
	    velocity.x= -2
	    con= 16
	}
	if(con == 16 and x < -80) {
	    instance_create(0, 0, 149/* obj_unfader */)
	    con= 17
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 18) {
	    instance_create(0, 0, 148/* obj_persistentfader */)
	    con= 19
	    GS.entrance= 24
	    if(GS.flag[459] == 1) get_tree().change_scene_to_file("res://godot_rooms/70.tscn")
	    if(GS.flag[459] == 2) get_tree().change_scene_to_file("res://godot_rooms/125.tscn")
	    if(GS.flag[459] == 3) get_tree().change_scene_to_file("res://godot_rooms/140.tscn")
	    if(GS.flag[459] == 0) get_tree().change_scene_to_file("res://godot_rooms/140.tscn")
	}
	if(con == 50) {
	    obj_mainchara.cutscene= 1
	    view_object[0]= -4
	    view_xview[0]= 0
	    x= 340
	    GS.facing= 3
	    GS.interact= 1
	    dogy= -10
	    if(reg == 1) {
	        dogy= 0
	        velocity.x= -2
	    }
	    image_speed= 0.2
	    velocity.x= -2
	    con= 51
	}
	if(con == 51 and x < xstart) {
	    x= xstart
	    con= 52
	    velocity.x= 0
	    image_speed= 0
	    frame= 0
	    $Alarm5.start((-1) / 30.0)
	}
	if(con == 52) {
	    GS.phasing= 1
	    con= 54
	    $Alarm4.start((20) / 30.0)
	    if(sprite_index == 1527) con= 52.5
	}
	if(con == 53.5) {
	    if(dogy < 1) dogy+= 0.5
	    else  {
	        con= 54
	        $Alarm4.start((10) / 30.0)
	    }
	}
	if(con == 55) {
	    GS.facing= 2
	    snapper= 9999999
	    if(up == 0) {
	        obj_mainchara.y-= 2
	        obj_mainchara.image_speed= 0.25
	        if(obj_mainchara.y < y - 25) con= 56
	    }
	    if(up == 1) {
	        GS.facing= 0
	        obj_mainchara.y+= 2
	        obj_mainchara.image_speed= 0.25
	        if(obj_mainchara.y > y + 25) con= 56
	    }
	}
	if(con == 56) {
	    GS.facing= 0
	    obj_mainchara.image_speed= 0
	    obj_mainchara.frame= 0
	    con= 57
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 58) {
	    GS.msc= 0
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.msg[0]= "* Come again some time^1.&* Tra la la./%%"
	    scr_regulartext()
	    con= 59
	    rman.image_speed= 0.1
	}
	if(con == 59 and not instance_exists(782/* OBJ_WRITER */)) {
	    z_index= rman + 1
	    if(up == 1) z_index= 960000
	    GS.flag[460]++
	    GS.phasing= 0
	    GS.msc= 0
	    rman.image_speed= 0
	    rman.frame= 0
	    con= 0
	    GS.interact= 0
	    myinteract= 0
	}
	adjust= 0
	if(sprite_index == 1527 and frame < 1) adjust= 1
	draw_sprite(sprite_index, frame, x, y + dogy)
	cc+= 0.1
	draw_sprite(1529/* spr_dogboat_cover */, cc, x, y)
	rman.y= y + dogy - 17 + adjust
	rman.x= x + 20
	if(is_instance_valid(snapper)) {
	    snapper.x= x + 56
	    snapper.y= y + dogy - 8 + adjust
	}
	if(lapbg == 1) {
	    tilex+= bgspeed
	    if(tilex > -20) {
	        tile_layer_shift(1000000, -240, 0)
	        tilex-= 240
	    }
	    tile_layer_shift(1000000, bgspeed, 0)
	}
	view_yview[0]= 0

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
