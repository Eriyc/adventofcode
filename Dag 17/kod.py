import fileinput
import re


# calculate bounds
def bounds_for(idx, ACTIVE):
    print(ACTIVE)
    return range(min(p[idx] for p in ACTIVE)-1, max(p[idx] for p in ACTIVE)+2)


def solve(part1):
    ACTIVE = set()
    L = list([l.strip() for l in fileinput.input()])
    for row, l in enumerate(L):
        for column, character in enumerate(l):
            if character == '#':
                ACTIVE.add((row, column, 0, 0))

    # repeat 6 iterations
    for _ in range(6):
        NEW_ACTIVE = set()
        w_range = ([0] if part1 else bounds_for(3, ACTIVE))
        for x in bounds_for(0, ACTIVE):
            for y in bounds_for(1, ACTIVE):
                for z in bounds_for(2, ACTIVE):
                    for w in w_range:
                        nbr = 0
                        # check number of neighbours
                        for dx in [-1, 0, 1]:
                            for dy in [-1, 0, 1]:
                                for dz in [-1, 0, 1]:
                                    for dw in [-1, 0, 1]:
                                        if dx != 0 or dy != 0 or dz != 0 or dw != 0:
                                            if (x+dx, y+dy, z+dz, w+dw) in ACTIVE:
                                                nbr += 1
                        # inactive and three neighbours
                        if (x, y, z, w) not in ACTIVE and nbr == 3:
                            NEW_ACTIVE.add((x, y, z, w))
                        # active and two or three neighbours
                        if (x, y, z, w) in ACTIVE and nbr in [2, 3]:
                            NEW_ACTIVE.add((x, y, z, w))
        ACTIVE = NEW_ACTIVE

    return len(ACTIVE)


print(solve(True))
print(solve(False))
