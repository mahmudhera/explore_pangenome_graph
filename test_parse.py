import gzip
import gfapy

g = gfapy.Gfa()

with gzip.open("hprc.gfa.gz", "rt") as f:
    for line in f:
        g.add_line(line.rstrip("\n"))

print("Segments:", len(g.segments))
print("Edges:", len(g.edges))

for path in g.paths[:2]:
    print("Path:", path.name)
    print("Nodes:", path.segment_names[:20])