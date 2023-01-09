/* Robot
 * Author: Asus
 * Creation date: 12/23/2022
 */
MACHINE
    Robot 

SEES
    Maze

SETS
    TEST_REPORT = { Moved_North_Successfully, Moved_South_Successfully, Moved_East_Successfully, Moved_West_Successfully, Teleported_Successfully_To_New_Point, 
        Cannot_Teleport_In_The_First_Move, Cannot_Teleport_To_Same_Point, Cannot_Teleport_To_Exit_Point, Robot_Hits_The_Internal_Wall, Out_Of_Maze_Boundary, Reset_Perfomed_Successfully, 
        Cannot_Move_Exit_Point_Reached, Yes, No }

VARIABLES
    x_position_of_robot,
    y_position_of_robot,
    get_current_position_of_robot,
    robot_has_visited
    
INVARIANT
    x_position_of_robot : moving_x_range &
    y_position_of_robot : moving_y_range &
    get_current_position_of_robot : maze &
    robot_has_visited : seq(maze)
    
INITIALISATION
    x_position_of_robot := 1 || 
    y_position_of_robot := 1 || 
    get_current_position_of_robot := (1|->1) ||
    robot_has_visited := [(1|->1)]

OPERATIONS
    
    direction_output_message <-- Move_To_North = // report stores the output value of the Move To North operation 
        PRE direction_output_message : TEST_REPORT // report is an element of TEST REPORT. report stores value Moved To North finally which is an element of TEST REPORT
        THEN
            IF (get_current_position_of_robot : exit_point)  //  Cannot move as exit reached
            THEN
                direction_output_message := Cannot_Move_Exit_Point_Reached
            ELSIF ((x_position_of_robot |-> y_position_of_robot + 1) /: maze)    // Check if new point is inside the maze boundary
            THEN
                direction_output_message := Out_Of_Maze_Boundary
            ELSIF ((x_position_of_robot |-> y_position_of_robot + 1) : internal_walls) // Check if new point hits the inner wall
            THEN
                direction_output_message := Robot_Hits_The_Internal_Wall

            ELSE
                get_current_position_of_robot := (x_position_of_robot |-> y_position_of_robot + 1) || //getting new points position
                robot_has_visited := (robot_has_visited <- (x_position_of_robot |-> y_position_of_robot + 1)) || // { <- append new point to tail of seq }
                y_position_of_robot := (y_position_of_robot + 1) || // updating the new point
                direction_output_message := Moved_North_Successfully //result
            END
        END;
    
    direction_output_message <-- Move_To_South =
        PRE direction_output_message : TEST_REPORT
        THEN 
            IF (get_current_position_of_robot : exit_point)
            THEN
                direction_output_message := Cannot_Move_Exit_Point_Reached
            ELSIF ((x_position_of_robot |-> y_position_of_robot - 1) /: maze)
            THEN
                direction_output_message := Out_Of_Maze_Boundary
            ELSIF ((x_position_of_robot |-> y_position_of_robot - 1) : internal_walls)
            THEN
                direction_output_message := Robot_Hits_The_Internal_Wall
            ELSE
                get_current_position_of_robot := ((x_position_of_robot |-> y_position_of_robot - 1)) ||
                robot_has_visited := (robot_has_visited <- (x_position_of_robot |-> y_position_of_robot - 1)) ||
                y_position_of_robot := (y_position_of_robot - 1) ||
                direction_output_message := Moved_South_Successfully
            END
        END;
    
    direction_output_message <-- Move_To_East =
        PRE direction_output_message : TEST_REPORT
        THEN
            IF (get_current_position_of_robot : exit_point)
            THEN
                direction_output_message := Cannot_Move_Exit_Point_Reached
            ELSIF (((x_position_of_robot + 1 |-> y_position_of_robot) /: maze))
            THEN 
                direction_output_message := Out_Of_Maze_Boundary
            ELSIF ((x_position_of_robot + 1 |-> y_position_of_robot) : internal_walls)
            THEN
                direction_output_message := Robot_Hits_The_Internal_Wall
            ELSE
                get_current_position_of_robot := (x_position_of_robot + 1 |-> y_position_of_robot) ||
                robot_has_visited := (robot_has_visited <- (x_position_of_robot + 1 |-> y_position_of_robot)) ||
                x_position_of_robot := x_position_of_robot + 1 ||
                direction_output_message := Moved_East_Successfully
            END
        END;
    
    direction_output_message <-- Move_To_West =
        PRE direction_output_message : TEST_REPORT
        THEN
            IF (get_current_position_of_robot : exit_point)
            THEN
                direction_output_message := Cannot_Move_Exit_Point_Reached
            ELSIF ((x_position_of_robot - 1 |-> y_position_of_robot) /: maze)
            THEN 
                direction_output_message := Out_Of_Maze_Boundary
            ELSIF ((x_position_of_robot - 1 |-> y_position_of_robot) : internal_walls)
            THEN
                direction_output_message := Robot_Hits_The_Internal_Wall
            ELSE
                get_current_position_of_robot := (x_position_of_robot - 1 |-> y_position_of_robot) ||
                robot_has_visited := (robot_has_visited <- (x_position_of_robot - 1 |-> y_position_of_robot)) ||
                x_position_of_robot := (x_position_of_robot - 1) ||
                direction_output_message := Moved_West_Successfully
            END
        END;
    
    teleport_output_message <-- Teleport_To(x_position_to_teleport, y_position_to_teleport) =
        PRE teleport_output_message : TEST_REPORT & x_position_to_teleport : NATURAL1 & y_position_to_teleport : NATURAL1
        THEN
