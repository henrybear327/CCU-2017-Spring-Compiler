input = "101.101"
input_split = input.split(".")

ans = 0.0

base = 2 ** (len(input_split[0]) - 1)
for i, c in enumerate(input_split[0]):
    # print (i, c)
    if c == '1':
        ans += base
    base /= 2

base = 0.5
for i, c in enumerate(input_split[1]):
    # print (i, c)
    if c == '1':
        ans += base
    base /= 2

print(ans)
