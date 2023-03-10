% This is the main file starting the game

:- dynamic i_am_at/1, at/2, holding/1, answer/1.
:- retractall(at(_, _)), retractall(i_am_at(_)), retractall(alive(_)).
:- retractall(answer(_)).

:- ensure_loaded(paths).

% load all locations
:- ensure_loaded(locations/room).
:- ensure_loaded(locations/openspace).

% load all actions
:- ensure_loaded(actions/drop).
:- ensure_loaded(actions/finish).
:- ensure_loaded(actions/go).
:- ensure_loaded(actions/instructions).
:- ensure_loaded(actions/look).
:- ensure_loaded(actions/notice_objects).
:- ensure_loaded(actions/start).
:- ensure_loaded(actions/take).

% set starting location to openspace
i_am_at(openspace).

