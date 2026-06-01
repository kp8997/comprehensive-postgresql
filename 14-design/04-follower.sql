CREATE TABLE followers (
    leader_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    follower_id INTEGER REFERENCES users(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (leader_id, follower_id)
);

-- CREATE INDEX "idx_leader_id" ON followers(leader_id);
-- CREATE INDEX "idx_follower_id" ON followers(follower_id);
