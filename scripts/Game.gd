extends Node2D

@onready var player = $Player
@onready var hp_label = $CanvasLayer/HUD/HPBar/HPLabel
@onready var hp_bar = $CanvasLayer/HUD/HPBar/ProgressBar

const PLAYER_SPEED = 120.0
const MAX_HP = 20

var current_hp: int = MAX_HP

func _ready():
	update_hp_display()

func _process(delta: float) -> void:
	handle_movement(delta)

func handle_movement(delta: float) -> void:
	if not is_instance_valid(player):
		return
	var dir := Vector2.ZERO
	if Input.is_action_pressed("move_up"):
		dir.y -= 1
	if Input.is_action_pressed("move_down"):
		dir.y += 1
	if Input.is_action_pressed("move_left"):
		dir.x -= 1
	if Input.is_action_pressed("move_right"):
		dir.x += 1
	player.position += dir.normalized() * PLAYER_SPEED * delta

func update_hp_display() -> void:
	if hp_label:
		hp_label.text = "HP  %d / %d" % [current_hp, MAX_HP]
	if hp_bar:
		hp_bar.max_value = MAX_HP
		hp_bar.value = current_hp

func take_damage(amount: int) -> void:
	current_hp = max(0, current_hp - amount)
	update_hp_display()
	if current_hp <= 0:
		_on_game_over()

func _on_game_over() -> void:
	get_tree().change_scene_to_file("res://scenes/Main.tscn")
