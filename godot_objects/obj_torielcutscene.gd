# Auto-converted from GameMaker: obj_torielcutscene
extends Node2D

func _ready():
	GS.dontfade= 0
	GS.typer= 8
	image_speed= 0
	conversation= 0
	GS.faceemotion= 1
	scale.x= 2
	scale.y= 2
	action_move("000100000", 7)

func _gm_event_2_2():
	GS.border= 0
	GS.plot= 1
	GS.interact= 1
	GS.specialbattle= 1
	get_tree().change_scene_to_file("res://godot_rooms/5.tscn")

func _process(delta: float):
	if(x < get_viewport_rect().size.x / 2 - sprite_width / 2 and conversation == 0) {
	    GS.currentsong= caster_load("music/toriel.ogg")
	    caster_loop(GS.currentsong, 0.7, 0.86)
	    conversation= 1
	    velocity.x= 0
	    blcon= instance_create(x + sprite_width - 10, y + 2, 187/* obj_blconwdflowey */)
	    GS.msc= 674
	    conversation= 1
	    image_speed= 0.2
	    blconwriter= instance_create(obj_blconwdflowey.x + 40, obj_blconwdflowey.y + 10, 782/* OBJ_WRITER */)
	}
	$Alarm0.start((20) / 30.0)
	if(instance_exists(782/* OBJ_WRITER */)) {
	    if(OBJ_WRITER.halt == 0) image_speed= 0.2
	    else  {
	        image_speed= 0
	        frame= 0
	    }
	}
	if(instance_exists(782/* OBJ_WRITER */) and conversation == 1)
	    scr_textskip()
	if(not instance_exists(782/* OBJ_WRITER */) and conversation == 1) {
	    with(blcon) instance_destroy()
	    instance_create(0, 0, 149/* obj_unfader */)
	    $Alarm2.start((20) / 30.0)
	    conversation= 2
	    image_speed= 0
	    frame= 0
	    volume= 1
	}
	if(GS.faceemotion == 1) sprite_index= 722/* spr_torielside1 */
	if(GS.faceemotion == 2) sprite_index= 724/* spr_torielcutscene */

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
