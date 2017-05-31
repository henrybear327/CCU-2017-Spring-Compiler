import subprocess


def convert_binary_to_decimal(input):
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


if __name__ == '__main__':
    input = "1001010.100010101"
    convert_binary_to_decimal(input)
