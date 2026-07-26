# Auto-converted from GameMaker: obj_vertplanebullet
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	image_speed= 0
	velocity.y= 7 + random(2)
	pop= scr_monstersum()
	if(pop > 1) velocity.y= 6 + random(1)
	y= 50
	parent= 327
	$Alarm0.start((10) / 30.0)
	off= 0
	green= 0
	pop= scr_monstersum()

func _gm_event_1_0():
	if(green == 1 and is_instance_valid(kid)) {
	    with(kid) instance_destroy()
	}

func _on_destroy():
	if(y > obj_uborder.y - 10) {
	    if(off == 0) off= 1
	    else  off= 0
	    if(green == 1) off= 2
	    bl= instance_create(x + 20, y + 10, 319/* obj_exhaustbullet */)
	    if(is_instance_valid(bl)) {
	        bl.dmg= dmg
	        bl.off= off
	    }
	}
	$Alarm0.start((6) / 30.0)
	if(green == 1) $Alarm0.start((10) / 30.0)
	if(pop > 1) alarm[0]*= 1.5

func _process(delta: float):
	if(y > obj_dborder.y) instance_destroy()
	if(green == 1 and is_instance_valid(kid)) {
	    kid.x= x - 18
	    pop= scr_monstersum()
	    if(pop > 1) kid.x= x - 28
	    kid.y= y - 8
	}

func _gm_event_7_10():
	green= 1
	kid= instance_create(x - 10, y - 5, 320/* obj_vertplanegreen */)
	kid.parent= parent
	velocity.y/= 1.3

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
