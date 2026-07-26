# Auto-converted from GameMaker: obj_rotategen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	myself= -1
	number= GS.bulletvariable[0]
	radius= GS.bulletvariable[1]
	bullettype= GS.bulletvariable[2]
	angle= 0
	angleadd= 360 / number

func _process_end(delta: float):
	if(GS.turntimer < 1) {
	    GS.turntimer= -1
	    if(GS.mnfight == 2) GS.mnfight= 3
	    instance_destroy()
	}

func _process(delta: float):
	while(angle < 360) {
	    iii= _spawn("bullettype", x, y)
	    if(is_instance_valid(iii)) {
	        iii.angleadd= angleadd
	        iii.angle= angle
	        iii.dmg= GS.monsteratk[myself]
	    }
	    x+= lengthdir_x(radius, angle)
	    y+= lengthdir_y(radius, angle)
	    angle+= angleadd
	}
	instance_destroy()

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
