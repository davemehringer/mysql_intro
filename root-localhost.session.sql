-- @block
CREATE TABLE Users(
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL UNIQUE,
    bio TEXT,
    country CHAR(2)
);

-- @BLOCK
INSERT INTO Users (email, bio, country)
VALUES (
    'hello@world.com',
    'I love strangers',
    'US'
);

-- @BLOCK
INSERT INTO Users (
    email, bio, country
)
VALUES
('hi@world.com', 'foo', 'US'),
('hola@munda.com', 'bar', 'MX'),
('bonjour@monde.com', 'bax', 'FR');



-- @BLOCK
SELECT * FROM Users;

-- @BLOCK
SELECT email, id FROM Users;

-- @BLOCK
SELECT email, id FROM Users LIMIT 2;
-- @BLOCK
SELECT email, id FROM Users ORDER BY id LIMIT 2

-- @BLOCK
SELECT email, id FROM Users WHERE country='US' ORDER BY id LIMIT 2

-- @BLOCK
CREATE index email_index ON Users(email);

-- @BLOCK
CREATE TABLE Rooms (
    id INT AUTO_INCREMENT,
    street VARCHAR(255),
    owner_id INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (owner_id) REFERENCES Users(id)
);

-- @BLOCK
INSERT INTO Rooms (owner_id, street)
VALUES 
(1, 'Main St'),
(1, 'Sequoia Rd.'),
(1, 'James Ave'),
(1, 'Springfiled Pl')

-- @BLOCK
SELECT * FROM Users
INNER JOIN Rooms 
ON Rooms.owner_id = Users.id;

-- @BLOCK
SELECT * FROM Users
LEFT JOIN Rooms 
ON Rooms.owner_id = Users.id;

-- @BLOCK
SELECT * FROM Users
RIGHT JOIN Rooms 
ON Rooms.owner_id = Users.id;

-- @BLOCK
CREATE TABLE Bookings (
    id INT AUTO_INCREMENT,
    guest_id INT NOT NULL,
    room_id INT NOT NULL,
    check_in DATETIME NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (guest_id) REFERENCES Users(id),
    FOREIGN KEY (room_id) REFERENCES Rooms(id)
);