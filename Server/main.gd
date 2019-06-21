extends Node

var udp = PacketPeerUDP.new()
var thread = Thread.new()
var should_quit = false
var rich_text_label

func _ready():
	udp.listen(1025)
	rich_text_label = get_node("Panel/MarginContainer/RichTextLabel")
	print("Listening on port 1025...")
	rich_text_label.set_text("Listening on port 1025...\n")
	thread.start(self, "thread_func")
	self.set_process(true)


func exit_tree():
	should_quit = true
	thread.wait_to_finish()


func thread_func(userdata=null):
	while not should_quit:
		OS.delay_msec(1)
		my_process()


func my_process():
	if udp.get_available_packet_count() < 1:
		return
	else:
		# Set return destination
		var client_ip = udp.get_packet_ip()
		var client_port = udp.get_packet_port()
		udp.set_dest_address(client_ip, client_port)
		
		# Read received packet
		var text = rich_text_label.get_text()
		rich_text_label.set_text(text + "UDP packet received!\n")
		var received_var = udp.get_var()
		
		# Output received data to console and client
		print("I received:")
		if typeof(received_var) == TYPE_STRING_ARRAY:
			var raw_data = str(received_var)
			
			print(raw_data)
			udp.put_var("I received '" + raw_data + "'")
		elif typeof(received_var) == TYPE_RAW_ARRAY:
			var tmp_str = ""
			for element in received_var:
				tmp_str += str(element) + ","
			tmp_str = "[ " + tmp_str.substr(0, tmp_str.length() - 1) + " ]"
			
			print(tmp_str)
			udp.put_var("I received '" + tmp_str + "'")
