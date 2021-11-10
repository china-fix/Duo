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
# Duo workflow
![](Figure_1.png?raw=true "Duo workflow")
* Overview of Duo workflow. (A) A schematic to illustrate the general working processes and the three main input contents defined by users. (B) A schematic to illustrate the correction analysis step between Query_proteins/Reference_proteins and Seed_database. (C) A schematic to illustrate the correction analysis step between Query_proteins and Reference_proteins.
# Input/Output files description

## Input files
* **Query_proteins**: query protein sequences file in fasta format
    ```
    >unknown_protein_1
    MARIIVVTSGKGGVGKTTSSAAIATGLAQKGKKTVVIDFDIGLRNLDLIMGCERRVVYDF
    VNVIQGDATLNQALIKDKRTENLFILPASQTRDKDALTREGVAKVLDSLKAMDFEFIVCD
    SPAGIETGALMALYFADEAIITTNPEVSSVRDSDRILGILASKSRRAENGEEPIKEHLLL
    TRYNPGRVNKGDMLSMEDVLEILRIKLVGVIPEDQSVLRASNQGEPVILDATADAGKAYA
    >unknown_protein_2
    MERITVTLGERSYPITIAAGLFNEPASFLPLKSGDQVMLVTNETLAPLYLDKVRGVLERA
    GVNVDSVILPDGEQYKSLTVLDTVFTALLKKPHGRDTTLVALGGGVIGDLTGFAAASYQR
    GVRFIQVPTTLLSQVDSSVGGKTAVNHPLGKNMIGAFYQPASVVVDLDCLKTLPARELAS
    GLAEVIKYGIILDADFFTWLEGNLDALLRLDGPAMAYCIRRCCELKAEVVAADEREAGLR
    ALLNLGHTFGHAIEAEMGYGNWLHGEAVAAGIVMAARASERLGQFSSTDTQRIIALLERA
    GLPVNGPCEMSAQDYLPHMLRDKKVLAGELRLVLPLAIGKSEVRGGVSHEVVLSAIADCQ
    ...
    ```


* **Reference_proteins**: reference protein sequences file in fasta format
    ```
    >reference_protein_1
    MSDDMSMGSPSSAGEQGVLRSMQEVAMSSQEASKMLRTYNIAWWGNNYYDVNELGHISVC
    PDPDVPEARVDLAKLVKAREAQGQRLPALFCFPQILQHRLRSINAAFKRARESYGYNGDY
    FLVYPIKVNQHRRVIESLIHSGEPLGLEAGSKAELMAVLAHAGMTRSVIVCNGYKDREYI
    RLALIGEKMGHKVYLVIEKMSEIAIVLEEAERLNVGPRLGVRARLASQGSGKWQSSGGEK
    SKFGLAATQVLQLVETLRDAGRLDSLQLLHFHLGSQMANIRDIATGVRESARFYVELHKL
    GVNIQCFDVGGGLGVDYEGTRSQSDCSVNYGLNEYANNIIWAIGDACEEHGLPHPTMITE
    SGRAVTAHHTVLVSNIIGVERNEYTDPTAPAEDAPRALQNLWETWQEMHKPGTRRSLREW
    LHDSQMDLHDIHIGYSSGAFSLQERAWAEQLYLSMCHEVQKQLDPQNRAHRPIIDELQER
    MADKMYVNFSLFQSMPDAWGIDQLFPVLPLEGLDQVPERRAVLLDITCDSDGAIDHYIDG
    DGIATTMPMPEYDPENPPMLGFFMVGAYQEILGNMHNLFGDTEAVDVFVFPDGSVEVELS
    DEGDTVADMLQYVQLDPKTLLTHFRDQVKQTDLDDALQQQFLEEFEAGLYGYTYLEDE
    >reference_protein_2
    MRRITPFFPFFVLLVSHFSLAISYPLPPEGSRLVGQPVTIAVPQNNTQPLESFAARYGQG
    LSNMLEANPGVDVFLPQSGSTLVVPQQLILPDTVREGIVVNVAEMRLYYYPAGTNTVEVL
    PIGIGQAGRGTPRNWVTAVERKQDGPVWVPTANTRREYAKEGKTLPAMVPAGPDNPMGLY
    AIYIGRLYAIHGTNANFGIGLRVSQGCIRLRNDDIKYLFDHVPVGTRVQIIDRPVKFSVE
    PDGSRWLEVHEPLSRNRAEFESDKKVPLPVTPVLRTFIKGDDVDTSRVNEVLERRSGMPV
    NISAGRPGL
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
* **domain_correlation.csv**:  tab-delimited text file, details all the correlation records among Query_proteins, Reference_proteins and Seed_database

    * Example of domain_correlation.csv output from domain_correlation.InterPro.py
 ```
	ACC	DB	DESCRIPTION	HIT_PROTEINS(name,domain_num)_R	HIT_PROTEINS_R	HIT_PROTEINS_NUM_R	HIT_PROTEINS(name,domain_num)_Q	HIT_PROTEINS_Q	HIT_PROTEINS_NUM_Q
