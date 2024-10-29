CREATE TABLE IF NOT EXISTS test_table (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL
);

INSERT INTO test_table (username) VALUES
('user1'),
('user2'),
('alice123'),
('bob_the_builder'),
('charlie.brown'),
('david_smith'),
('eve.online'),
('frankie35'),
('grace.kelly'),
('hannah_montana'),
('ian_somerhalder'),
('julia.james'),
('karen.miller'),
('lisa_simpson'),
('mike_tyson');