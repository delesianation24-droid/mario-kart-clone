# Game Manager

"""
This script manages the game state and race logic.
"""

var race_active = false
var race_start_time = 0
var race_duration = 0


func start_race(duration: int):
    """
    Starts the race with a given duration.
    """
    race_active = true
    race_duration = duration
    race_start_time = OS.get_system_time_msecs()  # Get current time in milliseconds


func update():
    """
    Updates the game state. Call this every frame.
    """
    if (race_active):
        var elapsed_time = (OS.get_system_time_msecs() - race_start_time) / 1000  # Convert to seconds
        if (elapsed_time >= race_duration):
            end_race()


func end_race():
    """
    Ends the race and resets the state.
    """
    race_active = false
    race_duration = 0
    race_start_time = 0
    print("Race has ended!")


func is_race_active() -> bool:
    return race_active
