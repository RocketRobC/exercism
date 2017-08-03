import re
from collections import Counter

def word_count(s):
    words = re.findall('[a-zA-Z0-9]+', s.lower())
    return Counter(words)
