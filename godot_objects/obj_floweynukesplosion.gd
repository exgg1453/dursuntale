# Auto-converted from GameMaker: obj_floweynukesplosion
# GM parent: obj_floweybullet_parent
extends Node2D

func _ready():
	counter= 0
	size= 1
	velocity.x= 1
	caster_stop(139)
	caster_play(139, 1, 1)
	if(not instance_exists(1582/* obj_vsflowey_shaker */)) {
	    shk= instance_create(0, 0, 1582/* obj_vsflowey_shaker */)
	    shk.shakex= 6
	    shk.shakey= 6
	}

func _process(delta: float):
	image_speed= 2
	counter+= 2
	if((counter == 2 or counter == 3) and collision_rectangle(x + 91, y + 93, x + 128, y + 158, 1581, 0, 1))
	    event_user(12)
	if(counter >= 4 and counter <= 8 and collision_rectangle(x + 88, y + 68, x + 128, y + 158, 1581, 0, 1))
	    event_user(12)
	if(counter >= 9 and counter <= 12 and collision_rectangle(x + 80, y + 44, x + 128, y + 158, 1581, 0, 1))
	    event_user(12)
	if(counter >= 13 and counter <= 23 and collision_rectangle(x + 70, y + 28, x + 118, y + 158, 1581, 0, 1))
	    event_user(12)
	if(counter > 24) {
	    modulate.a-= 0.2
	    if(modulate.a < 0.2) instance_destroy()
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
