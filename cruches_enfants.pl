/* NOM

C'est un graphe d'états parce que ....

*/

/* état = un couple avec la cruche 5 puis la cruche 8 */

etatInitial([0,0]).

etatFinal([4,_]).
etatFinal([_,4]).

operateur([X,_], remplirC8, [X,8]).
operateur([_,X], remplirC5, [5,X]).

operateur([X,_], viderC8, [X,0]).
operateur([_,X], viderC5, [0,X]).

operateur([C5,C8], mettre5dans8, [0,NC8]) :-
	Place is 8-C8, C5 =< Place, NC8 is C8+C5.
operateur([C5,C8], mettre5dans8, [NC5,8]) :-
	Place is 8-C8, C5 > Place, NC5 is C5-Place.


operateur([C5,C8], mettre8dans5, [NC5,0]) :-
	Place is 5-C5, C8 =< Place, NC5 is C5+C8.
operateur([C5,C8], mettre5dans8, [5,NC8]) :-
	Place is 5-C5, C8 > Place, NC8 is C8-Place.

:- dynamic interdit/1.

/* recherche dans un graphe d'etats */

/*recherche(EtatCourant,EtatFinal,ListeTaboue,ListeOp) tous donnes sauf ListeOp */
recherche(Ec,Ec,_,[]):-!.
recherche(Ec,Ef,Ltaboue,[Op|Lop]) :- 
	operateur(Ec,Op,Es),
	not(interdit(Es)),
	not(member(Es,Ltaboue)),
	%write(Ec), write(' '), write(Op), write(' '),write(Es),nl,
	recherche(Es,Ef,[Es|Ltaboue],Lop).

resoudre(Sol) :- etatInitial(Ei),etatFinal(Ef),
	recherche(Ei,Ef,[Ei],Sol).



/* --- les enfants --- 

C'est un CSP  .... */

enfants(S) :- 
	S = [[1,_],[2,_],[3,_],[4, felicie],[5,_],[6,_]],
	member([P1,antoine], S),
	member([P2,victor], S),


	X is P2 - P1, 
	abs(X,X2), 
	X2 > 1,

	member([P3,alice], S),

	member([P5,theo], S),

	P5 > P1, P5 \== 6,

	member([P6,axel], S),

	P6 > P1,

	member([P7, felicie], S), X3 is P7 - P1, abs(X3,1).

	









