extends Node


func _ready():
    setup_mod()
    queue_free()


func setup_mod():
    overrideScript()
    log_message("Startup completed")


func overrideScript():
    var new_script = load('res://mods/HeliGoBoom/heli_go_boom.gd')
    new_script.take_over_path("res://Scripts/EventSystem.gd")
    

func log_message(message: String) -> void:
    print("[HeliGoBoom] " + message)
