import random
from seamapi import Seam

seam = Seam(
    api_url=f"https://pws{random.randint(0,1e6)}{random.randint(0,1e6)}.fakeseamconnect.seam.vc",
    api_key="seam_apikey1_token"
)