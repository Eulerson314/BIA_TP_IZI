/*Question 1*/
/*Nous devons trouver des valeurs pour des variables peu importe le chemin pour y arriver, ce n'est donc pas un problème de graphe d'états, ni un problème que nous pouvons décomposer. C'est un problème de satisfaction de contraintes, CSP*/

/*Question 2*/

/*la solution est une liste de couples (valeur du billet,nombre de billets)*/

billets(S) :- S = [[0,50],[N20,20],[0,10],[N5,5],[N2,2],[N1,1]], D = [0,1,2,3,4,5,6,7,8,9],
				member(N20,D), member(N5,D), member(N2,D), member(N1,D),
				Y is N20 + N5 + N2 + N1, Y =:= 10,
				X is (20 * N20) + (5 * N5) + (2 * N2) + (1 * N1),
				X =:= 61.

/*Question 3*/
/* 3 solutions: 
	
?- findall(S,billets(S),L), length(L,N).
L = [[[0, 50], [1, 20], [0, 10], [8, 5], [0, 2], [1, 1]], [[0, 50], [2, 20], [0, 10], [2, 5], [5, 2], [1|...]], [[0, 50], [2, 20], [0, 10], [3, 5], [1|...], [...|...]]],
N = 3.

*/
