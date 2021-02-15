#!/bin/env  python

import requests
import json

r = requests.get("http://data.fixer.io/api/latest?access_key=8d44b637245b8a9592d77cb5ef982e4d&format=1&symbols=gbp")
resp = json.loads(r.content)

print (resp["rates"]["GBP"])
