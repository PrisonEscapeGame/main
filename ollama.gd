extends Node


func send_text(text, context = []):
	
	var data = {
		"model": "guard",
		"prompt": text,
		"context": context,
		"stream": false
	}
	
	var json = JSON.stringify(data)
	
	var error = $HTTPRequest.request("http://huitsinnevada.fi:2440/api/generate", 
		["Content-Type: application/json"], HTTPClient.METHOD_POST, json)
	
	if error != OK:
		print("An error occurred.")
	print(text)

func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)

# Example implementation: 
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json["response"])
