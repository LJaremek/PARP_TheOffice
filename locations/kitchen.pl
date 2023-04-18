:- multifile describe/1, dwight_stapler_out_clear/0, dwight_stapler_out_jelly/0.


describe(kitchen) :-
    write("You are in the kitchen"), nl,
    write("You can go to the 'break_room', 'bathroom' or to the 'openspace' from here"), nl,
    write("There is a coffee machine, some tea, kettle, and jelly powder."),
    write("Maybe it will be useful later..."),

    (dwight_stapler_out_clear ->
        nl,
        write("Do you want to put the Dwight stapler to the jelly?"), nl,
        write("HINT: 'jelly_stapler.'")
        ;
        true
    ).


jelly_stapler :-
    i_am_at(kitchen),
    dwight_stapler_out_clear,

    write("Choose the color of the jelly."), nl,
    write("HINT: 'red', 'green' or 'blue': "), nl,
    read(_),

    write("Its ready!"), nl, nl,
    write(" /----------\\"), nl,
    write("/  |/----,,  \\"), nl,
    write("|  |[______   |"), nl,
    write("==============="), nl, nl,

    write("Now I can put back the stapler to the drawer."), nl,

    retractall(dwight_stapler_out_clear),
    assert(dwight_stapler_out_jelly),
    retractall(holding(stapler)),
    assert(holding(stapler_in_jelly)).
