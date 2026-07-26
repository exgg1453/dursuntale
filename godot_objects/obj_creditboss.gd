# Auto-converted from GameMaker: obj_creditboss
extends Node2D

func _ready():
	type= 3
	active= 0
	$Alarm0.start((1) / 30.0)
	timer= 0
	truetype= 0

func _on_destroy():
	truetype= type
	active= 1
	if(truetype == 0) {
	    i= 0
	    while(i < 5) {
	        event_user(0)
	        cb_a[i]= cb
	        cb_a[i].x= 760 + 40 * i
	        cb_a[i].y= y + 40 * i
	        cb_a[i].velocity.x= -10
	        cb_a[i].action= 1
	        i++
	    }
	}
	if(truetype == 1) {
	    i= 0
	    while(i < 5) {
	        event_user(0)
	        cb_a[i]= cb
	        cb_a[i].x= -120 - 40 * i
	        cb_a[i].y= y + 40 * i
	        cb_a[i].velocity.x= 10
	        cb_a[i].action= 1
	        i++
	    }
	}
	if(truetype == 2) {
	    event_user(0)
	    cb_a= cb
	    with(cb_a) width= string_width(text)
	    cb_a.x= x - cb_a.width - 30
	    cb_a.y= -200
	    cb_a.velocity.y= 12
	    cb_a.action= 2
	    cb_a.stretch= 1
	    event_user(0)
	    cb_b= cb
	    with(cb_b) width= string_width(text)
	    cb_b.x= x + cb_b.width + 30
	    cb_b.y= -200
	    cb_b.velocity.y= 12
	    cb_b.action= 2
	    cb_b.stretch= 1
	    $Alarm0.start((4) / 30.0)
	}
	if(truetype == 3) {
	    if(y > 240) myaa= 3
	    else  myaa= -3
	    angrand= random(360)
	    i= 0
	    while(i < 10) {
	        event_user(0)
	        cb_a[i]= cb
	        cb_a[i].aa= myaa
	        cb_a[i].stretch= 2
	        cb_a[i].stretchfactor= 55
	        cb_a[i].rotation_degrees= i / 10 * 360 + angrand
	        cb_a[i].x= x
	        cb_a[i].y= y
	        with(cb_a[i]) {
	            x+= lengthdir_x(55, rotation_degrees)
	            y+= lengthdir_y(60, rotation_degrees)
	        }
	        i++
	    }
	}

func _process(delta: float):
	if(active == 1) {
	    timer++
	    if(truetype == 0 or truetype == 1) {
	        if(timer == 50) {
	            i= 0
	            while(i < 5) {
	                with(cb_a[i]) {
	                    speed= 0
	                    direction= 0
	                }
	                i++
	            }
	        }
	        if(timer >= 50 and timer <= 70) {
	            i= 0
	            while(i < 5) {
	                with(cb_a[i]) {
	                    rotation_degrees= direction
	                    curdir= direction
	                    idealdir= point_direction(x, y, obj_creditsheart.x + 8, obj_creditsheart.y + 8)
	                    facingMinusTarget= curdir - idealdir
	                    angleDiff= facingMinusTarget
	                    if(abs(facingMinusTarget) > 180) {
	                        if(curdir > idealdir)
	                            angleDiff= -1 * (360 - curdir + idealdir)
	                        else  angleDiff= 360 - idealdir + curdir
	                    }
	                    leastAccurateAim= 3
	                    if(abs(angleDiff) > leastAccurateAim) {
	                        dirspeed= 1
	                        angleDiff2= abs(angleDiff)
	                        if(angleDiff2 > 10) dirspeed= 2
	                        if(angleDiff2 > 20) dirspeed= 5
	                        if(angleDiff2 > 30) dirspeed= 15
	                        if(angleDiff2 > 40) dirspeed= 16
	                        if(angleDiff2 > 50) dirspeed= 17
	                        if(angleDiff2 > 60) dirspeed= 18
	                        if(angleDiff2 > 70) dirspeed= 20
	                        if(angleDiff2 > 80) dirspeed= 22
	                        if(angleDiff2 > 90) dirspeed= 24
	                        if(angleDiff2 > 100) dirspeed= 25
	                        if(angleDiff < 0) dirspeed= -dirspeed
	                        direction-= dirspeed
	                    }
	                }
	                i++
	            }
	        }
	        if(timer == 75) {
	            i= 0
	            while(i < 5) {
	                with(cb_a[i]) {
	                    speed= 3
	                    friction= -0.5
	                    action= 0
	                }
	                i++
	            }
	        }
	        if(timer == 85) instance_destroy()
	    }
	    if(truetype == 2) {
	        if(timer > 50 and timer < 70) x+= 4
	        if(timer > 80 and timer < 100) x-= 4
	        if(timer > 130 and timer < 150) x-= 4
	        if(timer > 160 and timer < 180) x+= 4
	        if(timer > 210 and timer < 230) x+= 4
	        if(timer > 230 and timer < 250) x-= 4
	        if(timer == 250) {
	            siner= 0
	            sf= 5
	        }
	        if(timer > 250 and timer < 420) {
	            siner++
	            x+= sin(siner / 7) * sf
	            sf+= 0.02
	        }
	        if(timer == 420) instance_destroy()
	    }
	    if(truetype == 3) {
	        i= 0
	        while(i < 10) {
	            if(velocity.x > 0) {
	                with(cb_a[i]) velocity.x= 0.1
	            }
	            if(velocity.x < 0) {
	                with(cb_a[i]) velocity.x= -0.1
	            }
	            if(instance_exists(cb_a[i])) {
	                cb_a[i].x= x
	                cb_a[i].y= y
	            }
	            with(cb_a[i]) {
	                if(abs(aa) < 1.7) aa*= 1.02
	                x+= lengthdir_x(85, rotation_degrees)
	                y+= lengthdir_y(85, rotation_degrees)
	            }
	            i++
	        }
	        if(x > 1000 or x < -400) instance_destroy()
	    }
	}

func _gm_event_7_10():
	if(obj_creditsloader.credno < obj_creditsloader.credamt - 1) {
	    cb= instance_create(x, y, 1701/* obj_creditbullet */)
	    cb.text= obj_creditsloader.creditname[obj_creditsloader.credno]
	    obj_creditsloader.credno++
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
