male(jason).
male(ian).

husband(jason,caroline).
brother(jason,ian).
mother(helen,caroline).

offspring(Child,Parent) :- mother(Parent,Child).

married_couple(Spouse1,Spouse2) :- husband(Spouse1,Spouse2).
married_couple(Spouse1,Spouse2) :- husband(Spouse2,Spouse1).

mother_in_law(MIL,Person) :- married_couple(Person,Spouse),
	mother(MIL,Spouse).

brother_in_law(BIL,Person) :- married_couple(Person,Spouse),
	brother(Spouse,BIL).

son_in_law(SIL,Person) :- offspring(Child,Person),
	married_couple(Child,SIL),
	male(SIL).
