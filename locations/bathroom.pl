:- multifile describe/1, bathroom_locked/0, i_am_at/1, go_to/1.

% these predicates are initialised as false
:-
    retractall(task_correct(_)),
    retractall(dwight_quest_done),
    retractall(answer(_)),
    retractall(door_destroyed).

% these predicates are initialised as true
:-
    assert(bathroom_locked).


describe(bathroom) :-
    % description when bathroom is locked
    bathroom_locked,
    write('You stop in front of the bathroom door. You place your hand on the door handle...'), nl,
    write('...and suddenly you hear furious German swearing words coming from the inside.'), nl,
    write('HINT: knock.'), !;

    % description when bathroom is not locked
    write("Some toilets, sinks, and rather unhealthy smell. The toilet paper seems to be missing as ususal. Nothing too interesting here.").

knock :-
    i_am_at(bathroom),
    bathroom_locked,
    display_dwight_initial_dialogue,
    decide_wheter_to_start_dwight_quest, !;

    i_am_at(bathroom),
    write("It seems there is no one in the bathroom").

decide_wheter_to_start_dwight_quest :-
    nl,
    write("Enter number of dialogue option followed by a dot:"), nl,
    write("1. Ok, I will help you now. (start quest)"), nl,
    write("2. Oh, I have left the oven turned on... be right back! (leave Dwight inside)"), nl,
    read(Choice),
    answer(Choice).

answer(Choice) :-
    Choice == 1, !, dwight_quest;
    Choice == 2, !, nl, go_to(openspace);
    write('Not a valid dialogue option'), nl, decide_wheter_to_start_dwight_quest.


dwight_quest :-
    display_dwight_quest_opening,
    dwight_quest_body,
    display_dwight_final_dialogue,
    assert(dwight_quest_done),
    assert(holding(dwight_reference)),
    retractall(bathroom_locked).

dwight_quest_body :-
    do_dwight_tasks,
    check_dwight_tasks, !;

    not(door_destroyed),
        nl,
        write("Dwight: It seems it didn't work... Let's try another time."), nl,
        dwight_quest_body, !;

    door_destroyed.

do_dwight_tasks :-
    task_0,
    not(door_destroyed), task_1,
    not(door_destroyed), task_2,
    not(door_destroyed), task_3.

check_dwight_tasks :-
    task_correct(0), task_correct(1), task_correct(2), task_correct(3).

task_0 :-
    nl,
    write("Find the next element: 1, 2, 4, 8, 16, ..."), nl,
    write("HINT: type '32.' or type 'kick.' to kick off the door (Michael is not going to be happy about it...) "), nl,
    read(Input),
    validate(0, Input, 32), !;
    destroy_door.                   % if validate returns fail than destroy door

task_1 :-
    nl,
    write("Find the next element: 1, 1, 2, 3, 5, 8, ..."), nl,
    write("OR: Type 'kick.' to kick off the door (Michael is not going to be happy about it...) "), nl,
    read(Input),
    validate(1, Input, 13), !;
    destroy_door.                   % if validate returns fail than destroy door

task_2 :-
    nl,
    write("Find the next element: 1, 4, 9, 16, 25, ..."), nl,
    write("OR: Type 'kick.' to kick off the door (Michael is not going to be happy about it...) "), nl,
    read(Input),
    validate(2, Input, 36), !;
    destroy_door.                   % if validate returns fail than destroy door

task_3 :-
    nl,
    write("Find the next element: 1, 32, 81, 64, 25, ..."), nl,     % 1^6, 2^5, 3^4, 4^3, 5^2, 6^1
    write("OR: Type 'kick.' to kick off the door (Michael is not going to be happy about it...) "), nl,
    read(Input),
    validate(3, Input, 6), !;
    destroy_door.                   % if validate returns fail than destroy door

validate(Task_number, Input, Correct_answer) :-
    Input == kick,
        fail;
    Input == Correct_answer,
        assert(task_correct(Task_number)), !;
    Input \== Correct_answer, Input \== kick,
        retractall(task_correct(Task_number)).

destroy_door :-
    assert(door_destroyed).

display_dwight_initial_dialogue :-
    nl,
    write("Dwight (from the inside): Hey, wait! Temp, is that you? You have to help me. I've been locked inside."), nl,
    write("Dwight: If you help me and tell nothing to Jim I will give you my recommendation."), nl,
    write("You: How on Earth are you locked inside?"), nl,
    write("Dwight: I have forgotten that I had recently changed code to my padlock..."), nl,
    write("You: Do you always lock yourself in a bathroom with a padlock?"), nl,
    write("Dwight: Of course, Temp. I value my privacy, I always have my military padlock with digit code."), nl,
    write("Dwight: For security reasons I change the code every month... Temp, you have to help me!"), nl.

display_dwight_quest_opening :-
    nl,
    write("You: Do you have your new code saved somewhere?"), nl,
    write("Dwight: No, are you stupid, Temp? I never write down any code. I have e n c r y p t e d it."), nl,
    write("You: So why don't you d e c r y p t it?"), nl,
    write("Dwight: Because I have forgotten how I encrypted it... I have my notes here, though."), nl,
    write("Dwight: I will tell you first numbers of a sequence and you have to find the next element. This is going to be a part of the code."), nl.

display_dwight_final_dialogue :-
    door_destroyed,
    nl,
    write("You take a deep breath and... CLANG!!!"), nl,
    write("The door lies on the floor broken in two parts. There is no way anyone can repair it, but Dwight is free."), nl,
    write("Dwight: Well... not what I expected, but thanks. Here is my reference for you, as promised. It will be useful to have you on board."), nl,
    write("Dwight: However, keep in mind that Michael likes to hide in a bathroom when his supervisor comes... he's not going to like what happend to the door."), nl, !;

    nl,
    write("You hear some clicking and cracking and, to your surprise, the bathroom door opens and you see Dwight coming out from the bathroom"), nl,
    write("Dwight: Did I forgot the code for real? FALSE. I was just checking whether you have basic math skills, Temp."), nl,
    write("Dwight: Here you have my reference, but don't imagine that you have proved yourself useful."), nl,
    write("Dwight gives you a sheet of paper with his signature and then moves to his desk in openspace. The bathroom is open now."), nl.