//          Cannot be the 1st move
            IF (size(robot_has_visited) = 1)
            THEN
                teleport_output_message := Cannot_Teleport_In_The_First_Move
//          Cannot move as exit reached
            ELSIF (get_current_position_of_robot : exit_point)
            THEN
                teleport_output_message := Cannot_Move_Exit_Point_Reached
//          Out of boundary check
            ELSIF ((x_position_to_teleport |-> y_position_to_teleport) /: maze)
            THEN 
                teleport_output_message := Out_Of_Maze_Boundary
//          Internal wall check
            ELSIF ((x_position_to_teleport |-> y_position_to_teleport) : internal_walls)
            THEN
                teleport_output_message := Robot_Hits_The_Internal_Wall
//          Cannot move to same point
            ELSIF ((x_position_to_teleport = x_position_of_robot & y_position_to_teleport = y_position_of_robot))
            THEN
                teleport_output_message := Cannot_Teleport_To_Same_Point
//          Cannot teleport to exit point 
            ELSIF ((x_position_to_teleport |-> y_position_to_teleport) : exit_point)
            THEN
                teleport_output_message := Cannot_Teleport_To_Exit_Point
//          Cannot move as exit reached
            ELSIF (get_current_position_of_robot : exit_point)
            THEN
                teleport_output_message := Cannot_Move_Exit_Point_Reached
            ELSE
                get_current_position_of_robot := (x_position_to_teleport |-> y_position_to_teleport) ||
                robot_has_visited := (robot_has_visited <- ((x_position_to_teleport |-> y_position_to_teleport))) ||
                x_position_of_robot := (x_position_to_teleport) ||
                y_position_of_robot := (y_position_to_teleport) ||
                teleport_output_message:= Teleported_Successfully_To_New_Point
           END
        END;
    
    get_position_output_message <-- Get_Current_Position = 
        BEGIN
            get_position_output_message := get_current_position_of_robot
        END;
    
    get_exit_output_message <-- Found_Exit_Pont =
        PRE get_exit_output_message : TEST_REPORT
        THEN
//          Check if the position is in exit point -> ( 5,1 )
            IF ((x_position_of_robot = 1) & (y_position_of_robot = 5))
            THEN
                get_exit_output_message := Yes
            ELSE
                get_exit_output_message := No
            END
        END;
        
    get_visited_square_output_message <-- Check_If_Visited(x_position_to_check, y_position_to_check) =
        PRE get_visited_square_output_message : TEST_REPORT & x_position_to_check : NATURAL1 & y_position_to_check : NATURAL1
        THEN
            IF ((x_position_to_check |-> y_position_to_check) : maze) // Check if the position is inside maze boundary
            THEN 
                IF ((x_position_to_check |-> y_position_to_check) /: internal_walls)    // Check is position hits thew internal wall
                THEN
                    IF ((x_position_to_check |-> y_position_to_check ) : ran(front(robot_has_visited)))    // Check if the position is available in the visited route sequence
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
            get_robots_route_output_message := robot_has_visited // Show visited position in the maze
        END;
        
    get_reset_output_message <-- Reset_Robot = 
        BEGIN
//          Reset all values of the maze to initial state
            x_position_of_robot := 1 || 
            y_position_of_robot := 1 || 
            get_current_position_of_robot := (1|->1) ||
            robot_has_visited := [(1|->1)] ||
                
            get_reset_output_message := Reset_Perfomed_Successfully        
         END
     END