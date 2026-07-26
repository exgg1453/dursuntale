# Auto-converted from GameMaker: obj_torboss_2ndtime
extends Node2D

func _ready():
	con= 0
	kneel= 0
	GS.faceemotion= 0
	image_speed= 0
	draw_u= 0
	draw_f= 0
	$Alarm1.start((1) / 30.0)

func _gm_event_2_4():
	con++

func _gm_event_2_1():
	GS.inbattle= 1

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, 1)
	if(sprite_index == 737)
	    draw_sprite_ext(835/* spr_torweird */, GS.faceemotion, x + 48, y + 58, 2, 2, 0, 16777215, 1)
	if(sprite_index == 722 or sprite_index == 735)
	    draw_sprite_ext(835/* spr_torweird */, GS.faceemotion, x + 48, y + 8, 2, 2, 0, 16777215, 1)
	if(con == 0) {
	    dogsong= caster_load("music/dogsong.ogg")
	    caster_loop(dogsong, 0.6, 1)
	    GS.flag[20]= 0
	    tobdog= instance_create(640, 240, 602/* obj_hard_dog */)
	    tobdog.y-= tobdog.sprite_height
	    tobdog.image_speed= 0.2
	    tobdog.velocity.x= -2
	    con= 1
	}
	if(con == 1 and tobdog.x < 480) {
	    tobdog.velocity.x= 0
	    tobdog.image_speed= 0
	    tobdog.frame= 0
	    tobdog.sprite_index= 834/* spr_tobdogl_talk */
	    con= 2
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 3) {
	    GS.faceemotion= 2
	    tobdog.image_speed= 0.2
	    GS.msc= 0
	    GS.typer= 33
	    GS.msg[0]= "And that\'s the&end of Hard&Mode!/%%"
	    scr_blcon(400, tobdog.y - 120, 0)
	    blcon.sprite_index= 24/* spr_blconabove */
	    con= 4
	}
	if(con == 4 and not is_instance_valid(blcon)) {
	    con= 5
	    tobdog.image_speed= 0
	    tobdog.frame= 0
	    $Alarm4.start((20) / 30.0)
	}
	if(con == 6) {
	    GS.typer= 8
	    GS.msg[0]= "\\E1Eh??/"
	    GS.msg[1]= "\\E2You are ending&it NOW?/"
	    GS.msg[2]= "\\E1And on such a&dramatic moment...?/%%"
	    GS.faceemotion= 1
	    scr_blcon(x + 120, y + 30, 0)
	    con= 7
	}
	if(con == 7 and not is_instance_valid(blcon)) {
	    con= 8
	    tobdog.image_speed= 0.2
	    GS.typer= 33
	    GS.msg[0]= "That\'s the&difficult part./"
	    GS.msg[1]= "Not the bullets./"
	    GS.msg[2]= "\\M2But^1, accepting&that it\'s all&over.../%%"
	    scr_blcon(400, tobdog.y - 120, 0)
	    blcon.sprite_index= 24/* spr_blconabove */
	}
	if(con == 8 and not is_instance_valid(blcon)) {
	    GS.flag[20]= 1
	    tobdog.image_speed= 0
	    tobdog.frame= 0
	    con= 9
	    GS.faceemotion= 3
	    GS.typer= 8
	    GS.msg[0]= "But there WILL be&more^1, will there&not?/%%"
	    scr_blcon(x + 120, y + 30, 0)
	}
	if(con == 9 and not is_instance_valid(blcon)) {
	    con= 10
	    tobdog.image_speed= 0.2
	    GS.faceemotion= 2
	    GS.typer= 33
	    GS.msg[0]= "\\M1Maybe./"
	    GS.msg[1]= "\\M2Knowing the&answer is.../"
	    GS.msg[2]= "\\M2... HARD./"
	    GS.msg[3]= "\\E4.../%%"
	    scr_blcon(400, tobdog.y - 120, 0)
	    blcon.sprite_index= 24/* spr_blconabove */
	}
	if(con == 10 and not is_instance_valid(blcon)) {
	    GS.faceemotion= 1
	    tobdog.image_speed= 0
	    tobdog.frame= 0
	    con= 11
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 12) {
	    GS.faceemotion= 0
	    sprite_index= 722/* spr_torielside1 */
	    con= 13
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 14 and not is_instance_valid(blcon)) {
	    con= 14.1
	    tobdog.image_speed= 0.2
	    GS.typer= 33
	    GS.flag[20]= 0
	    GS.msg[0]= "Hey!/"
	    GS.msg[1]= "Aren\'t you&supposed&to be dying or&something?/%%"
	    scr_blcon(400, tobdog.y - 120, 0)
	    blcon.sprite_index= 24/* spr_blconabove */
	}
	if(con == 14.1 and not is_instance_valid(blcon)) {
	    tobdog.image_speed= 0
	    tobdog.frame= 0
	    con= 15
	    GS.faceemotion= 0
	    GS.typer= 8
	    GS.msg[0]= "Well^1.&What is the point&of that now?/%%"
	    scr_blcon(x + 120, y + 30, 0)
	}
	if(con == 15 and not is_instance_valid(blcon)) {
	    con= 16
	    tobdog.image_speed= 0.2
	    GS.typer= 33
	    GS.flag[20]= 0
	    GS.msg[0]= "What will you do&instead...?/%%"
	    scr_blcon(400, tobdog.y - 120, 0)
	    blcon.sprite_index= 24/* spr_blconabove */
	}
	if(con == 16 and not is_instance_valid(blcon)) {
	    tobdog.image_speed= 0
	    tobdog.frame= 0
	    con= 17
	    GS.faceemotion= 0
	    GS.msg[0]= "Hmmm^1.&Perhaps I will&bake another pie./"
	    GS.msg[1]= "That last one ended&up a little burnt./%%"
	    GS.typer= 8
	    scr_blcon(x + 120, y + 30, 0)
	}
	if(con == 17 and not is_instance_valid(blcon)) {
	    con= 18
	    tobdog.image_speed= 0.2
	    GS.typer= 33
	    GS.msg[0]= "\\E2I thought it was&good./"
	    GS.msg[1]= "\\E1Theoretically./"
	    GS.msg[2]= "\\E4It\'s not like I&ate it all while&you were&fighting./%%"
	    scr_blcon(400, tobdog.y - 120, 0)
	    blcon.sprite_index= 24/* spr_blconabove */
	}
	if(con == 18 and not is_instance_valid(blcon)) {
	    tobdog.image_speed= 0
	    tobdog.frame= 0
	    GS.faceemotion= 1
	    con= 19
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 20) {
	    velocity.x= -3
	    con= 21
	    $Alarm4.start((180) / 30.0)
	}
	if(con == 22 and not is_instance_valid(blcon)) {
	    con= 23
	    tobdog.image_speed= 0.2
	    GS.typer= 33
	    GS.msg[0]= "Hey^1! Hey^1!&Can I have some&pie!/%%"
	    scr_blcon(400, tobdog.y - 120, 0)
	    blcon.sprite_index= 24/* spr_blconabove */
	}
	if(con == 23 and not is_instance_valid(blcon)) {
	    tobdog.velocity.x= -4
	    tobdog.sprite_index= 1520/* spr_tobdogl */
	    con= 24
	    GS.faceemotion= 0
	    GS.typer= 8
	    GS.msg[0]= "You are just going&to eat it all.../%%"
	    scr_blcon(0, y + 30, 0)
	}
	if(con >= 24 and con < 28 and tobdog.x <= 320)
	    tobdog.velocity.x= 0
	if(con == 24 and not is_instance_valid(blcon)) {
	    con= 25
	    tobdog.image_speed= 0.2
	    GS.typer= 33
	    GS.msg[0]= "I can helllp!!!/%%"
	    scr_blcon(230, tobdog.y - 120, 0)
	    blcon.sprite_index= 24/* spr_blconabove */
	}
	if(con == 25 and not is_instance_valid(blcon)) {
	    con= 26
	    GS.faceemotion= 0
	    GS.typer= 8
	    GS.msg[0]= "Snoring on the&floor is NOT help./%%"
	    scr_blcon(0, y + 30, 0)
	}
	if(con == 26 and not is_instance_valid(blcon)) {
	    con= 27
	    tobdog.image_speed= 0.2
	    GS.typer= 33
	    GS.msg[0]= "I\'m not snoring^1,&I\'m cheering you&on in my sleep!!/"
	    GS.msg[1]= ".../"
	    GS.msg[2]= "Oh^1, you\'re still&here?/"
	    GS.msg[3]= "Don\'t you have&anything better&to do?/%%"
	    scr_blcon(230, tobdog.y - 120, 0)
	    blcon.sprite_index= 24/* spr_blconabove */
	}
	if(con == 27 and not is_instance_valid(blcon)) {
	    caster_stop(dogsong)
	    in= caster_load("music/intronoise.ogg")
	    mode= caster_load("music/mode.ogg")
	    con= 28
	    tobdog.velocity.x= -4
	    $Alarm4.start((210) / 30.0)
	}
	if(con == 29) {
	    caster_play(in, 1, 1)
	    draw_u= 1
	    z_index= -40000
	    con= 30
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 31) {
	    caster_play(mode, 0.9, 1)
	    draw_u= 2
	    con= 32
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 33) {
	    caster_play(mode, 0.8, 1.2)
	    draw_u= 3
	    con= 34
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 35) {
	    caster_play(mode, 0.7, 1.6)
	    draw_u= 4
	    con= 36
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 37) {
	    caster_play(mode, 0.6, 2.2)
	    draw_u= 5
	    con= 38
	    $Alarm4.start((600) / 30.0)
	    GS.faceemotion= 0
	}
	if(con == 39) {
	    draw_f= 1
	    fx= 280
	    fy= 340
	    famt= 0
	    con= 40
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 41) {
	    GS.typer= 6
	    GS.msg[0]= "\\E0Hey./"
	    GS.msg[1]= "\\E3What\'s the hold&up!?/"
	    GS.msg[2]= "\\E9Shouldn\'t she be&dead by now!?/"
	    GS.msg[3]= "\\E1I\'ve been waiting&in that room for.../"
	    GS.msg[4]= "\\E6.../"
	    GS.msg[5]= "\\E7... Hard mode...?/"
	    GS.msg[6]= "\\E0Gee^1, you better&take a picture./"
	    GS.msg[7]= "People are gonna&think you\'re REALLY&cool./"
	    GS.msg[8]= "\\E9... NOT!/"
	    GS.msg[9]= "\\E8Golly^1, talk about&a tryhard./"
	    GS.msg[10]= "PA^1. THE^1. TIC./%%"
	    scr_blcon(fx + 90, fy, 0)
	    // OBJ_WRITER
	    with(782) z_index= -42100
	    blcon.z_index= -42000
	    con= 42
	}
	if(con == 42 and not is_instance_valid(blcon)) {
	    GS.faceemotion= 0
	    con= 42.1
	    $Alarm4.start((150) / 30.0)
	}
	if(con == 43.1) {
	    GS.msg[0]= "\\E0Uh^1, so^1, are you&gonna keep going^1,&or...?/%%"
	    scr_blcon(fx + 90, fy, 0)
	    // OBJ_WRITER
	    with(782) z_index= -42100
	    blcon.z_index= -42000
	    con= 44
	}
	if(con == 44 and not is_instance_valid(blcon)) {
	    GS.faceemotion= 1
	    con= 45
	    GS.typer= 8
	    GS.msg[0]= "It\'s over./%%"
	    scr_blcon(0, fy, 0)
	    // OBJ_WRITER
	    with(782) z_index= -42100
	    blcon.z_index= -42000
	}
	if(con == 45 and not is_instance_valid(blcon)) {
	    con= 46
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 47) {
	    GS.typer= 6
	    GS.msg[0]= "\\E8Hahaha^1!&I KNEW that!/"
	    GS.msg[1]= "Why does everyone&have to be so&condescending!?/"
	    GS.msg[2]= "\\E1.../"
	    GS.msg[3]= "\\E8So what\'s YOUR&excuse^1?&Sitting around&here...?/"
	    GS.msg[4]= "\\E0Don\'t you have&anything better to%%"
	    scr_blcon(fx + 90, fy, 0)
	    // OBJ_WRITER
	    with(782) z_index= -42100
	    blcon.z_index= -42000
	    con= 48
	}
	if(con == 48 and not is_instance_valid(blcon)) {
	    con= 50
	    GS.typer= 33
	    GS.msg[0]= "I already said&that./%%"
	    scr_blcon(0, fy, 0)
	    // OBJ_WRITER
	    with(782) z_index= -42100
	    blcon.z_index= -42000
	}
	if(con == 50 and not is_instance_valid(blcon)) {
	    con= 51
	    $Alarm4.start((120) / 30.0)
	}
	if(con == 52) {
	    draw_f= 3
	    con= 53
	    $Alarm4.start((180) / 30.0)
	    blk= 0
	}
	if(draw_u > 0) {
	    draw_set_color(0)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_halign(1)
	    if(draw_u >= 1) draw_sprite_ext(0/* spr_undertaletitle */, 0, 0, -60, 2, 2, 0, 16777215, 1)
	    if(draw_u >= 2) {
	        draw_set_color(255)
	        draw_set_font(1)
	        draw_text_transformed(320, 140, "HARD MODE", 3, 3, 20)
	    }
	    if(draw_u >= 3) {
	        draw_set_color(65535)
	        draw_set_font(1)
	        draw_text_transformed(320, 230, "Coming...", 1.5, 1.5, 0)
	    }
	    if(draw_u >= 4) {
	        draw_set_color(65535)
	        draw_set_font(1)
	        draw_text_transformed(320, 270, "Maybe,", 1, 1, 0)
	    }
	    if(draw_u >= 5) {
	        draw_set_color(65535)
	        draw_set_font(1)
	        draw_text_transformed(320, 305, "Eh. don\'t count on it.", 0.5, 0.5, 0)
	    }
	    draw_set_halign(0)
	}
	if(draw_f == 1) {
	    draw_sprite_ext(623/* spr_flowey_riseanim */, floor(famt), fx, fy, 2, 2, 0, 16777215, 1)
	    famt+= 0.5
	    if(famt >= 8) draw_f= 2
	}
	if(draw_f == 2) {
	    draw_sprite_ext(623/* spr_flowey_riseanim */, 8, fx, fy, 2, 2, 0, 16777215, 1)
	    draw_sprite_ext(646/* spr_floweyface_l3 */, GS.faceemotion, fx, fy, 2, 2, 0, 16777215, 1)
	}
	if(draw_f == 3) {
	    draw_sprite_ext(623/* spr_flowey_riseanim */, floor(famt), fx, fy, 2, 2, 0, 16777215, 1)
	    famt-= 0.5
	    if(famt <= 0) draw_f= 4
	}
	if(con == 54) {
	    draw_set_alpha(blk)
	    blk+= 0.01
	    draw_set_color(0)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    if(blk > 1.8) get_tree().change_scene_to_file("res://godot_rooms/323.tscn")
	    draw_set_alpha(1)
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
