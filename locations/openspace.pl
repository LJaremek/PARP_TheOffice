% objects in the location
at(stapler, openspace).

:- multifile describe/1.

describe(openspace) :-
    write("You are in the openspace"), nl,
    write("You can go to the kitchen from here"), !.