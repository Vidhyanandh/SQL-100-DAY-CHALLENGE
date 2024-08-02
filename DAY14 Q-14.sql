DROP TABLE IF EXISTS Users;
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    mail VARCHAR(100)
);

INSERT INTO Users (user_id, name, mail) VALUES
(31, 'Sam', 'sam.123@ymail.com'),
(32, 'Sam', 'sam-456@ymail.com'),
(33, 'Sam', 'sam_789@ymail.com'),
(34, 'Samantha', 'samantha@ymail.com'),
(35, 'Samantha', 'samantha+extra@ymail.com'),
(36, 'Samuel', 'samuel@ymail.com'),
(37, 'Sammy', 'sammy@ymail.com'),
(38, 'Sara', 'sara@ymail.com'),
(39, 'Sarah', 'sarah@ymail.com'),
(40, 'Samuel', 'samuel+test@gmail.com'),
(41, 'Sandy', 'sandy@ymail.com'),
(42, 'Sandi', 'sandi@ymail.com'),
(43, 'Sandra', 'sandra@ymail.com'),
(44, 'Steve', 'steve@ymail.com'),
(45, 'Steven', 'steven@ymail.com'),
(46, 'Stephanie', 'stephanie@ymail.com'),
(47, 'Stefan', 'stefan@ymail.com'),
(48, 'Stella', 'stella@ymail.com'),
(49, 'Stanley', 'stanley@ymail.com'),
(50, 'Stacy', 'stacy@ymail.com'),
(51, 'Stan', 'stan@ymail.com'),
(52, 'Stacey', 'stacey@ymail.com'),
(53, 'Stella', 'stella123@ymail.com'),
(54, 'Steve', 'steve123@gmail.com'),
(55, 'Susan', 'susan@ymail.com'),
(56, 'Sullivan', 'sullivan@ymail.com'),
(57, 'Sylvia', 'sylvia@ymail.com'),
(58, 'Sybil', 'sybil@ymail.com'),
(59, 'Sylvester', 'sylvester@ymail.com'),
(60, 'Seth', 'seth@ymail.com'),
(61, 'Selena', 'selena@ymail.com'),
(62, 'Sierra', 'sierra@ymail.com'),
(63, 'Simon', 'simon@ymail.com'),
(64, 'Simeon', 'simeon@ymail.com'),
(65, 'Sasha', 'sasha@ymail.com'),
(66, 'Silas', 'silas@ymail.com'),
(67, 'Spencer', 'spencer@ymail.com'),
(68, 'Sage', 'sage@ymail.com'),
(69, 'Sonia', 'sonia@ymail.com'),
(70, 'Solomon', 'solomon@ymail.com'),
(71, 'Sofia', 'sofia@ymail.com'),
(72, 'Sophia', 'sophia@ymail.com'),
(73, 'Sophie', 'sophie@ymail.com'),
(74, 'Sonya', 'sonya@ymail.com'),
(75, 'Sondra', 'sondra@ymail.com'),
(76, 'Shane', 'shane@ymail.com'),
(77, 'Shawn', 'shawn@ymail.com'),
(78, 'Shirley', 'shirley@ymail.com'),
(79, 'Shari', 'shari@ymail.com'),
(80, 'Shaun', 'shaun@ymail.com');


SELECT *
FROM Users
WHERE mail REGEXP '^[a-z]+@[a-zA-Z0-9]+\\.[a-z]{2,}$';