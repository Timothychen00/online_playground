import os ,subprocess
subprocess.run(['pipenv','run','python','app.py'],shell=False) 
subprocess.run(['pipenv','run','python','-m','frontend.app'],shell=False) 