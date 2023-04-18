/* This rule just writes out game instructions. */

instructions :-
    nl,
    write('Enter commands using standard Prolog syntax.'), nl,
    write('Available commands are:'), nl,
    write('start.           -- to start the game.'), nl,
    write('go(Room).        -- to go to that room.'), nl,
    write('look.            -- to look around you again.'), nl,
    write('inventory.       -- to show inventory.'), nl,
    write('instructions.    -- to see this message again.'), nl,
    write('halt.            -- to end the game and quit.'), nl,
    nl.
