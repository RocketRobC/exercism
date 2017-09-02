from itertools import groupby

def decode(s):
    result = ''
    c_buffer = ''
    for c in s:
        if c.isdigit():
            c_buffer += c
        else:
            result += c * int(c_buffer or 1)
            c_buffer = ''
    return result


def encode(s):
    result = ''
    for v, grp in groupby(s):
        c = len(''.join(grp))
        if c == 1:
            result += v
        else:
            result += str(c) + v
    return result
