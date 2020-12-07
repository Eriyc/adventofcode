from functools import reduce

with open("input.in") as f:
    gs = f.read().split("\n\n")
    print(sum(map(lambda g: len(set(g.replace("\n",""))), gs)))
    print(sum(map(lambda g: len(reduce(lambda x, y: x & y, map(set, g.splitlines()))), gs)))