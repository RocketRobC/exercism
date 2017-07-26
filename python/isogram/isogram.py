def is_isogram(word):
    s = str.lower(word).replace('-', '').replace(' ', '')
    return len(set(s)) == len(s) 
