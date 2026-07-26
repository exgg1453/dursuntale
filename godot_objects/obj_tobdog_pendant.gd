# Auto-converted from GameMaker: obj_tobdog_pendant
extends Node2D

func _ready():
	image_speed= 0
	con= 0

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(con == 1) {
	    image_speed= 0.25
	    x+= random(2) - 1
	    y+= random(2) - 1
	    move_towards_point(obj_rarependant.x - 4, obj_rarependant.y - 5, 2)
	}
	if(con == 1) {
	    if(velocity.x > 0) sprite_index= 1525/* spr_tobdogr */
	    else  sprite_index= 1520/* spr_tobdogl */
	    if(abs(distance_to_point(obj_rarependant.x - 4, obj_rarependant.y - 5)) < 2) {
	        con= 2
	        $Alarm4.start((30) / 30.0)
	    }
	}
	if(con == 2 or con == 3 or con == 4) {
	    image_speed= 0.25
	    x= obj_rarependant.x - 4
	    y= obj_rarependant.y - 5
	    x+= random(1) - 0.5
	    y+= random(1.2) - 0.5
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    con= 5
	    $Alarm4.start((90) / 30.0)
	}
	if(con == 5) {
	    move_towards_point(x + 400, y + 100, 2)
	    x+= 1 - random(2)
	    y+= 1 - random(2)
	    if(velocity.x > 0) sprite_index= 1525/* spr_tobdogr */
	    else  sprite_index= 1520/* spr_tobdogl */
	}
	if(con == 6) {
	    obj_rarependant.con= 5
	    con= 7
	}
	if(con == 3) {
	    // obj_rarependant
	    with(1147) frame= 1
	    GS.typer= 5
	    GS.facechoice= 0
	    GS.msc= 0
	    GS.msg[0]= "* (The dog absorbs the&  artifact.)/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 4
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
