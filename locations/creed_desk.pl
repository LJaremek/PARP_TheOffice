:- multifile
describe/1, i_am_at/1, go/1,
creed_quest_started/0,
grape_soda/0,
creed_quest_done/0.


describe(creed_desk) :-
    write("You see Creed playing solitaire on his computer while eating an apple..."), nl,
    write("(HINT: talk.)"), nl,
    write("You can go back to openspace from here.").

talk :-
    % description when creed quest is done
    (creed_quest_done ->
        nl,
        write("Creed: Hi kid, thanks for the drink once again!")
    ;
        true
    ),

    (not(creed_quest_started) ->
        write("Creed: Hi kid, I have some small job for you."), nl,
        decide_wheter_to_start_creed_quest, !
    ;
        (grape_soda, not(creed_quest_done) ->
            nl,
            write("Creed: Hi kid, I see you have my soda, nice job!"), nl,
            retractall(grape_soda),
            assert(creed_quest_done)
        ;
            not(creed_quest_done),
            nl, 
            write("Creed: *plays solitaire without even noticing you*"), nl,
            write("(HINT: go(openspace).)"), nl
            ; !
        )
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
    write("Creed: Nice, so I would like to drink some Grape Soda, but the thing is that TODO"), nl,
    write("Creed: So here is the matrix..."), nl, nl,
    write("         F  G  H"), nl,
    write("       P 34 15 92"), nl,
    write("       R 59 41 65"), nl,
    write("       S 26 73 87"), nl.

creed_quest :-
    display_creed_quest_opening,
    assert(creed_quest_started).
