:- multifile describe/1, bathroom_locked/0.

describe(bathroom) :-
    % description when bathroom is locked
    % bathroom_locked,
    write('You stop in front of the bathroom door. You place your hand on the door handle...'), nl,
    write('...and suddenly you hear furious German swearing words coming from the inside.'), nl,
    write('HINT: knock.'), nl,
    !.

knock :- write('TODO').