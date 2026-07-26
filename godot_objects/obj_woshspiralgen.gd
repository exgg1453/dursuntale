# Auto-converted from GameMaker: obj_woshspiralgen
# GM parent: obj_bulletgenparent
extends Node2D

func _ready():
	blue= 1
	dmg= 7
	rate= GS.firingrate
	$Alarm0.start((rate) / 30.0)
	longnote= 0
	direction= 0
	$Alarm0.start((6) / 30.0)
	turn= 5
	green= -1 + random(6)
	cleaner= 0
	backwards= 0
	sum= scr_monstersum()
	siner= random(30)
	siner2= random(30)

func _on_destroy():
	$Alarm0.start((rate) / 30.0)
	m= instance_create(x, y, 665/* blt_growbullet */)
	if(is_instance_valid(m)) {
	    m.dmg= dmg
	    if(sum == 1) {
	        m.speed/= 1.1
	        m.friction/= 1.25
	    }
	    if(blue == 1) {
	        m.frame= 1
	        m.blue= 1
	    }
	    m.direction= direction
	    if(green == 0 and cleaner == 1) {
	        m.frame= 2
	        m.blue= 3
	        m.friction/= 3
	        m.sprite_index= 122/* spr_waterbul_mask */
	    }
	}
	green--
	if(green < 0) {
	    if(sum > 1) green= 4
	    if(sum == 1) green= 9
	}

func _process(delta: float):
	direction+= turn
	if(sum == 1) turn+= 0.05
	if(sum > 1) turn+= 0.01
	if(backwards == 1) turn-= 0.1
	if(sum == 1) {
	    siner++
	    x+= sin(siner / 6) * 1
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
