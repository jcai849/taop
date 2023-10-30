% i

%course(complexity,time(monday,9,11),lecturer(david,harel),location(feinberg,a)).
%course(statistics,time(wednesday,16,17),lecturer(mike,smith),location(310,10)).
course(complexity,time(monday,7,11),lecturer(spongebob,squarepants),location(310,broom_closet)).
course(complexity,time(monday,8,11),lecturer(spongebob,squarepants),location(310,broom_closet)).

lecturer(Lecturer,Course) :- course(Course,Time,Lecturer,Location).
duration(Course,Length) :-
	course(Course,time(Day,Start,Finish),Lecturer,Location),
	plus(Start,Length,Finish).
teaches(Lecturer,Day) :- course(Course,time(Day,Start,Finish),Lecturer,Location).
occupied(Room,Day,Time) :-
	course(Course,time(Day,Start,Finish),Lecturer,location(building,Room)),
	between(Start,Finish,Time).

location(Course,Building) :- course(Course,Time,Lecturer,location(Building,Room)).

busy(Lecturer,Time) :-
	course(Course,time(Day,Start,Finish),Lecturer,Location),
	between(Start,Finish,Time).

% ii

schedule_conflict(Time,Location,Course1,Course2) :-
	Course1 \= Course2,
	Course1 = course(_,Time1,_,Location1),
	Course2 = course(_,Time2,_,Location2),
	Location1 = Location2,
	Location2 = Location,
	day_time_overlap(Time1,Time2),
	day_time_overlap(Time,Time1),
	day_time_overlap(Time,Time2).

day_time_overlap(time(Day1,Start1,Finish1),time(Day2,Start2,Finish2)) :-
	Day1 = Day2,
	time_overlap(time_duration(Start1,Finish1),time_duration(Start2,Finish2)).
	
time_overlap(time_duration(Start1,Finish1),time_duration(Start2,_)) :-
	between(Start1,Finish1,Start2).
time_overlap(time_duration(Start1,Finish1),time_duration(_,Finish2)) :-
	between(Start1,Finish1,Finish2).
