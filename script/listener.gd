extends Node

var udp = PacketPeerUDP.new()
var thread = Thread.new()
var should_quit = false

func _ready():
	udp.listen(1025)
	get_node("Control/MarginContainer/RichTextLabel").set_text("Listening on port 1025...\n")
	thread.start(self, "thread_func")
	self.set_process(true)

func _process(delta):
	pass

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
		var node = get_node("Control/MarginContainer/RichTextLabel")
		var text = node.get_text()
		node.set_text(text + "UDP packet received!\n")
		udp.get_var()
