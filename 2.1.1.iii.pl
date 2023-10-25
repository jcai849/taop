left_of(bicycle,camera).
left_of(pencil,hourglass).
left_of(hourglass,butterfly).
left_of(butterfly,fish).
above(bicycle,pencil).
above(camera,butterfly).

right_of(X,Y) :- left_of(Y,X).
below(X,Y) :- above(Y,X).
