
def play(p, q, rec=False):
    h = {}
    while len(p) > 0 and len(q) > 0:
        hash = str(p)+str(q)
        if hash in h:
            return True, p
        h[hash] = 1
        p1 = p.pop(0)
        q1 = q.pop(0)
        p1win = p1 > q1
        if rec and len(p) >= p1 and len(q) >= q1:
            p1win, _ = play(p[:p1], q[:q1], True)
        if p1win:
            p = p + [p1, q1]
        else:
            q = q + [q1, p1]
    return (True, p) if p else (False, q)


decks = open('input.in').read().rstrip().split('\n\n')
p = list(map(int, decks[0].split('\n')[1:]))
q = list(map(int, decks[1].split('\n')[1:]))

for r in (1, 2):
    win, w = play(p.copy(), q.copy(), r == 2)
    print(f"P{2-win} wins: ", w)
    print(f"Part{r}:", sum([i*j for i, j in zip(w, range(len(w), 0, -1))]))
