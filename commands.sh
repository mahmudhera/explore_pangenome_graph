wget -O hprc.gfa.gz   https://s3-us-west-2.amazonaws.com/human-pangenomics/pangenomes/freeze/freeze1/minigraph-cactus/hprc-v1.1-mc-grch38/hprc-v1.1-mc-grch38.gfa.gz

# using bash

# First 20 records
gzip -dc hprc.gfa.gz | head -n 20

# a few entries

# S       5       TGCCAGCAGCTTGGAGAACCCACACTCAATGAACGCAGCACTCCACTACCCAGGAAATGCCTTCCTGCCCTCTCCTCATCCCATCCCTGGGCAGGGGACATGCAACTGTCTACAAGGTGCCAAGTACCAGGACAGGAAAGGAAAGACGCCAAAAATCCAGCGCTGCCCTCAGAGAAGGGCAACCACGCAGTCCCCATCTTGGCAAGGAAACACAATTTCCGAGGGAATGGTTTTGGCCTCCATTCTAAGTGCTGGACATGGGGTGGCCATAATCTGGAGCTGATGGCTCTTAAAGACCTGCATCCTCTTCCCTAGGTGTCCCTCGGGCACATTTAGCACAAAGATAAGCACAAAAGGTGCATCCAGCACTTTGTTACTATTGGTGGCAGGTT      SN:Z:GRCh38#chr1        SO:i:22678      SR:i:0
# S       6       T       SN:Z:GRCh38#chr1        SO:i:23070      SR:i:0
# S       922     C

# Count segment, link, and path records
gzip -dc hprc.gfa.gz |
  awk '$1=="S"{s++} $1=="L"{l++} $1=="P"||$1=="W"{p++}
       END{print "Segments:",s,"Links:",l,"Paths/Walks:",p}'

# output:
# Segments: 80069733 Links: 110938345 Paths/Walks: 25770

# create conda environment and install gfapy
conda create -n pangenome
conda activate pangenome
pip install gfapy

