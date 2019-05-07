from sage.all import *

S4 = SymmetricGroup(4).list()

T4 =[]
for s in S4:
    if len(s.cycle_string()) == 5: # elements of the form (a,b)(c,d) have order 2, so cannot use order to create connection set
        T4.append(s)
print(T4)

for s in S4:
    print(s.conjugacy_class())

identity = [S4[0]]
transpositions = []
dbletranspos = []
threecycles = []
fourcycles = []
# a really ugly way of separating the elements by their conjugacy classes
for s in S4:
    if len(s.cycle_string()) == 5:
        transpositions.append(s)
    elif len(s.cycle_string()) == 10:
        dbletranspos.append(s)
    elif len(s.cycle_string()) == 7:
        threecycles.append(s)
    elif len(s.cycle_string()) == 9:
        fourcycles.append(s)

pos = {}
counter = 0
counter2 = 0
first = []
second = []
# assigns the odd elements on the right and the even elements on the left
# also creates a set that can be used to color the vertices by even and odd
for s in S4:
    if s.sign() == 1:
        pos.update( {s : [0.0, counter ]} )
        counter = counter + 1
        first.append(s)
    elif s.sign() == -1:
        pos.update( {s: [4, counter2]})
        counter2 = counter2 + 1
        second.append(s)
colors = [first,second]



colors2 = [identity,transpositions,dbletranspos,threecycles,fourcycles]

pos3 = {}
counts1 = 0
counts2 = 0
for s in S4:
    if s.sign() == 1:
        pos3.update( {s : [0.0, 0, counts1 ]} )
        counts1 = counts1 + 1
    elif s.sign() == -1:
        pos3.update( {s: [4, 0, counts2]})
        counts2 = counts2 + 1

pos3 = {}
# currently a failed attempt to create a 3d plot by positioning the vertices based on their conjugacy classes
for s in S4:
    if len(s.cycle_string()) == 2:
        pos3.update( {s : [-1, 0, 0] } )
    if len(s.cycle_string()) == 5:
        pos3.update( { s : [0, 1, counts1] } )
        counts1 = counts1 + 1
    elif len(s.cycle_string()) == 10:
        pos3.update( { s : [1 , 0, counts2] } )
        counts2 = counts2 + 1
    elif len(s.cycle_string()) == 7:
        pos3.update( { s : [2 ,1,counts3] } )
        counts3 = counts3 + 1
    elif len(s.cycle_string()) == 9:
        pos3.update( { s : [3,0,counts4] } )
        counts4 = counts4 + 1

def CayleyGraph(G,S):
    Gamma = Graph()
    for g in G:
        Gamma.add_vertices(g)
        for s in S:
            Gamma.add_edges([(g,g*s)])
    return Gammaprint(order(G))

G = CayleyGraph(S4,T4)

print(G.show())
H = G.graphplot(vertex_size = 100, vertex_labels = False, graph_border = True,pos = pos2, partition = colors2)
print(H.show())

B = G.plot3d(vertex_labels = False, graph_border = True, partition = colors2, viewer = 'threejs')
print(B.show())
