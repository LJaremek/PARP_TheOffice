:- multifile describe/1, go/1,
grape_soda/0, strange_soda/0.

describe(break_room) :-
    write("You are in the break room"), nl,
    write("There's a vending machine here (HINT: machine.)"), nl,
    write("You can go back to the kitchen"), !.

machine :-
    (not(grape_soda), not(strange_soda) ->
        machine_keyboard, !
    ;
        write("(You've already used the coupon)"), nl
    ).

machine_keyboard :-
    nl,
    write("Enter a number:"), nl,
    read(Number),
    (not(integer(Number)) ->
        nl,
        write("(Not a valid input)"), nl
    ;
        true
    ),

    (member(Number, [034, 015, 092, 059, 041, 065, 026, 087]) ->
        nl,
        write("Can of some strange soda that you've never heard of rolled out... (it's not Grape Soda but it's better than nothing)"), nl,
        assert(strange_soda),
        assert(holding(strange_soda)), !
    ;
        true
    ),

    (not(strange_soda) ->
        (Number == 073 ->
            nl,
            write("You have the Grape Soda!"), nl,
            assert(grape_soda),
            assert(holding(grape_soda))
        ;
            nl,
            write("Nothing happens..."), nl
        )
    ;
        true
    ).

