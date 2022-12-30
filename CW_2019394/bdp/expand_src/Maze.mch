/* Maze
 * Author: Asus
 * Creation date: 12/23/2022
 */
MACHINE
    Maze

CONCRETE_CONSTANTS
    moving_x_range ,
    moving_y_range ,
    internal_walls ,
    exit_point ,
    entry_point ,
    maze

PROPERTIES
    moving_x_range <: NAT1 & moving_x_range = 1 .. 7 &

    moving_y_range <: NAT1 & moving_y_range = 1 .. 5 &

    internal_walls : ( moving_x_range <-> moving_y_range ) &
    internal_walls = { ( 2 |-> 1 ) , ( 6 |-> 1 ) , ( 4 |-> 2 ) , ( 6 |-> 2 ) , ( 1 |-> 3 ) , ( 2 |-> 3 ) , ( 3 |-> 3 ) , ( 4 |-> 3 ) , ( 4 |-> 4 ) , ( 6 |-> 4 ) , ( 7 |-> 4 ) , ( 2 |-> 5 ) } &

    maze : ( moving_x_range <-> moving_y_range ) &
    maze = moving_x_range * moving_y_range &

    entry_point : ( moving_x_range <-> moving_y_range ) &
    entry_point = { ( 1 |-> 1 ) } &

    exit_point : ( moving_x_range <-> moving_y_range ) &
    exit_point = { ( 1 |-> 5 ) }


END
