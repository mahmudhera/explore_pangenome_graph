import gzip
import gfapy

g = gfapy.Gfa(version="gfa1")

with gzip.open("hprc.gfa.gz", "rt") as f:
    for line in f:
        if line.startswith(("S\t", "L\t", "P\t")):
            g.add_line(line.rstrip("\n"))

print("Segments:", len(g.segments))
print("Links:", len(g.edges))
print("Paths:", len(g.paths))