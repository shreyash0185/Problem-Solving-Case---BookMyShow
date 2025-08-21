
-- BookMyShow SQL Case Study

-- ========================
-- Theatre Table
-- ========================
CREATE TABLE Theatre (
    theatre_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    contact_number VARCHAR(15)
);

-- ========================
-- Screen Table
-- ========================
CREATE TABLE Screen (
    screen_id INT AUTO_INCREMENT PRIMARY KEY,
    theatre_id INT,
    screen_name VARCHAR(50),
    screen_type VARCHAR(50),
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id)
);

-- ========================
-- Movie Table
-- ========================
CREATE TABLE Movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    language VARCHAR(50),
    duration INT,
    censor_rating VARCHAR(10)
);

-- ========================
-- Format Table
-- ========================
CREATE TABLE Format (
    format_id INT AUTO_INCREMENT PRIMARY KEY,
    format_name VARCHAR(50) NOT NULL
);

-- ========================
-- Show Table
-- ========================
CREATE TABLE Show (
    show_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_id INT,
    theatre_id INT,
    screen_id INT,
    format_id INT,
    show_date DATE,
    show_time TIME,
    price DECIMAL(10,2),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (theatre_id) REFERENCES Theatre(theatre_id),
    FOREIGN KEY (screen_id) REFERENCES Screen(screen_id),
    FOREIGN KEY (format_id) REFERENCES Format(format_id)
);

-- ========================
-- Sample Inserts
-- ========================
-- Theatre
INSERT INTO Theatre (name, address, contact_number)
VALUES ('PVR: Nexus Forum', 'Bengaluru, Karnataka', '9876543210');

-- Screens
INSERT INTO Screen (theatre_id, screen_name, screen_type)
VALUES (1, 'Screen 1', 'Standard'),
       (1, 'Screen 2', 'IMAX');

-- Movies
INSERT INTO Movie (title, language, duration, censor_rating)
VALUES ('Dasara', 'Telugu', 150, 'UA'),
       ('Kisi Ka Bhai Kisi Ki Jaan', 'Hindi', 160, 'UA'),
       ('Avatar: The Way of Water', 'English', 190, 'UA');

-- Format
INSERT INTO Format (format_name)
VALUES ('2D'), ('3D'), ('4K Dolby 7.1');

-- Shows
INSERT INTO Show (movie_id, theatre_id, screen_id, format_id, show_date, show_time, price)
VALUES 
(1, 1, 1, 1, '2025-04-26', '12:15:00', 250.00),
(2, 1, 1, 3, '2025-04-26', '16:10:00', 300.00),
(2, 1, 1, 3, '2025-04-26', '20:20:00', 320.00),
(3, 1, 2, 2, '2025-04-26', '19:20:00', 350.00);

-- ========================
-- Query P2: List shows by theatre & date
-- ========================
SELECT 
    m.title AS movie_name,
    sh.show_time,
    f.format_name,
    sc.screen_name,
    sh.price
FROM Show sh
JOIN Movie m ON sh.movie_id = m.movie_id
JOIN Theatre t ON sh.theatre_id = t.theatre_id
JOIN Screen sc ON sh.screen_id = sc.screen_id
JOIN Format f ON sh.format_id = f.format_id
WHERE t.name = 'PVR: Nexus Forum'
  AND sh.show_date = '2025-04-26'
ORDER BY m.title, sh.show_time;
