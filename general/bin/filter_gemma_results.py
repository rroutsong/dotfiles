#!/usr/bin/python
import os
import sys
import pandas as pd
from pprint import pprint as pp

def main(argv):
    if len(sys.argv) != 2:
        raise ValueError('please run like ./filter_gemma_results.py <filename>')

    if os.path.exists(sys.argv[1]):
        assoc_results = sys.argv[1]
    else:
        raise FileNotFoundError('Input file ' + sys.argv[1] + ' does not exist.')

    df = pd.read_csv(sys.argv[1], sep='\t')

    chrs = list(set(list(df['chr'])))

    chrs_no_scaff = [int(x) for x in chrs if 'scaffold' not in str(x)]
    chrs_no_scaff = list(set(chrs_no_scaff))
    chrs_no_scaff.sort()
    scaffold_chr = chrs_no_scaff[-1]+1
    chrs_fixed = chrs_no_scaff + [scaffold_chr]

    df['chr'] = df['chr'].apply(lambda x: x if 'scaffold' not in str(x) else scaffold_chr)
    df['p_wald'] = df['p_wald'].apply(lambda x: float(x))
    df['snp'] = 'Chr' + df['chr'].map(str) + '_' + df['ps'].map(str)

    df2 = df[['snp', 'chr', 'ps', 'p_wald']]
    df2.columns = ['SNP', 'CHR', 'BP', 'P']

    df3 = df2[df2['P'] <= 0.05]
    df3 = df3.sort_values(by='P', ascending=True)

    df3.to_csv('filtered.txt', sep='\t', index=False)

if __name__ == '__main__':
    main(sys.argv)
