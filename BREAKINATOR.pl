dead(jesse,0).
moral(jesse,1).
criminal(jesse,1).
lawyer(jesse,0).
woman(jesse,0).
mexican(jesse,0).

dead(jane,1).
moral(jane,2).
criminal(jane,0).
lawyer(jane,0).
woman(jane,1).
mexican(jane,0).

dead(hank,1).
moral(hank,2).
criminal(hank,0).
lawyer(hank,0).
woman(hank,0).
mexican(hank,0).

dead(homez,1).
moral(homez,2).
criminal(homez,0).
lawyer(homez,0).
woman(homez,0).
mexican(homez,1).

dead(mike,1).
moral(mike,1).
criminal(mike,1).
lawyer(mike,0).
woman(mike,0).
mexican(mike,0).

dead(saul,0).
moral(saul,1).
criminal(saul,1).
lawyer(saul,1).
woman(saul,0).
mexican(saul,0).

dead(skyler,0).
moral(skyler,1).
criminal(skyler,0).
lawyer(skyler,0).
woman(skyler,1).
mexican(skyler,0).

dead(walter_jr,0).
moral(walter_jr,2).
criminal(walter_jr,0).
lawyer(walter_jr,0).
woman(walter_jr,0).
mexican(walter_jr,0).

dead(marie,0).
moral(marie,2).
criminal(marie,1).
lawyer(marie,0).
woman(marie,1).
mexican(marie,0).

dead(kim,0).
moral(kim,1).
criminal(kim,0).
lawyer(kim,1).
woman(kim,1).
mexican(kim,0).

dead(howard,1).
moral(howard,2).
criminal(howard,0).
lawyer(howard,1).
woman(howard,0).
mexican(howard,0).

dead(nacho,1).
moral(nacho,1).
criminal(nacho,1).
lawyer(nacho,0).
woman(nacho,0).
mexican(nacho,1).

dead(chuck,1).
moral(chuck,1).
criminal(chuck,0).
lawyer(chuck,1).
woman(chuck,0).
mexican(chuck,0).

dead(walter,1).
moral(walter,0).
criminal(walter,1).
lawyer(walter,0).
woman(walter,0).
mexican(walter,0).
role(walter,2).

dead(gus,1).
moral(gus,0).
criminal(gus,1).
lawyer(gus,0).
woman(gus,0).
mexican(gus,0).
role(gus,0).

dead(todd,1).
moral(todd,0).
criminal(todd,1).
lawyer(todd,0).
woman(todd,0).
mexican(todd,0).
role(todd,1).

dead(salamanca_twins,1).
moral(salamanca_twins,0).
criminal(salamanca_twins,1).
lawyer(salamanca_twins,0).
woman(salamanca_twins,0).
mexican(salamanca_twins,1).
soft_skills(salamanca_twins,1).

dead(lalo,1).
moral(lalo,0).
criminal(lalo,1).
lawyer(lalo,0).
woman(lalo,0).
mexican(lalo,1).
soft_skills(lalo,3).

dead(tuco,1).
moral(tuco,0).
criminal(tuco,1).
lawyer(tuco,0).
woman(tuco,0).
mexican(tuco,1).
soft_skills(tuco,2).

dead(hector,1).
moral(hector,0).
criminal(hector,1).
lawyer(hector,0).
woman(hector,0).
mexican(hector,1).
soft_skills(hector,0).

%question1(-X1)
question1(X1):-	write("Is your character dead?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X1).


%question2(-X2)
question2(X2):-	write("Is your character somewhat moral?"),nl,
				write("2. Yes, there is good in them"),nl,
				write("1. Some kind of grey morality"),nl,
				write("0. No, they are immoral"),nl,
				read(X2).

%question3(-X3)
question3(X3):-	write("Is your character a criminal?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X3).

%question4(-X4)
question4(X4):-	write("Is your character a lawyer?"),nl,
				write("1. yes"),nl,
				write("0. NO"),nl,
				read(X4).

%question5(-X5)
question5(X5):-	write("Is your character a woman?"),nl,
				write("1. Yes"),nl,
				write("0. NO"),nl,
				read(X5).

%question6(-X6)
question6(X6):-	write("Is your character mexican?"),nl,
				write("1. yes"),nl,
				write("0. NO"),nl,
				read(X6).

%question7(-X7)
question7(X7):-	write("What is your character's role?"),nl,
				write("2. One of the main protagonists"),nl,
				write("1. Supporting character(secondary role"),nl,
				write("0. One of the antagonists"),nl,
				read(X7).

%question8(-X8)
question8(X8):-	write("What is your character's way of interacting with people?"),nl,
				write("3. Nice and polite (and then they kill you)"),nl,
				write("2. Aggressive and physically threatening"),nl,
				write("1. Mostly not talking"),nl,
				write("0. Ding-ding-ding-ding"),nl,
				read(X8).


%play/0
play:-	question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),
		(X1 =:= 0 -> dead(X,X1),moral(X,X2),criminal(X,X3),lawyer(X,X4),woman(X,X5),write(X);
		X4 =:= 1 -> dead(X,X1),moral(X,X2),criminal(X,X3),lawyer(X,X4),woman(X,X5),write(X);
		X5 =:= 1 -> dead(X,X1),moral(X,X2),criminal(X,X3),lawyer(X,X4),woman(X,X5),write(X);
		question6(X6),branch(X1,X2,X3,X4,X5,X6)).

%branch(+X1,+X2,+X3,+X4,+X5,+X6)
branch(X1,X2,X3,X4,X5,X6):-(
	X1 =:= 1,X2 =:= 0,X3 =:= 1,X4 =:= 0,X5 =:= 0->
		(X6=:=0 ->question7(X7),dead(X,X1),moral(X,X2),criminal(X,X3),lawyer(X,X4),woman(X,X5),role(X,X7),write(X);
		X6=:=1 ->question8(X8),dead(X,X1),moral(X,X2),criminal(X,X3),lawyer(X,X4),woman(X,X5),soft_skills(X,X8),write(X));
	dead(X,X1),moral(X,X2),criminal(X,X3),lawyer(X,X4),woman(X,X5),mexican(X,X6),write(X)).
