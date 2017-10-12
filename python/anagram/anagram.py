def detect_anagrams(word, candidates):
    result = [match(w, word) for w in candidates]
    return list(filter(None, result))

def match(list_word, input_word):
    if list_word.lower() != input_word.lower() and letters_of(list_word) == letters_of(input_word):
        return list_word

def letters_of(word):
    l = list(word.lower())
    l.sort()
    return l
