/*This file was automatically generated by AUnit v1.0's coverage-based test generation feature.
Test Suite Details:
Tests generated over: GRAPHS_templateAllCorrect.als
Number Valuations: 8
Number Tests: 38
Scope used: 5*/

/* 
Each node as a set of outgoing edges, representing a directed graph without multiple edged.
*/

sig Node {
	adj : set Node
}

/*
The graph is undirected, ie, edges are symmetric.
http://mathworld.wolfram.com/UndirectedGraph.html
*/
pred undirected {
 	adj = ~adj  --correct
 --  adj in Node<:adj    --incorrect 1
 -- { adj.~adj in iden}   --incorrect 2
 -- { all a,b:Node | a->b in adj implies b->a  not in adj}   --incorrect 3
 --  all a,b:Node | b->a in adj   --incorrect 4
 -- { all n : Node | one n.adj}   --incorrect 5
 -- { all n : Node | one n.adj & n.(~adj)}   --incorrect 6
 -- { all n : Node | some adj.n}   --incorrect 7
 --  lone Node   --incorrect 8
 -- { no adj}   --incorrect 9
 -- { no adj & ~*adj}   --incorrect 10
 -- { no adj & ~adj}   --incorrect 11
 -- { no adj.~adj}   --incorrect 12
 -- { no Node}   --incorrect 13
 -- { Node in Node}   --incorrect 14 
 -- { Node.adj = ~adj.Node}   --incorrect  15
 --  one adj & ~adj   --incorrect 16
 -- { one Node}   --incorrect  17
 --  some adj & ~adj  --incorrect. 18 
 -- { ~adj.adj in iden}   --incorrect. 19 
 --  ~adj.adj in iden and adj.~adj in iden   --incorrect 20
 -- { ~adj.adj in iden and iden in adj.~adj}   --incorrect 21
 -- { ~adj.adj in iden and iden in ~adj.adj}   --incorrect 22
}

/*
The graph is oriented, ie, contains no symmetric edges.
http://mathworld.wolfram.com/OrientedGraph.html
*/
pred oriented {
   no adj & ~adj --correct
 -- { adj != ~adj}   --incorrect 1
 -- { adj not in ~adj}   --incorrect 2
 -- { adj.~adj in iden}   --incorrect 3
 -- { all n : Node | some adj.n}   --incorrect 4
 -- { all n:Node | adj.n not in n.adj}   --incorrect 5
 -- { all n:Node | n.adj not in adj.n}   --incorrect 6
 -- { all n:Node | not (n.adj in adj.n)}   --incorrect 7
 -- { all n:Node | not n.adj in adj.n}   --incorrect 8
 -- { all x, y : Node | (x in ^adj.y) and (y in ^adj.x)}   --incorrect 9
 -- { all x, y : Node | x->y in adj and y->x in adj implies y = x}   --incorrect 10
 -- { no adj}   --incorrect 11
 -- { no adj . ~adj}   --incorrect 12
 -- { no iden & adj.~adj}   --incorrect (but no for generated test) 13
 -- { no ~adj}   --incorrect 14
 -- { Node.adj != adj.Node}   --incorrect 15
 -- { not (~adj = adj)}   --incorrect 16
 -- { some Node}   --incorrect 17
 -- { ~adj.adj in iden} --incorrect 18
}

/*
The graph is acyclic, ie, contains no directed cycles.
http://mathworld.wolfram.com/AcyclicDigraph.html
*/
pred acyclic {
 all a:Node | a not in a.^adj --correct
 -- { *adj not in iden}   --incorrect 1
 -- { adj not in adj.^adj}   --incorrect 2
 -- { all n : Node | no n & n.(*adj)}   --incorrect 3 
 -- { all n : Node | no n.(*adj)}   --incorrect  4
 -- { all n : Node | no n.(*adj) & n}   --incorrect 5
 -- { all n : Node | no n.(^adj)}   --incorrect 6
 -- { all x, y : Node | ^(x->y) in adj implies (y->x) not in adj}   --incorrect 7
 -- { all x, y : Node | ^(x->y) in adj implies ^(y->x) not in adj}   --incorrect 8
 -- { all x, y : Node | x->y in adj implies ^(y->x) not in adj}   --incorrect 9
 -- { all x, y : Node | x->y in adj implies y->x not in adj}   --incorrect 10
 -- { all x, y, z : Node | x->y in adj and z->y in adj implies y = z}   --incorrect 11
 -- { all x, y, z : Node | x->y in adj and z->y in adj implies y = z and z = x}   --incorrect 12
 -- { iden in ^adj}   --incorrect 13
 -- { iden not in (*adj - adj)}   --incorrect 14
 -- { iden not in (*adj) - adj}   --incorrect 15
 -- { iden not in (^adj - adj)}   --incorrect 16
 -- { iden not in *adj}   --incorrect 17
 -- { iden not in ^adj}   --incorrect 18
 -- { iden not in ^adj or iden in adj}   --incorrect 19
 -- { no n:Node | n in n.adj}   --incorrect 20
 --  { no n:Node | n not in n.^adj}   --incorrect 21
 -- { no n:Node | n not in n.adj}   --incorrect 22
 -- { no n:Node | Node in n.*adj}   --incorrect 23
 -- { no n:Node | Node in n.^adj}   --incorrect 24
 -- { no n:Node | Node in n.adj}   --incorrect 25
 -- { not iden in ^adj}   --incorrect 26
 -- { some a : Node | a -> a in adj}   --incorrect 27
 -- { some a,b : Node | a -> a in adj}  --incorrect 28
}

