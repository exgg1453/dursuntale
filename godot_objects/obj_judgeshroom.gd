# Auto-converted from GameMaker: obj_judgeshroom
# GM parent: obj_readablesolid
extends CharacterBody2D

func _ready():
	myinteract= 0
	facing= 0
	talkedto= 0
	image_speed= 0
	scr_depth()
	if(GS.flag[270] == 0) GS.flag[270]= 1
	if(scr_murderlv() >= 10) instance_destroy()
	con= 0
	buffer= 0

func _gm_event_2_4():
	con++

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 28
	GS.facechoice= 0
	GS.faceemotion= 0
	if(GS.flag[269] == 1) GS.msg[0]= "* hOIVS!/%%"
	else  {
	    GS.msg[0]= "* p..^1.&* tem heard human allergics&  to tem.../"
	    GS.msg[1]= "* dat OK..^1.&* tem understan.../"
	    GS.msg[2]= "* tem..^1.&* ALSO allergic to tem!!!/%%"
	    con= 2
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)
	talkedto++

func _process(delta: float):
	scr_depth(0, 0, 0, 0, 0)
	buffer--
	if(myinteract == 1 and buffer >= 0) myinteract= 0
	if(con == 0 and myinteract == 1 and GS.interact == 0 and buffer < 0) {
	    caster_pause(GS.currentsong)
	    con= 1
	    GS.interact= 1
	    sprite_index= 980/* spr_mushroomdance_prep */
	    frame= 0
	}
	if(con == 1) {
	    frame+= 0.25
	    if(frame >= 4) {
	        GS.msg[0]= "* Mushroom danc^2e&* Mushroom danc^2e&* Whatever could it mean/%%"
	        scr_regulartext()
	        con= 2
	        caster_loop(133, 1, 1)
	        remx= x
	        siner= 0
	        frame= 0
	        image_speed= 0.2
	        sprite_index= 979/* spr_mushroomdance_mid */
	    }
	}
	if(con == 2) {
	    siner++
	    x= remx + sin(siner / 6) * 2
	}
	if(con == 9) {
	    GS.msg[0]= "* It symbolizes my inner&  pain./%%"
	    GS.msg[0]= "* It symbolizes my inner&  torment^1, trapped here&  by my hyphae./"
	    GS.msg[1]= "* My struggle to pull away^1.&* My struggle to escape^1.&* But alas^1, to no avail./%%"
	    if(talkedto > 0) {
	        GS.msg[0]= "* If only I could see the&  world above./"
	        GS.msg[1]= "* But even if the barrier&  was open^1, how would I&  leave...?/%%"
	    }
	    if(GS.kills > 0) {
	        GS.msg[0]= "* It means you\'ve lived a&  life of sin./%%"
	        if(talkedto > 0)
	            GS.msg[0]= "* It means..^1.&* Don\'t talk to me./%%"
	    }
	    if(GS.flag[7] == 1) {
	        GS.msg[0]= "* It symbolizes my unbridled&  happiness./"
	        GS.msg[1]= "* The government told me&  they are willing to&  transplant me outside!/"
	        GS.msg[2]= "* Why didn\'t you smile at my&  dance^1? It almost feels&  a little rude.../%%"
	    }
	    scr_regulartext()
	    con= 10
	}
	if(con == 7) {
	    frame= 2
	    con= 8
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 5) {
	    frame= 1
	    con= 6
	    $Alarm4.start((1) / 30.0)
	}
	if(con == 2 and not instance_exists(782/* OBJ_WRITER */)) {
	    caster_stop(133)
	    frame= 0
	    image_speed= 0
	    if(x < remx) x++
	    if(x > remx) x--
	    if(abs(x - remx) < 1.5) {
	        image_speed= 0
	        x= remx
	        sprite_index= 978/* spr_mushroomdance_end */
	        frame= 0
	        con= 4
	        $Alarm4.start((40) / 30.0)
	    }
	}
	if(con == 10 and not instance_exists(782/* OBJ_WRITER */)) {
	    talkedto++
	    sprite_index= 980/* spr_mushroomdance_prep */
	    frame= 0
	    con= 0
	    GS.interact= 0
	    myinteract= 0
	    buffer= 5
	    caster_resume(GS.currentsong)
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
