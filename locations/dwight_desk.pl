:- multifile describe/1, dwight_stapler_out_clear/0, dwight_stapler_out_jelly/0, dwight_stapler_in_jelly/0, i_am_at/1.


% these predicates are initialised as true
:-
    assert(dwight_drawer_lock).


% these predicates are initialised as false
:-
    retractall(dwight_stapler_out_clear),
    retractall(dwight_stapler_out_jelly),
    retractall(dwight_stapler_in_jelly).


describe(dwight_desk) :-
    write("You are in the Dwight Box"), nl,
    write("You can go to the 'openspace' from here"), nl,

    (dwight_drawer_lock ->
        write("Jim told me to prank Dwight."), nl,
        write("You see his desk with the drawer closed with a four-digit lock."), nl,
        write("Maybe can I breake the code?. There should be something!"), nl,
        write("HINT: 'break_code.'")
        ;
        true
    ),

    (dwight_stapler_out_clear ->
        write("I have the stapler in my hands."), nl,
        write("I have to go to the kitchen and put it to the jelly!")
        ;
        true
    ),

    (dwight_stapler_out_jelly ->
        write("I have the stapler in a jelly in my hands."), nl,
        write("I have to put it back to the drawer!"), nl,
        write("HINT 'put_jelly_stapler.'")
        ;
        true
    ),

    (dwight_stapler_in_jelly ->
        write("The jelly stapler is in the Dwight desk dewar. Good job!"), nl,
        write("Jim gave me a confirmation of completing the task.")
    ).


break_code :-
    i_am_at(dwight_desk),
    dwight_drawer_lock,
    try_break_code, !;

    i_am_at(dwight_desk),
    write("The drawer is open.").


try_break_code :-
    write("Type the code: "), nl,
    read(Dwightcode),
    check_code(Dwightcode).


check_code(Dwightcode) :-
    Dwightcode > 4510,  !, write("It's not that number. I think the code number is less..."), nl, try_break_code;
    Dwightcode < 4510,  !, write("It's not that number. I think the code number is bigger..."), nl, try_break_code;
    Dwightcode == 4510, !, broken_code.


broken_code :-
    nl,
    write("I have broken the code!"), nl,
    write("There is a stapler here... I'm taking it!"), nl,
    write("Now I have to put it to jelly in the kitchen."), nl,
    retractall(dwight_drawer_lock),
    assert(dwight_stapler_out_clear).


put_jelly_stapler :-
    write("Now the jelly stapler is in the Dwight drawer."), nl,
    retractall(dwight_stapler_out_clear),
    assert(dwight_stapler_in_jelly).
