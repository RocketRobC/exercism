import string

def is_pangram(phrase):
    return not (set(string.ascii_lowercase) - set(str.lower(phrase)))
