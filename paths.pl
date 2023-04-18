path(openspace, n, room).
path(room, s, openspace).

path(openspace, w, bathroom).

path(elevator, openspace).

path(openspace, kitchen).
path(kitchen, openspace).
path(openspace, room).
path(room, openspace).
path(kitchen, bathroom).
path(bathroom, kitchen).

path(openspace, dwight_box).
path(dwight_box, openspace).

path(openspace, creed_desk).
path(creed_desk, openspace).

path(kitchen, break_room).
path(break_room, kitchen).

path(openspace, conference_room).
path(conference_room, openspace).