0	G3DSA:1.10.10.10	GENE3D	<unknown description>	('VFG042447(gb|AAA23662)', 1);('VFG042390(gb|YP_540132)', 1);('VFG042429(gb|CAA54112)', 1);('VFG000880(gb|NP_755468)', 1);('VFG002413(gb|NP_286011)', 1);('VFG042440(gb|AAK16195)', 1);('VFG001713(gb|NP_755457)', 1);('VFG012327(gb|YP_540122)', 1)	VFG042447(gb|AAA23662);VFG042390(gb|YP_540132);VFG042429(gb|CAA54112);VFG000880(gb|NP_755468);VFG002413(gb|NP_286011);VFG042440(gb|AAK16195);VFG001713(gb|NP_755457);VFG012327(gb|YP_540122)	8.0	('STM0960', 1);('STM0068', 1);('STM3876', 1);('STM1547', 1);('STM1805', 1);('STM4588', 1);('STM3682', 2);('STM3888', 1);('STM2920', 1);('STM2145', 1);('STM3014', 1);('STM1127', 1);('STM1950', 1);('STM2275', 1);('STM0115', 1);('STM1625', 1);('STM3533', 1);('STM1887', 1);('STM0347', 1);('STM2557', 1);('STM1523', 1);('STM2131', 1);('STM1894', 1);('STM1842', 1);('STM4270', 1);('STM1659', 1);('STM0466', 1);('STM1520', 1);('PSLT013', 1);('STM3064', 1);('STM0397', 1);('STM0789', 1);('STM3124', 1);('STM2201', 1);('STM1096', 1);('STM3215', 1);('STM1598', 1);('STM3507', 1);('STM0459', 1);('STM3958', 1);('STM2069', 1);('STM3502', 1);('STM0151', 1);('STM1677', 1);('STM2373', 1);('STM4138', 1);('STM2982', 1);('STM2837', 1);('STM0693', 1);('STM2924', 2);('PSLT012', 1);('STM3405', 1);('STM2455', 1);('STM3367', 1);('STM3211', 2);('STM3667', 1);('STM3466', 1);('STM2803', 1);('STM2281', 1);('STM1541', 1);('STM0835', 1);('STM4237', 1);('STM2572', 1);('STM3084', 1);('STM0430', 1);('STM2420', 1);('STM4507', 1);('STM4068', 1);('STM4073', 1);('STM0410', 1);('STM0606', 1);('STM4448', 1);('STM3262', 1);('STM0702', 1);('STM3177', 1);('STM0514', 1);('STM3693', 1);('STM3759', 1);('STM0779', 1);('STM3607', 1);('STM0952', 1);('STM0763', 1);('STM1014', 1);('STM4241', 1);('STM0030', 1);('STM0040', 1);('STM0959', 1);('STM2270', 1);('STM3848', 1);('STM1429', 1);('STM3357', 1);('STM1767', 1);('STM3360', 1);('STM1713', 1);('STM3121', 1);('STM2813', 1);('STM3252', 1);('STM0516', 1);('STM2544', 1);('STM2794', 1);('STM2912', 1);('STM4125', 1);('STM2609', 1);('STM2575', 1);('STM0992', 1);('STM4337', 1);('STM3964', 1);('STM2828', 3);('STM1660', 1);('STM0634', 1);('STM1487', 1);('STM3830', 1);('STM4417', 1);('STM4548', 1);('STM1001', 1);('STM4292', 1);('STM3020', 1);('STM1142', 1);('STM0017', 1);('STM2979', 1);('STM4059', 1);('STM0029', 1);('STM1265', 1);('STM2330', 1);('STM4367', 1);('STM3523', 1);('STM3736', 1);('STM4187', 1);('STM3547', 1);('STM1704', 1);('STM1231', 1);('STM2292', 1);('STM2797', 1);('STM3358', 1);('STM3235', 1);('STM0031', 1);('STM3908', 1);('STM2424', 1);('STM0682', 1);('STM2640', 1);('STM2644', 1);('STM0014', 1);('STM3098', 1);('STM1510', 1);('STM1382', 1);('STM3785', 1);('STM0256', 1);('STM2876', 1);('STM2919', 1);('STM1444', 1);('STM0552', 1);('STM4463', 1);('STM3602', 1);('STM0344', 1);('STM0859', 1);('STM3824', 1);('STM3340', 1);('STM2180', 1);('STM1168', 2);('STM3800', 1);('STM1588', 1);('STM3834', 1);('STM4025', 1);('STM2265', 1);('STM0304', 1);('STM3515', 1);('STM3245', 1);('STM2436', 1);('STM4598', 1);('STM1475', 1);('STM1982', 1);('STM1488', 1);('STM1100', 1);('PSLT041', 1);('STM3897', 1);('STM4511', 1);('STM3606', 1);('STM0764', 1);('STM4314', 1);('STM0333', 1);('STM2785', 1);('STM1387', 1);('STM0692', 1);('STM4402', 1)	STM0960;STM0068;STM3876;STM1547;STM1805;STM4588;STM3682;STM3888;STM2920;STM2145;STM3014;STM1127;STM1950;STM2275;STM0115;STM1625;STM3533;STM1887;STM0347;STM2557;STM1523;STM2131;STM1894;STM1842;STM4270;STM1659;STM0466;STM1520;PSLT013;STM3064;STM0397;STM0789;STM3124;STM2201;STM1096;STM3215;STM1598;STM3507;STM0459;STM3958;STM2069;STM3502;STM0151;STM1677;STM2373;STM4138;STM2982;STM2837;STM0693;STM2924;PSLT012;STM3405;STM2455;STM3367;STM3211;STM3667;STM3466;STM2803;STM2281;STM1541;STM0835;STM4237;STM2572;STM3084;STM0430;STM2420;STM4507;STM4068;STM4073;STM0410;STM0606;STM4448;STM3262;STM0702;STM3177;STM0514;STM3693;STM3759;STM0779;STM3607;STM0952;STM0763;STM1014;STM4241;STM0030;STM0040;STM0959;STM2270;STM3848;STM1429;STM3357;STM1767;STM3360;STM1713;STM3121;STM2813;STM3252;STM0516;STM2544;STM2794;STM2912;STM4125;STM2609;STM2575;STM0992;STM4337;STM3964;STM2828;STM1660;STM0634;STM1487;STM3830;STM4417;STM4548;STM1001;STM4292;STM3020;STM1142;STM0017;STM2979;STM4059;STM0029;STM1265;STM2330;STM4367;STM3523;STM3736;STM4187;STM3547;STM1704;STM1231;STM2292;STM2797;STM3358;STM3235;STM0031;STM3908;STM2424;STM0682;STM2640;STM2644;STM0014;STM3098;STM1510;STM1382;STM3785;STM0256;STM2876;STM2919;STM1444;STM0552;STM4463;STM3602;STM0344;STM0859;STM3824;STM3340;STM2180;STM1168;STM3800;STM1588;STM3834;STM4025;STM2265;STM0304;STM3515;STM3245;STM2436;STM4598;STM1475;STM1982;STM1488;STM1100;PSLT041;STM3897;STM4511;STM3606;STM0764;STM4314;STM0333;STM2785;STM1387;STM0692;STM4402	184.0
1	PF04703	PFAM	FaeA-like protein	('VFG042447(gb|AAA23662)', 1);('VFG042429(gb|CAA54112)', 1);('VFG000880(gb|NP_755468)', 1);('VFG042440(gb|AAK16195)', 1);('VFG012327(gb|YP_540122)', 1)	VFG042447(gb|AAA23662);VFG042429(gb|CAA54112);VFG000880(gb|NP_755468);VFG042440(gb|AAK16195);VFG012327(gb|YP_540122)	5.0	('PSLT013', 1)	PSLT013	1.0
2   ...
 ```
    
    Content Name: Explanation
 
    AAC: accession number(id) of the matched biological entity in Seed_database.
 
    DB: the member Seed_database name applied in InterProscan.
 
    DESCRIPTION: the annotation information of the matched biological entity.
 
    HIT_PROTEINS(name,domain_num)_R: records the protein name and the domain number to the matched biological entity in Reference_proteins.
 
    HIT_PROTEINS_R: records the protein name to the matched biological entity in Reference_proteins.
 
    HIT_PROTEINS_NUM_R: count the protein number to the matched biological entity in Reference_proteins.
 
    HIT_PROTEINS(name,domain_num)_Q: records the protein name and the domain number to the matched biological entity in Query_proteins.
 
    HIT_PROTEINS_Q: records the protein name to the matched biological entity in Query_proteins.
 
    HIT_PROTEINS_NUM_Q: count the protein number to the matched biological entity in Query_proteins.
 
* **domain_correlation_inner.csv**:  subset of domain_correlation.csv file who only details the correlation records shared between Query_proteins and Reference_proteins.
* **HITPROTEINS**:  a folder who contains the detailed protein names that correlated between Reference_proteins and Query_proteins.

	* Example of one output file in HITPROTEINS folder (PFAM_HITPROTEINS_Q)
 ```
 STM1091
