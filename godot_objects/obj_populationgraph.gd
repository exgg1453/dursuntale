# Auto-converted from GameMaker: obj_populationgraph
# GM parent: obj_graphparent
extends Node2D

func _ready():
	die= 0
	i= 0
	while(i < 8) {
	    point[i]= random(50)
	    i++
	}
	off= 0
	tough= 0

func _on_outside_room():
	if(tough == 0) {
	    draw_set_color(4235519)
	    i= 0
	    while(i < 7) {
	        draw_line_width(x + i * 10 - off, y + point[i], x + i * 10 + 10 - off, y + point[i + 1], 2)
	        i++
	    }
	    off++
	    if(off > 9) {
	        i= 0
	        while(i < 7) {
	            point[i]= point[i + 1]
	            i++
	        }
	        point[7]= random(50)
	        off= 0
	    }
	    draw_set_color(16777215)
	    draw_rectangle(x - 10, y - 20, x + 70, y + 60, 1)
	    draw_set_font(1)
	    draw_text(x - 20, y - 50, "POPULATION")
	}
	if(tough == 1) {
	    draw_set_color(255)
	    i= 0
	    while(i < 7) {
	        draw_line_width(x + i * 10 - off, y + point[i], x + i * 10 + 10 - off, y + point[i + 1], 2)
	        i++
	    }
	    off+= 3
	    if(off > 9) {
	        i= 0
	        while(i < 7) {
	            point[i]= point[i + 1]
	            i++
	        }
	        point[7]= random(80)
	        off= 0
	    }
	    draw_set_color(16777215)
	    draw_rectangle(x - 10, y - 20, x + 70, y + 100, 1)
	    draw_set_font(1)
	    draw_text(x - 20, y - 50, "TENSION")
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
