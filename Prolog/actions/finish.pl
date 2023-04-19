/* This rule tells how to die. */

die :-
    finish.


/* Under UNIX, the "halt." command quits Prolog but does not
remove the output window. On a PC, however, the window
disappears before the final output can be seen. Hence this
routine requests the user to perform the final "halt." */

finish :-
    nl,
    write('The game is over. Please enter the "halt." command.'),
    nl.
