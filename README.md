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

 