STM2897
STM1412
STM0301
STM4572
STM2150
STM3028
STM0175
STM3638
STM0023
PSLT017
...
 ```
* **INPUT_BACKUP**:  a folder who contains the copys of the Query_proteins and Reference_proteins files inputted by user.




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
* This is a InterProScan dependent python script to correlate the proteins (references proteins/query proteins) according the different member databases.

Usage: python3 domain_correlation_InterPro.py

    --Q_PROTEINS (required=True, type=str, metavar='FILENAME', help="the user selected proteins file as Query_proteins")
    
    --R_PROTEINS (required=True, type=str, metavar='FILENAME', help="the user selected proteins file as Reference_proteins")
    
    --INTERPROSCAN_BIN (required=True, type=str, metavar='PATH', help="the path of hmm profile InterProScan. eg. /home/fix/export_bin/InterProScan/interproscan-5.46-81.0/interproscan.sh")
    
    --OUTPUT (default="domain_cor_InterPro", type=str, metavar='directory', help="Output directory name")

## custom_pfamdb.py
* This is a hmmer3 dependent python script to constract your own customed pfam profiles database according the proteins you feed to the total pfam databse

Usage: python3 custom_pfamdb.py

    --CUSTOM_PROTEINS (required=True, type=str, metavar='FILENAME', help="the user selected proteins file (Reference_proteins) to help construct the custom_pfam databse")
    
    --HMMDB_PATH (required=True, type=str, metavar='PATH', help="the path of hmm profile database. eg. /home/fix/downloads/pfam.hmmlib")
    
    --OUTPUT (default="custom_pfamdb_out", type=str, metavar='directory', help="Output directory name")
    
    --DETAIL_DIC (action='store_const', const=True, metavar='get detailed hmms dictornary', help="optional, get more detailed hmms dictorynary")
    
    --CPU (default=1, type=int, metavar='the cpu num you want to use', help="the cup number you want to use during hmmscan process, default is 1")
    
    --HIT_EVALUE (default=0.001, type=int, metavar='evalue thread', help="the evalue thread use during extracting hmm profile in domain-table, default is 0.001")
    
    --BIT_SCORE (default=10, type=int, metavar='bitscore thread', help="the bitscore thread use during extracting hmm profile in domain-table, default is 10")
   

        
# Citation
Fei, X., Li, Q., Olsen, J. E., & Jiao, X. (2021). Duo: A Signature Based Method to Batch-Analyze Functional Similarities of Proteins. Frontiers in microbiology, 2308.
 
