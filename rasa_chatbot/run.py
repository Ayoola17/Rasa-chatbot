import requests
import json

url = "http://192.168.65.4:32582/webhooks/rest/webhook"
payload = {
    "sender": "user", 
    "message": "sad"
}
headers = {
    'Content-Type': 'application/json'
}

response = requests.post(url, data=json.dumps(payload), headers=headers)

print(response.json())
