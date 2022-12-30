Normalised(
THEORY MagicNumberX IS
  MagicNumber(Machine(Robot))==(3.5)
END
&
THEORY UpperLevelX IS
  First_Level(Machine(Robot))==(Machine(Robot));
  Level(Machine(Robot))==(0)
END
&
THEORY LoadedStructureX IS
  Machine(Robot)
END
&
THEORY ListSeesX IS
  List_Sees(Machine(Robot))==(Maze)
END
&
THEORY ListUsesX IS
  List_Uses(Machine(Robot))==(?)
END
&
THEORY ListIncludesX IS
  Inherited_List_Includes(Machine(Robot))==(?);
  List_Includes(Machine(Robot))==(?)
END
&
THEORY ListPromotesX IS
  List_Promotes(Machine(Robot))==(?)
END
&
THEORY ListExtendsX IS
  List_Extends(Machine(Robot))==(?)
END
&
THEORY ListVariablesX IS
  External_Context_List_Variables(Machine(Robot))==(?);
  Context_List_Variables(Machine(Robot))==(?);
  Abstract_List_Variables(Machine(Robot))==(?);
  Local_List_Variables(Machine(Robot))==(check_if_robot_visited,get_current_position_of_robot,y_position_of_robot,x_position_of_robot);
  List_Variables(Machine(Robot))==(check_if_robot_visited,get_current_position_of_robot,y_position_of_robot,x_position_of_robot);
  External_List_Variables(Machine(Robot))==(check_if_robot_visited,get_current_position_of_robot,y_position_of_robot,x_position_of_robot)
END
&
THEORY ListVisibleVariablesX IS
  Inherited_List_VisibleVariables(Machine(Robot))==(?);
  Abstract_List_VisibleVariables(Machine(Robot))==(?);
  External_List_VisibleVariables(Machine(Robot))==(?);
  Expanded_List_VisibleVariables(Machine(Robot))==(?);
  List_VisibleVariables(Machine(Robot))==(?);
  Internal_List_VisibleVariables(Machine(Robot))==(?)
END
&
THEORY ListInvariantX IS
  Gluing_Seen_List_Invariant(Machine(Robot))==(btrue);
  Gluing_List_Invariant(Machine(Robot))==(btrue);
  Expanded_List_Invariant(Machine(Robot))==(btrue);
  Abstract_List_Invariant(Machine(Robot))==(btrue);
  Context_List_Invariant(Machine(Robot))==(btrue);
  List_Invariant(Machine(Robot))==(x_position_of_robot: moving_x_range & y_position_of_robot: moving_y_range & get_current_position_of_robot: maze & check_if_robot_visited: seq(maze))
END
&
THEORY ListAssertionsX IS
  Expanded_List_Assertions(Machine(Robot))==(btrue);
  Abstract_List_Assertions(Machine(Robot))==(btrue);
  Context_List_Assertions(Machine(Robot))==(btrue);
  List_Assertions(Machine(Robot))==(btrue)
END
&
THEORY ListCoverageX IS
  List_Coverage(Machine(Robot))==(btrue)
END
&
THEORY ListExclusivityX IS
  List_Exclusivity(Machine(Robot))==(btrue)
END
&
THEORY ListInitialisationX IS
  Expanded_List_Initialisation(Machine(Robot))==(x_position_of_robot,y_position_of_robot,get_current_position_of_robot,check_if_robot_visited:=1,1,1|->1,[1|->1]);
  Context_List_Initialisation(Machine(Robot))==(skip);
  List_Initialisation(Machine(Robot))==(x_position_of_robot:=1 || y_position_of_robot:=1 || get_current_position_of_robot:=1|->1 || check_if_robot_visited:=[1|->1])
END
&
THEORY ListParametersX IS
  List_Parameters(Machine(Robot))==(?)
END
&
THEORY ListInstanciatedParametersX IS
  List_Instanciated_Parameters(Machine(Robot),Machine(Maze))==(?)
END
&
THEORY ListConstraintsX IS
  List_Context_Constraints(Machine(Robot))==(btrue);
  List_Constraints(Machine(Robot))==(btrue)
END
&
THEORY ListOperationsX IS
  Internal_List_Operations(Machine(Robot))==(Move_To_North,Move_To_South,Move_To_East,Move_To_West,Teleport_To,Get_Current_Position,Found_Exit_Pont,Check_If_Visited,Route_Of_The_Robot_Traversed,Reset_Robot);
  List_Operations(Machine(Robot))==(Move_To_North,Move_To_South,Move_To_East,Move_To_West,Teleport_To,Get_Current_Position,Found_Exit_Pont,Check_If_Visited,Route_Of_The_Robot_Traversed,Reset_Robot)
END
&
THEORY ListInputX IS
  List_Input(Machine(Robot),Move_To_North)==(?);
  List_Input(Machine(Robot),Move_To_South)==(?);
  List_Input(Machine(Robot),Move_To_East)==(?);
  List_Input(Machine(Robot),Move_To_West)==(?);
  List_Input(Machine(Robot),Teleport_To)==(x_position_to_teleport,y_position_to_teleport);
  List_Input(Machine(Robot),Get_Current_Position)==(?);
  List_Input(Machine(Robot),Found_Exit_Pont)==(?);
  List_Input(Machine(Robot),Check_If_Visited)==(x_position_to_check,y_position_to_check);
  List_Input(Machine(Robot),Route_Of_The_Robot_Traversed)==(?);
  List_Input(Machine(Robot),Reset_Robot)==(?)
END
&
THEORY ListOutputX IS
  List_Output(Machine(Robot),Move_To_North)==(direction_output_message);
  List_Output(Machine(Robot),Move_To_South)==(direction_output_message);
  List_Output(Machine(Robot),Move_To_East)==(direction_output_message);
  List_Output(Machine(Robot),Move_To_West)==(direction_output_message);
  List_Output(Machine(Robot),Teleport_To)==(teleport_output_message);
  List_Output(Machine(Robot),Get_Current_Position)==(get_position_output_message);
  List_Output(Machine(Robot),Found_Exit_Pont)==(get_exit_output_message);
  List_Output(Machine(Robot),Check_If_Visited)==(get_visited_square_output_message);
  List_Output(Machine(Robot),Route_Of_The_Robot_Traversed)==(get_robots_route_output_message);
  List_Output(Machine(Robot),Reset_Robot)==(get_reset_output_message)
END
&
THEORY ListHeaderX IS
  List_Header(Machine(Robot),Move_To_North)==(direction_output_message <-- Move_To_North);
  List_Header(Machine(Robot),Move_To_South)==(direction_output_message <-- Move_To_South);
  List_Header(Machine(Robot),Move_To_East)==(direction_output_message <-- Move_To_East);
  List_Header(Machine(Robot),Move_To_West)==(direction_output_message <-- Move_To_West);
  List_Header(Machine(Robot),Teleport_To)==(teleport_output_message <-- Teleport_To(x_position_to_teleport,y_position_to_teleport));
  List_Header(Machine(Robot),Get_Current_Position)==(get_position_output_message <-- Get_Current_Position);
  List_Header(Machine(Robot),Found_Exit_Pont)==(get_exit_output_message <-- Found_Exit_Pont);
  List_Header(Machine(Robot),Check_If_Visited)==(get_visited_square_output_message <-- Check_If_Visited(x_position_to_check,y_position_to_check));
  List_Header(Machine(Robot),Route_Of_The_Robot_Traversed)==(get_robots_route_output_message <-- Route_Of_The_Robot_Traversed);
  List_Header(Machine(Robot),Reset_Robot)==(get_reset_output_message <-- Reset_Robot)
END
&
THEORY ListOperationGuardX END
&
THEORY ListPreconditionX IS
  List_Precondition(Machine(Robot),Move_To_North)==(direction_output_message: TEST_REPORT);
  List_Precondition(Machine(Robot),Move_To_South)==(direction_output_message: TEST_REPORT);
  List_Precondition(Machine(Robot),Move_To_East)==(direction_output_message: TEST_REPORT);
  List_Precondition(Machine(Robot),Move_To_West)==(direction_output_message: TEST_REPORT);
  List_Precondition(Machine(Robot),Teleport_To)==(teleport_output_message: TEST_REPORT & x_position_to_teleport: NAT1 & y_position_to_teleport: NAT1);
  List_Precondition(Machine(Robot),Get_Current_Position)==(btrue);
  List_Precondition(Machine(Robot),Found_Exit_Pont)==(get_exit_output_message: TEST_REPORT);
  List_Precondition(Machine(Robot),Check_If_Visited)==(get_visited_square_output_message: TEST_REPORT & x_position_to_check: 1..7 & y_position_to_check: 1..5);
  List_Precondition(Machine(Robot),Route_Of_The_Robot_Traversed)==(btrue);
  List_Precondition(Machine(Robot),Reset_Robot)==(get_reset_output_message: TEST_REPORT)
END
&
THEORY ListSubstitutionX IS
  Expanded_List_Substitution(Machine(Robot),Reset_Robot)==(get_reset_output_message: TEST_REPORT | x_position_of_robot,y_position_of_robot,get_current_position_of_robot,check_if_robot_visited:=1,1,1|->1,[1|->1] || (x_position_of_robot = 1 & y_position_of_robot = 1 ==> get_reset_output_message:=Reset_Perfomed [] not(x_position_of_robot = 1 & y_position_of_robot = 1) ==> get_reset_output_message:=Reset_Not_Perfomed));
  Expanded_List_Substitution(Machine(Robot),Route_Of_The_Robot_Traversed)==(btrue | get_robots_route_output_message:=ran(front(check_if_robot_visited)));
  Expanded_List_Substitution(Machine(Robot),Check_If_Visited)==(get_visited_square_output_message: TEST_REPORT & x_position_to_check: 1..7 & y_position_to_check: 1..5 | x_position_to_check|->y_position_to_check: maze ==> (x_position_to_check|->y_position_to_check/:internal_walls ==> (x_position_to_check|->y_position_to_check: ran(front(check_if_robot_visited)) ==> get_visited_square_output_message:=Yes [] not(x_position_to_check|->y_position_to_check: ran(front(check_if_robot_visited))) ==> get_visited_square_output_message:=No) [] not(x_position_to_check|->y_position_to_check/:internal_walls) ==> get_visited_square_output_message:=Robot_Hits_The_Internal_Wall) [] not(x_position_to_check|->y_position_to_check: maze) ==> get_visited_square_output_message:=Out_Of_Maze_Boundary);
  Expanded_List_Substitution(Machine(Robot),Found_Exit_Pont)==(get_exit_output_message: TEST_REPORT | x_position_of_robot = 5 & y_position_of_robot = 1 ==> get_exit_output_message:=Yes [] not(x_position_of_robot = 5 & y_position_of_robot = 1) ==> get_exit_output_message:=No);
  Expanded_List_Substitution(Machine(Robot),Get_Current_Position)==(btrue | get_position_output_message:=get_current_position_of_robot);
  Expanded_List_Substitution(Machine(Robot),Teleport_To)==(teleport_output_message: TEST_REPORT & x_position_to_teleport: NAT1 & y_position_to_teleport: NAT1 | size(check_if_robot_visited) = 1 ==> teleport_output_message:=Cannot_Teleport_In_The_First_Move [] not(size(check_if_robot_visited) = 1) ==> (x_position_to_teleport|->y_position_to_teleport/:maze ==> teleport_output_message:=Out_Of_Maze_Boundary [] not(x_position_to_teleport|->y_position_to_teleport/:maze) ==> (x_position_to_teleport|->y_position_to_teleport: internal_walls ==> teleport_output_message:=Robot_Hits_The_Internal_Wall [] not(x_position_to_teleport|->y_position_to_teleport: internal_walls) ==> (x_position_to_teleport = x_position_of_robot & y_position_to_teleport = y_position_of_robot ==> teleport_output_message:=Cannot_Teleport_To_Same_Point [] not(x_position_to_teleport = x_position_of_robot & y_position_to_teleport = y_position_of_robot) ==> get_current_position_of_robot,check_if_robot_visited,x_position_of_robot,y_position_of_robot,teleport_output_message:=x_position_to_teleport|->y_position_to_teleport,check_if_robot_visited<-(x_position_to_teleport|->y_position_to_teleport),x_position_to_teleport,y_position_to_teleport,Teleported_Successfully_To_New_Point))));
  Expanded_List_Substitution(Machine(Robot),Move_To_West)==(direction_output_message: TEST_REPORT | x_position_of_robot-1|->y_position_of_robot/:maze ==> direction_output_message:=Out_Of_Maze_Boundary [] not(x_position_of_robot-1|->y_position_of_robot/:maze) ==> (x_position_of_robot-1|->y_position_of_robot: internal_walls ==> direction_output_message:=Robot_Hits_The_Internal_Wall [] not(x_position_of_robot-1|->y_position_of_robot: internal_walls) ==> get_current_position_of_robot,check_if_robot_visited,x_position_of_robot,direction_output_message:=x_position_of_robot-1|->y_position_of_robot,check_if_robot_visited<-(x_position_of_robot-1|->y_position_of_robot),x_position_of_robot-1,Moved_West_Successfully));
  Expanded_List_Substitution(Machine(Robot),Move_To_East)==(direction_output_message: TEST_REPORT | x_position_of_robot+1|->y_position_of_robot/:maze ==> direction_output_message:=Out_Of_Maze_Boundary [] not(x_position_of_robot+1|->y_position_of_robot/:maze) ==> (x_position_of_robot+1|->y_position_of_robot: internal_walls ==> direction_output_message:=Robot_Hits_The_Internal_Wall [] not(x_position_of_robot+1|->y_position_of_robot: internal_walls) ==> get_current_position_of_robot,check_if_robot_visited,x_position_of_robot,direction_output_message:=x_position_of_robot+1|->y_position_of_robot,check_if_robot_visited<-(x_position_of_robot+1|->y_position_of_robot),x_position_of_robot+1,Moved_East_Successfully));
  Expanded_List_Substitution(Machine(Robot),Move_To_South)==(direction_output_message: TEST_REPORT | x_position_of_robot|->y_position_of_robot-1/:maze ==> direction_output_message:=Out_Of_Maze_Boundary [] not(x_position_of_robot|->y_position_of_robot-1/:maze) ==> (x_position_of_robot|->y_position_of_robot-1: internal_walls ==> direction_output_message:=Robot_Hits_The_Internal_Wall [] not(x_position_of_robot|->y_position_of_robot-1: internal_walls) ==> get_current_position_of_robot,check_if_robot_visited,y_position_of_robot,direction_output_message:=x_position_of_robot|->y_position_of_robot-1,check_if_robot_visited<-(x_position_of_robot|->y_position_of_robot-1),y_position_of_robot-1,Moved_South_Successfully));
  Expanded_List_Substitution(Machine(Robot),Move_To_North)==(direction_output_message: TEST_REPORT | x_position_of_robot|->y_position_of_robot+1/:maze ==> direction_output_message:=Out_Of_Maze_Boundary [] not(x_position_of_robot|->y_position_of_robot+1/:maze) ==> (x_position_of_robot|->y_position_of_robot+1: internal_walls ==> direction_output_message:=Robot_Hits_The_Internal_Wall [] not(x_position_of_robot|->y_position_of_robot+1: internal_walls) ==> get_current_position_of_robot,check_if_robot_visited,y_position_of_robot,direction_output_message:=x_position_of_robot|->y_position_of_robot+1,check_if_robot_visited<-(x_position_of_robot|->y_position_of_robot+1),y_position_of_robot+1,Moved_North_Successfully));
  List_Substitution(Machine(Robot),Move_To_North)==(IF x_position_of_robot|->y_position_of_robot+1/:maze THEN direction_output_message:=Out_Of_Maze_Boundary ELSE IF x_position_of_robot|->y_position_of_robot+1: internal_walls THEN direction_output_message:=Robot_Hits_The_Internal_Wall ELSE get_current_position_of_robot:=x_position_of_robot|->y_position_of_robot+1 || check_if_robot_visited:=check_if_robot_visited<-(x_position_of_robot|->y_position_of_robot+1) || y_position_of_robot:=y_position_of_robot+1 || direction_output_message:=Moved_North_Successfully END END);
  List_Substitution(Machine(Robot),Move_To_South)==(IF x_position_of_robot|->y_position_of_robot-1/:maze THEN direction_output_message:=Out_Of_Maze_Boundary ELSE IF x_position_of_robot|->y_position_of_robot-1: internal_walls THEN direction_output_message:=Robot_Hits_The_Internal_Wall ELSE get_current_position_of_robot:=x_position_of_robot|->y_position_of_robot-1 || check_if_robot_visited:=check_if_robot_visited<-(x_position_of_robot|->y_position_of_robot-1) || y_position_of_robot:=y_position_of_robot-1 || direction_output_message:=Moved_South_Successfully END END);
  List_Substitution(Machine(Robot),Move_To_East)==(IF x_position_of_robot+1|->y_position_of_robot/:maze THEN direction_output_message:=Out_Of_Maze_Boundary ELSE IF x_position_of_robot+1|->y_position_of_robot: internal_walls THEN direction_output_message:=Robot_Hits_The_Internal_Wall ELSE get_current_position_of_robot:=x_position_of_robot+1|->y_position_of_robot || check_if_robot_visited:=check_if_robot_visited<-(x_position_of_robot+1|->y_position_of_robot) || x_position_of_robot:=x_position_of_robot+1 || direction_output_message:=Moved_East_Successfully END END);
  List_Substitution(Machine(Robot),Move_To_West)==(IF x_position_of_robot-1|->y_position_of_robot/:maze THEN direction_output_message:=Out_Of_Maze_Boundary ELSE IF x_position_of_robot-1|->y_position_of_robot: internal_walls THEN direction_output_message:=Robot_Hits_The_Internal_Wall ELSE get_current_position_of_robot:=x_position_of_robot-1|->y_position_of_robot || check_if_robot_visited:=check_if_robot_visited<-(x_position_of_robot-1|->y_position_of_robot) || x_position_of_robot:=x_position_of_robot-1 || direction_output_message:=Moved_West_Successfully END END);
  List_Substitution(Machine(Robot),Teleport_To)==(IF size(check_if_robot_visited) = 1 THEN teleport_output_message:=Cannot_Teleport_In_The_First_Move ELSE IF x_position_to_teleport|->y_position_to_teleport/:maze THEN teleport_output_message:=Out_Of_Maze_Boundary ELSE IF x_position_to_teleport|->y_position_to_teleport: internal_walls THEN teleport_output_message:=Robot_Hits_The_Internal_Wall ELSE IF x_position_to_teleport = x_position_of_robot & y_position_to_teleport = y_position_of_robot THEN teleport_output_message:=Cannot_Teleport_To_Same_Point ELSE get_current_position_of_robot:=x_position_to_teleport|->y_position_to_teleport || check_if_robot_visited:=check_if_robot_visited<-(x_position_to_teleport|->y_position_to_teleport) || x_position_of_robot:=x_position_to_teleport || y_position_of_robot:=y_position_to_teleport || teleport_output_message:=Teleported_Successfully_To_New_Point END END END END);
  List_Substitution(Machine(Robot),Get_Current_Position)==(get_position_output_message:=get_current_position_of_robot);
  List_Substitution(Machine(Robot),Found_Exit_Pont)==(IF x_position_of_robot = 5 & y_position_of_robot = 1 THEN get_exit_output_message:=Yes ELSE get_exit_output_message:=No END);
  List_Substitution(Machine(Robot),Check_If_Visited)==(IF x_position_to_check|->y_position_to_check: maze THEN IF x_position_to_check|->y_position_to_check/:internal_walls THEN IF x_position_to_check|->y_position_to_check: ran(front(check_if_robot_visited)) THEN get_visited_square_output_message:=Yes ELSE get_visited_square_output_message:=No END ELSE get_visited_square_output_message:=Robot_Hits_The_Internal_Wall END ELSE get_visited_square_output_message:=Out_Of_Maze_Boundary END);
  List_Substitution(Machine(Robot),Route_Of_The_Robot_Traversed)==(get_robots_route_output_message:=ran(front(check_if_robot_visited)));
  List_Substitution(Machine(Robot),Reset_Robot)==(x_position_of_robot:=1 || y_position_of_robot:=1 || get_current_position_of_robot:=1|->1 || check_if_robot_visited:=[1|->1] || IF x_position_of_robot = 1 & y_position_of_robot = 1 THEN get_reset_output_message:=Reset_Perfomed ELSE get_reset_output_message:=Reset_Not_Perfomed END)
END
&
THEORY ListConstantsX IS
  List_Valuable_Constants(Machine(Robot))==(?);
  Inherited_List_Constants(Machine(Robot))==(?);
  List_Constants(Machine(Robot))==(?)
END
&
THEORY ListSetsX IS
  Set_Definition(Machine(Robot),TEST_REPORT)==({Moved_North_Successfully,Moved_South_Successfully,Moved_East_Successfully,Moved_West_Successfully,Teleported_Successfully_To_New_Point,Cannot_Teleport_In_The_First_Move,Cannot_Teleport_To_Same_Point,Robot_Hits_The_Internal_Wall,Out_Of_Maze_Boundary,Reset_Perfomed,Reset_Not_Perfomed,Yes,No});
  Context_List_Enumerated(Machine(Robot))==(?);
  Context_List_Defered(Machine(Robot))==(?);
  Context_List_Sets(Machine(Robot))==(?);
  List_Valuable_Sets(Machine(Robot))==(?);
  Inherited_List_Enumerated(Machine(Robot))==(?);
  Inherited_List_Defered(Machine(Robot))==(?);
  Inherited_List_Sets(Machine(Robot))==(?);
  List_Enumerated(Machine(Robot))==(TEST_REPORT);
  List_Defered(Machine(Robot))==(?);
  List_Sets(Machine(Robot))==(TEST_REPORT)
END
&
THEORY ListHiddenConstantsX IS
  Abstract_List_HiddenConstants(Machine(Robot))==(?);
  Expanded_List_HiddenConstants(Machine(Robot))==(?);
  List_HiddenConstants(Machine(Robot))==(?);
  External_List_HiddenConstants(Machine(Robot))==(?)
END
&
THEORY ListPropertiesX IS
  Abstract_List_Properties(Machine(Robot))==(btrue);
  Context_List_Properties(Machine(Robot))==(moving_x_range <: NAT1 & moving_x_range = 1..7 & moving_y_range <: NAT1 & moving_y_range = 1..5 & internal_walls: moving_x_range <-> moving_y_range & internal_walls = {2|->1,6|->1,4|->2,6|->2,1|->3,2|->3,3|->3,4|->3,4|->4,6|->4,7|->4,2|->5} & maze: moving_x_range <-> moving_y_range & maze = moving_x_range*moving_y_range & entry_point: moving_x_range <-> moving_y_range & entry_point = {1|->1} & exit_point: moving_x_range <-> moving_y_range & exit_point = {1|->5});
  Inherited_List_Properties(Machine(Robot))==(btrue);
  List_Properties(Machine(Robot))==(TEST_REPORT: FIN(INTEGER) & not(TEST_REPORT = {}))
END
&
THEORY ListSeenInfoX IS
  Seen_Internal_List_Operations(Machine(Robot),Machine(Maze))==(?);
  Seen_Context_List_Enumerated(Machine(Robot))==(?);
  Seen_Context_List_Invariant(Machine(Robot))==(btrue);
  Seen_Context_List_Assertions(Machine(Robot))==(btrue);
  Seen_Context_List_Properties(Machine(Robot))==(btrue);
  Seen_List_Constraints(Machine(Robot))==(btrue);
  Seen_List_Operations(Machine(Robot),Machine(Maze))==(?);
  Seen_Expanded_List_Invariant(Machine(Robot),Machine(Maze))==(btrue)
END
&
THEORY ListANYVarX IS
  List_ANY_Var(Machine(Robot),Move_To_North)==(?);
  List_ANY_Var(Machine(Robot),Move_To_South)==(?);
  List_ANY_Var(Machine(Robot),Move_To_East)==(?);
  List_ANY_Var(Machine(Robot),Move_To_West)==(?);
  List_ANY_Var(Machine(Robot),Teleport_To)==(?);
  List_ANY_Var(Machine(Robot),Get_Current_Position)==(?);
  List_ANY_Var(Machine(Robot),Found_Exit_Pont)==(?);
  List_ANY_Var(Machine(Robot),Check_If_Visited)==(?);
  List_ANY_Var(Machine(Robot),Route_Of_The_Robot_Traversed)==(?);
  List_ANY_Var(Machine(Robot),Reset_Robot)==(?)
END
&
THEORY ListOfIdsX IS
  List_Of_Ids(Machine(Robot)) == (TEST_REPORT,Moved_North_Successfully,Moved_South_Successfully,Moved_East_Successfully,Moved_West_Successfully,Teleported_Successfully_To_New_Point,Cannot_Teleport_In_The_First_Move,Cannot_Teleport_To_Same_Point,Robot_Hits_The_Internal_Wall,Out_Of_Maze_Boundary,Reset_Perfomed,Reset_Not_Perfomed,Yes,No | ? | check_if_robot_visited,get_current_position_of_robot,y_position_of_robot,x_position_of_robot | ? | Move_To_North,Move_To_South,Move_To_East,Move_To_West,Teleport_To,Get_Current_Position,Found_Exit_Pont,Check_If_Visited,Route_Of_The_Robot_Traversed,Reset_Robot | ? | seen(Machine(Maze)) | ? | Robot);
  List_Of_HiddenCst_Ids(Machine(Robot)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Robot)) == (?);
  List_Of_VisibleVar_Ids(Machine(Robot)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Robot)) == (?: ?);
  List_Of_Ids(Machine(Maze)) == (moving_x_range,moving_y_range,internal_walls,exit_point,entry_point,maze | ? | ? | ? | ? | ? | ? | ? | Maze);
  List_Of_HiddenCst_Ids(Machine(Maze)) == (? | ?);
  List_Of_VisibleCst_Ids(Machine(Maze)) == (moving_x_range,moving_y_range,internal_walls,exit_point,entry_point,maze);
  List_Of_VisibleVar_Ids(Machine(Maze)) == (? | ?);
  List_Of_Ids_SeenBNU(Machine(Maze)) == (?: ?)
