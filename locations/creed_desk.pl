:- multifile
describe/1, i_am_at/1, go/1,
creed_quest_started/0,
grape_soda/0,
strange_soda/0,
creed_quest_done_full/0,
creed_quest_done_half/0.

:-
    retractall(holding(creed_reference)),
    retractall(holding(coupon)).

describe(creed_desk) :-
    write("You see Creed playing solitaire on his computer while eating an apple..."), nl,
    write("(HINT: talk.)"), nl,
    write("You can go back to 'openspace' from here.").

talk :-
    ((creed_quest_done_full ; creed_quest_done_half) ->
        nl,
        write("Creed: Hi kid, thanks for the drink once again!"), nl
    ;
        true
    ),

    (not(creed_quest_started) ->
        write("Creed: Hi kid, I have some small job for you."), nl,
        decide_wheter_to_start_creed_quest, !
    ;
        (grape_soda ->
            nl,
            write("Creed: Hi kid, I see you have my Grape Soda, nice job!"), nl,
            write("Creed: I'm giving you a great review!"), nl,
            retractall(grape_soda),
            retractall(holding(soda)),
            assert(creed_quest_done_full),
            assert(holding(creed_reference))
        ;
            strange_soda,
            not(creed_quest_done_full),
            not(creed_quest_done_half),
            nl,
            write("Creed: It's not grape soda but it will do the thing, thanks kid!"), nl,
            write("Creed: I'm giving you a pretty good review!"), nl,
            retractall(strange_soda),
            retractall(holding(strange_soda)),
            assert(creed_quest_done_half),
            assert(holding(creed_reference))
            ; !
        ),

        not(creed_quest_done_full),
        not(creed_quest_done_half),
        nl,
        write("Creed: *plays solitaire without even noticing you*"), nl,
        write("(HINT: go(openspace).)"), nl
        ;
        !
    ).

decide_wheter_to_start_creed_quest :-
    nl,
    write("Enter number of dialogue option followed by a dot:"), nl,
    write("1. Ok, I will do it. (start quest)"), nl,
    write("2. Sorry, but I don't have time right now. (leave)"), nl,
    read(Choice),
    answer_creed(Choice).

answer_creed(Choice) :-
    (Choice == 1 ->
        creed_quest
    ;
    Choice == 2 ->
        write("Creed: Cool beans!"), nl,
        go(openspace), !
    ;
        write("Not a valid dialogue option"), nl,
        decide_wheter_to_start_creed_quest
    ).

display_creed_quest_opening :-
    nl,
    write("Creed: Nice, I have this coupon for one free soda in our vending machine. I would like to drink some Grape Soda, but the thing is that this coupon is strange. I don't know how to use it, maybe you will figure it out."), nl,
    write("Creed: So here is the coupon..."), nl, nl,
    write("       =ONE FREE SODA="), nl,
    write("          F   G   H"), nl,
    write("       P 034 015 092"), nl,
    write("       R 059 041 065"), nl,
    write("       S 026 073 087"), nl, nl,
    write("Creed: As I said, I would prefer the Grape Soda, but I don't know how to order it using this strange coupon..."), nl,
    write("Creed: When you will figure out the proper code, go the the break room and type it into the vending machine."),
    assert(holding(coupon)).


creed_quest :-
    display_creed_quest_opening,
    assert(creed_quest_started).
