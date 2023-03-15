path(openspace, n, room).
path(room, s, openspace).

path(openspace, w, bathroom).

path(openspace, kitchen).
path(kitchen, openspace).
path(openspace, room).
path(room, openspace).
path(kitchen, bathroom).
path(bathroom, kitchen).

path(openspace, conference_room).
path(conference_room, openspace).
