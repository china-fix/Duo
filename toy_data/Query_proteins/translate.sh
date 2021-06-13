list=$(cat list)
for locus in $list
do
	seqkit translate "$locus.fa" --trim -T11 > "$locus.fa.p"
done
