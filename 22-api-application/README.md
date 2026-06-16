This project is implemented to practice the concept of rest api application with database connection. How to avoid some following mistakes: 

* Direct query inside the route => cause sql injection
* Hard code database connection inside the route => cause coupling between app and database => use repository pattern
* Hard code database connection configuration inside the repo => cause coupling between app and database config => use environment variables

Use Prepare statement (PostgresSQL feature) to prevent sql injection
