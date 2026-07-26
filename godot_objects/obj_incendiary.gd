# Auto-converted from GameMaker: obj_incendiary
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	number= 12
	$Alarm0.start((1) / 30.0)
	fatal= 0

func _on_destroy():
	if(number < 12) {
	    bomb2= instance_create(x + random(8) - 4, y - 18, 323/* obj_incendiary */)
	    if(is_instance_valid(bomb2)) {
	        bomb2.velocity.x= velocity.x
	        bomb2.number= number + 1
	        bomb2.dmg= dmg
	    }
	}

func _process(delta: float):
	fatal++
	if(fatal > 10) {
	    modulate.a-= 0.1
	    if(modulate.a <= 0) instance_destroy()
	}

func _on_alarm_0_timeout():
	if(modulate.a >= 0.9) scr_damagestandard_x()

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
