import sys
from sage.all import *

S4 = SymmetricGroup(4).list()

T4 =[]
for s in S4:
    if len(s.cycle_string())() == 2: # elements of the form (a,b)(c,d) are also of order 2 
        T4.append(s)
print(T4)


G = Graph()
for s in S4:
    G.add_vertices(s)
    for t in T4:
        G.add_edges([(s,s*t)])
print(order(G))
print(G.show())
print(G.is_bipartite())
