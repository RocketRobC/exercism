import math

def encode(plain_text):
    return ' '.join([''.join(t) for t in list(zip(*generate_rectangle(normalise(plain_text))))])

def generate_rectangle(normalised_text):
    text = apply_padding(normalised_text)
    return [text[i:i + columns(text)] for i in range(0, len(text), columns(text))]

def apply_padding(text):
    padding_value = (columns(text) * rows(text)) - len(text)
    return text + ' ' * padding_value

def normalise(text):
    return str.lower(''.join([char for char in text if char.isalnum()]))

def columns(text):
    return math.ceil(math.sqrt(len(text))) or 1

def rows(text):
    return math.ceil(len(text) / columns(text))
