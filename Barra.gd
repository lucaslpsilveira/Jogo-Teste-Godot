extends KinematicBody2D

const velocidade = 200
const gravidade = 20
const pulo = -550
const ceu = Vector2(0, -1)

var motion = Vector2();

func _physics_process(delta):
	motion.y += gravidade
	
	if Input.is_action_pressed("ui_right"):
		motion.x = velocidade
		$Sprite.play("Run")
		$Sprite.flip_h = false
	elif Input.is_action_pressed("ui_left"):			
		motion.x = -velocidade
		$Sprite.play("Run")
		$Sprite.flip_h = true
	else:
		motion.x = 0
		$Sprite.play("Idle")
		
	if is_on_floor():
		if Input.is_action_pressed("ui_up"):			
			motion.y = pulo					
	else:
		print(motion.y)
		if(motion.y < 0):
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
	#motion é igual a função para zerar a gravidade
	motion = move_and_slide(motion,ceu)

