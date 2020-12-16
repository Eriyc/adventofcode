TURN = 30000000  # 2020 for part 1

input_nums = [18, 8, 0, 5, 4, 1, 20]
numbers = {}
prev = None
for i, x in enumerate(input_nums):
    numbers[prev] = i - 1
    prev = x
while 1:
    i += 1
    x = 0 if prev not in numbers else i - 1 - numbers[prev]
    numbers[prev] = i - 1
    prev = x
    if i == TURN-1:  # tar ~15-20 sekunder
        print(x)
        break
