# Auto-converted from GameMaker: blt_muscbul
# GM parent: blt_parent_noborder
extends Node2D

func _ready():
	if(x < 320) side= 1
	if(x > 320) {
	    side= -1
	    sprite_index= 129/* spr_muscbul1_r */
	    x-= sprite_width - 2
	}
	xs= x
	offset= 0
	velocity.y= -3
	flexspeed= 15
	$Alarm0.start((flexspeed) / 30.0)

func _on_destroy():
	ch= 0
	if(sprite_index == 128 and ch == 0) {
	    sprite_index= 130/* spr_muscbul2 */
	    ch= 1
	}
	if(sprite_index == 129 and ch == 0) {
	    sprite_index= 131/* spr_muscbul2_r */
	    ch= 1
	}
	if(sprite_index == 130 and ch == 0) {
	    sprite_index= 128/* spr_muscbul1 */
	    ch= 1
	}
	if(sprite_index == 131 and ch == 0) {
	    sprite_index= 129/* spr_muscbul1_r */
	    ch= 1
	}
	$Alarm0.start((flexspeed) / 30.0)
	if(offset == 1) velocity.y= -4

func _on_alarm_0_timeout():
	if(GS.invc < 1) {
	    dmgamt= round(dmg - (GS.df + GS.adef) / 5)
	    if(dmgamt < 1) dmgamt= 1
	    GS.hp-= dmgamt
	    snd_play(53/* snd_hurt1 */)
	    GS.hshake= 2
	    GS.shakespeed= 2
	    GS.vshake= 2
	    instance_create(0, 0, 184/* obj_shaker */)
	    GS.invc= GS.inv * 2
	    if(GS.battlegroup == 22 and GS.hp < 1)
	        obj_torielboss.sprite_index= 726/* spr_torielboss_mouthcover */
	}

func _on_outside_room():
	draw_self_border()
	if(y < 150) instance_destroy()
	if(instance_exists(694/* obj_muscbulgen */))
	    x= xs + round(sin(obj_muscbulgen.siner / 20) * 2)

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
