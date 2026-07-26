# Auto-converted from GameMaker: obj_1sidegen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	firingspeed= GS.firingrate
	bullettype= 0
	specgreen= 0
	num= 0
	$Alarm0.start(1 / 30.0)

func _on_destroy():
	script_execute(125/* SCR_BORDER */, 0, 6)
	x= xx
	y= yy
	if(bullettype == 0) script_execute(124/* SCR_DIRECT */, 2.5, 0.2, 0, 0, 0, 0, 0, 0, 0, 156)
	if(bullettype == 1) {
	    iii= instance_create(x, y, 631/* blt_flybullet */)
	    if(is_instance_valid(iii))
	        iii.dmg= GS.monsteratk[myself]
	}
	if(bullettype == 2) {
	    iii= instance_create(x, y, 622/* blt_splinterbig */)
	    if(is_instance_valid(iii))
	        iii.dmg= GS.monsteratk[myself]
	}
	if(bullettype == 3) {
	    iii= instance_create(x, y, 635/* blt_pollendrop */)
	    if(is_instance_valid(iii))
	        iii.dmg= GS.monsteratk[myself]
	}
	if(bullettype == 4) {
	    iii= instance_create(GS.idealborder[0], GS.idealborder[2] + round(random(GS.idealborder[3] - GS.idealborder[2] - 60)) + 30, 628/* blt_roachbullet */)
	    if(is_instance_valid(iii))
	        iii.dmg= GS.monsteratk[myself]
	    iii= instance_create(GS.idealborder[1] - 4, GS.idealborder[2] + round(random(GS.idealborder[3] - GS.idealborder[2] - 60)) + 30, 628/* blt_roachbullet */)
	    if(is_instance_valid(iii))
	        iii.dmg= GS.monsteratk[myself]
	}
	if(bullettype == 5) {
	    num++
	    script_execute(125/* SCR_BORDER */, 0, 40)
	    x-= 20
	    y+= 5
	    iii= instance_create(x, y, 629/* blt_vegbullet */)
	    sum= scr_monstersum()
	    if(is_instance_valid(iii)) {
	        if(num == 4 - sum and specgreen == 1) {
	            iii.green= 1
	            iii.image_blend= 65280
	        }
	        iii.dmg= GS.monsteratk[myself]
	    }
	}
	if(bullettype == 6) {
	    num++
	    script_execute(125/* SCR_BORDER */, 0, 40)
	    x-= 20
	    y+= 5
	    iii= instance_create(x, y, 630/* blt_gravbullet */)
	    if(is_instance_valid(iii)) {
	        if(not instance_exists(597/* obj_parsnik */)) {
	            if(num == 4 and specgreen == 1) {
	                iii.green= 1
	                iii.image_blend= 65280
	            }
	        } else  {
	            if(num == 8 and specgreen == 1) {
	                iii.green= 1
	                iii.image_blend= 65280
	            }
	        }
	        iii.dmg= GS.monsteratk[myself]
	    }
	}
	if(bullettype == 7) {
	    x= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2 - 3
	    y= GS.idealborder[2] - 25
	    iii= instance_create(x, y, 617/* blt_firehelix1 */)
	    if(is_instance_valid(iii)) {
	        iii.dmg= GS.monsteratk[myself]
	        if(GS.hp < 8) iii.dmg= 2
	        if(GS.hp < 6) iii.dmg= 1
	    }
	    if(GS.hp <= 2) GS.turntimer= -100
	}
	if(bullettype == 8) {
	    x= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2 - 3
	    y= GS.idealborder[2] + 5
	    iii= instance_create(x, y, 618/* blt_minihelix */)
	    if(is_instance_valid(iii)) {
	        iii.dmg= GS.monsteratk[myself]
	        if(GS.hp < 8) iii.dmg= 2
	        if(GS.hp < 6) iii.dmg= 1
	    }
	    if(GS.hp <= 2) GS.turntimer= -100
	}
	if(bullettype == 9) {
	    script_execute(125/* SCR_BORDER */, 0, 80)
	    x-= 40
	    y-= 20
	    iii= instance_create(x, y, 619/* blt_avoidfire */)
	    if(is_instance_valid(iii)) iii.dmg= 1
	}
	if(bullettype == 10) {
	    x= GS.idealborder[0] + (GS.idealborder[1] - GS.idealborder[0]) / 2 - 3
	    y= GS.idealborder[2] - 25
	    iii= instance_create(x, y, 617/* blt_firehelix1 */)
	    if(is_instance_valid(iii)) {
	        iii.dmg= GS.monsteratk[myself]
	        if(GS.hp < 8) iii.dmg= 2
	        if(GS.hp < 6) iii.dmg= 1
	    }
	    if(GS.hp <= 2) GS.turntimer= -100
	    x= GS.idealborder[0] + 2
	    y= GS.idealborder[2] + 90
	    iiii= instance_create(x, y, 612/* blt_floatfire */)
	    if(is_instance_valid(iiii)) {
	        iiii.dmg= GS.monsteratk[myself]
	        if(GS.hp < 8) iiii.dmg= 2
	        if(GS.hp < 6) iiii.dmg= 1
	    }
	    x= GS.idealborder[1] - 18
	    iiiii= instance_create(x, y, 612/* blt_floatfire */)
	    if(is_instance_valid(iiiii)) {
	        iiiii.dmg= GS.monsteratk[myself]
	        if(GS.hp < 8) iiiii.dmg= 2
	        if(GS.hp < 6) iiiii.dmg= 1
	    }
	}
	if(bullettype == 11) {
	    script_execute(126/* SCR_BORDER_X */, 1, 30, 30)
	    gen= instance_create(x, y, 644/* blt_hat */)
	    if(is_instance_valid(gen))
	        gen.dmg= GS.monsteratk[myself]
	}
	$Alarm0.start((firingspeed) / 30.0)

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
