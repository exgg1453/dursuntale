# Auto-converted from GameMaker: obj_quickgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	siner= 0
	if(GS.flag[370] == 1) {
	    firingspeed= 3
	    $Alarm0.start((1) / 30.0)
	    dmg= 9
	    siner= 0
	    GS.turntimer= 45
	}
	if(GS.flag[370] == 2 or GS.flag[370] == 3) {
	    GS.turntimer= 55
	    i= 0
	    while(i < 3) {
	        obj_fakeheart.x= GS.idealborder[0] + 50
	        b= choose(1, 2)
	        bb= instance_create(550 + i * 100, GS.idealborder[2], 677/* obj_bluelaser_b */)
	        bb.blue= b
	        bb.velocity.x= -12
	        i++
	    }
	}

func _on_destroy():
	blt= instance_create(GS.idealborder[0] + 10 + random(c_borderwidth(0) - 10), GS.idealborder[2] - 80, 673/* blt_uspear */)
	snd_play(20/* snd_arrow */)
	blt.dmg= dmg
	$Alarm0.start((firingspeed) / 30.0)

func _gm_event_7_0():
	if(instance_exists(674/* blt_muscbul */))
	    blt_muscbul.velocity.y-= 0.04
	GS.turntimer--
	siner++
	if(GS.turntimer < 8) {
	    room_goto(GS.currentroom)
	    GS.invc= 0
	}
	if(GS.turntimer < 12) instance_create(0, 0, 149/* obj_unfader */)

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
