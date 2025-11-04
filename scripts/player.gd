extends CharacterBody2D


const SPEED = 200.0

func _physics_process(delta) -> void:
	# 1. Captura do Input de Movimento
	# get_vector() retorna um Vector2 baseado nas ações de input configuradas.
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")

	# 2. Aplica a Velocidade
	if direction.length() > 0:
		# Se estiver movendo, a velocidade é a direção normalizada * SPEED
		# direction.normalized() garante que o movimento diagonal não seja mais rápido
		velocity = direction.normalized() * SPEED
	else:
		# Se não houver input, freia o personagem suavemente até parar
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)

	move_and_slide()

# --- FUNÇÃO DE INTERAÇÃO (Será usada na ETAPA 3) ---
# A lógica principal de 'interact' será tratada pelas áreas de colisão
# (Area2D - Desk e Door) para manter o Player.gd simples.
# func _input(event):
#     if event.is_action_pressed("interact"):
#         # (A lógica de interação será codificada nos scripts Desk_Interaction.gd e Door.gd)
#         pass
