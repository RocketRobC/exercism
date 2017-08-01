import re
import string

def word_count(s):
    result = {}
    words = re.findall('[%s]+' % string.ascii_letters, s)
    for word in words:
        result[word] = words.count(word)
    return result
