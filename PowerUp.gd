# PowerUp.gd
# Power-up system for Mario Kart Clone

extends Node

# Power-up types
enum PowerUpType {
	SPEED_BOOST,
	SHIELD,
	MISSILE,
	BANANA_PEEL,
	TRIPLE_RED_SHELL,
	STAR
}

# Power-up properties
class PowerUp:
	var type: int
	var duration: float
	var active: bool = false
	
	func _init(p_type: int, p_duration: float = 5.0):
		type = p_type
		duration = p_duration

# Player power-up inventory
var player_powerups = []

# Add a power-up to the player's inventory
func add_powerup(powerup_type: int):
	var powerup = PowerUp.new(powerup_type)
	player_powerups.append(powerup)
	print("Power-up acquired: ", PowerUpType.keys()[powerup_type])

# Use a power-up
func use_powerup(index: int):
	if index < player_powerups.size():
		var powerup = player_powerups[index]
		powerup.active = true
		apply_powerup_effect(powerup)
		player_powerups.remove(index)

# Apply the effect of a power-up
func apply_powerup_effect(powerup: PowerUp):
	match powerup.type:
		PowerUpType.SPEED_BOOST:
			print("Speed boost activated!")
		PowerUpType.SHIELD:
			print("Shield activated!")
		PowerUpType.MISSILE:
			print("Missile launched!")
		PowerUpType.BANANA_PEEL:
			print("Banana peel dropped!")
		PowerUpType.TRIPLE_RED_SHELL:
			print("Triple red shell activated!")
		PowerUpType.STAR:
			print("Star power activated!")