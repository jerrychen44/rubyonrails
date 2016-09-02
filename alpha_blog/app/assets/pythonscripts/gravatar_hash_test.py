import sys,os,hashlib,urllib

email = b"xxxx@test.com"

gravatar_url = "https://www.gravatar.com/avatar/" + hashlib.md5(email.lower()).hexdigest()
print(gravatar_url)