/*
The graph is complete, ie, every node is connected to every other node.
http://mathworld.wolfram.com/CompleteDigraph.html
*/
pred complete {
  all n:Node | Node in n.adj --correct
 -- { *adj = Node set -> set Node}   --incorrect 1
 -- { *adj in Node set -> set Node}   --incorrect 2
 -- { adj = *adj}   --incorrect 3
 -- { adj = ^adj}   --incorrect 4
 -- { all a : Node | a in a.^adj}   --incorrect 5
 -- { all a,b:Node | b in a.^adj}   --incorrect 6
 -- { all a:Node | a in a.^adj}   --incorrect 7
 --{ all a:Node | a in a.^adj and not a->a in adj}   --incorrect 8
 -- { all a:Node | a in a.^adj implies a in a.^adj}   --incorrect 9
 -- { all a:Node | a in a.adj}   --incorrect 10
 -- { all a:Node | a in adj.a}   --incorrect 11
 -- { all a:Node,b:Node | a in a.^adj implies a->b in adj}   --incorrect 12
 -- { all n : Node | (Node - n) in n.^adj}   --incorrect 13
 -- { all n : Node | (Node - n) in n.adj}   --incorrect 14
 -- { all n : Node | n.adj = (Node - n)}   --incorrect 15
 -- { all n : Node | Node - n in n.adj}   --incorrect 16
 -- { all n : Node | Node in n.^adj}   --incorrect 17
 -- { all n : Node | some (^adj).n}   --incorrect 18
 -- { all n : Node | some adj.n}   --incorrect 19
 -- { all n : Node | some n.(^adj)}   --incorrect 20 
 -- { all n : Node | some n.adj}   --incorrect 21
 -- { all n:Node | n in adj.n}   --incorrect 22
 -- { all n:Node | n in adj.Node}   --incorrect 23 
 -- { all n:Node | n in n.adj}   --incorrect 24
 -- { all n:Node | n in Node.adj}   --incorrect 25 
 -- { all n:Node | Node in n.*adj}   --incorrect 26
 -- { all n:Node | Node in n.^adj}   --incorrect 27
 -- { all n:Node | Node-n in n.adj}   --incorrect 28
 -- { all x : Node | x.adj - x = Node - x}   --incorrect 29
 -- { Node in Node.^adj}   --incorrect 30
 -- { Node in Node.adj}   --incorrect 31
 -- { Node set -> set Node in *adj}   --incorrect 32
 -- { Node.^adj = Node}   --incorrect 33
 -- { Node.^adj in Node}   --incorrect 34
}

/*
The graph contains no loops, ie, nodes have no transitions to themselves.
http://mathworld.wolfram.com/GraphLoop.html
*/
pred noLoops {
 no (iden & adj) --correct
 -- { adj = Node->Node - iden}   --incorrect 1
 -- { adj = ~iden}   --incorrect 2
 -- { all a : Node | a -> a in adj}   --incorrect 3
 -- { all a : Node | no (a.^adj & ^adj.a)}   --incorrect 4
 -- { all a:Node | a not in a.^adj}   --incorrect 5
 -- { all a:Node | a.next not in a }   --incorrect 6
 -- { all a:Node | no a & a.^adj}   --incorrect 7
 -- { all a:Node | not (a.adj=a)}   --incorrect 8
 -- { all n : Node | no n->n}   --incorrect 9
 -- { all n:Node | n not in n.^adj}   --incorrect 10
 -- { all x, y : Node | x->y in adj implies not y->x in adj}   --incorrect 11
 -- { all x, y, z : Node | x->y in adj implies not y->x in adj}   --incorrect 12    
 -- { no adj + iden}   --incorrect 13
 -- { no adj - iden}   --incorrect 14
 --{ no adj.Node & Node.adj}   --incorrect 15
 -- { no iden}   --incorrect 16
 -- { no ~adj.adj}   --incorrect 17
}

