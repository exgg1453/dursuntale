# Auto-converted from GameMaker: obj_onionbody
extends Node2D

func _ready():
	on= 0
	onion_blue_alpha= 0
	onionh= 0
	GS.flag[20]= 0
	siner= 0
	special= 1
	follow= 0

func _gm_event_7_12():
	ot= instance_create(x + 40, y, 1078/* obj_oniont */)
	ot.type= 4
	ot.on= 2

func _on_outside_room():
	siner++
	if(on >= 1 and on <= 4) {
	    if(on == 1 and special == 1) {
	        special= 2
	        tenta1= instance_create(x - 32, y, 1078/* obj_oniont */)
	        tenta1.on= 1
	        tenta1.type= 2
	        tenta1.special= 1
	        tenta2= instance_create(x + 8, y + 20, 1078/* obj_oniont */)
	        tenta2.on= 1
	        tenta2.type= 3
	        tenta2.special= 1
	    }
	    if((on == 1 or on == 2 or on == 3) and onion_blue_alpha < 1)
	        onion_blue_alpha+= 0.05
	    draw_sprite_ext(1530/* spr_onionblue */, 0, x, y, 0.1 + onion_blue_alpha + sin(siner / 4) * 0.05, onion_blue_alpha + sin(siner / 4) * 0.05, 0, 16777215, onion_blue_alpha)
	}
	if(on == 2 or on == 3 or on == 4) {
	    if(GS.flag[20] == 0) onionsprite= 1537
	    if(GS.flag[20] == 1) onionsprite= 1538
	    if(GS.flag[20] == 2) onionsprite= 1540
	    if(GS.flag[20] == 3) onionsprite= 1539
	    draw_sprite_part(onionsprite, floor(siner / 6), 0, 0, 63, floor(onionh), x - 32, y - floor(onionh))
	    if((on == 2 or on == 3) and onionh < 63)
	        onionh+= 0.5
	    if(on == 4) {
	        if(onionh > 0) onionh-= 0.5
	        else  {
	            if(onion_blue_alpha > 0)
	                onion_blue_alpha-= 0.05
	        }
	    }
	}
	if(follow == 1) {
	    if(x < 162) {
	        x= 162
	        velocity.x= 0
	    }
	    if(x > 1048) {
	        x= 1048
	        velocity.x= 0
	    }
	    if(x < obj_mainchara.x - 4) {
	        velocity.x+= 0.17
	        x++
	    }
	    if(x > obj_mainchara.x + 6) {
	        velocity.x-= 0.17
	        x--
	    }
	    friction= 0.1
	    x= floor(x)
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
