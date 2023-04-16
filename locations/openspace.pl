% objects in the location
% at(stapler, openspace).  % This is a example only

:- multifile describe/1.

describe(openspace) :-
    write("You are in the openspace"), nl,
    write("You can go to the 'kitchen' and 'dwight_box' from here"), !.