/*
The graph is weakly connected, ie, it is possible to reach every node from every node ignoring edge direction.
http://mathworld.wolfram.com/WeaklyConnectedDigraph.html
*/
pred weaklyConnected {
 	all n:Node | Node in n.*(adj+~adj) --correct
 -- { all a,b:Node | a->b in adj}   --incorrect 	1
 -- { all a,b:Node | a->b in adj and b->a in adj}   --incorrect 	2
 -- { all a,b:Node | a->b in adj implies b->a in adj}   --incorrect 	3
 --{ all a,b:Node | a->b in adj or b->a in adj}   --incorrect 	4
 -- { all a,b:Node | a.^adj + b.^adj = a+b}   --incorrect 	5
 -- { all a,b:Node | a.^adj + b.^adj = Node}   --incorrect 	6
 -- { all a,b:Node | a.^adj = b}   --incorrect 	7
 -- { all a,b:Node | b in a.^(adj+~adj)}   --incorrect 	8
 -- { all a,b:Node | b in a.^adj}   --incorrect 	9
 --{ all a,b:Node | b in a.^adj and a in b.^adj}   --incorrect 	10
 -- { all a,b:Node | b in a.^adj and b in a.^~adj}   --incorrect 	11
 -- { all a:Node, b:Node | b in a.^(adj + ~adj)}   --incorrect 	12
 -- { all a:Node, b:Node | b in a.^adj || b in a.~^adj}   --incorrect 	13
 -- { all n : Node | n.(adj + ~adj) = Node}   --incorrect 	14
 -- { all n : Node | n.(adj + ~adj) = Node - n}   --incorrect 	15
 -- { all n : Node | Node - n = n.^(adj + ~adj)}   --incorrect 	16
 -- { all n : Node | Node = n.^(adj + ~adj)}   --incorrect 	17
 -- { all n : Node | Node in (n.^adj + n.^~adj)}   --incorrect 	18
 -- { all n : Node | Node in n.*adj}   --incorrect 	19
 -- { all n : Node | Node in n.*adj & ^adj.n}   --incorrect 	20
 -- { all n : Node | Node in n.*adj & n}   --incorrect 	21
 -- { all n : Node | Node in n.*adj + *adj.n}   --incorrect 	22
 -- { all n : Node | Node in n.*adj + ^adj.n}   --incorrect 	23
 -- { all n : Node | Node in n.*adj + n}   --incorrect 	24
 -- { all n : Node | Node in n.^(adj + ~adj)}   --incorrect 	25
 -- { all n : Node | Node in n.^adj}   --incorrect 	26
 -- { all n : Node | Node in n.^adj & ^adj.n}   --incorrect 	27
 -- { all n : Node | Node in n.^adj & n}   --incorrect 	28
 -- { all n : Node | Node in n.^adj + ^adj.n}   --incorrect 	29
 -- { all n : Node | Node in n.^adj + n}   --incorrect 	30
 -- { all n : Node | some n.*(adj + ~adj)}   --incorrect 	31
 -- { all n, x :Node | some n2:Node | n in (n2.*adj + ~(~adj).x)}   --incorrect 	32
 -- { all n, x :Node | some n2:Node | n in (n2.^adj + ~(~adj).x)}   --incorrect 	33
 -- { all n1,n2:Node | n1 in n2.^adj || n2 in n1.^adj}   --incorrect 	34
 -- { all n1,n2:Node | n1->n2 in adj}   --incorrect 	35
 -- { all n1,n2:Node | n2 in n1.^(adj + ~adj)}   --incorrect 	36
 -- { all n1,n2:Node | n2 in n1.^(adj + ~adj) || n1 in n2.^(adj + ~adj)}   --incorrect 	37
 -- { all n:Node | (Node-n)  in n.^adj}   --incorrect 	38
 -- { all n:Node | Node in (n+ n.*adj + *adj.n).*adj}   --incorrect 	39
 -- { all n:Node | Node in (n+ n.adj + adj.n).*adj}   --incorrect 	40
 -- { all n:Node | Node in (n.*adj + *~adj.n)}   --incorrect 	41
 -- { all n:Node | Node in (n.*adj + n.^~adj)}   --incorrect 	42
 -- { all n:Node | Node in (n.^(adj + ~adj) )}   --incorrect 	43
 -- { all n:Node | Node in (n.^adj + n.^~adj + n)}   --incorrect 	44
 -- { all n:Node | Node in (n.^adj + n.^~adj)}   --incorrect 	45
 -- { all n:Node | Node in (n.adj + adj.n)}   --incorrect 	46
 -- { all n:Node | Node in (n.adj + adj.n).*adj}   --incorrect 	47
 -- { all n:Node | Node in (n.adj + adj.n).^adj}   --incorrect 	48
 -- { all n:Node | Node in (n.adj + adj.n).adj}   --incorrect 	49
 -- { all n:Node | Node in n.(^adj + ^~adj)}   --incorrect 	50
 -- { all n:Node | Node in n.(^adj+^~adj)}   --incorrect 	51
 -- { all n:Node | Node in n.(n->(n.*adj + n.^~adj))}   --incorrect 	52
 -- { all n:Node | Node in n.(n->(n.*adj+n.^~adj))}   --incorrect 	53
 -- { all n:Node | Node in n.(n->n.*adj)}   --incorrect 	54
 -- { all n:Node | Node in n.(~adj + *adj)}   --incorrect 	55
 -- { all n:Node | Node in n.(~adj + adj)}   --incorrect 	56
 -- { all n:Node | Node in n.*(adj+^adj)}   --incorrect 	57
 -- { all n:Node | Node in n.*adj}   --incorrect 	58
 -- { all n:Node | Node in n.*adj + *^adj.n}   --incorrect 	59
 -- { all n:Node | Node in n.*adj + *adj.n}   --incorrect 	60
 -- { all n:Node | Node in n.*adj + ^*adj.n}   --incorrect 	61
 -- { all n:Node | Node in n.*adj + ^adj.n}   --incorrect 	62
 -- { all n:Node | Node in n.*adj + ^~adj.n}   --incorrect 	63
 -- { all n:Node | Node in n.*adj + n.*adj}   --incorrect 	64
 -- { all n:Node | Node in n.*adj + n.*~adj}   --incorrect 	65
 -- { all n:Node | Node in n.*adj + n.^~adj}   --incorrect 	66
 -- { all n:Node | Node in n.^(^adj + ^~adj)}   --incorrect 	67
 -- { all n:Node | Node in n.^(adj+~adj)}   --incorrect 	68
 -- { all n:Node | Node in n.^adj}   --incorrect 	69
 -- { all n:Node | Node in n.^adj + ^adj.n}   --incorrect 	70
 -- { all n:Node | Node in n.^adj + ^~adj.n}   --incorrect 	71
 -- { all n:Node | Node in n.^adj + ^~adj.n + n}   --incorrect 	72
 -- { all n:Node | Node in n.^adj + n.^~adj}   --incorrect 	73
 -- { all n:Node | Node in n.^adj + n.^~adj + n}   --incorrect 	74
 -- { all n:Node | Node in n.^adj+n.^~adj}   --incorrect 	75
 -- { all n:Node | Node in n.adj + ~adj.n}   --incorrect 	76
 -- { all n:Node | Node in n.adj + ~adj.n + n}   --incorrect 	77
 -- { all n:Node | Node-n in (n.^adj + n.^~adj)}   --incorrect 	78
 -- { all n:Node | some n->(n.*adj + n.^~adj)}   --incorrect 	79
 -- { all n:Node | some n->n.*adj}   --incorrect 	80
 -- { all n:Node | some n.(n->(n.*adj + n.^~adj))}   --incorrect 	81
 -- { all n:Node | some n.(n->n.*adj)}   --incorrect 	82
 -- { all n:Node | some n.*adj}   --incorrect 	83
 -- { all n:Node | some n.*adj + n.^~adj}   --incorrect 	84
 -- { all x : Node | Node in x.*adj + (*adj).x}   --incorrect 	85
 -- { all x : Node | Node in x.*adj + (*~adj).x}   --incorrect 	86
 -- { all x : Node | Node in x.*adj + (~(*adj)).x}   --incorrect 	87
 -- { all x : Node | Node in x.*adj + (~*adj).x}   --incorrect 	88
 -- { all x : Node | Node in x.*adj + *(~adj).x}   --incorrect 	89
 -- { all x : Node | Node in x.*adj + *adj.x}   --incorrect 	90
 -- { all x : Node | Node in x.*adj + *~adj.x}   --incorrect 	91
 -- { all x : Node | Node in x.*adj + x.(~*adj)}   --incorrect 	92
 -- { all x : Node | Node in x.*adj + x.*(~adj)}   --incorrect 	93
 -- { all x : Node | Node in x.*adj + x.*~adj}   --incorrect 	94
 -- { all x : Node | Node in x.*adj + x.~(*adj)}   --incorrect 	95
 -- { all x : Node | Node in x.*adj + x.~(^adj)}   --incorrect 	96
 -- { all x : Node | Node in x.*adj + x.~adj}   --incorrect 	97
 -- { all x : Node | Node in x.*adj + ~(*adj).x}   --incorrect 	98
 -- { all x : Node | Node in x.*adj + ~*adj.x}   --incorrect 	99
 -- { all x : Node | Node in x.^adj}   --incorrect 	100
 -- { all x : Node | Node in x.^adj + ^adj.x}   --incorrect 	101
 -- { all x : Node | Node in x.^adj + ^adj.x + x}   --incorrect 	102
 -- { all x : Node | Node in x.^adj + x}   --incorrect 	103
 -- { all x : Node | Node in x.^adj + x + ^adj.x}   --incorrect 	104
 -- { all x : Node | Node in x.^adj + x + ^~adj.x}   --incorrect 	105
 -- { all x : Node | Node in x.^adj + x + x.^~adj}   --incorrect 	106
 -- { all x : Node | Node in x.^adj + x.^(~adj)}   --incorrect 	107
 -- { all x : Node | Node in x.^adj - x}   --incorrect 	108
 -- { all x : Node | Node in x.adj}   --incorrect 	109
 -- { all x : Node | Node in x.adj + (~adj).x}   --incorrect 	110
 -- { all x : Node | Node in x.adj + (~adj).x + x}   --incorrect 	111
 -- { all x : Node | Node in x.adj + adj.x}   --incorrect 	112
 -- { all x : Node | Node in x.adj + adj.x + x}   --incorrect 	113
 -- { all x : Node | Node in x.adj + x}   --incorrect 	114
 -- { all x, y : Node | (x in ^adj.y) and (y in ^adj.x)}   --incorrect 	115
 -- { all x, y : Node | (x->y in adj) or (y->x in adj)}   --incorrect 	116
 -- { all x, y : Node | ^adj.x in ^adj.y}   --incorrect 	117
 -- { all x, y : Node | ^adj.x in ^adj.y & x}   --incorrect 	118
 -- { all x, y : Node | Node in (x<:^adj).y}   --incorrect 	119
 -- { all x, y : Node | Node in x.*adj & y.*adj}   --incorrect 	120
 -- { all x, y : Node | Node in x.*adj + y.*adj}   --incorrect 	121
 -- { all x, y : Node | Node in x.^adj + x + x.^~adj}   --incorrect 	122
 -- { all x, y : Node | some (^adj).y & x}   --incorrect 	123
 -- { all x, y : Node | some (x<:^adj).y}   --incorrect 	124
 -- { all x, y : Node | some x & (^adj).y}   --incorrect 	125
 -- { all x, y : Node | some x.*adj & y.*adj}   --incorrect 	126
 -- { all x, y : Node | some x.*adj + y.*adj}   --incorrect 	127
 -- { all x, y : Node | some x.^adj & y.^adj}   --incorrect 	128
 -- { all x, y : Node | some x<:(^adj.y)}   --incorrect 	129
 -- { all x, y : Node | some x<:^adj & y<:^adj}   --incorrect 	130
 -- { all x, y : Node | x in ^adj.y & x}   --incorrect 	131
 -- { all x, y : Node | x in ^adj.y and y in ^adj.x}   --incorrect 	132
 -- { all x, y : Node | x->y in adj iff y->x in adj}   --incorrect 	133
 -- { all x, y : Node | x->y in adj implies y->x not in adj and Node in x.^adj + x}   --incorrect 	134
 -- { all x, y : Node | x->y in adj implies y->x not in adj and Node in x.^adj + x + ^adj.x}   --incorrect 	135
 -- { all x, y : Node | x->y in adj or y->x in adj}   --incorrect 	136
 -- { Node in Node.^adj}   --incorrect 	137
 -- { some adjall n : Node | Node in n.^(adj + ~adj)} --incorrect	138
}

