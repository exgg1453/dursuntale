# Auto-converted from GameMaker: obj_countermiddle
# GM parent: obj_interactable
extends Node2D

func _ready():
	if(GS.plot > 134) instance_destroy()
	con= 0
	myinteract= 0
	scale.x= 1.2

func _gm_event_2_4():
	con++

func _process(delta: float):
	if(myinteract == 1 and GS.interact == 0 and con == 0) {
	    if(instance_exists(1173/* obj_mettaton_npc */) and GS.facing == 0 and obj_mettaton_npc.sugar == 1 and obj_mettaton_npc.eggs == 1 and obj_mettaton_npc.milk == 1)
	        con= 1
	    myinteract= 0
	}
	if(con == 1) {
	    GS.interact= 1
	    con= 2
	    $Alarm4.start((30) / 30.0)
	    snd_play(108/* snd_item */)
	    newx= obj_mainchara.x - 15
	    gg= instance_create(newx - 7, 374, 1363/* obj_npc_marker */)
	    gg.visible= 1
	    gg.sprite_index= 1704/* spr_eggcarton */
	    gg.z_index= 3020
	    gg= instance_create(newx - 2, 370, 1363/* obj_npc_marker */)
	    gg.visible= 1
	    gg.sprite_index= 1716/* spr_mettflour */
	    gg.z_index= 3010
	    gg= instance_create(newx + 1, 360, 1363/* obj_npc_marker */)
	    gg.visible= 1
	    gg.sprite_index= 1703/* spr_milkcarton */
	    gg.z_index= 3000
	}
	if(con == 3) {
	    obj_mettaton_npc.image_speed= 0.25
	    GS.typer= 27
	    GS.msc= 0
	    GS.facechoice= 0
	    GS.msg[0]= "* PERFECT^1!&* GREAT JOB^1, BEAUTIFUL!/"
	    GS.msg[1]= "* WE\'VE GOT ALL OF THE&  INGREDIENTS WE NEED TO BAKE&  THE CAKE!/"
	    GS.msg[2]= "\\W* \\YMILK\\W... &* \\YSUGAR\\W...&* \\YEGGS\\W.../"
	    GS.msg[3]= "* ... OH MY^1!&* WAIT A MAGNIFICENT MOMENT^1!&* HOW COULD I FORGET!!!/"
	    GS.msg[4]= "\\W* WE\'RE MISSING THE MOST&  \\YIMPORTANT INGREDIENT\\W!/%%"
	    instance_create(0, 0, 779/* obj_dialoguer */)
	    con= 4
	}
	if(con == 4 and not instance_exists(782/* OBJ_WRITER */)) {
	    // obj_cookshowevent
	    with(1195) caster_stop(bossa)
	    obj_cookshowevent.con= 20
	    con= 5
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
