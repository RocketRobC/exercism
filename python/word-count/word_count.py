import re

def word_count(s):
    result = {}
    words = re.split('[^a-zA-Z0-9]', s.lower())
    for word in words:
        result[word] = words.count(word)
    if '' in result: del result['']
    return result
