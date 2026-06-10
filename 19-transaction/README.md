whenever a BEGIN keyword, postgresql create a separate workspace for the user to run that query. Think of it as atomicity of multi-thread in Java
    COMMIT is the keyword to confirm and execute the query in the workspace and merge the data back to the main data pool
    ROLLBACK is the keyword to cancel and delete the query in the workspace and back to the main data pool
    