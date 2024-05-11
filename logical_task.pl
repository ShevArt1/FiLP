%in_list(?List, ?El)
in_list([El|_],El).
in_list([_|T],El):-in_list(T,El).

%ein4/0 - logical task 4 from variant 3(who has which profession?)
ein4:- Friends=[_,_,_],

		in_list(Friends,[_,slesar,none,youngest]),
		in_list(Friends,[borisov,_,sister,_]),
		in_list(Friends,[semyonov,_,_,older_than_tokar]),
		in_list(Friends,[ivanov,_,_,_]),
		in_list(Friends,[_,tokar,_,_]),
		in_list(Friends,[_,svarshik,_,_]),
		in_list(Friends,[_,_,unknown,_]),
		in_list(Friends,[_,_,_,unknown]),
		
		not(in_list(Friends,[semyonov,tokar,_,_])),

		in_list(Friends,[WHO1,slesar,_,_]),
		in_list(Friends,[WHO2,tokar,_,_]),
		in_list(Friends,[WHO3,svarshik,_,_]),
		write(Friends),nl,
		write("slesar "),write(WHO1),nl,write("tokar "),write(WHO2),nl,write("svarshik "),write(WHO3),!.


%ein8/0 - logical task 8 from variant 3(what is Roman's speciality?)
ein8:- Students=[_,_,_],

		in_list(Students,[P,peter]),
		in_list(Students,[R,roman]),
		in_list(Students,[S,serg]),
		in_list(Students,[math,_]),
		in_list(Students,[chem,_]),
		in_list(Students,[phys,_]),
 	
 		(
            		(P = math, S \= phys);
            		(R \= phys, P = math);
            		(S \= math, R = chem)
        	),

		in_list(Students,[WHERE1,roman]),
		write(Students),nl,
		write(WHERE1).
