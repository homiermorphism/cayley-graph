from sage.all import *

S4 = SymmetricGroup(4).list()

T4 =[]
for s in S4:
    if len(s.cycle_string()) == 5:
        T4.append(s)
print(T4)

for s in S4:
    print(s.conjugacy_class())

pos = {}
counter = 0
counter2 = 0
for s in S4:
    if s.sign() == 1:
        pos.update( {s : [0.0, 0 - counter ]} )
        counter = counter + 1
    elif s.sign() == -1:
        pos.update( {s: [4,0 - counter2]})
        counter2 = counter2 + 1

first = []
second = []
for s in S4:
    if s.sign() == 1:
        first.append(s)
    elif s.sign() == -1:
        second.append(s)
colors = [first,second]

G = Graph()
for s in S4:
    G.add_vertices(s)
    for t in T4:
        G.add_edges([(s,s*t)])
print(order(G))
print(G.show())
H = G.graphplot(vertex_size = 100, vertex_labels = False, graph_border = True,pos = pos, partition = colors)
print(H.show())
print(G.is_bipartite())
