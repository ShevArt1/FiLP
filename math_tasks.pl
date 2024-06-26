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

%2

%nod(+A,+B,?C) - nod of A and B
nod(A,0,A):-!.
nod(_,0,_):-!,fail.
nod(A,B,C):-Ost is A mod B, nod(B,Ost,C).


%min_cifr(+Num) - min digit of a Num
min_cifr(Num):-CurMin is Num mod 10, min_cifr(Num,CurMin),!.
%min_cifr(+Num,+CurMin)
min_cifr(Num,CurMin):-Num<10,Num>=CurMin,print(CurMin),nl.
min_cifr(Num,CurMin):-Num<10,Num<CurMin,print(Num),nl.
min_cifr(Num,CurMin):-Num1 is Num div 10,D is Num mod 10,(D<CurMin -> CurMin1 is D;CurMin1 is CurMin), min_cifr(Num1,CurMin1).

%mul_cifr(+Num) - multiply all digits of Num which cant be divided by 5
mult_cifr(Num):-mul_cifr(Num,1),!.
%mul_cifr(+Num,+CurMul)
mul_cifr(Num,CurMul):-Num<10,Ost is Num mod 5,Ost \= 0, Mul is CurMul*Num,print(Mul),nl.
mul_cifr(Num,CurMul):-Num<10,print(CurMul),nl.
mul_cifr(Num,CurMul):-Num1 is Num div 10,D is Num mod 10,Ost is D mod 5,(Ost \= 0-> Mul is CurMul*D; Mul is CurMul), mul_cifr(Num1,Mul).

%prost(+X) - check if X is a prime number
prost(X):-prost(X,2),!.
%prost(+X,+D)
prost(X,X).
prost(X,D):-X>D,Ost is X mod D, Ost\=0, D1 is D+1, prost(X,D1). 

%3

%is_global_max(+List, +Index) - is element at index global max
is_global_max(List, Index) :-nth0(Index, List, Element),max_list(List, Max),Element =:= Max.

%find_min_here(+List,+A,+B,-Min) find min element in interval
find_min_here(List,A,B,Min):-nth0(A,List,El),CurMin is El,Ind is A+1,find_min_here(List,A,B,Ind,CurMin),Min is CurMin,!.
%find_min_here(+List,+A,+B,+Ind,+CurMin)
find_min_here(List,A,B,Ind,CurMin):-Ind>B,!.
find_min_here(List,A,B,Ind,CurMin):-nth0(Ind,List,El),El<CurMin,NewMin is El,Ind1 is Ind+1,find_min_here(List,A,B,Ind1,NewMin),!.
find_min_here(List,A,B,Ind,CurMin):-Ind1 is Ind+1,find_min_here(List,A,B,Ind1,CurMin),!.

%count_min_here(+List,+A,+B,-Count) count minimum elements in interval
count_min_here(List,A,B,Count) :- find(List,A,B,Min), count_min_here(List,A,B,Min,0)!.
%count_min_here(+List,+A,+B,+Min,+Count)
count_min_here(List,B,B,Min,Count):-!.
count_min_here(List,A,B,Min,Count):-nth0(A,List,Min),Count1 is Count+1, A1 is A+1,count_min_here(List,A1,B,Min,Count1),!.
count_min_here(List,A,B,Min,Count):-A1 is A+1,count_min_here(List,A1,B,Min,Count),!.

%is_max_here(+List,+A,+B) - is max element of list i interval
is_max_here(List,A,B) :- max_list(List, Max),nth0(Index, List, Max),Index>=A,B>=Index,!.



%5

%max_del(+X,+Chet,+Prost,-MaxDel) - find max divisor, even or odd, prime or not
max_del(X,Chet,Prost,MaxDel):-max_del(X,X,Chet,Prost,MaxDel),!.
%max_del(+X,+Cur,+Chet,+Prost,?MaxDel)
max_del(X,0,Chet,Prost,1):-write("MaxDel not found, using 1 instead"),!.
max_del(X,CurMax,Chet,Prost,MaxDel):- Mod is X mod CurMax, Mod\=0, NewMax is CurMax -1,max_del(X,NewMax,Chet,Prost,MaxDel),!.
max_del(X,CurMax,1,1,CurMax):-Ost is CurMax mod 2,Ost=:=0,prost(CurMax),!.
max_del(X,CurMax,0,1,CurMax):-Ost is CurMax mod 2,Ost=:=1,prost(CurMax),!.
max_del(X,CurMax,1,0,CurMax):-Ost is CurMax mod 2,Ost=:=0,not(prost(CurMax)),!.
max_del(X,CurMax,0,0,CurMax):-Ost is CurMax mod 2,Ost=:=1,not(prost(CurMax)),!.
max_del(X,CurMax,Chet,Prost,MaxDel):-NewMax is CurMax - 1,max_del(X,NewMax,Chet,Prost,MaxDel),!.


%proiz_c(+N,?P) - multiply all digits of a number
proiz_c(0,1):-!.
proiz_c(N,P):-N1 is N div 10,Ost is N mod 10,proiz_c(N1,X1),P is Ost*X1.

%max_prost_del(+X,-Y) - find max prime divisor of X
max_prost_del(X,Y):-max_del(X,0,1,A), max_del(X,1,1,B), max(A,B,M), Y is M.

%nod_of_stuff(+X,-N)
nod_of_stuff(X,N):-max_del(X,0,0,A),proiz_c(X,B),nod(A,B,N),nl,write("del"),write(A),nl,write("proiz"),write(B).

%7

%task39(+List) - write elements with odd index, then with even
task39([H|T]):-write_elems([H|T]),write_elems(T),!.
%write_elems(+List) - write current element, skip next
write_elems([]).
write_elems([H|T]):-write(H),nl,skip_el(T).
%skip_el(+List) - skip current element 
skip_el([]).
skip_el([H|T]):-write_elems(T).

%task44(+List) - do float and int elements alternate in the list
task44(List):-check_alter(List),!.
% check_alter(+List) - check if float and int elements are alternating
check_alter([_]):- !.
check_alter([Int, Float|Tail]):- integer(Int), float(Float), check_alter([Float|Tail]), !.
check_alter([Float, Int|Tail]):- float(Float), integer(Int), check_alter([Int|Tail]), !.

%task52(+N,-List) - create list of prime divisors of N
task52(N,List):- add_del(N,List,2),!.
%add_del(+N,?List,+D) - add number to list if it it prime divisor of N, else go to next, until N is 1
add_del(1,[],_):-!.
add_del(N,[D|List],D):-Ost is N mod D, Ost =:=0,prost(D),N1 is N div D, add_del(N1,List,D),!. 
add_del(N,List,D):-NextD is D+1, add_del(N,List,NextD),!.

%task57(+N) - enter list of N elements and count elements bigger than sum of all previous
task57(N):-read_list(List,N),count_new_big(List,0,0,Count),write("Count="),write(Count).
%count_new_big(+List,+Sum,+CurCount,?Res) - count elements bigger than sum of all previous
count_new_big([],Sum,Count,Count):-!.
count_new_big([H|T],Sum,CurCount,Res):-H>Sum, Count1 is CurCount+1, Sum1 is Sum+H,count_new_big(T,Sum1,Count1,Res),!.
count_new_big([H|T],Sum,CurCount,Res):-Sum1 is Sum+H,count_new_big(T,Sum1,CurCount,Res),!.

