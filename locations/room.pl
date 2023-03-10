:- multifile describe/1.

describe(room) :-
    write('You are in a room. There is a person here'), nl,
    write('HINT: talk(person)'), nl,!.


talk(person) :-
    nl,
    write('Person: Hi!'), nl,
    write('Enter number of dialogue option followed by a dot:'), nl,
    write('1. Hello there'), nl,
    write('2. I don''t like you'), nl,
    read(Choice),
    answer(Choice).

answer(Choice) :-
    Choice == 1, write('Person: General Kenobi'), nl;
    Choice == 2, write('Person: You are rude!'), nl;
    write('Not a valid dialogue option'), nl, talk(person).

