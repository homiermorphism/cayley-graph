def CayleyGraph(S,T):
    G = Graph()
    for s in S:
        G.add_vertices(s)
        for t in T:
            G.add_edges([(s,s*t)])
    return G



S4 = SymmetricGroup(4).list()

T4 = []
for s in S4:
    if len(s.cycle_string()) == 5:
        T4.append(s)

G = CayleyGraph(S4,T4)
G.show()
