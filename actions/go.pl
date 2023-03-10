:- multifile look/0, i_am_at/1, at/2, path/2.

/* These rules define the direction letters as calls to go/1. */

n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).


/* This rule tells how to move in a given direction. */

% deprecated :)
go(Direction) :-
        i_am_at(Here),
        path(Here, Direction, There),
        retract(i_am_at(Here)),
        assert(i_am_at(There)),
        !, look.

go(_) :-
        write('You can''t go that way.').

%  New method for moving
go_to(Room) :-
        i_am_at(Here),
        path(Here, Room),
        retract(i_am_at(Here)),
        assert(i_am_at(Room)),
        !, look.

go_to(_) :-
        write('There is not such place here').


