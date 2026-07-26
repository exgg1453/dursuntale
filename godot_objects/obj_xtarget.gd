# Auto-converted from GameMaker: obj_xtarget
# GM parent: obj_targetparent
extends Node2D

func _ready():
	priority= 999
	fatalx= 360
	image_speed= 0
	frame= 1

func _process(delta: float):
	if(priority < 0) priority= 0
	if(x > fatalx) {
	    modulate.a-= 0.2
	    if(modulate.a < 0.1) {
	        modulate.a= 0
	        if(instance_exists(719/* obj_targetparent */)) {
	            // obj_targetparent
	            with(719) priority--
	        }
	        instance_destroy()
	        priority= 999999
	        exit
	    }
	}
	if(priority == 0) {
	    frame= 0
	    if(keyboard_multicheck_pressed(0/* NOKEY */)) {
	        modulate.a= 1
	        image_speed= 0.5
	        obj_battlethingparent.check= id
	        // obj_battlethingparent
	        with(718) event_user(3)
	        keyboard_clear(13/* ENTER */)
	        keyboard_clear(90/* Z */)
	        // obj_targetparent
	        with(719) event_user(1)
	    }
	}

func _gm_event_7_11():
	priority--

func _on_outside_room():
	draw_sprite_ext(sprite_index, frame, x, y, 1, 1, 0, 16777215, modulate.a)

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
