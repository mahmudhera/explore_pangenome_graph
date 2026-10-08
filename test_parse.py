import gfapy

g = gfapy.Gfa.from_file("hprc.gfa")

for path in g.paths[:2]:
    print("Path:", path.name)
    print("Nodes:", [str(s) for s in path.segment_names[:20]])