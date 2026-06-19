This project is implemented to practice the concept of rest api application with database connection. How to avoid some following mistakes: 

* Direct query inside the route => cause sql injection
* Hard code database connection inside the route => cause coupling between app and database => use repository pattern
* Hard code database connection configuration inside the repo => cause coupling between app and database config => use environment variables

Use Prepare statement (PostgresSQL feature) to prevent sql injection

We also implement the testing files (folder /tests) to verify the correctness of the application.

Leverage the schema feature of postgresql to isolate the test files, create, clean them up. We can understand a schema like a folder inside a database. By default there is a schema named public.
    CREATE SCHEMA test;

    CREATE TABLE test.users (
        id SERIAL PRIMARY KEY,
        username VARCHAR
    );

    INSERT INTO test.users (username, bio) VALUES ('test', 'bio test');

    SELECT * FROM test.users;
    -- Result: table test.users does not exist
        
    SHOW search_path;

Step for isolate the schema for testing
    Randomly generating a role name to connect to PG
    Connect to PG as usual (use normal account)
    Create a new role
    Create a new schema
    Disconnect from PG
    Run migration for the new schema
    Connect to PG as new created role
