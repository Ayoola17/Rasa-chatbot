import requests
import json

url = "http://10.110.220.228:30648/webhooks/rest/webhook"
payload = {
    "sender": "user", 
    "message": "sad"
}
headers = {
    'Content-Type': 'application/json'
}

response = requests.post(url, data=json.dumps(payload), headers=headers)

print(response.json())