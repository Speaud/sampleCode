import subprocess

excmd = ["ls", "-l"]

p = subprocess.call(excmd)

output = subprocess.check_output(['ls', '-1'])
print('Have %d bytes in output' % len(output))
print(output)
