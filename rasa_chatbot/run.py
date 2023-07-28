import requests
import json

url = "http://localhost:5005/webhooks/rest/webhook"
payload = {
    "sender": "user", 
    "message": "Hello"
}
headers = {
    'Content-Type': 'application/json'
}

response = requests.post(url, data=json.dumps(payload), headers=headers)

print(response.json())
