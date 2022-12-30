/* Robot
 * Author: Asus
 * Creation date: 12/23/2022
 */
MACHINE
    Robot 

SEES
    Maze

SETS
    TEST_REPORT = {Moved_North_Successfully, Moved_South_Successfully, Moved_East_Successfully, Moved_West_Successfully, Teleported_Successfully_To_New_Point, 
        Cannot_Teleport_In_The_First_Move, Cannot_Teleport_To_Same_Point, Robot_Hits_The_Internal_Wall, Out_Of_Maze_Boundary, Reset_Perfomed, Reset_Not_Perfomed, Yes, No }

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
    
    direction_output_message <-- Move_To_North = // report stores the output value of the Move To North operation 
        PRE direction_output_message : TEST_REPORT // report is an element of TEST REPORT. report stores value Moved To North finally which is an element of TEST REPORT
        THEN
            IF ((x_position_of_robot |-> y_position_of_robot + 1) /: maze)     
            THEN
                direction_output_message := Out_Of_Maze_Boundary
            ELSE IF ((x_position_of_robot |-> y_position_of_robot + 1) : internal_walls) // Check if new point hits the inner wall
            THEN
                direction_output_message := Robot_Hits_The_Internal_Wall
            ELSE
                get_current_position_of_robot := (x_position_of_robot |-> y_position_of_robot + 1) || //getting new points position
                check_if_robot_visited := (check_if_robot_visited <- (x_position_of_robot |-> y_position_of_robot + 1)) || // {<- append new point to tail of seq}
                y_position_of_robot := (y_position_of_robot + 1) || // updating the new point
                direction_output_message := Moved_North_Successfully //result
            END //IF condition END
        END // PRE condition END
    END; // Move To North END
    
    direction_output_message <-- Move_To_South =
        PRE direction_output_message : TEST_REPORT
        THEN 
            IF ((x_position_of_robot |-> y_position_of_robot - 1) /: maze)
            THEN
                direction_output_message := Out_Of_Maze_Boundary
            ELSE IF ((x_position_of_robot |-> y_position_of_robot - 1) : internal_walls)
            THEN
                direction_output_message := Robot_Hits_The_Internal_Wall
            ELSE
                get_current_position_of_robot := ((x_position_of_robot |-> y_position_of_robot - 1)) ||
                check_if_robot_visited := (check_if_robot_visited <- (x_position_of_robot |-> y_position_of_robot - 1)) ||
                y_position_of_robot := (y_position_of_robot - 1) ||
                direction_output_message := Moved_South_Successfully
            END
        END
    END;
    
    direction_output_message <-- Move_To_East =
        PRE direction_output_message : TEST_REPORT
        THEN
            IF (((x_position_of_robot + 1 |-> y_position_of_robot) /: maze))
            THEN 
                direction_output_message := Out_Of_Maze_Boundary
            ELSE IF ((x_position_of_robot + 1 |-> y_position_of_robot) : internal_walls)
            THEN
                direction_output_message := Robot_Hits_The_Internal_Wall
            ELSE
                get_current_position_of_robot := (x_position_of_robot + 1 |-> y_position_of_robot) ||
                check_if_robot_visited := (check_if_robot_visited <- ((x_position_of_robot + 1 |-> y_position_of_robot))) ||
                x_position_of_robot := x_position_of_robot + 1 ||
                direction_output_message := Moved_East_Successfully
            END
        END
    END;
    
    direction_output_message <-- Move_To_West =
        PRE direction_output_message : TEST_REPORT
        THEN
            IF ((x_position_of_robot - 1 |-> y_position_of_robot) /: maze)
            THEN 
                direction_output_message := Out_Of_Maze_Boundary
            ELSE IF ((x_position_of_robot - 1 |-> y_position_of_robot) : internal_walls)
            THEN
                direction_output_message := Robot_Hits_The_Internal_Wall
            ELSE
                get_current_position_of_robot := (x_position_of_robot - 1 |-> y_position_of_robot) ||
                check_if_robot_visited := (check_if_robot_visited <- ((x_position_of_robot - 1 |-> y_position_of_robot))) ||
                x_position_of_robot := (x_position_of_robot - 1) ||
                direction_output_message := Moved_West_Successfully
            END
        END
    END;
    
    teleport_output_message <-- Teleport_To(x_position_to_teleport, y_position_to_teleport) =
        PRE teleport_output_message : TEST_REPORT & x_position_to_teleport : NAT1 & y_position_to_teleport : NAT1
        THEN
