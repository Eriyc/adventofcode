from itertools import chain

def p1(dumb, **_):
    return ''.join(map(str, f(map(int, dumb), 100)))

def p2(dumb, **_):
    gen = f(chain(map(int, dumb), range(10, 1000001)), 10000000)
    return next(gen) * next(gen)

def f(x, n):
    prev = None
    d = {}
    for i in x:
        if prev is None:
            start = i
        else:
            d[prev] = i
        prev = i
    d[i] = start
    current = start
    length = len(d)
    for _ in range(n):
        a = d[current]
        b = d[a]
        c = d[b]
        next_ = d[c]
        d[current] = next_                   
        dest = current
        while True:
            dest -= 1
            if not dest:
                dest = length
            if dest not in (a, b, c):
                break
        d[c] = d[dest]
        d[dest] = a
        current = next_
    current = 1
    while d[current] != 1:
        current = d[current]
        yield current

print(p1("589174263"))
print(p2("589174263"))