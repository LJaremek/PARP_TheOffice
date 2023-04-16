:- multifile describe/1, dwight_stapler_out_clear/0, dwight_stapler_out_jelly/0, dwight_stapler_in_jelly/0.


% these predicates are initialised as true
:-
    assert(dwight_drawer_lock).


% these predicates are initialised as false
:-
    retractall(dwight_stapler_out_clear),
    retractall(dwight_stapler_out_jelly),
    retractall(dwight_stapler_in_jelly).


describe(dwight_box) :-
    write("You are in the Dwight Box"), nl,
    write("You can go to the 'openspace' from here"), nl,


    (dwight_drawer_lock ->
        write("You see his desk with the drawer closed with a four-digit lock."), nl,
        write("Maybe can you breake the code?."), nl,
        write("HINT: 'break_code.'")
        ;
        true
    ),

    (dwight_stapler_out_clear ->
        write("Dupa")
        ;
        true
    ).

break_code :-
    i_am_at(dwight_box),
    dwight_drawer_lock,
    try_break_code, !;

    i_am_at(dwight_box),
    write("The drawer is open.").


try_break_code :-
    write("Type the code: "),
    read(Dwightcode),
    check_code(Dwightcode).


check_code(Dwightcode) :-
    Dwightcode > 4510,  !, write("It's not that number. I think the code number is less..."), nl, try_break_code;
    Dwightcode < 4510,  !, write("It's not that number. I think the code number is bigger..."), nl, try_break_code;
    Dwightcode == 4510, !, breaked_code.


breaked_code :-
    write("I broke the code!"), nl,
    write("Now I have to put it to jelly in the kitchen."), nl,
    retractall(dwight_drawer_lock),
    assert(dwight_stapler_out_clear),
    describe(dwight_box).
