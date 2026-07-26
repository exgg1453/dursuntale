# Auto-converted from GameMaker: obj_backgrounder_castle
# GM parent: obj_backgrounder_parent
extends Node2D

func _ready():
	scrollspeed= 0.08
	repeat(10)  {
	    rr= round(random(get_viewport_rect().size.x / 6))
	    rr*= 6
	    star= instance_create(rr, 2, 122/* obj_waterstar_bg */)
	    star.size= 0.9 + random(0.3)
	}
	repeat(20)  {
	    rr= round(random(get_viewport_rect().size.x / 6))
	    rr*= 6
	    star= instance_create(rr, 2, 122/* obj_waterstar_bg */)
	    star.size= 0.5 + random(0.4)
	}
	repeat(40)  {
	    rr= round(random(get_viewport_rect().size.x / 6))
	    rr*= 6
	    star= instance_create(rr, 2, 122/* obj_waterstar_bg */)
	    star.size= 0.4 + random(0.3)
	}
	background_x[4]= 200
	if(instance_exists(1570/* obj_mainchara */)) {
	    // obj_mainchara
	    with(1570) {
	        if(rsprite == 1045) {
	            rsprite= 1028
	            lsprite= 1029
	            dsprite= 1031
	            usprite= 1030
	        }
	    }
	}

func _gm_event_7_10():
	if(view_xview[0] >= 0)
	    background_x[4]= 200 + round(view_xview[0] - view_xview[0] * scrollspeed)
	gg= get_viewport_rect().size.x - view_wview[0]
	if(view_xview[0] >= gg)
	    background_x[4]= 200 + round(gg - gg * scrollspeed)

func _on_outside_room():
	draw_set_color(0)
	draw_rectangle(140, 195, get_viewport_rect().size.x - 150, 241, 0)

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
