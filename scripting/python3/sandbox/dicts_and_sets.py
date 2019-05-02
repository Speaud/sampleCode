#!/usr/bin/env python3
d = dict([
    ("a", 1)
])

# key can be dupel
dd = {(1, 1): 'a', (1, 2): 'b', (2, 1): 'c', (2, 2): 'd'}

print(dd[(1, 1)])

print(d.get('a', 'defaultfora?'))
print(d.get('ad', 'defaultfora?'))

def f(x):
    return {
        '--help': 1,
        '-h': 'df',
        'b': 2,
    }[x]

fa = f('--help')


#my_dict = dict.fromkeys(['a', 'b', 'c'], 10)
#my_dict.update(dict.fromkeys(['b', 'e'], 20))
#my_dict = {('a', 'c', 'd'): 10, ('b', 'e'): 20}

print(fa)

# `set`...
# store values
# cannot have multiple occurrences of the same element
# store unordered values
# and is useful to...
# remove duplicate values
# perform common math ops (unions, intersections)
setx = set(['foo', 'bar', 'baz', 'foo', 'qux'])

print(setx)

print('bar' in setx)

for x in setx:
    for y in setx:
        print(x, y)