/*
The graph is strongly connected, ie, it is possible to reach every node from every node considering edge direction.
http://mathworld.wolfram.com/StronglyConnectedDigraph.html
*/
pred stonglyConnected {
 --	all n:Node | Node in n.*adj --correct 
 -- { all a,b:Node | a->b in adj}   --incorrect 1
 -- { all a:Node , b:Node| b in a.^adj}   --incorrect 2
 -- { all n : Node | Node in n.^adj}   --incorrect 3
 -- { all n1,n2:Node | (n2+n1) in n1.^adj}   --incorrect 4
  {  all n1,n2:Node | n1 in n2.^adj}   --incorrect 5
 -- { all n1,n2:Node | n2 in n1.^adj}   --incorrect 6
 -- { all n:Node | n in n.~adj}   --incorrect 7
 -- { all n:Node | Node = n.^adj + n.^~adj}   --incorrect 8
 -- { all n:Node | Node in (n.^adj + n.^~adj)}   --incorrect 9
 -- { all n:Node | Node in n.(*adj + *~adj)}   --incorrect 10
 -- { all n:Node | Node in n.*adj+n.^~adj}   --incorrect 11
 -- { all n:Node | Node in n.^adj or Node in n.^~adj}   --incorrect 12
 -- { all n:Node | Node in n.^adj+n.^~adj}   --incorrect 13
 -- { all n:Node | Node in n.adj}   --incorrect 14
 -- { all n:Node | Node in n.~adj}   --incorrect 15
 -- { all n:Node | Node-n = n.^adj + n.^~adj}   --incorrect 16
 -- { all n:Node | Node-n in (n.^adj + n.^~adj)}   --incorrect 17
 -- { all n:Node | Node-n in n.(*adj + *~adj)}   --incorrect 18
 -- { all n:Node | Node-n in n.(^adj + ^~adj)}   --incorrect 19
 -- { all n:Node | Node-n in n.^adj + n.^~adj}   --incorrect 20
 -- { all n:Node | Node-n in n.^adj or Node in n.^~adj}   --incorrect 21
 -- { all n:Node | Node-n in n.^adj or Node-n in n.^~adj}   --incorrect 22
 -- { all x : Node | Node in x.^adj}   --incorrect 23
 -- { complete and oriented }   --incorrect ( see next )
 -- { (all n:Node | Node in n.adj) and (no adj & ~adj) }   --incorrect 24 (with inlinning of complete and oriented) 
}

