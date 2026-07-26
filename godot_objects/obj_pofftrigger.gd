# Auto-converted from GameMaker: obj_pofftrigger
extends Node2D

func _ready():
	scale.y= 20
	t= 0
	if(GS.plot >= 64) instance_destroy()

func _gm_event_2_4():
	t++

func _process(delta: float):
	if(t == 2) {
	    obj_dogpoff.image_speed= 0.25
	    t= 3
	}
	if(t == 6) {
	    GS.battlegroup= 26
	    GS.flag[200]= 0
	    GS.mercy= 1
	    instance_create(0, 0, 142/* obj_battler */)
	    t= 10
	}
	if(GS.plot == 60 and t == 10) {
	    obj_mainchara.y= 140
	    GS.interact= 1
	    GS.plot= 61
	    if(GS.flag[54] == 1) {
	        GS.mercy= 0
	        GS.interact= 0
	        GS.plot= 65
	        GS.currentsong= caster_load("music/snowy.ogg")
	        caster_loop(GS.currentsong, 1, 0.95)
	        t= 9999
	        // obj_dogpoff
	        with(974) instance_destroy()
	        instance_destroy()
	        exit
	    } else  {
	        $Alarm4.start((30) / 30.0)
	        if(GS.flag[54] == 0 or GS.flag[54] == 2) t= 20
	        if(GS.flag[54] == 3) t= 26
	    }
	}
	if(t == 20 or t == 26) GS.interact= 1
	if(t == 21) {
	    obj_dogpoff.frame= 0
	    obj_dogpoff.sprite_index= 1273/* spr_doglick */
	    obj_dogpoff.image_speed= 0.25
	    t= 22
	}
	if(t == 23 and obj_dogpoff.sprite_index == 1275) {
	    obj_dogpoff.velocity.x= 2
	    obj_dogpoff.image_speed= 0.25
	    $Alarm4.start((50) / 30.0)
	    t= 24
	}
	if(t == 25) {
	    GS.mercy= 0
	    GS.currentsong= caster_load("music/snowy.ogg")
	    caster_loop(GS.currentsong, 1, 0.95)
	    GS.interact= 0
	    GS.plot= 65
	    instance_destroy()
	}
	if(t == 27) {
	    obj_dogpoff.frame= 0
	    obj_dogpoff.sprite_index= 1276/* spr_dogboredwalk */
	    obj_dogpoff.velocity.x= 2
	    obj_dogpoff.image_speed= 0.5
	    $Alarm4.start((50) / 30.0)
	    t= 28
	}
	if(t == 29) t= 25

func _on_alarm_0_timeout():
	if(GS.plot < 64 and t == 0) {
	    t= 1
	    GS.interact= 1
	    $Alarm4.start((20) / 30.0)
	    fader= instance_create(0, 0, 92/* obj_musfadeout */)
	    fader.fadespeed= 0.01
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
