man(voeneg).
man(ratibor).
man(boguslav).
man(velerad).
man(duhovlad).
man(svyatoslav).
man(dobrozhir).
man(bogomil).
man(zlatomir).

woman(goluba).
woman(lubomila).
woman(bratislava).
woman(veslava).
woman(zhdana).
woman(bozhedara).
woman(broneslava).
woman(veselina).
woman(zdislava).

parent(voeneg,ratibor).
parent(voeneg,bratislava).
parent(voeneg,velerad).
parent(voeneg,zhdana).

parent(goluba,ratibor).
parent(goluba,bratislava).
parent(goluba,velerad).
parent(goluba,zhdana).

parent(ratibor,svyatoslav).
parent(ratibor,dobrozhir).
parent(lubomila,svyatoslav).
parent(lubomila,dobrozhir).

parent(boguslav,bogomil).
parent(boguslav,bozhedara).
parent(bratislava,bogomil).
parent(bratislava,bozhedara).

parent(velerad,broneslava).
parent(velerad,veselina).
parent(veslava,broneslava).
parent(veslava,veselina).

parent(duhovlad,zdislava).
parent(duhovlad,zlatomir).
parent(zhdana,zdislava).
parent(zhdana,zlatomir).

men:-man(X),write(X),nl,fail.
women:-woman(X),write(X),nl,fail.

% children(+X) - all children of X
children(X):-parent(X,Y),write(Y),nl,fail.

% mother(+X, +Y) - is X  a mother of Y
mother(X,Y):-parent(X,Y),woman(X),nl.
% mother(+X) - a mother of X
mother(X):-mother(Y,X),write(Y),nl.

% brother(+X, +Y) - is X  a brother of Y
brother(X,Y):-parent(A,X),parent(A,Y),X\=Y,man(X),man(A),nl.
% brothers(+X) - all brothers of X
brothers(X):-brother(Y,X),write(Y),nl,fail.

% b_s(+X, +Y) - is X a brother or sister of Y 
b_s(X,Y):-parent(A,X),parent(A,Y),man(A),X\=Y,nl.
% b_s(+X) - all brothers and sisters of X
b_s(X):-b_s(Y,X),write(Y),nl,fail.