//          Cannot be the 1st move
            IF (size(check_if_robot_visited) = 1)
            THEN
                teleport_output_message := Cannot_Teleport_In_The_First_Move
//          Out of boundary check
            ELSE IF ((x_position_to_teleport |-> y_position_to_teleport) /: maze)
            THEN 
                teleport_output_message := Out_Of_Maze_Boundary
//          Internal wall check
            ELSE IF ((x_position_to_teleport |-> y_position_to_teleport) : internal_walls)
            THEN
                teleport_output_message := Robot_Hits_The_Internal_Wall
//          Cannot move to same point
            ELSE IF ((x_position_to_teleport = x_position_of_robot & y_position_to_teleport = y_position_of_robot))
            THEN
                teleport_output_message := Cannot_Teleport_To_Same_Point
            ELSE
                get_current_position_of_robot := (x_position_to_teleport |-> y_position_to_teleport) ||
                check_if_robot_visited := (check_if_robot_visited <- ((x_position_to_teleport |-> y_position_to_teleport))) ||
                x_position_of_robot := (x_position_to_teleport) ||
                y_position_of_robot := (y_position_to_teleport) ||
                teleport_output_message:= Teleported_Successfully_To_New_Point
            END
            END
            END
        END
    END;
    
    get_position_output_message <-- Get_Current_Position = 
        BEGIN
            get_position_output_message := get_current_position_of_robot
        END;
    
    get_exit_output_message <-- Found_Exit_Pont =
        PRE get_exit_output_message : TEST_REPORT
        THEN
            IF ((x_position_of_robot = 5) & (y_position_of_robot = 1))
            THEN
                get_exit_output_message := Yes
            ELSE
                get_exit_output_message := No
            END
        END;
        
    get_visited_square_output_message <-- Check_If_Visited(x_position_to_check, y_position_to_check) =
        PRE get_visited_square_output_message : TEST_REPORT & x_position_to_check : 1..7 & y_position_to_check : 1..5
        THEN
            IF ((x_position_to_check |-> y_position_to_check) : maze)
            THEN 
                IF ((x_position_to_check |-> y_position_to_check) /: internal_walls)
                THEN
                    IF ((x_position_to_check |-> y_position_to_check ) : ran(front(check_if_robot_visited)))
                    THEN
                        get_visited_square_output_message := Yes
                    ELSE
                        get_visited_square_output_message  := No
                    END
                ELSE
                    get_visited_square_output_message := Robot_Hits_The_Internal_Wall
                END
            ELSE
                get_visited_square_output_message := Out_Of_Maze_Boundary
            END
        END;
        
    get_robots_route_output_message <-- Route_Of_The_Robot_Traversed = 
        BEGIN
            get_robots_route_output_message := ran(front(check_if_robot_visited))
        END;
        
    get_reset_output_message <-- Reset_Robot = 
        PRE get_reset_output_message : TEST_REPORT
        THEN
            x_position_of_robot := 1 || 
            y_position_of_robot := 1 || 
            get_current_position_of_robot := (1|->1) ||
            check_if_robot_visited := [(1|->1)] ||
            
            IF ((x_position_of_robot = 1) & (y_position_of_robot = 1))
            THEN
                get_reset_output_message := Reset_Perfomed        
            ELSE
                get_reset_output_message := Reset_Not_Perfomed
            END
         END
END