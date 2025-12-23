extends ChickenState

func enter():
	print("he cooked")
	chicken.velocity = Vector2.ZERO
	%ChickenAnimation.play("Cooked") # Or "idle" if you have it
	%ChickenAnimationPlayer.play("RESET")
	#%ChickenAnimationPlayer.play("Cooked")
	%ChickenAnimation.frame = 1 # Stand on specific frame
	

func update(delta: float):
	#if user clicks me then i get consumed and a example function is called
	pass
