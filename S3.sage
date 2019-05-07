import sys
from sage.all import *


S3 = SymmetricGroup(3).list()

T3 =[]
for s in S3:
    if s.order() == 2:
        T3.append(s)
print(T3)


G = Graph()
for s in S3:
    G.add_vertices(s)
    for t in T3:
        G.add_edges([(s,s*t)])
print(order(G))
H = G.graphplot(vertex_size = 400,graph_border = True,layout='circular')
print(H.show())
print(G.is_bipartite())
