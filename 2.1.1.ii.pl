married_couple(Wife, Husband).

mother_in_law(MIL,Person) :- married_couple(Person,Husband),
	mother(MIL,Husband).
mother_in_law(MIL,Person) :- married_couple(Wife,Person),
	mother(MIL,Wife).
