# ADVANCED TOPICS 

## TYPES OF MYSQL VARIABLES 

1. Local Variables
2. Session Variables
3. Global Variables 
4. User-Defined vs System Variables


## LOCAL VARIABLES

A variable that is visible only in the **BEGIN - END** block in which it was created. 

*DECLARE* is a keyword that can be used when creating **local** variables only. 

## SESSION VARIABLES

A series of information exchange interactions, or a dialogue, between a computer and a user. 

Session Variable is a variable that exists only for the session in which you are operating. 

```
--- @ -> indicates we are creating a MYSQL session variable.                            
SET @session_variable
```

## GLOBAL VARIABLES

Global variables apply to all connections related to a specific server. 

Syntax: 
```
SET GLOBAL var_name = value;
```

Or 
```
SET @@global.var_name = value;
```

You can't set just any variable as global.

A specific group of *pre-defined* variables in MySQL is suitable for this job. They are called _*system variables*_.

Examples:
    * .max_connections() : Indicates the *maximum number of connections.* to a server that can be established at a certain point in time. 
    * .max_join_size() : Sets the *maximum memory space* allocated for the joins created by a certain connection. 


## USER-DEFINED VS SYSTEM VARIABLES

### USER-DEFINED

Variables that can be set by the user manually. 

### SYSTEM

Variables that are pre-defined on the system, the MYSQL server.
