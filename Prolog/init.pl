% This is the main file starting the game

% These predicates are going to be changed during the game
:-
    dynamic
    i_am_at/1,
    at/2,
    holding/1,
    answer/1,
    bathroom_locked/0,
    dwight_quest_done/0,
    door_destroyed/0,

    dwight_stapler_out_clear/0,
    dwight_stapler_out_jelly/0,
    dwight_stapler_in_jelly/0,

    creed_quest_started/0,
    grape_soda/0,
    strange_soda/0,
    creed_quest_done_full/0,
    creed_quest_done_half/0,

    said_hi/0.

% These predicates are initialised with false
:-

    retractall(at(_, _)),
    retractall(i_am_at(_)),
    retractall(alive(_)).

:- ensure_loaded(paths).

% load all locations
:-
    ensure_loaded(locations/room),
    ensure_loaded(locations/elevator),
    ensure_loaded(locations/openspace),
    ensure_loaded(locations/kitchen),
    ensure_loaded(locations/bathroom),
    ensure_loaded(locations/break_room),
    ensure_loaded(locations/conference_room),
    ensure_loaded(locations/dwight_desk),
    ensure_loaded(locations/creed_desk),
    ensure_loaded(locations/michael_room).

% load all actions
:- ensure_loaded(actions/finish).
:- ensure_loaded(actions/go).
:- ensure_loaded(actions/instructions).
:- ensure_loaded(actions/look).
:- ensure_loaded(actions/start).
:- ensure_loaded(actions/inventory).

% set starting location
i_am_at(elevator).
% i_am_at(openspace).
% i_am_at(break_room).
% i_am_at(creed_desk).
% i_am_at(bathroom).
