def hey(remark):
    if remark == remark.upper() and remark != remark.lower():
        return 'Whoa, chill out!'
    elif remark.rstrip().endswith('?'):
        return 'Sure.'
    elif len(remark.strip()) == 0:
        return 'Fine. Be that way!'
    else:
        return 'Whatever.'
