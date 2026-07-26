# Auto-converted from GameMaker: obj_oniont
extends Node2D

func _ready():
	on= 0
	onion_blue_alpha= 0
	onionh= 0
	type= 0
	siner= 0
	special= 0
	follow= 0
	if(instance_exists(1570/* obj_mainchara */) and y > obj_mainchara.y)
	    scr_depth()

func _on_outside_room():
	siner++
	if(on >= 1 and on <= 4) {
	    if((on == 1 or on == 2 or on == 3) and onion_blue_alpha < 1)
	        onion_blue_alpha+= 0.1
	    draw_sprite_ext(1531/* spr_oniontblue */, 0, x, y, 0.1 + onion_blue_alpha + sin(siner / 4) * 0.05, onion_blue_alpha + sin(siner / 4) * 0.05, 0, 16777215, onion_blue_alpha)
	}
	if(on == 2 or on == 3 or on == 4) {
	    if(type == 0) sprite_index= 1532/* spr_oniont_l */
	    if(type == 1) sprite_index= 1536/* spr_oniont_r */
	    if(type == 2) sprite_index= 1534/* spr_oniont_coyl */
	    if(type == 3) sprite_index= 1535/* spr_oniont_coyd */
	    if(type == 4) sprite_index= 1533/* spr_oniont_bye */
	    if(type == 0 or type == 1 or type == 2)
	        draw_sprite_part(sprite_index, floor(siner / 6), 0, 0, sprite_width, floor(onionh), x - floor(sprite_width / 2), y - floor(onionh))
	    if(type == 3)
	        draw_sprite_part(sprite_index, floor(siner / 6), 0, 0, sprite_width, floor(onionh), x - 22, y - floor(onionh))
	    if(type == 4)
	        draw_sprite_part(sprite_index, floor(siner / 6), 0, 0, sprite_width, floor(onionh), x - 6, y - floor(onionh))
	    if((on == 2 or on == 3) and onionh < sprite_height) {
	        if(special == 0) onionh++
	        if(special == 1) onionh+= 0.25
	    }
	    if(on == 4) {
	        if(onionh > 0) onionh--
	        else  {
	            if(onion_blue_alpha > 0)
	                onion_blue_alpha-= 0.1
	        }
	    }
	}
	if(follow == 1) {
	    if(x < 162) {
	        x= xprevious
	        velocity.x= 0
	    }
	    if(x > 1048) {
	        x= xprevious
	        velocity.x= 0
	    }
	    if(x < obj_mainchara.x + 6) velocity.x+= 0.17
	    if(x > obj_mainchara.x + 16) velocity.x-= 0.17
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
