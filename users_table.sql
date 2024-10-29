-- Create the users table if it doesn't exist
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    bio TEXT,
    profile_image VARCHAR(255),
    location VARCHAR(100),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Add indexes for performance on commonly queried fields if they don't exist
DO $$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='users' AND indexname='idx_users_username') THEN
        CREATE INDEX idx_users_username ON users (username);
    END IF;
    
    IF NOT EXISTS (SELECT 1 FROM pg_indexes WHERE tablename='users' AND indexname='idx_users_email') THEN
        CREATE INDEX idx_users_email ON users (email);
    END IF;
END $$;

-- Insert dummy data into the users table if the data doesn't already exist
INSERT INTO users (username, email, password_hash, bio, profile_image, location)
VALUES 
('john_doe', 'john@example.com', 'hashed_password_1', 'Hello, I am John!', 'path/to/john_image.jpg', 'New York'),
('jane_smith', 'jane@example.com', 'hashed_password_2', 'Hey there! I love coding.', 'path/to/jane_image.jpg', 'San Francisco'),
('mike_jones', 'mike@example.com', 'hashed_password_3', 'Coffee lover and tech enthusiast.', 'path/to/mike_image.jpg', 'Chicago'),
('sarah_connor', 'sarah@example.com', 'hashed_password_4', 'Future is now!', 'path/to/sarah_image.jpg', 'Los Angeles'),
('linda_white', 'linda@example.com', 'hashed_password_5', 'Travel enthusiast and foodie.', 'path/to/linda_image.jpg', 'Miami')
ON CONFLICT (username) DO NOTHING; -- Prevents duplicate entries for usernames