#!/usr/bin/env python3

# Data Strcutures
# list, dict, tuples, sets, strings

##### list... ####################
# https://thomas-cokelaer.info/tutorials/python/lists.html
def runListDemo():
    print(">>> runListDemo >>>")
    
    l = ["run", "list", "demo"]
    print(l)

    # removes the first instance of, not all
    # if (!instance), killerr
    l.remove("run")

    l.insert(0, "running")
    print(l)

    l.append("..still")
    print(l)

    l.extend(["is", "obvi", "runin", "so.."])
    print(l)

    l.pop()
    print(l)

    # print(l.index("is"))
    # print(l.count(1))
    # print(l[0]) # access elements by

    l = ["redefined - no longer runin"]
    print(l)

    print("<<< runListDemo <<<")

##### list... ####################


##### `set`... ####################
# store values
# cannot have multiple occurrences of the same element
# store unordered values
# and is useful to...
# remove duplicate values
# perform common math ops (unions, intersections)
setx = set(['foo', 'bar', 'baz', 'foo', 'qux'])

runListDemo()