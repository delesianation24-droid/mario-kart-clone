extends Node

# NetworkManager handles online multiplayer functionality

# Importing necessary Photon classes
const Photon = preload("res://photon/Photon.gd")

class_name NetworkManager

# Photon variables
var photon_client: Photon = null
var is_connected: bool = false

# Setting up the network manager
func _ready():
    photon_client = Photon.new()
    connect_to_photon()

# Connecting to Photon
func connect_to_photon():
    photon_client.connect("your_photon_app_id", "your_region")
    is_connected = true
    print("Connected to Photon!")

# Disconnect from Photon
func disconnect_from_photon():
    if is_connected:
        photon_client.disconnect()
        is_connected = false
        print("Disconnected from Photon!")

# Function to join a room
func join_room(room_name: String):
    if is_connected:
        photon_client.join_room(room_name)
        print("Joining room: " + room_name)
    else:
        print("Not connected to Photon!")

# Function to handle player movement and synchronization
func sync_player_movement(player_data):
    if is_connected:
        photon_client.send_data(player_data)
        # Add any additional synchronization logic here

# Listen to events from Photon
func _process(delta):
    if is_connected:
        photon_client.process_events()