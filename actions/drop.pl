:- multifile holding/1, i_am_at/1, at/2.

/* These rules describe how to put down an object. */


drop(X) :-
    holding(X),
    i_am_at(Place),
    retract(holding(X)),
    assert(at(X, Place)),
    write('OK.'),
    !, nl.

drop(_) :-
    write('You aren''t holding it!'),
    nl.