END
&
THEORY SetsEnvX IS
  Sets(Machine(Robot)) == (Type(TEST_REPORT) == Cst(SetOf(etype(TEST_REPORT,0,12))))
END
&
THEORY ConstantsEnvX IS
  Constants(Machine(Robot)) == (Type(Moved_North_Successfully) == Cst(etype(TEST_REPORT,0,12));Type(Moved_South_Successfully) == Cst(etype(TEST_REPORT,0,12));Type(Moved_East_Successfully) == Cst(etype(TEST_REPORT,0,12));Type(Moved_West_Successfully) == Cst(etype(TEST_REPORT,0,12));Type(Teleported_Successfully_To_New_Point) == Cst(etype(TEST_REPORT,0,12));Type(Cannot_Teleport_In_The_First_Move) == Cst(etype(TEST_REPORT,0,12));Type(Cannot_Teleport_To_Same_Point) == Cst(etype(TEST_REPORT,0,12));Type(Robot_Hits_The_Internal_Wall) == Cst(etype(TEST_REPORT,0,12));Type(Out_Of_Maze_Boundary) == Cst(etype(TEST_REPORT,0,12));Type(Reset_Perfomed) == Cst(etype(TEST_REPORT,0,12));Type(Reset_Not_Perfomed) == Cst(etype(TEST_REPORT,0,12));Type(Yes) == Cst(etype(TEST_REPORT,0,12));Type(No) == Cst(etype(TEST_REPORT,0,12)))
