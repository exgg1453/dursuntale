# Auto-converted from GameMaker: obj_giftgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	i= 0
	repeat(3)  {
	    blt[i]= instance_create(GS.idealborder[0] + 10 + i * 55, GS.idealborder[3] - 60, 640/* blt_potentiallyblue */)
	    blt[i].dmg= 7
	    blt[i].sprite_index= 70/* spr_gyftbullet */
	    blt[i].image_speed= 0
	    blt[i].sinex= -50 + i * 50
	    blt[i].x= sin(blt[i].sinex / 100 * 3.14159265358979) * (GS.idealborder[1] - GS.idealborder[0] - 45) / 2 + GS.idealborder[0] + 67
	    blt[i].xstar= blt[i].x
	    i++
	}
	bltx= floor(random(3))
	$Alarm0.start((5) / 30.0)
	siner= 0

func _gm_event_2_2():
	siner= 0
	blt[bltx].frame= 1
	blt[bltx].blue= 1
	blt_parent.velocity.y= -2
	blt_parent.velocity.x= 0
	blt_parent.friction= -0.3
	if(GS.hardmode == 1) blt_parent.friction= -0.5
	if(rr == 2) {
	    blt_parent.velocity.y= -1
	    blt_parent.friction= -0.1
	    rr= 3
	    siner= 1
	}

func _gm_event_2_1():
	blt[bltx].image_speed= 0
	blt[bltx].frame= 0
	siner= 1
	rr= floor(random(3))
	if(rr == 0) $Alarm2.start((41) / 30.0)
	if(rr == 1) $Alarm2.start((61) / 30.0)
	if(rr == 2) $Alarm2.start((21) / 30.0)

func _on_destroy():
	blt[bltx].image_speed= 0.2
	$Alarm1.start((25) / 30.0)

func _process(delta: float):
	if(siner > 0) {
	    i= 0
	    siner++
	    repeat(3)  {
	        if(rr != 3) blt[i].sinex+= 5
	        else  blt[i].sinex+= 2
	        blt[i].x= sin(blt[i].sinex / 100 * 3.14159265358979) * (GS.idealborder[1] - GS.idealborder[0] - 45) / 2 + GS.idealborder[0] + 67
	        i++
	        if(siner > 20) velocity.y-= 0.04
	    }
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
