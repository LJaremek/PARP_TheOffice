:- multifile describe/1, go/1,
grape_soda/0.

describe(break_room) :-
    write("You are in the break room"), nl,
    write("There's a vending machine here (HINT: machine.)"), nl,
    write("You can go back to the kitchen"), !.

machine :-
    nl,
    write("Enter a number:"), nl,
    read(Number),
    (integer(Number) ->
        (Number == 73 ->
            nl,
            write("You have the Grape Soda!"), nl,
            assert(grape_soda),
            describe(break_room)
        ;
            nl,
            write("Nothing happens..."), nl,
            machine
        )
    ;
        nl,
        write("(Not a valid input)"), nl,
        machine
    ).
    
