DROP TABLE IF EXISTS users;

CREATE TABLE users
(
    id SERIAL PRIMARY KEY,
    username VARCHAR(50)
);

INSERT INTO users (username) VALUES 
('khang'),
('simson317'),
('pororopipipi'),
('mrmaybe'),
('simon334');

DROP TABLE IF EXISTS photos;

CREATE TABLE photos (
    id SERIAL PRIMARY KEY,
    url VARCHAR(200),
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
    -- constraint fk_user foreign key (user_id) references users(id)
);

INSERT INTO photos (url, user_id) VALUES 
('http://url-1', 1),
('http://url-2', 1),
('http://url-3', 2),
('http://url-4', 3),
('http://url-5', 4),
('http://url-6', 5),
('http://url-7', 5);

SELECT * FROM users;

SELECT * FROM photos;
