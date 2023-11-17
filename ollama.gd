extends Node

func send_text(text, context = []):
	
	var data = {
		"model": "assistant",
		"prompt": text,
		"context": context,
		"stream": false
	}
	
	var json = JSON.stringify(data)
	
	var error = $HTTPRequest.request("http://127.0.0.1:11434/api/generate", 
		["Content-Type: application/json"], HTTPClient.METHOD_POST, json)
	
	if error != OK:
		print("An error occurred.")

func _ready():
	$HTTPRequest.request_completed.connect(_on_request_completed)

# Example implementation: 
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json["response"])