/*
The graph is transitive, ie, if two nodes are connected through a third node, they also are connected directly.
http://mathworld.wolfram.com/TransitiveDigraph.html
*/
pred transitive {
 	adj.adj in adj --correct
 -- {all a,b,c:Node | a->b in adj and a->c in adj implies a->b in adj}   --incorrect 1
 -- {no (^adj + iden)}   --incorrect 2
 
}






/*======== IFF PERFECT ORACLE ===============*/
pred undirectedOK {
	adj = ~adj
}
assert undirectedRepaired {
    undirected[] iff undirectedOK[]
}
pred orientedOK {
	no adj & ~adj 
}
assert orientedRepaired {
    oriented[] iff orientedOK[]
}
pred acyclicOK {
	all a:Node | a not in a.^adj
}
assert acyclicRepaired {
   acyclic[]  iff acyclicOK[]
}
pred completeOK {
	all n:Node | Node in n.adj
}
assert completeRepaired {
    complete[] iff completeOK[]
}
pred noLoopsOK {
	no (iden & adj)
}
assert noLoopsRepaired {
   noLoops[]  iff noLoopsOK[]
}
pred weaklyConnectedOK {
	all n:Node | Node in n.*(adj+~adj)
}
assert weaklyConnectedRepaired {
   weaklyConnected[]  iff weaklyConnectedOK[]
}
pred stonglyConnectedOK {
	all n:Node | Node in n.*adj
}
assert stonglyConnectedRepaired {
   stonglyConnected[]  iff stonglyConnectedOK[]
}
pred transitiveOK {
	adj.adj in adj
}
assert transitiveRepaired {
    transitive[] iff transitiveOK[]
}

 check undirectedRepaired expect 0
 check orientedRepaired expect 0
 check acyclicRepaired expect 0
 check completeRepaired expect 0
 check noLoopsRepaired expect 0
 check weaklyConnectedRepaired expect 0
 check stonglyConnectedRepaired expect 0
 check transitiveRepaired expect 0
pred __repair {
	stonglyConnected
}
assert __repair {
	stonglyConnected <=> stonglyConnectedOK
}
check __repair
fact __repair {
	stonglyConnected
}
