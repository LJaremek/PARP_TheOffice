:- multifile describe/1, go/1.

% these predicates are initialised as false
:-
    retractall(said_hi).

describe(elevator) :-
    write("You step into the elevator and when the doors are closing Michael (your boss) rushes inside."), nl, nl,
    write("Michael: Hi, you must be our new intern, welcome to Dunder Mifflin!"), nl,
    write("(HINT: type 'hi.' to say hi)").

hi :-
    nl,
    write("Michael: During your internship you should obtain 3 (hopefully positive) reviews from other employees. Look around the office and see what you can do. When you are ready come to my room and I will take a look. Good luck!"), nl,
    write("(HINT: enter. to enter the office)"),
    assert(said_hi).

enter :-
    said_hi,
    nl,
    write("As you step out of the elevator you enter the office openspace..."), nl,
    write("You see Jim approaching you with a big smile..."), nl,
    write("Jim: Hi, I'm Jim! I'm glad to have the opportunity to assign to you something useful that will prove your competence. Dwight is working in our office, he's my best friend who LOVES jelly and staplers. Play him a funny prank, and I'll sign off on your task completion. It's worth checking out his desk in the openspace. Good luck!"), nl,
    go(openspace), !.
