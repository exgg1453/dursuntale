# Auto-converted from GameMaker: obj_asrielappear
extends Node2D

func _ready():
	scale.x= 2
	scale.y= 2
	image_speed= 0
	con= 0
	$Alarm4.start((150) / 30.0)
	counter= 0
	flasher= 0
	fl= 0
	GS.inbattle= 1

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    counter++
	    if(counter == 30) frame= 1
	    if(counter == 60) frame= 2
	    if(counter == 90) frame= 3
	    if(counter == 120) frame= 2
	    if(counter == 180) frame= 4
	    if(counter == 190) frame= 5
	    if(counter == 200) frame= 6
	    if(counter == 210) frame= 7
	    if(counter == 250) frame= 9
	    if(counter == 258) frame= 8
	    if(counter == 266) frame= 9
	    if(counter == 274) frame= 8
	    if(counter == 282) frame= 9
	    if(counter == 290) frame= 8
	    if(counter == 298) frame= 9
	    if(counter == 306) frame= 8
	    if(counter == 380) {
	        con= 1.1
	        GS.typer= 85
	        GS.msc= 0
	        GS.msg[0]= "Finally./"
	        GS.msg[1]= "I was so&tired of&being a&flower./%%"
	        scr_blcon_x(x + 90, y)
	        obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	    }
	}
	if(con == 1.1 and not instance_exists(188/* obj_blconwideslave */)) {
	    con= 1.2
	    $Alarm4.start((50) / 30.0)
	}
	if(con == 2.2 and not instance_exists(188/* obj_blconwideslave */)) {
	    sprite_index= 2295/* spr_kidasriel_front */
	    x+= 2
	    y-= 2
	    frame= 0
	    con= 3
	    counter= 0
	    $Alarm4.start((40) / 30.0)
	}
	if(con == 4) {
	    counter++
	    if(counter == 15) frame= 1
	    if(counter == 30) frame= 2
	    if(counter == 45) frame= 3
	    if(counter == 90) con= 5
	}
	if(con == 5) {
	    GS.msg[0]= "Howdy!/"
	    GS.msg[1]= GS.charname + "^1,&are you&there?/"
	    GS.msg[2]= "It\'s me^1,&your&best&friend./%%"
	    scr_blcon_x(x + 90, y)
	    obj_blconwideslave.sprite_index= 18/* spr_blconsm */
	    con= 6
	}
	if(con == 6 and not instance_exists(188/* obj_blconwideslave */)) {
	    con= 7
	    $Alarm4.start((10) / 30.0)
	}
	if(con == 8) {
	    cr= caster_load("music/create.ogg")
	    caster_play(cr, 1, 1)
	    flasher= 1
	    con= 9
	    $Alarm4.start((5) / 30.0)
	}
	if(con == 10) {
	    sprite_index= 2275/* spr_asriel_afterimager_full */
	    x= 320 - sprite_width / 2
	    y= 20
	    ss= 0
	    con= 11
	    $Alarm4.start((30) / 30.0)
	}
	if(con == 12) {
	    con= 13
	    instance_create(0, 0, 1681/* obj_FinalWriter */)
	    $Alarm4.start((200) / 30.0)
	}
	if(con >= 10) {
	    ss++
	    y+= sin(ss / 6) * 0.5
	}
	if(con == 14) {
	    GS.border= 0
	    SCR_BORDERSETUP()
	    GS.battlegroup= 255
	    GS.mercy= 1
	    GS.hp= GS.maxhp
	    GS.flag[15]= 0
	    GS.seriousbattle= 1
	    get_tree().change_scene_to_file("res://godot_rooms/306.tscn")
	}

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 2, 2, 0, 16777215, modulate.a)
	if(flasher == 1) {
	    fl+= 0.2
	    draw_set_alpha(fl)
	    draw_set_color(16777215)
	    draw_rectangle(-10, -10, 999, 999, 0)
	    draw_set_alpha(1)
	    if(fl > 1.2) flasher= 2
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
