# Auto-converted from GameMaker: obj_dogringbell
# GM parent: obj_interactable
extends CharacterBody2D

func _ready():
	if(GS.flag[52] == 1) instance_destroy()
	if(GS.plot >= 64) {
	    instance_create(x, y, 946/* obj_spagnot */)
	    instance_destroy()
	}
	myinteract= 0
	conversation= 0
	td= 0

func _gm_event_2_5():
	snd_stop(28)
	snd_play(28/* snd_bell */)

func _on_destroy():
	if(conversation == 3) conversation= 4
	if(conversation == 5.6) conversation= 6
	if(conversation == 8) conversation= 9

func _process(delta: float):
	if(GS.plot < 42) myinteract= 0
	if(myinteract == 1 and conversation == 0) {
	    if(GS.flag[52] == 1) {
	        if(not snd_isplaying(28/* snd_bell */)) snd_play(28/* snd_bell */)
	        conversation= 0
	        myinteract= 0
	    } else  {
	        GS.interact= 1
	        myinteract= 3
	    }
	}
	if(conversation == 0 and myinteract == 3) {
	    snd_play(28/* snd_bell */)
	    $Alarm5.start((12) / 30.0)
	    GS.interact= 1
	    scale.y= 1
	    visible= 1
	    sprite_index= 1295/* spr_movedoge_o */
	    image_speed= 0.1
	    y= 150
	    velocity.y= -0.5
	    conversation= 2
	}
	if(conversation == 2 and y <= 120) {
	    y= 120
	    $Alarm0.start((20) / 30.0)
	    conversation= 3
	    velocity.y= 0
	}
	if(conversation == 4) {
	    GS.msg[0]= "* Hello^1?&* Is anybody there...^1?&* No?/%%"
	    if(td == 1)
	        GS.msg[0]= "* Are you two playing a trick&  on me^1?&* Real funny./%%"
	    if(td == 2)
	        GS.msg[0]= "* Big guy^1?&* Is that you^1?&* Come on.../%%"
	    if(td == 3)
	        GS.msg[0]= "* Well^1, it\'s not the tall&  skeleton..^1.&* He\'s too loud./%%"
	    if(td == 4)
	        GS.msg[0]= "* Whoever you are^1, knock it&  off!!!/%%"
	    if(td > 4) GS.msg[0]= "* .../%%"
	    scr_regulartext()
	    conversation= 7
	    td++
	}
	if(conversation == 7 and not instance_exists(782/* OBJ_WRITER */)) {
	    velocity.y= 1
	    $Alarm0.start((20) / 30.0)
	    conversation= 8
	}
	if(conversation == 9) {
	    visible= 0
	    sprite_index= 1057/* spr_event */
	    velocity.y= 0
	    y= 140
	    conversation= 0
	    GS.interact= 0
	    myinteract= 0
	}

func _on_outside_room():
	draw_self_custom(0, get_viewport_rect().size.x, 0, obj_dogehouse.y + 62)

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
