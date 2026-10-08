import gzip

filename = "hprc.gfa.gz"

with gzip.open(filename, "rt") as f:
    count = 0
    for line in f:
        if line.startswith("W\t"):
            fields = line.rstrip("\n").split("\t")

            sample = fields[1]
            haplotype = fields[2]
            chromosome = fields[3]
            walk = fields[6]

            print("Sample:", sample)
            print("Haplotype:", haplotype)
            print("Chromosome:", chromosome)
            print("Walk (first 150 chars):", walk[:150])
            print()

            count += 1
            if count == 2:
                break