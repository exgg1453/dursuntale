# Auto-converted from GameMaker: obj_intromenu
extends Node2D

func _ready():
	siner_o= 0
	selected= 65
	charname= ""
	naming= 3
	selected2= 0
	selected3= 0
	q= 0
	name= ""
	iniread= ini_open("undertale.ini")
	if(ini_section_exists("General")) {
	    name= ini_read_string("General", "Name", "")
	    love= ini_read_real("General", "Love", 0)
	    time= ini_read_real("General", "Time", 0)
	    kills= ini_read_real("General", "Kills", 0)
	    roome= ini_read_real("General", "Room", 0)
	}
	hasname= 0
	if(name != "") hasname= 1
	if(hasname == 1) GS.charname= name
	ini_close()
	ini_open("undertale.ini")
	m2= file_exists("file0")
	m3= ini_read_real("Toriel", "TK", 0)
	m4= ini_read_real("Toriel", "TS", 0)
	pd= ini_read_real("Papyrus", "PD", 0)
	ud= ini_read_real("Undyne", "UD", 0)
	ad= ini_read_real("Alphys", "AD", 0)
	fd= ini_read_real("F7", "F7", 0)
	fk= ini_read_real("Flowey", "K", 0)
	truereset= ini_read_real("EndF", "EndF", 0)
	ini_close()
	mlevel= 0
	if(m2 > 0) {
	    if(m2 > 0) mlevel= 1
	    if(m4 > 0) mlevel= 2
	    if(pd > 0 and mlevel == 2) mlevel= 3
	    if(ud > 0 and mlevel == 3) mlevel= 4
	    if(ad > 0 and mlevel == 4) mlevel= 5
	    if(fd > 0 and mlevel == 5) mlevel= 6
	}
	if(truereset > 0) mlevel= 7
	if(mlevel == 0) menusong= 219
	if(mlevel == 1) menusong= 220
	if(mlevel == 2) menusong= 221
	if(mlevel == 3) menusong= 222
	if(mlevel == 4) menusong= 223
	if(mlevel == 5) menusong= 224
	if(mlevel == 6) menusong= 225
	if(mlevel == 7) menusong= 219
	if(mlevel >= 0 and mlevel <= 6) caster_loop(menusong, 0.6, 1)
	if(mlevel == 7) caster_loop(menusong, 0.1, 0.1)

func _on_outside_room():
	siner_o++
	if(naming == 3) {
	    if(mlevel > 0) draw_background(9, 0, -120)
	    if(mlevel == 1 and fk == 0) draw_sprite(1095/* spr_flowey */, 0, 147, 169)
	    if(mlevel == 2) draw_sprite(1118/* spr_chairiel */, 0, 125, 138)
	    if(mlevel == 3) {
	        draw_sprite(1119/* spr_chairiel_sleep */, siner_o / 8, 125, 138)
	        draw_sprite(1314/* spr_papyrus_d_darkbg */, 0, 241, 151)
	        draw_sprite(1357/* spr_sans_shrug1_dark */, 0, 271, 164)
	    }
	    if(mlevel == 4) {
	        draw_sprite(1119/* spr_chairiel_sleep */, siner_o / 8, 125, 138)
	        draw_sprite(1311/* spr_papyrus_cape_dark */, 0, 243, 151)
	        draw_sprite(1411/* spr_undyne_youremine_dark */, 0, 240, 103)
	        draw_sprite(1357/* spr_sans_shrug1_dark */, 0, 63, 33)
	    }
	    if(mlevel == 5) {
	        draw_sprite(1119/* spr_chairiel_sleep */, siner_o / 8, 125, 138)
	        draw_sprite(1640/* spr_alphys_d_dark */, 0, 270, 167)
	        draw_sprite(1311/* spr_papyrus_cape_dark */, 0, 272, 132)
	        draw_sprite(1411/* spr_undyne_youremine_dark */, 0, 269, 84)
	        draw_sprite(1344/* spr_out_to_lunch_sign */, 0, 20, 169)
	    }
	    if(mlevel == 6) {
	        draw_sprite(1104/* spr_toriel_d_dark */, 0, 143, 138)
	        draw_sprite(1314/* spr_papyrus_d_darkbg */, 0, 119, 147)
	        draw_sprite(1354/* spr_sans_d_dark */, 0, 172, 161)
	        draw_sprite(1405/* spr_undyne_d_dark */, 0, 99, 136)
	        draw_sprite(1639/* spr_alphys_d_dark2 */, 0, 74, 158)
	        draw_sprite(1905/* spr_asgore_d_dark */, 0, 195, 130)
	        draw_sprite(1128/* spr_napstablook_d */, 0, 9, 157)
	        draw_sprite(1666/* spr_mettex_dark */, 0, 28, 139)
	        draw_sprite(1393/* spr_mkid_d_dark */, 0, 262, 162)
	    }
	}
	script_execute(53/* scr_namingscreen */)
	if(naming == 3) {
	    draw_set_color(8421504)
	    draw_set_font(3)
	    draw_text(70, 232, "UNDERTALE v1.001 (C) Toby Fox 2015")
	}

func _gm_event_9_27():
	game_end()

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
