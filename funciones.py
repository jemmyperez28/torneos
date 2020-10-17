
import hashlib


class hasheo():
    def __init__(self):
        pass
    def encriptar(self,hash_string):
        sha_signature = \
            hashlib.sha256(hash_string.encode()).hexdigest()
        return sha_signature



