#This is the main script.
#Runs "Node2D" of the main scene.
#This script is part of the main thread.
extends Node

#Thread, will run alongside the main thread in "_process()" of this function.
var thread : Thread;
var second_thread : Thread;

func _ready():
	
	pass;


func _process(delta: float) -> void:
	
	#Intialize both threads as a plain, empty thread.
	#The threads will need to be assigned a process next.
	#The process will be assigned as a function.
	thread = Thread.new();
	second_thread = Thread.new();
	
	#Set each thread to run a function.
	#"thread" is set to run the function "sayHi()".
	thread.start(sayHi);
	second_thread.start(sayYo);
	
	pass;




func _exit_process() -> void:
	
	#Here we are waiting for each thread 2 finish. We have 2 defined
	#threads ("thread", "second_thread") plus the main thread. Once these
	#two threads are completed, the main thread (thread that _process() and the
	#entire application are running from) will end, starting another cycle of the
	#main thread (_process()), using _ready(), we can start "thread" and "second_thread" again.
	thread.wait_to_finish();
	second_thread.wait_to_finish();
	
	
	#main thread ends here
	pass;




#This function writes "Hi" string
#to IOStream.
func sayHi() -> void:
	print("Hi");
	return;


#This function writes "Yo" string
#to IOStream.
func sayYo() -> void:
	print("Yo");
	return;
