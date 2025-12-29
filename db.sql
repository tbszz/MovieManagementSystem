CREATE DATABASE IF NOT EXISTS movie_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE movie_db;

CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role VARCHAR(20) DEFAULT 'user'
);

CREATE TABLE IF NOT EXISTS t_category (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS t_movie (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    director VARCHAR(100),
    actors VARCHAR(255),
    description TEXT,
    release_date DATE,
    cover_image VARCHAR(255),
    file_path VARCHAR(255),
    category_id INT,
    rating DOUBLE DEFAULT 0.0,
    rating_count INT DEFAULT 0,
    is_hot BOOLEAN DEFAULT FALSE,
    region VARCHAR(100),
    language VARCHAR(100),
    episode_count INT DEFAULT 0,
    update_time DATETIME,
    FOREIGN KEY (category_id) REFERENCES t_category(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS t_comment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    create_date DATETIME,
    user_id INT,
    movie_id INT,
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES t_movie(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS t_carousel (
    id INT AUTO_INCREMENT PRIMARY KEY,
    image_url VARCHAR(255) NOT NULL,
    target_url VARCHAR(255),
    title VARCHAR(255),
    sort_order INT DEFAULT 0,
    is_visible BOOLEAN DEFAULT TRUE
);

CREATE TABLE IF NOT EXISTS t_viewing_record (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    movie_id INT,
    start_time DATETIME,
    duration BIGINT, -- Duration in seconds
    FOREIGN KEY (user_id) REFERENCES user(id) ON DELETE CASCADE,
    FOREIGN KEY (movie_id) REFERENCES t_movie(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS t_news (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    content TEXT,
    publish_date DATETIME
);

-- Insert default admin user
INSERT INTO user (username, password) VALUES ('admin', 'admin123'); -- You may want to hash this if using md5
