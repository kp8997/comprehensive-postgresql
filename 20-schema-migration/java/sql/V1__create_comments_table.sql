-- run this before doing migration
-- createdb comprehensive-postgresql-social-network 

CREATE TABLE comments (
    id SERIAL PRIMARY KEY,
    contents VARCHAR(240) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
);
