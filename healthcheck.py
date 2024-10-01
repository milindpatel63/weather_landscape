# healthcheck.py
import sys
import requests

try:
    response = requests.get("http://localhost:3355/")
    if response.status_code == 200:
        sys.exit(0)
    else:
        sys.exit(1)
except Exception:
    sys.exit(1)
