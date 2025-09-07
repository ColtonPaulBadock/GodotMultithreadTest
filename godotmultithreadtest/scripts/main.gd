extends Node

#Thread number one, branching off from the main application thread
#This thread will run seperate from __process, as "_process" is part
#of the main thread.
var thread1 : Thread;

#Runs once on program intialization
func _ready() -> void:
	
	thread1 = Thread.new();
	
	thread1.start(supYo.bind());
	
	pass;


#Indefinite program loop
func _process(delta: float) -> void:
	
	
	return;


#This function prints "sup yo"
#in an infinite loop
func supYo() -> void:
	
	while true:
		print("Sup yo");
	
	pass;
