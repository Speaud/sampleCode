#!/usr/bin/env python3
import sys
import subprocess
from hello import helloworld

# false command always exits with a non-zero status code


print("yep")

helloworld()

excmd = ["ls", "-l"]

p = subprocess.call(excmd)

output = subprocess.check_output(['ls', '-1'])
print('Have %d bytes in output' % len(output))
print(output)

# subprocess.Popen(['/bin/sh', '-c', args[0], args[1], ...])


print('Number of arguments:', len(sys.argv), 'arguments.')
print('Argument List:', str(sys.argv))