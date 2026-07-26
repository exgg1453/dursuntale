# Auto-converted from GameMaker: obj_fisttargettest
# GM parent: obj_battlethingparent
extends Node2D

func _ready():
	myscore= 0
	check= 274
	thensc= 0
	fatalx= 274 + x
	wherex= -80
	lr= choose(0, 1)
	factor= choose(20, 40, 60)
	factor+= 30
	if(lr == 0) {
	    event_user(4)
	    wherex= -80 + factor
	    event_user(4)
	    wherex= -80 + factor * 2
	    event_user(4)
	}
	if(lr == 1) {
	    event_user(5)
	    wherex= -80 + factor
	    event_user(5)
	    wherex= -80 + factor * 2
	    event_user(5)
	}

func _gm_event_7_15():
	newtarg= instance_create(x + sprite_width + wherex, y, 722/* obj_ztarget */)
	newtarg.velocity.x= -12
	newtarg.priority= instance_number(719) - 1
	newtarg.fatalx= fatalx

func _gm_event_7_14():
	newtarg= instance_create(x - wherex, y, 721/* obj_xtarget */)
	newtarg.velocity.x= 12
	newtarg.priority= instance_number(719) - 1
	newtarg.fatalx= fatalx

func _gm_event_7_13():
	thensc= 0
	sc= abs(floor(check.x / check.velocity.x) - floor(fatalx / check.velocity.x))
	if(sc < 26) thensc= 10
	if(sc < 20) thensc= 15
	if(sc < 16) thensc= 30
	if(sc < 12) thensc= 50
	if(sc < 8) thensc= 75
	if(sc < 5) thensc= 83
	if(sc < 3) thensc= 90
	if(sc < 2) thensc= 95
	if(sc < 1) {
	    thensc= 110
	    check.x= fatalx
	}
	myscore+= thensc
	fadebar= instance_create(check.x, check.y, 720/* obj_fadebar */)
	if(sc < 1) {
	    fadebar.frame= 2
	    fadebar.image_speed= 1
	    snd_play(54/* snd_victor */)
	} else  {
	    if(sc < 5) {
	        fadebar.frame= 1
	        snd_play(55/* snd_hit */)
	    }
	}
	with(check) instance_destroy()

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, 16777215, modulate.a)
	draw_set_color(32768)
	draw_text(0, 0, myscore)
	if(myscore > 400) {
	    draw_set_color(65535)
	    draw_text(0, 100, "critical  hit!")
	}
	if(myscore > 430) {
	    draw_set_color(255)
	    draw_text(200, 200, "CRITICAL HIT!!!")
	}

func _gm_event_9_13():
	room_restart()

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
