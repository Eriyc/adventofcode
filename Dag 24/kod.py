import collections

directions = open('input.in').read().rstrip().split('\n')

temp = "sesenwnenenewseeswwswswwnenewsewsw"

def parse(direction):
    complete = []
    prev = None
    current = None
    for character in direction:
        prev = current
        current = character
        if current == 'e':
            if prev == 's':
                complete.append('se')
            elif prev == 'n':
                complete.append('ne')
            else:
                complete.append('e')
        if current == 'w':
            if prev == 's':
                complete.append('sw')
            elif prev == 'n':
                complete.append('nw')
            else:
                complete.append('w')
    return complete

flips = collections.defaultdict(int)
def navigate(direction):
    x, y = 0, 0

    for d in parse(direction):
        ch = {
            'e': (1, 0),
            'se': (0, -1),
            'sw': (-1, -1),
            'w': (-1, 0),
            'nw': (0, 1),
            'ne': (1, 1),
        }[d]
        x += ch[0]
        y += ch[1]
    flips[(x,y)] += 1


for direction in directions:
    navigate(direction)

print(sum(1 for k, v in flips.items() if v % 2 == 1))


def step(flips):
    nearblack = collections.defaultdict(int)
    for k, v in flips.items():
        if v % 2 == 0:
            continue
        for adj in [
            (1, 0),
            (0, -1),
            (-1, -1),
            (-1, 0),
            (0, 1),
            (1, 1),
        ]:
            pt = (k[0] + adj[0], k[1] + adj[1])
            nearblack[pt] += 1
    newflips = {}
    for k, v in flips.items():
        if v % 2 == 1:
            if nearblack.get(k, 0) not in (1, 2):
                # flip to white
                pass
            else:
                newflips[k] = 1
    for k, v in nearblack.items():
        if v == 2 and flips.get(k, 0) % 2 == 0:
            newflips[k] = 1
    return newflips

for i in range(100):
    flips = step(flips)
    print(i+1, sum(1 for k, v in flips.items() if v % 2 == 1))