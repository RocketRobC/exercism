from string import maketrans

def to_rna(strand):
    dna = 'GCTA'
    rna = 'CGAU'
    for c in strand:
        if c not in dna:
            return ''
    return strand.translate(maketrans(dna, rna))
