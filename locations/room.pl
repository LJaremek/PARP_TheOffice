:- multifile describe/1.

describe(room) :-
    write('You are in a room. There is a person here'), nl,
    write('HINT: talk(person)'), nl,!.

talk(person) :-
    write('Person: Hi!'), nl,
    nl,
    write('a. Hello there'), nl,
    write('b. I don''t like you'), nl,
    write('Enter symbol of dialogue option followed by a dot:'), nl,
    read(Answer), nl,
    assert(answer(Answer)),     % answer = Answer
    answer(Answer),
    retractall(answer(_)).

answer(a) :- write('General Kenobi'),!.
answer(b) :- write('You are rude!'),!.
% answer(_) :-
%     write('Not a valid input').