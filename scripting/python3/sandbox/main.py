#!/usr/bin/env python3
import os
import sys
import subprocess
from hello import helloworld
import datetime

# false command always exits with a non-zero status code

vvv = os.popen('ls -l').read()

print(vvv)

print("yep")

helloworld()

excmd = ["ls", "-l"]

p = subprocess.call(excmd)

output = subprocess.check_output(['ls', '-1'])
print('Have %d bytes in output' % len(output))
print(output)

# subprocess.Popen(['/bin/sh', '-c', args[0], args[1], ...])

exec()



program = input('Enter input:')
print(program)

ddd = datetime.date.today()
print(ddd)