# Auto-converted from GameMaker: obj_mettnews_ticker
extends Node2D

func _ready():
	stayx= xstart - view_xview[0]
	stayy= ystart - view_yview[0]
	on= 1
	ang= 1 + random(2) * choose(1, -1)
	if(ang > 0) ang/= 2
	tx= 0
	stringer= "MTT-BRAND STILL TOP-RATED    or    SCHOOL CANCELLED OVER REACTIVATED PUZZLES    or     "
	stringer+= "SCIENTIST DISCOVERS HEALTH BENEFITS OF USING COMPUTER (JUST KIDDING LOL)   or     "
	stringer+= "LOCAL METTATON VERY RICH FAMOUS AND GORGEOUS or    "
	stringer+= "TINY VOLCANO MONSTER TRIES ITS BEST, RECEIVES TINY APPLAUSE or    "
	stringer+= "PYROPE IRONICALLY MISSES INVITATION TO THIS SCENARIO " + chr(ord('"')) + "WOULD HAVE LOVED IT" + chr(ord('"')) + "  or    "
	stringer+= "LOCAL PLANE CREATES HUGE LINE AT STORE BY SAYING " + chr(ord('"')) + "IT\'S NOT LIKE I WANT TO BUY THESE PRODUCTS OR ANYTHING" + chr(ord('"')) + " CASHIER CONFUSED   or     "
	stringer+= "HOTLAND TECHNICAL MALFUNCTIONS ACCEDE AND RECEDE IN LINEAR PROGRESSION THROUGHOUT AREA  or     "
	stringer+= "WOSHUA CLEANS UP LOCAL CRIME, LITERALLY FINDS CRIMINALS AND DOUSES THEM IN SOAP, CRIME DOESN\'T GO DOWN BUT IT SMELLS AMAZING   or   "
	stringer+= "HISTORIC NEWS TICKER HEADLINE SHORTAGE or     "
	write= 1
	doom= 0
	$Alarm2.start((1) / 30.0)
	thischara= 1570
	timertimer= 0
	voff= 0
	doomtimer= 0
	doomx= 0

func _gm_event_2_2():
	if(doom == 1) stringer= "120 SECONDS LEFT! DEFUSE 6 BOMBS!"

func _process_end(delta: float):
	if(not instance_exists(184/* obj_shaker */) and on == 1) {
	    view_xview[0]= round(obj_mainchara.x - view_wview[0] / 2 + 10)
	    view_yview[0]= round(obj_mainchara.y - view_hview[0] / 2 + 10)
	}
	if(on == 1) {
	    x= view_xview[0] + stayx
	    if(x >= get_viewport_rect().size.x - view_wview[0])
	        x= get_viewport_rect().size.x - view_wview[0]
	    y= view_yview[0] + stayy
	    if(y <= 200) y= 200
	    if(view_yview[0] <= 0) view_yview[0]= 0
	}
	if(view_yview[0] <= 0) view_yview[0]= 0

func _gm_event_7_11():
	tx= 0
	if(instance_exists(1226/* obj_doomtimer */))
	    dmx= 120 - obj_doomtimer.dx
	else  dmx= 0
	stringer= string(dmx) + " SECONDS LEFT!"
	if(doomx == 0) stringer+= " HURRY UP!"
	if(doomx == 1)
	    stringer+= " " + string(6 - GS.flag[395]) + " BOMBS LEFT!"
	if(doomx == 2)
	    stringer+= " TIME\'S RUNNING OUT!"
	if(doomx == 3)
	    stringer+= " " + string(6 - GS.flag[395]) + " BOMBS LEFT!"
	if(doomx == 4) stringer+= " DO YOUR BEST!"
	if(doomx == 5)
	    stringer+= " " + string(6 - GS.flag[395]) + " BOMBS LEFT!"
	if(doomx == 6) stringer+= " SPEED UP!"
	if(doomx == 7)
	    stringer+= " " + string(6 - GS.flag[395]) + " BOMBS LEFT!"
	if(doomx == 8) stringer+= " RUN! RUN! RUN!"
	if(doomx == 9) stringer+= " GIVE IT YOUR ALL!"
	if(doomx == 10) stringer+= " DON\'T WAIT UP!"
	doomx++
	doomtimer= 0

func _gm_event_7_4():
	event_user(1)

func _on_outside_room():
	draw_set_color(0)
	draw_rectangle(x, y - 1 + voff, x + 330, y + 242 + voff, 0)
	if(write == 1) {
	    draw_set_color(65535)
	    tx++
	    if(doom == 1) tx+= 4
	    draw_set_font(2)
	    if(doom == 0)
	        draw_text(x + 320 - tx, y + 10 + voff, stringer)
	    if(doom == 1)
	        draw_text_transformed(x + 320 - tx, y + 10 + voff, stringer, 2, 1, 0)
	}
	draw_sprite(1787/* spr_tickerlogo */, 0, x, y)
	if(doom == 1) {
	    doomtimer++
	    if(doomtimer > 150) event_user(1)
	}
	if(voff > 0) voff-= 4
	if(voff <= 0) voff= 0
	if(y > get_viewport_rect().size.y) instance_destroy()

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
