extends Node

var udp = PacketPeerUDP.new()

func _ready():
	udp.set_dest_address("127.0.0.1", 1025)

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_SendPacketButton_pressed():
	udp.put_packet(PoolByteArray([20, 0, 0, 0, 0, 0, 0, 255]))
