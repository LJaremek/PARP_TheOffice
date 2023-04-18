:- multifile describe/1.

describe(elevator) :-
    write("You step in the elevator and when the doors are closing Michael (your boss) rushes into the elevator."), nl,
    write("Michael: Hi, you must be our new intern, welcome to Dunder Mifflin!"), nl,
    write("(HINT: hi. to say hi)"), nl,
    read(_),
    write("Michael: During your internship you should obtain 3 (hopefully positive) reviews from other employees. Look around the office and see what you can do. When you are ready come to my room and I will take a look. Good luck!"), nl,
    write("(HINT: enter. to enter the office)").

enter :-
    nl,
    write("As you step out of the elevator you enter the office openspace..."), nl,
    go(openspace), !.
