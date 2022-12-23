/* Robot
 * Author: Asus
 * Creation date: 12/23/2022
 */
MACHINE
    Robot

SEES
    Maze

SETS
    TEST_REPORT = {Moved_To_North, Moved_To_South, Moved_To_East, Moved_To_West, Teleported_Now, Cannot_Teleport_Now, 
        Cannot_Teleport_To_Same_Point, Robot_Hits_The_Wall, Out_Of_Maze_Boundary, yes, no }

VARIABLES
    x_position_of_robot,
    y_position_of_robot,
    get_current_position_of_robot,
    check_if_robot_visited
    
INVARIANT
    x_position_of_robot : moving_x_range &
    y_position_of_robot : moving_y_range &
    get_current_position_of_robot : maze &
    check_if_robot_visited : seq(maze)
    
INITIALISATION
    x_position_of_robot := 1 || 
    y_position_of_robot := 1 || 
    get_current_position_of_robot := (1|->1) ||
    check_if_robot_visited := [(1|->1)]

OPERATIONS
    
    report <-- Move_To_North = // report stores the output value of the Move To North operation 
        PRE report : TEST_REPORT // report is an element of TEST REPORT. report stores value Moved To North finally which is an element of TEST REPORT
        THEN
//            IF (y_position_of_robot + 1 > max(moving_y_range)) // Check if new point is in Maze boundary
            IF ((x_position_of_robot |-> y_position_of_robot + 1) /: maze)     
            THEN
                report := Out_Of_Maze_Boundary
            ELSE IF ((x_position_of_robot |-> y_position_of_robot + 1) : internal_walls) // Check if new point hits the inner wall
            THEN
                report := Robot_Hits_The_Wall
            ELSE
                get_current_position_of_robot := (x_position_of_robot |-> y_position_of_robot + 1) || //getting new points position
                check_if_robot_visited := (check_if_robot_visited <- (x_position_of_robot |-> y_position_of_robot + 1)) || // {<- append new point to tail of seq}
                y_position_of_robot := (y_position_of_robot + 1) || // updating the new point
                report := Moved_To_North //result
            END //IF condition END
        END // PRE condition END
    END; // Move To North END
    
    report <-- Move_To_South =
        PRE report : TEST_REPORT
        THEN 
            IF ((x_position_of_robot |-> y_position_of_robot - 1) /: maze)
            THEN
                report := Out_Of_Maze_Boundary
            ELSE IF ((x_position_of_robot |-> y_position_of_robot - 1) : internal_walls)
            THEN
                report := Robot_Hits_The_Wall
            ELSE
                get_current_position_of_robot := ((x_position_of_robot |-> y_position_of_robot - 1)) ||
                check_if_robot_visited := (check_if_robot_visited <- (x_position_of_robot |-> y_position_of_robot - 1)) ||
                y_position_of_robot := (y_position_of_robot - 1) ||
                report := Moved_To_South
            END
        END
    END;
    
    report <-- Move_To_East =
        PRE report : TEST_REPORT
        THEN
            IF (((x_position_of_robot + 1 |-> y_position_of_robot) /: maze))
            THEN 
                report := Out_Of_Maze_Boundary
            ELSE IF ((x_position_of_robot + 1 |-> y_position_of_robot) : internal_walls)
            THEN
                report := Robot_Hits_The_Wall
            ELSE
                get_current_position_of_robot := (x_position_of_robot + 1 |-> y_position_of_robot) ||
                check_if_robot_visited := (check_if_robot_visited <- ((x_position_of_robot + 1 |-> y_position_of_robot))) ||
                x_position_of_robot := x_position_of_robot + 1 ||
                report := Moved_To_East
            END
        END
    END;
    
    report <-- Move_To_West =
        PRE report : TEST_REPORT
        THEN
            IF ((x_position_of_robot - 1 |-> y_position_of_robot) /: maze)
            THEN 
                report := Out_Of_Maze_Boundary
            ELSE IF ((x_position_of_robot - 1 |-> y_position_of_robot) : internal_walls)
            THEN
                report := Robot_Hits_The_Wall
            ELSE
                get_current_position_of_robot := (x_position_of_robot - 1 |-> y_position_of_robot) ||
                check_if_robot_visited := (check_if_robot_visited <- ((x_position_of_robot - 1 |-> y_position_of_robot))) ||
                x_position_of_robot := (x_position_of_robot - 1) ||
                report := Moved_To_West
            END
        END
    END
   
END // Machines END