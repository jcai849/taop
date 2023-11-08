% i

course(complexity,time(monday,9,11),lecturer(david,harel),location(feinberg,a)).
course(statistics,time(wednesday,16,17),lecturer(mike,smith),location(310,10)).

lecturer(Lecturer,Course) :- course(Course,_,Lecturer,_).
duration(Course,Length) :-
	course(Course,time(_,Start,Finish),_,_),
	Finish is Start + Length.
teaches(Lecturer,Day) :- course(_,time(Day,_,_),Lecturer,_).
occupied(Room,Day,Time) :-
	course(_,time(Day,Start,Finish),_,location(_,Room)),
	between(Start,Finish,Time).

%location(Course,Building) :- course(Course,_,_,location(Building,_)).

busy(Lecturer,Time) :-
	course(_,time(_,Start,Finish),Lecturer,_),
	between(Start,Finish,Time).

% ii

course(math,time(monday,7,11),lecturer(John, Doe),location('science building', 1)).
course(physics,time(monday,8,11),lecturer(Jane, Doe),location('science building', 1)).

schedule_conflict(Time,Location,Course1,Course2) :-
	course(Course1,Time,_,Location),
	course(Course2,Time2,_,Location2),
	Course1 \= Course2,
	Location = Location2,
	day_time_overlap(Time,Time2).

day_time_overlap(time(Day1,Start1,Finish1),time(Day2,Start2,Finish2)) :-
	Day1 = Day2,
	time_overlap(time_duration(Start1,Finish1),time_duration(Start2,Finish2)).
	
time_overlap(time_duration(Start1,Finish1),time_duration(Start2,_)) :-
	between(Start1,Finish1,Start2).
time_overlap(time_duration(Start1,Finish1),time_duration(_,Finish2)) :-
	between(Start1,Finish1,Finish2).
