Installation
    Java with flyway
        brew install flyway
        touch flyway.conf
        mkdir sql
        touch V1__name_of_migration_file.sql
        <!-- remember: the name must be like above convetion for flyway -->
        insert content
        then run flyway info to test without executing into to real database
    Node
        npm init -y
        npm install node-pg-migrate pg
        update package.json for migrate script
        run DATABASE_URL=... npm run migrate up/down
