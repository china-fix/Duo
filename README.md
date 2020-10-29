# Duo
A biological signature based method to batch analyze functional similarities of proteins
# Introduction
Duo is a workflow to batch analyze functional similarities of proteins. A key utility provided by Duo is to screen for query proteins with specific characteristics based on highly free and customizable reference protein sequences inputted by users.
# Dependencies
1. [python 3.6.9](https://www.python.org/) and following librarires are required:
* [Biopython 1.74](https://biopython.org/)
* [pandas 1.1.3](https://pandas.pydata.org/)
2. [InterProScan 5 (version 5.47-82.0)](https://www.ebi.ac.uk/interpro/download/);
3. [hmmer 3.3](http://hmmer.org/download.html);
4. [ps_scan 20.0](https://prosite.expasy.org/prosite.html)
# Corevar workflow
![](Figure_1.png?raw=true "Duo workflow")
* Overview of Duo workflow. (A) A schematic to illustrate the general working processes and the three main input contents defined by users. (B) A schematic to illustrate the correction analysis step between Query_proteins/Reference_proteins and Seed_database. (C) A schematic to illustrate the correction analysis step between Query_proteins and Reference_proteins.
# Input/Output files description

## Input files
* **Query_proteins**: query protein sequences file in fasta format
    ```
    >unknown_protein_1
    ATGAAGCGATTAAGTTTAGCGATGGTGACGCTGCTGGCCTGTGCGGGTGCGCAGGCTGCC
    AGCGAGAAAGTAGAGATGAATCTGGTGACGGCGCAAGGCGTAGGACAGTCTATCGGCACC
    GTCGTCATCGATGAAACCGAAGGCGGCTTAAAATTTACCCCACACCTTAAAGCGTTGCCG
    CCGGGCGAGCATGGTTTTCACATTCATGCCAACGGTAGCTGCCAGCCAGCGATTAAAGAC
    GGCCAAGCGGTTGCCGCAGAAGCCGCTGGTGGTCATCTGGACCCACAAAATACCGGCAAG
    CATGAAGGACCGGAAGGCCAGGGGCATCTGGGCGACCTCCCGGTGTTAGTCGTTAATAAT
    GATGGTATCGCCACCGAACCGGTTACTGCGCCGCGTCTGAAGTCTCTTGATGAAGTGAAA
    GATAAAGCGCTCATGATCCATGTGGGCGGCGATAACATGTCCGATCAGCCGAAACCGCTC
    GGCGGCGGCGGAACGCGTTACGCCTGCGGCGTCATTAAATAA
    >unknown_protein_2
    ATGAATAAGCAAACCGAACATGATACCCGCGAACATCTGCTGGCCACCGGCGAGCAGCTT
    TGTATGCAACGGGGTTTTACCGGCATGGGGCTTAGCGAATTGCTCAAAACCGCCCAGGTG
    CCTAAAGGGTCGTTTTATCACTACTTTCGCTCGAAAGAAGCCTTCGGCGTCGCCATGCTT
    GAGCGACATTACGCCTGCTATCATCAGCGTCTTACGGCGCACTTCACCTCCGGTCCCGGT
    AATCATCGCGATCGCCTTCTCGCCTGGTATCAGGAAACGTTAAAGCAGTTTTGCCAGCAA
    GGCGCCATCAGCGGTTGCCTGACGGTGAAACTGTCAGCGGAGGTCTGCGATCTGTCGGAG
    GATATGCGCTCTACGATGGATAAAGGGGCGCAGGAGATCATGGCACTGCTTGCACGCGCG
    CTGGAAGATGGCCGTAATAGCCACTGTTTACATTTCACCGGCCAGCCGTTGCCACAGGCG
    CAGGTACTTTATGCCCTGTGGCTGGGCGCCAATTTGCAGGCCAAAATATCCCGTAGCGCC
    GCGCCGCTGGAAAATGCGTTGGCGCATGTTAAGACCATCATTGCAACGCCTGAGCAGTAA
    ...
    ```


* **Reference_proteins**: reference protein sequences file in fasta format
    ```
    >reference_protein_1
    ATGAAGCGATTAAGTTTAGCGATGGTGACGCTGCTGGCCTGTGCGGGTGCGCAGGCTGCC
    AGCGAGAAAGTAGAGATGAATCTGGTGACGGCGCAAGGCGTAGGACAGTCTATCGGCACC
    GTCGTCATCGATGAAACCGAAGGCGGCTTAAAATTTACCCCACACCTTAAAGCGTTGCCG
    CCGGGCGAGCATGGTTTTCACATTCATGCCAACGGTAGCTGCCAGCCAGCGATTAAAGAC
    GGCCAAGCGGTTGCCGCAGAAGCCGCTGGTGGTCATCTGGACCCACAAAATACCGGCAAG
    CATGAAGGACCGGAAGGCCAGGGGCATCTGGGCGACCTCCCGGTGTTAGTCGTTAATAAT
    GATGGTATCGCCACCGAACCGGTTACTGCGCCGCGTCTGAAGTCTCTTGATGAAGTGAAA
    GATAAAGCGCTCATGATCCATGTGGGCGGCGATAACATGTCCGATCAGCCGAAACCGCTC
    GGCGGCGGCGGAACGCGTTACGCCTGCGGCGTCATTAAATAA
    >reference_protein_2
    ATGAATAAGCAAACCGAACATGATACCCGCGAACATCTGCTGGCCACCGGCGAGCAGCTT
    TGTATGCAACGGGGTTTTACCGGCATGGGGCTTAGCGAATTGCTCAAAACCGCCCAGGTG
    CCTAAAGGGTCGTTTTATCACTACTTTCGCTCGAAAGAAGCCTTCGGCGTCGCCATGCTT
    GAGCGACATTACGCCTGCTATCATCAGCGTCTTACGGCGCACTTCACCTCCGGTCCCGGT
    AATCATCGCGATCGCCTTCTCGCCTGGTATCAGGAAACGTTAAAGCAGTTTTGCCAGCAA
    GGCGCCATCAGCGGTTGCCTGACGGTGAAACTGTCAGCGGAGGTCTGCGATCTGTCGGAG
    GATATGCGCTCTACGATGGATAAAGGGGCGCAGGAGATCATGGCACTGCTTGCACGCGCG
    CTGGAAGATGGCCGTAATAGCCACTGTTTACATTTCACCGGCCAGCCGTTGCCACAGGCG
    CAGGTACTTTATGCCCTGTGGCTGGGCGCCAATTTGCAGGCCAAAATATCCCGTAGCGCC
    GCGCCGCTGGAAAATGCGTTGGCGCATGTTAAGACCATCATTGCAACGCCTGAGCAGTAA
    ...
    ```


* **Seed_database**: protein signatures saved in specific format according the modeling method they applied.

    For example: HMMs profile
```
HMMER3/f [3.3.1 | Jul 2020]
NAME globins4
LENG 149
ALPH amino
RF no
MM no
CONS yes
CS no
MAP yes
DATE Tue Jul 21 10:15:03 2020
NSEQ 4
EFFN 0.964844
CKSUM 2027839109
STATS LOCAL MSV -9.8664 0.70955
STATS LOCAL VITERBI -10.7223 0.70955
STATS LOCAL FORWARD -4.1641 0.70955
HMM A C D E F G H ... W Y
m->m m->i m->d i->m i->i d->m d->d
COMPO 2.36800 4.52198 2.96929 2.70577 3.20715 3.01836 3.40293 ... 4.55599 3.63079
2.68638 4.42245 2.77499 2.73143 3.46374 2.40505 3.72514 ... 4.58497 3.61523
0.55970 1.87270 1.29132 1.73023 0.19509 0.00000 *
1 1.75819 4.17850 3.77264 3.37715 3.71018 3.31297 4.28273 ... 5.32308 4.09587 9 v - - -
2.68618 4.42225 2.77519 2.73123 3.46354 2.40513 3.72494 ... 4.58477 3.61503
0.03182 3.85936 4.58171 0.61958 0.77255 0.34183 1.23951
...
149 2.93078 5.12630 3.29219 2.66308 4.49202 3.60568 2.46960 ... 5.42994 4.19803 165 k - - -
2.68634 4.42241 2.77535 2.73098 3.46370 2.40469 3.72510 ... 4.58493 3.61420
0.21295 1.65128 * 1.49930 0.25268 0.00000 *
//
...
 ```


## Output files




# Quick Start (run it on Linux system)
## domain_correlation_hmmer3.py
* This is a hmmer3 dependent python script to correlate the proteins (references proteins/query proteins) according the pfam database (or other HMMs_profile)

Usage: pyhont3 domain_correlation_hmmer3.py

    --Q_PROTEINS (required=True, type=str, metavar='FILENAME', help="the user selected proteins file as Query_proteins")
    
    --R_PROTEINS (required=True, type=str, metavar='FILENAME', help="the user selected proteins file as Reference_proteins")
   
    --HMMDB_PATH (required=True, type=str, metavar='PATH', help="the path of hmm profile database (Seed_database). eg. /home/fix/downloads/pfam.hmmlib")
    
    --OUTPUT (default="domain_cor_hmmer3", type=str, metavar='directory', help="Output directory name")
    
    --PFAM (action='store_const', const=True, metavar='add --cut_tc option in hmmscan specific for pfam_db', help="optional, specific designed for pfam_db")
    
    --CPU (default=1, type=int, metavar='the cpu num you want to use', help="the cup number you want to use during hmmscan process, default is 1")
    
    --HIT_EVALUE (default=0.001, type=int, metavar='evalue thread', help="the evalue thread use during extracting hmm profile in domain-table, default is 0.001")
    
    --BIT_SCORE (default=10, type=int, metavar='bitscore thread', help="the bitscore thread use during extracting hmm profile in domain-table, default is 10")
    


## domain_correlation_prosite.py
* This is a ps_scan dependent python script to correlate the proteins (references proteins/query proteins) according the scanProsite database.

Usage: python3 domain_correlation_prosite.py


    --Q_PROTEINS (required=True, type=str, metavar='FILENAME', help="the user selected proteins file as Query_proteins")
    
    --R_PROTEINS (required=True, type=str, metavar='FILENAME', help="the user selected proteins file as Reference_proteins")
    
    --PROSITE_DB_PATH (required=True, type=str, metavar='PATH', help="the path of prosite.dat profile (Seed_database). eg. /home/fix/downloads/prosite.dat")
    
    --EVALUATOR_PATH (required=True, type=str, metavar='PATH', help="the path of evaluator.dat profile (for evaluate the pattern). eg. /home/fix/downloads/evaluator.dat")
    
    --ps_scan_PATH (required=True, type=str, metavar='PATH', help="the folder path of ps_scan.pl program. eg. /home/fix/ps_scan/")
    
    --OUTPUT (default="domain_cor_prosite", type=str, metavar='directory', help="Output directory name")
    
    --ONLY_DOM (action='store_const', const=True, metavar='ONLY_DOMMAIN_DB', help="optional,only ps_scan the protein domain profiles")
    
    --ONLY_PAT (action='store_const', const=True, metavar='ONLY_PATTERN_DB', help="optional,only ps_scan the protein pattern profiles")
    
    --SIMPLE_ANN (action='store_const', const=True, metavar='ONLY SHOW THE MATCH ACC', help="optional, in the ouput only show the match profile ID, without detail description")
    



## domain_correlation_InterPro.py

## custom_pfamdb.py



        
# Citation

 
