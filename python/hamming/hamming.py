def distance(s1, s2):
    if len(s1) != len(s2): raise ValueError
    return len([1 for (a, b) in zip(s1, s2) if a != b])
