extends Node

var udp = PacketPeerUDP.new()

func _ready():
	udp.set_dest_address("127.0.0.1", 1025)


func _on_SendPacketButton_pressed():
	# Send a default PoolByteArray
	#udp.put_packet(PoolByteArray([20, 0, 0, 0, 2, 0, 0, 0, 4, 7]))
	#udp.put_var(PoolByteArray([4, 7]))
	
	# Send a string
	#udp.put_var('test')
	#udp.put_var(PoolStringArray(['test']))
	
	# Put data into memory
	udp.put_packet(PoolByteArray([23, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 72, 101, 108, 108, 111, 32, 119, 111, 114, 108, 100, 33]))
	#udp.put_packet(PoolByteArray([23, 0, 0, 0, 1, 0, 0, 0, 3, 0, 0, 0, 116, 101, 97]))
	# Try to read data that still exists in memory until it is null termin
	#udp.put_packet(PoolByteArray([23, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 255]))


func _on_SendMaliciousPacketButton_pressed():
	# Send a packet of death to crash the server
	udp.put_packet(PoolByteArray([20, 0, 0, 0, 0, 0, 0, 255]))
