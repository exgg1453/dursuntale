# Auto-converted from GameMaker: obj_colorlever
# GM parent: obj_readable
extends Node2D

func _ready():
	anim= 0
	type= 0
	if(room == 253) type= 1
	if(room == 259) type= 2
	if(room == 257) type= 3
	red= 0
	yel= 0
	gre= 0
	blu= 0
	myinteract= 0
	if(GS.flag[481] == 3) red= 1
	if(GS.flag[482] == 3) blu= 1
	if(GS.flag[483] == 3) gre= 1
	if(GS.flag[484] == 3) yel= 1

func _on_destroy():
	myinteract= 3
	GS.msc= 0
	GS.typer= 5
	GS.facechoice= 0
	GS.faceemotion= 0
	if(type == 0) {
	    GS.msg[0]= "* (It\'s some kind of switch.^1)&* (There\'s a red-colored&  slot in the center.)/%%"
	    if(GS.flag[481] == 3)
	        GS.msg[0]= "* (The red switch has been&  turned on.)/%%"
	    if(GS.flag[481] == 2) {
	        GS.flag[481]= 3
	        red= 1
	        snd_play(106/* snd_noise */)
	        GS.msg[0]= "* (Click!^1)&* (The red key fits perfectly&  into the slot.)/%%"
	    }
	}
	if(type == 1) {
	    GS.msg[0]= "* (It\'s some kind of switch.^1)&* (There\'s a blue-colored&  slot in the center.)/%%"
	    if(GS.flag[482] == 3)
	        GS.msg[0]= "* (The blue switch has been&  turned on.)/%%"
	    if(GS.flag[482] == 2) {
	        GS.flag[482]= 3
	        blu= 1
	        snd_play(106/* snd_noise */)
	        GS.msg[0]= "* (Click!^1)&* (The blue key fits perfectly&  into the slot.)/%%"
	    }
	}
	if(type == 2) {
	    GS.msg[0]= "* (It\'s some kind of switch.^1)&* (There\'s a green-colored&  slot in the center.)/%%"
	    if(GS.flag[483] == 3)
	        GS.msg[0]= "* (The green switch has been&  turned on.)/%%"
	    if(GS.flag[483] == 2) {
	        GS.flag[483]= 3
	        gre= 1
	        snd_play(106/* snd_noise */)
	        GS.msg[0]= "* (Click!^1)&* (The green key fits perfectly&  into the slot.)/%%"
	    }
	}
	if(type == 3) {
	    GS.msg[0]= "* (It\'s some kind of switch.^1)&* (There\'s a yellow-colored&  slot in the center.)/%%"
	    if(GS.flag[484] == 3)
	        GS.msg[0]= "* (The yellow switch has been&  turned on.)/%%"
	    if(GS.flag[484] == 2) {
	        GS.flag[484]= 3
	        yel= 1
	        snd_play(106/* snd_noise */)
	        GS.msg[0]= "* (Click!^1)&* (The yellow key fits perfectly&  into the slot.)/%%"
	    }
	}
	mydialoguer= instance_create(0, 0, 779/* obj_dialoguer */)

func _on_outside_room():
	draw_sprite(sprite_index, frame, x, y)
	anim++
	if(type == 0) {
	    if(red == 0) draw_sprite(2111/* spr_levereye_red */, 0, x + 6, y + 16)
	    if(red == 1)
	        draw_sprite(2115/* spr_levereye_red_bright */, floor(anim / 4), x + 6, y + 16)
	}
	if(type == 1) {
	    if(blu == 0) draw_sprite(2113/* spr_levereye_blue */, 0, x + 6, y + 16)
	    if(blu == 1)
	        draw_sprite(2116/* spr_levereye_blue_bright */, floor(anim / 4), x + 6, y + 16)
	}
	if(type == 2) {
	    if(gre == 0) draw_sprite(2112/* spr_levereye_green */, 0, x + 6, y + 16)
	    if(gre == 1)
	        draw_sprite(2117/* spr_levereye_green_bright */, floor(anim / 4), x + 6, y + 16)
	}
	if(type == 3) {
	    if(yel == 0) draw_sprite(2114/* spr_levereye_yellow */, 0, x + 6, y + 16)
	    if(yel == 1)
	        draw_sprite(2118/* spr_levereye_yellow_bright */, floor(anim / 4), x + 6, y + 16)
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
