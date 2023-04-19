:- multifile i_am_at/1, describe/1.

/* This rule tells how to look around you. */

look :-
    i_am_at(Place),
    describe(Place),
    nl.