# Auto-converted from GameMaker: obj_backgrounder_pillar
extends Node2D

func _ready():
	scrollspeed= 2
	$Alarm0.start((1) / 30.0)
	x= 200

func _on_destroy():
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

func _process_end(delta: float):
	if(view_xview[0] >= 0)
	    x= 200 + floor(view_xview[0] - view_xview[0] * scrollspeed)
	gg= get_viewport_rect().size.x - view_wview[0]
	if(view_xview[0] >= gg)
	    x= 200 + floor(gg - gg * scrollspeed)

func _on_outside_room():
	i= 0
	while(i < 9) {
	    draw_sprite(sprite_index, frame, x + 230 * i, 0)
	    if(i == 5)
	        draw_sprite(sprite_index, frame, x + 230 * i + 110, 0)
	    i++
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
