DROP TABLE IF EXISTS game_room CASCADE;
DROP TABLE IF EXISTS game CASCADE;
DROP TABLE IF EXISTS history CASCADE;
DROP TABLE IF EXISTS room CASCADE;
DROP TABLE IF EXISTS users CASCADE;

CREATE TABLE history (
    id SERIAL PRIMARY KEY NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NOT NULL,
    winners VARCHAR(255) NOT NULL
);


CREATE TABLE game (
    id SERIAL PRIMARY KEY NOT NULL,
    game_name VARCHAR(255) NOT NULL,
    game_history_id INTEGER REFERENCES history(id) ON DELETE CASCADE
);

CREATE TABLE room (
    id SERIAL PRIMARY KEY NOT NULL,
    room_name VARCHAR(255) NOT NULL,
    room_password  VARCHAR(255)  
);


CREATE TABLE game_room (
game_to_room_id INTEGER REFERENCES game(id) ON DELETE CASCADE,
room_to_game_id INTEGER REFERENCES room(id) ON DELETE CASCADE
);








CREATE TABLE users (
    id SERIAL PRIMARY KEY NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    pass VARCHAR(255) NOT NULL, 
    token VARCHAR(255) NOT NULL,
    room_id INTEGER REFERENCES room(id) ON DELETE CASCADE,
    game_id INTEGER REFERENCES game(id) ON DELETE CASCADE 
);
