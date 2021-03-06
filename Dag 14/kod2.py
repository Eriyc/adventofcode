def solve(inp):

    # THIS IS PART ONE
    mem = {}
    mask = ""
    for v in inp:
        if v.startswith("mask = "):
            mask = list(v.split(" = ")[1])
        else:
            addr, val = v.split(" = ")
            addr = int(addr[4:-1])
            val = int(val)

            bits = list(bin(val)[2:].zfill(36))
            bitsn = [0] * 36
            for i, (mbit, abit) in enumerate(zip(mask, bits)):
                if mbit == "X":
                    bitsn[i] = abit
                else:
                    bitsn[i] = mbit

            mem[addr] = int("".join(bitsn), 2)
    print(sum(mem.values()))

    # THIS IS PART TWO
    mem = {}
    mask = ""
    for v in inp:
        if v.startswith("mask = "):
            mask = list(v.split(" = ")[1])
        else:
            addr, val = v.split(" = ")
            addr = int(addr[4:-1])
            val = int(val)

            addr = list(bin(addr)[2:].zfill(36))
            addrn = [None] * 36
            for i, (mbit, abit) in enumerate(zip(mask, addr)):
                if mbit == "0":
                    addrn[i] = abit
                elif mbit == "1":
                    addrn[i] = 1
                else:
                    addrn[i] = None

            num_fluct = addrn.count(None)
            flucts = []
            for i in range(2**num_fluct):
                flucts.append( list(bin(i)[2:].zfill(num_fluct)) )

            addresses = []
            for fluct in flucts:
                i = 0
                a = ""
                for j, vv in enumerate(addrn):
                    if vv != None:
                        a += str(vv)
                    else:
                        a += str(fluct[i])
                        i = i + 1
                
                mem[int(a, 2)] = val

    print(sum(mem.values()))


with open("input.in") as f:
    s = f.read().strip().split("\n")

solve(s)