# Auto-converted from GameMaker: obj_credits_short
extends Node2D

func _ready():
	number= -1
	ii= caster_load("music/intronoise.ogg")
	caster_play(ii, 1, 1)
	$Alarm5.start((150) / 30.0)
	rot= 0
	phonecalls= 0
	GS.filechoice= 0
	ini_open("undertale.ini")
	ini_write_real("FFFFF", "E", 0)
	ini_write_real("FFFFF", "F", 0)
	won= ini_read_real("General", "Won", 0)
	ini_write_real("General", "Won", won + 1)
	ini_close()

func _gm_event_2_7():
	instance_create(0, 0, 134/* obj_mainend */)
	instance_destroy()

func _gm_event_2_6():
	snd_play(104/* snd_phone */)
	$Alarm7.start((20) / 30.0)

func _gm_event_2_5():
	caster_play(ii, 1, 1)
	number++
	if(number < 6) $Alarm5.start((130) / 30.0)
	else  $Alarm6.start((200) / 30.0)

func _on_outside_room():
	draw_set_color(16777215)
	draw_set_font(2)
	if(number == -1)
	    draw_sprite_ext(sprite_index, frame, x, y, 1, 1, rot, 16777215, 1)
	if(number == 0) draw_text_transformed(90, 90, "By Toby Fox", 2, 2, 0)
	if(number == 1) {
	    draw_set_color(65535)
	    draw_text(86, 30, "Logo Design#Cutscene Artist#Overworld Artist+#Animator (Area 1.2.3)#Shop Artist (Area 2.3)#Tile Artist (Area 2)")
	    draw_set_color(16777215)
	    draw_text_transformed(40, 130, "Temmie Chang", 2, 2, 0)
	}
	if(number == 2) {
	    draw_set_color(65535)
	    draw_text(60, 34, "Tile Artist (Area3+4)#And Hypertester")
	    draw_set_color(16777215)
	    draw_text(90, 74, "Kenju")
	    draw_set_color(65535)
	    draw_text(60, 104, "Main BG Artist")
	    draw_set_color(16777215)
	    draw_text(90, 124, "Merrigo")
	    draw_set_color(65535)
	    draw_text(60, 154, "Assistant Monster Designer")
	    draw_set_color(16777215)
	    draw_text(90, 174, "Magnolia Porter")
	}
	if(number == 3) {
	    draw_set_color(65535)
	    draw_text(60, 24, "Extra Art and Testing")
	    draw_set_color(16777215)
	    draw_text(90, 44, "Gigi DG#Drak#Clairevoire")
	    draw_set_color(65535)
	    draw_text(60, 104, "Misc. Art")
	    draw_set_color(16777215)
	    draw_text(90, 124, "Easynam (Tile Area 1)#Guzusuru (Asgore Spear Reveal)")
	    draw_set_color(65535)
	    draw_text(60, 164, "Guest Monster Designs")
	    draw_set_color(16777215)
	    draw_text(90, 184, "" + chr(ord('"')) + "Muffet" + chr(ord('"')) + " - Michelle Czajkowski#" + chr(ord('"')) + "Woshua" + chr(ord('"')) + " - Inspired by OMOCAT")
	}
	if(number == 4) {
	    draw_set_color(65535)
	    draw_text(60, 20, "Photoshop#Flowey Battle Co-design")
	    draw_set_color(16777215)
	    draw_text(90, 55, "Everdraed")
	    draw_set_color(65535)
	    draw_text(60, 95, "Programming Help")
	    draw_set_color(16777215)
	    draw_text(90, 115, "Flashygoodness#Leon Arnott")
	    draw_set_color(65535)
	    draw_text(60, 165, "Other Monster Designs")
	    draw_set_color(16777215)
	    draw_text(90, 185, "Mike Reid#????????????")
	}
	if(number == 5) {
	    draw_set_color(65535)
	    draw_text(60, 24, "Guest NPC Concepts")
	    draw_set_color(16777215)
	    draw_text(90, 44, "Mushroom " + chr(ord('"')) + "Ragel" + chr(ord('"')) + " - Alexander Sward#" + chr(ord('"')) + "Sam Byool" + chr(ord('"')) + " - Ahmed Almutawa#Bah! " + chr(ord('"')) + "Puzzle Guy" + chr(ord('"')) + " - Summer Wine#Stars..? " + chr(ord('"')) + "Loren" + chr(ord('"')) + " - Colin MacDougall#Comedian Dad - Braxton Harris")
	    draw_set_color(65535)
	    draw_text(60, 135, "Guitar")
	    draw_set_color(16777215)
	    draw_text(90, 155, "Stephanie MacIntire")
	    draw_set_color(65535)
	    draw_text(60, 185, "Bratty & Catty Help")
	    draw_set_color(16777215)
	    draw_text(90, 205, "IPGD")
	}
	if(won >= 1 and keyboard_multicheck(0/* NOKEY */) and alarm[5] > 20)
	    $Alarm5.start((20) / 30.0)

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
