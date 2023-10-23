father(terach,abraham).
father(terach,nachor).
father(terach,haran).
father(abraham,isaac).
father(haran,lot).
father(haran,milcah).
father(haran,yiscah).

mother(sarah,isaac).

male(terach).
male(abraham).
male(nachor).
male(haran).
male(isaac).
male(lot).
female(sarah).
female(milcah).
female(yiscah).

parent(X,Y) :- father(X,Y).
parent(X,Y) :- mother(X,Y).

son(X,Y) :- parent(Y,X), male(X).
daughter(X,Y) :- parent(Y,X), female(X).

grandparent(X,Y) :- parent(X,Z), parent(Z,Y).

brother(Brother,Sib) :- parent(Parent,Brother),
	parent(Parent,Sib),
	male(Brother),
	Brother \= Sib.

sister(Sister,Sib) :- parent(Parent,Sister),
	parent(Parent,Sib),
	female(Sister),
	Sister \= Sib.

uncle(Uncle,Person) :- brother(Uncle,Parent),
	parent(Parent,Person).

niece(Niece,Person) :- parent(Parent,Niece),
	sibling(Parent,Person).

sibling(Sib1,Sib2) :- father(Father,Sib1),
	father(Father,Sib2),
	mother(Mother,Sib1),
	mother(Mother,Sib2),
	Sib1 \= Sib2.
