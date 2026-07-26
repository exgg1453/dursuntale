# Auto-converted from GameMaker: obj_bellblossom
# GM parent: obj_readablesolid
extends Node2D

func _ready():
	myinteract= 0
	image_speed= 0
	scr_depth()
	con= 0
	block[0]= 0
	block[1]= 0
	block[2]= 0
	block[3]= 0
	blockon= 0
	blockno= 0
	GS.flag[386]= 1

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(myinteract == 1 and con == 0 and GS.interact == 0) {
	    snd_play(28/* snd_bell */)
	    if(instance_exists(1114/* obj_waterboard */)) {
	        GS.interact= 1
	        image_speed= 0.2
	        con= 1
	        $Alarm4.start((15) / 30.0)
	    } else  {
	        image_speed= 0.2
	        con= 20
	        $Alarm4.start((15) / 30.0)
	    }
	}
	if(con == 1) {
	    GS.encounter= 0
	    finished= 0
	    if(instance_exists(1114/* obj_waterboard */)) {
	        if(obj_waterboard.using == 99) finished= 1
	        obj_waterboard.using= 99
	        // obj_waterboard
	        with(1114) modulate.a-= 0.08
	    }
	}
	if(con == 2) {
	    obj_waterboardpuzzle1.won= 0
	    i= 0
	    while(i < 4) {
	        if(block[i] > 0) {
	            with(block[i]) {
	                x= xstart
	                y= ystart
	            }
	            block[i]= 0
	        }
	        i++
	    }
	    con= 3
	    $Alarm4.start((15) / 30.0)
	}
	if(con == 3 and instance_exists(1114/* obj_waterboard */)) {
	    obj_waterboard.frame= 0
	    obj_waterboard.image_speed= 0
	    // obj_waterboard
	    with(1114) x= xstart
	    // obj_waterboard
	    with(1114) y= ystart
	    // obj_waterboard
	    with(1114) modulate.a+= 0.08
	}
	if(con == 4) {
	    if(instance_exists(1110/* obj_waterboardpuzzle1 */))
	        obj_waterboardpuzzle1.waterboard= 0
	    if(instance_exists(1114/* obj_waterboard */)) {
	        obj_waterboard.using= 0
	        obj_waterboard.myinteract= 0
	        obj_waterboard.z_index= 800000
	    }
	    myinteract= 0
	    con= 0
	    image_speed= 0
	    frame= 0
	    GS.interact= 0
	}
	if(con == 21) {
	    image_speed= 0
	    frame= 0
	    con= 0
	    myinteract= 0
	}

func _gm_event_7_10():
	blockon= 1
	block[blockno]= block2
	blockno++
	if(blockno > 3) blockno= 0

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
