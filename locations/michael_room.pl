:- multifile describe/1, dwight_stapler_in_jelly/0, creed_quest_done_full/0, creed_quest_done_half/0, bathroom_locked/0, door_destroyed/0, at/1.

describe(michael_room) :-
    ((not(dwight_stapler_in_jelly) ; (not(creed_quest_done_full) , not(creed_quest_done_half)) ; bathroom_locked) ->
        write("(You haven't obtained 3 reviews yet)"), nl,
        go(openspace)
    ;
        write("You are in the Michael's room"), nl,
        write("(HINT: michael.)"), nl,
        write("You can go back to the 'openspace' from here")
    ).

michael :-
    % poor (1/3)
    ((creed_quest_done_half, door_destroyed) ->
        nl,
        write("Michael: Who do we have here? It's our future employee! Welcome! Please show me the reviews from my people. Oh my! What a massacre! I have never seen such bad employee reviews. What was I saying? Oh yes, about your job application. It's very nice, but that's all for today. We will call you back, goodbye. What? No, we don't need your phone number, have a nice day."), nl, end_game
    ;
        true
    ),

    % good (3/3)
    ((creed_quest_done_full, not(door_destroyed)) ->
        nl,
        write("Michael: Okay, what do we have here? Hmm, okay. Fantastic! I see that each of my top three employees has given you a positive review, I'm impressed! Thank you for this wonderful day and welcome aboard the company! That's all for today, go home and celebrate the success, and see you tomorrow morning. Take care!"), nl, end_game
    ;
        true
    ),

    % medium (2/3)
    nl,
    write("Hi, I see you have reviews from my employees, great, let's see what they wrote. Hmmm, I see that the experts' opinions are divided. Well, these aren't the best reviews I've ever seen, but they're not the worst either. You didn't do that bad overall, I'll cut your salary a bit and the company will be satisfied with you. So, welcome aboard! Come in tomorrow at 8 AM."), nl, end_game.

end_game :-
    nl,
    write("THANKS FOR PLAYING"), nl,
    halt.