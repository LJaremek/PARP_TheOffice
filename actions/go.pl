:- multifile look/0, i_am_at/1, at/2, path/2.

/* This rule tells how to move to given room. */

go(Room) :-
        i_am_at(Here),
        path(Here, Room),
        retract(i_am_at(Here)),
        assert(i_am_at(Room)),
        !, nl, look.

go(_) :-
        write('There is not such place here').
