import requests
import json

url = "http://localhost:5005/webhooks/rest/webhook"
payload = {
    "sender": "user", 
    "message": "What\'s a good venue"
}
headers = {
    'Content-Type': 'application/json'
}

response = requests.post(url, data=json.dumps(payload), headers=headers)

print(response.json())
