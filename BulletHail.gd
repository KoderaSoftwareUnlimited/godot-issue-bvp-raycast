extends Node2D

var bullet = preload("res://Bullet.tscn")

onready var start = $Start
onready var results = $Results

var instance
var good = 0
var bad = 0

func _physics_process(delta):
	if !instance:
		instance = bullet.instance()
		instance.position = start.position
		instance.linear_velocity = Vector2(10000,0)
		add_child(instance)
	
	if instance && instance.linear_velocity.length() < 100:
		good += 1
		instance.queue_free()
		instance = null
	
	if instance && instance.position.x > 1000:
		bad += 1
		instance.queue_free()
		instance = null

	results.text = "Good: %d, Bad: %d" % [good,bad]
