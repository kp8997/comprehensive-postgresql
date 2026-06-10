whenever a BEGIN keyword, postgresql create a separate workspace for the user to run that query. Think of it as atomicity of multi-thread in Java
    COMMIT is the keyword to confirm and execute the query in the workspace and merge the data back to the main data pool
    ROLLBACK is the keyword to cancel and delete the query in the workspace and back to the main data pool

If any issue happen with the connection in the middle of BEGIN transaction, the query will be rollback automatically.
When the trasaction falls into aborted state, the query will be ROLLBACK explicily.

State of Transaction:
    1. idle: Before BEGIN or START
    2. active: After BEGIN and before COMMIT or ROLLBACK
    3. aborted: when a query/ command is failed in there 
    4. commit: Successfully execute to the end of block of code. Merge data to the main pool
    5. rollback: Clear space and discard all the changes to the main data pool
    