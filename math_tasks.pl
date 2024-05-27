%max(+X,+Y,-Z) max of two
max(X,Y,X):-X>Y,!.
max(_,Y,Y).

%max(+X,+Y,+U,-Z) max of three
max3(X,Y,U,X):-X>Y,X>U,!.
max3(_,Y,U,Y):-Y>U,!.
max3(_,_,U,U).

%fact(+N,-X) - factorial up
fact(0,1):-!.
fact(N,X):-N1 is N-1,fact(N1,X1),X is N*X1.

%fact1(+N,-X) - factorial down call
fact1(N,X):-fact1(0,1,N,X).
%fact1(+I,+Y,+N,-X) - factorial down
fact1(N,Y,N,Y):-!.
fact1(I,Y,N,X):-I1 is I+1, Y1 is Y*I1, fact1(I1,Y1,N,X).


%summ_cifr(+X,?SummCifr) - sum of digits of X up
summ_cifr(0,0):-!.
summ_cifr(X,SummCifr):-X1 is X // 10, Ost is X mod 10, summ_cifr(X1, SummCifr1), SummCifr is SummCifr1 + Ost.

%summ_cifr_down(+N,-X) - sum of digits of X down
summ_cifr_down(N,X):- summ_cifr(N,0,X).
%summ_cifr_down(+N,?CurX,-X)
summ_cifr(0,X,X):-!.
summ_cifr(N,CurX,X):-N1 is N // 10, Ost is N mod 10,
	NewX is CurX + Ost, summ_cifr(N1, NewX, X).

% free_from_square(+X) - is number free from squares
free_from_square(X):- MaxDel is X - 1, free_from_square(2, MaxDel, X), !, true.
free_from_square(MaxDel, MaxDel, X):- !.
free_from_square(N, MaxDel, X):- Square is N * N, Ost is X mod Square, Ost \= 0, NextN is N + 1, free_from_square(NextN, MaxDel, X).

% read_list(-List, +N) - enter list with length = N
read_list(List,N):-read_list(List,N,0,[]).
read_list(List,N,N,List):-!.
read_list(List,N,K,NewList):-read(X), append(NewList,[X],AppenListResult),K_next is K+1, read_list(List,N,K_next,AppenListResult).

% write_list(+List) - write list
write_list([]):-!.
write_list([H|T]):-write(H), nl, write_list(T).

%sum_list_up(+List,?Sum) 
sum_list_up([], 0) :- !.
sum_list_up([H|T],Sum) :- sum_list_up(T, SumT), Sum is H + SumT.

%sum_list_down(+List,-Sum)
sum_list_down(List, Sum) :- sum_list_down(List, 0, Sum).
%sum_list_down(+List,+CurSum,?Sum)
sum_list_down([], Sum, Sum) :- !.
sum_list_down([H|T],CurSum, Sum) :- NewSum is CurSum + H, sum_list_down(T, NewSum, Sum).

%proga(+N) - read list with length N, count sum of elements, write list
proga(N):-read_list(List,N),sum_list_down(List,Sum),write("Sum="),write(Sum),nl,write_list(List).

% remove_with_sum_number(+List, +NeedSum) - removes elements from list with sum of digits = NeedSum
remove_with_sum_number(List, NeedSum):- remove_with_sum_number(List, NeedSum, []).
remove_with_sum_number([], _, ResultList):- write_list(ResultList), !.
remove_with_sum_number([HeadList|TailList], NeedSum, ResultList):- 
        summ_cifr_down(HeadList, SumNumbers), 
        NeedSum is SumNumbers,
        remove_with_sum_number(TailList, NeedSum, ResultList), !.
remove_with_sum_number([HeadList|TailList], NeedSum, ResultList):- append(ResultList, [HeadList], NewList), remove_with_sum_number(TailList, NeedSum, NewList), !.
