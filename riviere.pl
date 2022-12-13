initial([3,3,0,0,g]).
final([0,0,3,3,d]).

/* etat : nb moutons gauche, nb loups gauche, nb moutons droite, nb loups droite, pos bateau */
interdit([MG, LG, _, _, d]) :- MG > 0, MG =< LG.
interdit([_, _, MD, LD, g]) :- MD > 0, MD =< LD.

/* M et L nombre de moutons et de loups qu'on transfere */
operateur([MG1, LG1, MD1, LD1, g], [animauxDroite, M, L], [MG2, LG2, MD2, LD2, d]) :-
	V = [0,1,2],
	member(M, V),
	M =< MG1,
	member(L, V),
	L =< LG1,
	2 >= M + L,
	MG2 is MG1 - M,
	LG2 is LG1 - L,
	MD2 is MD1 + M,
	LD2 is LD1 + L.
	
operateur([MG1, LG1, MD1, LD1, d], [animauxGauche, M, L], [MG2, LG2, MD2, LD2, g]) :-
	V = [0,1,2],
	member(M, V),
	M =< MD1,
	member(L, V),
	L =< LD1,
	2 >= M + L,
	MD2 is MD1 - M,
	LD2 is LD1 - L,
	MG2 is MG1 + M,
	LG2 is LG1 + L.
	
rechercheP(Ec, Ec, _, []).
rechercheP(Ec, Ef, L1, [Op|L2]) :-
	operateur(Ec, Op, Es),
	not(interdit(Es)),
	not(member(Es, L1)),
	rechercheP(Es, Ef, [Es|L1], L2).

resoudre(S) :-
	initial(Ei),
	final(Ef),
	rechercheP(Ei, Ef, [Ei], S).
