# Auto-converted from GameMaker: obj_transheart_fake
extends Node2D

func _ready():
	image_speed= 0
	xx= view_xview[view_current]
	yy= view_yview[view_current]
	scale.x= 0.5
	scale.y= 0.5
	mode= 0
	$Alarm0.start((1) / 30.0)
	clapper= 1
	claps= 0
	if(GS.transtype == 0) {
	    clapper= 0
	    mychoicex= xx + 160 - 3
	    mychoicey= yy + 211 + 1
	    snd_play(105/* snd_battlefall */)
	    event_user(0)
	}
	if(GS.transtype == 1) {
	    sprite_index= 2258/* spr_allsoul */
	    frame= 0
	    mychoicex= xx + 110
	    mychoicey= yy + 100
	    x= mychoicex + 30
	    y= mychoicey - 20
	}
	if(GS.transtype == 2) {
	    sprite_index= 2258/* spr_allsoul */
	    frame= 1
	    mychoicex= xx + 210
	    mychoicey= yy + 100
	    x= mychoicex - 30
	    y= mychoicey - 20
	}
	if(GS.transtype == 3) {
	    sprite_index= 2258/* spr_allsoul */
	    frame= 2
	    mychoicex= xx + 90
	    mychoicey= yy + 60
	    x= mychoicex + 30
	    y= mychoicey
	}
	if(GS.transtype == 4) {
	    sprite_index= 2258/* spr_allsoul */
	    frame= 3
	    mychoicex= xx + 230
	    mychoicey= yy + 60
	    x= mychoicex - 30
	    y= mychoicey
	}
	if(GS.transtype == 5) {
	    sprite_index= 2258/* spr_allsoul */
	    frame= 4
	    mychoicex= xx + 110
	    mychoicey= yy + 20
	    x= mychoicex + 30
	    y= mychoicey + 20
	}
	if(GS.transtype == 6) {
	    sprite_index= 2258/* spr_allsoul */
	    frame= 5
	    mychoicex= xx + 210
	    mychoicey= yy + 20
	    x= mychoicex - 30
	    y= mychoicey + 20
	}
	if(clapper == 1) {
	    mychoicex-= 4
	    xx-= 4
	    $Alarm4.start((2) / 30.0)
	    snd_play(106/* snd_noise */)
	}

func _gm_event_2_4():
	if(visible == 1) visible= 0
	else  {
	    visible= 1
	    claps++
	    snd_stop(106)
	    snd_play(106/* snd_noise */)
	}
	if(claps < 2) $Alarm4.start((2) / 30.0)

func _process(delta: float):
	if(abs(x - mychoicex) < speed and abs(y - mychoicey) < speed) {
	    x= round(mychoicex)
	    y= round(mychoicey)
	    speed= 0
	}

func _gm_event_7_10():
	spdr= distance_to_point(mychoicex, mychoicey) / 17
	move_towards_point(mychoicex, mychoicey, spdr)

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
