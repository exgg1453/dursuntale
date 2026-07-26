# Auto-converted from GameMaker: obj_darksink
# GM parent: obj_readable
extends Node2D

func _ready():
	acon= 0
	wcon= 0
	anim= 0
	aanim= 0
	scr_depth()
	myinteract= 0
	dont= 0
	how_bad_me_key= 0
	event_user(0)
	kanim= 0

func _gm_event_2_4():
	acon++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	dont= 0
	GS.msg[0]= "* Error./%%"
	if(how_bad_me_key == 0) {
	    if(wcon == 0 and GS.flag[486] != 2) {
	        GS.msg[0]= "* (You turned on the sink.)/%%"
	        if(GS.flag[486] == 13)
	            GS.msg[0]= "* (You really like to wash&  your hands.)/%%"
	        caster_stop(water)
	        caster_loop(water, 0.6, 2.2)
	        GS.flag[486]++
	        wcon= 1
	    } else  {
	        if(wcon == 1) {
	            GS.msg[0]= "* (You turned off the sink.)/%%"
	            caster_stop(water)
	            wcon= 0
	        } else  {
	            if(GS.flag[486] == 2 and GS.flag[481] == 0) {
	                // obj_mainchara
	                with(1570) uncan= 1
	                dont= 1
	                z_index-= 3
	                GS.msg[0]= "* (You turned on the sink.)/%%"
	            }
	        }
	    }
	} else  {
	    how_bad_me_key= 0
	    GS.msg[0]= "* (There\'s a red key lying&  in the sink.)/"
	    GS.msg[1]= "* (You took it and put it&  on your keychain.)/%%"
	    GS.flag[487]= 0
	    GS.flag[481]= 2
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _gm_event_7_10():
	if(GS.flag[487] > 0) {
	    if(GS.flag[487] == 1 and x < 81) how_bad_me_key= 1
	    if(GS.flag[487] == 2 and x > 81 and x < 101)
	        how_bad_me_key= 1
	    if(GS.flag[487] == 3 and x > 110) how_bad_me_key= 1
	}

func _gm_event_7_5():
	caster_free(water)

func _gm_event_7_4():
	water= caster_load("music/ambientwater.ogg")

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	if(dont == 1 and not instance_exists(782/* OBJ_WRITER */)) {
	    GS.interact= 1
	    dont= 2
	    // obj_darksink
	    with(1561) caster_stop(water)
	    caster_pause(GS.currentsong)
	    acon= 1
	}
	if(acon > 0) {
	    wcon= 0
	    if(acon == 1) {
	        if(aanim < 14) aanim+= 0.1
	        else  {
	            aanim= 14
	            acon= 2
	            $Alarm4.start((50) / 30.0)
	        }
	    }
	    if(acon == 3) {
	        tr= caster_load("music/sfx_generate.ogg")
	        caster_play(tr, 0.9, 0.75)
	        aanim= 0
	        acon= 4
	        $Alarm4.start((50) / 30.0)
	    }
	    if(acon == 4) {
	        aanim+= 0.334
	        if(aanim >= 7) aanim-= 2
	    }
	    if(acon == 5) {
	        caster_free(tr)
	        GS.battlegroup= 85
	        GS.mercy= 1
	        GS.border= 0
	        GS.flag[16]= 0
	        instance_create(0, 0, 142/* obj_battler */)
	        acon= 6
	        $Alarm4.start((32) / 30.0)
	    }
	    if(acon < 7) GS.interact= 1
	    if(acon == 7) {
	        // obj_mainchara
	        with(1570) uncan= 0
	        GS.mercy= 0
	        caster_resume(GS.currentsong)
	        // obj_darksink
	        with(1561) wcon= 0
	        myinteract= 0
	        $Alarm4.start((10) / 30.0)
	        GS.flag[486]= 10
	        GS.flag[487]= 3
	        if(obj_mainchara.x < 110) GS.flag[487]= 2
	        if(obj_mainchara.x < 75) GS.flag[487]= 1
	        event_user(0)
	        GS.flag[481]= 1
	        acon= -10
	    }
	    if(acon == 1 or acon == 2)
	        draw_sprite(2124/* spr_amalgam_sink1 */, floor(aanim), x + 6, y)
	    if(acon == 4 or acon == 5 or acon == 6)
	        draw_sprite(2125/* spr_amalgam_sink2 */, floor(aanim), x + 6, y)
	}
	if(wcon == 1) {
	    anim++
	    draw_sprite(2123/* spr_sink_water */, floor(anim / 3), x + 10, y)
	}
	if(how_bad_me_key == 1) {
	    kanim+= 0.1
	    draw_sprite_ext(2110/* spr_leverkey */, floor(kanim), x + 13, y + 6, 1, 1, 0, 255, 1)
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
