path(openspace, n, room).
path(room, s, openspace).

path(openspace, w, bathroom).

path(openspace, bathroom).
path(bathroom, openspace).
path(openspace, room).
path(room, openspace).

