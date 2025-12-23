class_name CoockedState
extends ChickenState

func enter():
	chicken.velocity = Vector2.ZERO
	%ChickenAnimation.play("Cooked") # Or "idle" if you have it
	SfxMusicPlayer.play_sound(SfxMusicPlayer.SoundType.CHICKEN_COOKED, SfxMusicPlayer.RandomizeStrength.EXTREME)
	%ChickenAnimationPlayer.play("RESET")
	#%ChickenAnimationPlayer.play("Cooked")
	%ChickenAnimation.frame = 1 # Stand on specific frame
	

func update(delta: float):
	#if user clicks me then i get consumed and a example function is called
	pass