END
&
THEORY VariablesEnvX IS
  Variables(Machine(Robot)) == (Type(check_if_robot_visited) == Mvl(SetOf(btype(INTEGER,?,?)*(btype(INTEGER,?,?)*btype(INTEGER,?,?))));Type(get_current_position_of_robot) == Mvl(btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(y_position_of_robot) == Mvl(btype(INTEGER,?,?));Type(x_position_of_robot) == Mvl(btype(INTEGER,?,?)))
END
&
THEORY OperationsEnvX IS
  Operations(Machine(Robot)) == (Type(Reset_Robot) == Cst(etype(TEST_REPORT,?,?),No_type);Type(Route_Of_The_Robot_Traversed) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),No_type);Type(Check_If_Visited) == Cst(etype(TEST_REPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(Found_Exit_Pont) == Cst(etype(TEST_REPORT,?,?),No_type);Type(Get_Current_Position) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type);Type(Teleport_To) == Cst(etype(TEST_REPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(Move_To_West) == Cst(etype(TEST_REPORT,?,?),No_type);Type(Move_To_East) == Cst(etype(TEST_REPORT,?,?),No_type);Type(Move_To_South) == Cst(etype(TEST_REPORT,?,?),No_type);Type(Move_To_North) == Cst(etype(TEST_REPORT,?,?),No_type));
  Observers(Machine(Robot)) == (Type(Route_Of_The_Robot_Traversed) == Cst(SetOf(btype(INTEGER,?,?)*btype(INTEGER,?,?)),No_type);Type(Check_If_Visited) == Cst(etype(TEST_REPORT,?,?),btype(INTEGER,?,?)*btype(INTEGER,?,?));Type(Found_Exit_Pont) == Cst(etype(TEST_REPORT,?,?),No_type);Type(Get_Current_Position) == Cst(btype(INTEGER,?,?)*btype(INTEGER,?,?),No_type))
END
&
THEORY TCIntRdX IS
  predB0 == OK;
  extended_sees == KO;
  B0check_tab == KO;
  local_op == OK;
  abstract_constants_visible_in_values == KO;
  project_type == SOFTWARE_TYPE;
  event_b_deadlockfreeness == KO;
  variant_clause_mandatory == KO;
  event_b_coverage == KO;
  event_b_exclusivity == KO;
  genFeasibilityPO == KO
END
)
