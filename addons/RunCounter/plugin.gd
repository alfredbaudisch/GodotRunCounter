@tool
extends EditorPlugin


func _init():
	name = "RunCounterPlugin"
	add_autoload_singleton("RunCounter", "Scripts/RunCounter.gd")
	
