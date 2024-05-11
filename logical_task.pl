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

