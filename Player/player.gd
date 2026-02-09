extends CharacterBody2D

@onready var animationPlayer = $AnimationPlayer

@export var velocidade = 220.0
@export var multiplicador_y = 0.7
@export var aceleracao = 880.0
@export var desaceleracao = 1100.0

func _ready():
	return

func _physics_process(_delta):
	var input_vector = Vector2.ZERO
	
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	input_vector = input_vector.normalized()
	
	input_vector.y *= multiplicador_y
	
	var velocidade_alvo = input_vector * velocidade
	var taxa = aceleracao if input_vector != Vector2.ZERO else desaceleracao
	velocity = velocity.move_toward(velocidade_alvo,taxa * _delta)
	
	move_and_slide()
