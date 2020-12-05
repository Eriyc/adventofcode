f = open("input.in", "r").read().splitlines()


def solve(tickets):
    seats = []

    for ticket in tickets:
        seats.append(
            int(ticket.replace("F", "0")
                      .replace("B", "1")
                      .replace("L", "0")
                      .replace("R", "1"), 2)
        )

    print("Part 1", max(seats))

    mine = None
    for seat_id in range(127 * 8):
        if (seat_id - 1 in seats) and \
           (seat_id not in seats) and \
           (seat_id + 1 in seats):
            mine = seat_id

    print("Part 2", mine)


solve(f)
