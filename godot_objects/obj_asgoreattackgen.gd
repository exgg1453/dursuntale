# Auto-converted from GameMaker: obj_asgoreattackgen
extends Node2D

func _ready():
	t= 2
	$Alarm0.start((1) / 30.0)

func _on_destroy():
	gil= GS.idealborder[0]
	gir= GS.idealborder[1]
	giw= gir - gil
	giu= GS.idealborder[2]
	if(t == 1) {
	    i= 0
	    repeat(2)  {
	        j= 0
	        repeat(4)  {
	            gg= instance_create(gil + j * giw / 4 + 20 - random(10) + 10 * j, giu - 80 - 360 * i - random(90), 469/* obj_helixfiregen */)
	            gg.velocity.y= random(0.25) - random(0.25)
	            j++
	        }
	        i++
	    }
	}
	if(t == 2) {
	    i= 0
	    repeat(2)  {
	        j= 0
	        repeat(4)  {
	            gg= instance_create(gil + j * giw / 4 + 20 - random(10) + 10 * j, giu - 80 - 340 * i - random(90), 469/* obj_helixfiregen */)
	            gg.mysf= 5.5
	            gg.mysv= 3.5
	            gg.mys= random(2)
	            gg.velocity.y= 0 + random(2) - random(2)
	            j++
	        }
	        i++
	    }
	}

func _process_end(delta: float):
	if(GS.turntimer < 0) instance_destroy()

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
