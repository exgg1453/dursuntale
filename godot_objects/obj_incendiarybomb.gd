# Auto-converted from GameMaker: obj_incendiarybomb
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	velocity.x= random(4) + 0.1
	velocity.x*= choose(-1, 1)
	velocity.y= 0
	gravity_direction= 270
	gravity= 0.1

func _process(delta: float):
	on= 0
	if(x > GS.idealborder[0] and x < GS.idealborder[1])
	    on= 1
	if(y >= obj_dborder.y - 20 and y < obj_dborder.y and on == 1) {
	    bomb= instance_create(x, y, 323/* obj_incendiary */)
	    if(is_instance_valid(bomb)) {
	        bomb.number= 1
	        bomb.velocity.x= velocity.x
	        bomb.dmg= dmg
	    }
	    instance_destroy()
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
