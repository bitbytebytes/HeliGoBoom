extends "res://Scripts/EventSystem.gd"


func CrashSite():
    var randomCrash = crashes.get_child(randi_range(0, crashes.get_child_count() - 1))

    var crashSite = crash.instantiate()
    
    var event_start_timer = Timer.new()
    var event_delay_time = randf() * 300.0
    event_start_timer.wait_time = event_delay_time
    event_start_timer.one_shot = true
    event_start_timer.autostart = true
    
    var boom_player  = AudioStreamPlayer3D.new()
    boom_player.stream = load("res://mods/HeliGoBoom/Audio/Helicopter/heli_crash.mp3")
    boom_player.bus = "SFX"
    boom_player.max_distance = 1000.0
    boom_player.max_db = 12.0
    boom_player.volume_db = 12.0
    boom_player.autoplay = true
    
    add_child(event_start_timer)
    await event_start_timer.timeout
    event_start_timer.queue_free()
    
    randomCrash.add_child(boom_player)
    await boom_player.finished
    
    randomCrash.add_child(crashSite)
    crashSite.global_transform = randomCrash.global_transform
    


#func _unhandled_key_input(_event: InputEvent) -> void:
    #if Input.is_key_pressed(KEY_BACKSLASH):
        #CrashSite()
