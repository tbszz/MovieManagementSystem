SET FOREIGN_KEY_CHECKS = 0;

-- Clear existing data
TRUNCATE TABLE t_comment;
TRUNCATE TABLE t_viewing_record;
TRUNCATE TABLE t_movie;
TRUNCATE TABLE t_carousel;
TRUNCATE TABLE t_category;
TRUNCATE TABLE t_news;

-- Insert Categories
INSERT INTO t_category (id, name) VALUES (1, 'Drama');
INSERT INTO t_category (id, name) VALUES (2, 'Crime');
INSERT INTO t_category (id, name) VALUES (3, 'Action');
INSERT INTO t_category (id, name) VALUES (4, 'Sci-Fi');
INSERT INTO t_category (id, name) VALUES (5, 'Romance');
INSERT INTO t_category (id, name) VALUES (6, 'Animation');
INSERT INTO t_category (id, name) VALUES (7, 'Thriller');
INSERT INTO t_category (id, name) VALUES (8, 'Fantasy');
INSERT INTO t_category (id, name) VALUES (9, 'Adventure');
INSERT INTO t_category (id, name) VALUES (10, 'Comedy');

-- Insert Movies
-- 1. The Shawshank Redemption
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(1, 'The Shawshank Redemption', 'Frank Darabont', 'Tim Robbins, Morgan Freeman', 'Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency. Andy Dufresne (Tim Robbins) is a mild-mannered banker wrongly convicted of murder in the 1940s and sentenced to life in Shawshank State Penitentiary. He is befriended by Red (Morgan Freeman), a fellow inmate who knows the ropes.', '1994-09-22', 'uploads/covers/poster_1.jpg', '', 1, 9.3, 2000, 1);

-- 2. The Godfather
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(2, 'The Godfather', 'Francis Ford Coppola', 'Marlon Brando, Al Pacino', 'The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son. The story, spanning from 1945 to 1955, chronicles the Corleone family under patriarch Vito Corleone, focusing on the transformation of his youngest son, Michael, from reluctant family outsider to ruthless mafia boss.', '1972-03-24', 'uploads/covers/poster_2.jpg', '', 2, 9.2, 1800, 1);

-- 3. The Dark Knight
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(3, 'The Dark Knight', 'Christopher Nolan', 'Christian Bale, Heath Ledger', 'When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice. With the help of allies Lt. Jim Gordon and DA Harvey Dent, Batman creates an unlikely alliance to dismantle the criminal organizations that plague the city streets.', '2008-07-18', 'uploads/covers/poster_3.jpg', '', 3, 9.0, 2500, 1);

-- 4. Pulp Fiction
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(4, 'Pulp Fiction', 'Quentin Tarantino', 'John Travolta, Uma Thurman', 'The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption. Known for its eclectic dialogue, ironic mix of humor and violence, nonlinear storyline, and a host of cinematic allusions and pop culture references.', '1994-10-14', 'uploads/covers/poster_4.jpg', '', 2, 8.9, 1900, 1);

-- 5. Inception
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(5, 'Inception', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt', 'A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O. Dom Cobb is an industrial spy who extracts information from the subconscious of his targets while they dream. He is offered a chance to regain his old life as payment for a task considered to be impossible: "inception", the implantation of another person''s idea into a target''s subconscious.', '2010-07-16', 'uploads/covers/poster_5.jpg', '', 4, 8.8, 2200, 1);

-- 6. Forrest Gump
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(6, 'Forrest Gump', 'Robert Zemeckis', 'Tom Hanks, Robin Wright', 'The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate and other historical events unfold from the perspective of an Alabama man with an IQ of 75, whose only desire is to be reunited with his childhood sweetheart. Forrest Gump is a simple man with a low I.Q. but good intentions. He is running through childhood with his best and only friend Jenny.', '1994-07-06', 'uploads/covers/poster_6.jpg', '', 1, 8.8, 1700, 1);

-- 7. The Matrix
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(7, 'The Matrix', 'Lana Wachowski, Lilly Wachowski', 'Keanu Reeves, Laurence Fishburne', 'A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers. Thomas Anderson, a computer programmer, is led to fight an underground war against powerful computers who have constructed his entire reality with a system called the Matrix.', '1999-03-31', 'uploads/covers/poster_7.jpg', '', 4, 8.7, 1800, 1);

-- 8. Spirited Away
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(8, 'Spirited Away', 'Hayao Miyazaki', 'Daveigh Chase, Suzanne Pleshette', 'During her family''s move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches, and spirits, and where humans are changed into beasts. Chihiro Ogino transfers to a new school, but on the way, she and her parents discover an abandoned amusement park which turns out to be a supernatural bathhouse.', '2001-07-20', 'uploads/covers/poster_8.jpg', '', 6, 8.6, 1400, 1);

-- 9. Titanic
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(9, 'Titanic', 'James Cameron', 'Leonardo DiCaprio, Kate Winslet', 'A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic. 84 years later, a 100-year-old woman named Rose DeWitt Bukater tells the story to her grandchildren about her life set in April 10th 1912, on a ship called Titanic when young Rose boards the departing ship.', '1997-12-19', 'uploads/covers/poster_9.jpg', '', 5, 7.9, 2100, 1);

-- 10. The Lion King
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(10, 'The Lion King', 'Roger Allers', 'Matthew Broderick, Jeremy Irons', 'Lion prince Simba and his father are targeted by his bitter uncle, who wants to ascend the throne himself. Tricked into thinking he killed his father, a guilt ridden lion cub flees into exile and abandons his identity as the future King.', '1994-06-15', 'uploads/covers/poster_10.jpg', '', 6, 8.5, 1600, 1);

-- 11. Avengers: Endgame
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(11, 'Avengers: Endgame', 'Anthony Russo', 'Robert Downey Jr., Chris Evans', 'After the devastating events of Avengers: Infinity War (2018), the universe is in ruins. With the help of remaining allies, the Avengers assemble once more in order to reverse Thanos'' actions and restore balance to the universe.', '2019-04-26', 'uploads/covers/poster_11.jpg', '', 3, 8.4, 2800, 1);

-- 12. Interstellar
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(12, 'Interstellar', 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway', 'A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival. In Earth''s future, a global crop blight and second Dust Bowl are slowly rendering the planet uninhabitable. Professor Brand, a brilliant NASA physicist, is working on plans to save mankind by transporting Earth''s population to a new home via a wormhole.', '2014-11-07', 'uploads/covers/poster_12.jpg', '', 4, 8.6, 1900, 1);

-- 13. Parasite
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(13, 'Parasite', 'Bong Joon Ho', 'Kang-ho Song, Sun-kyun Lee', 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan. The Kims, a poor family living in a semi-basement apartment in Seoul, struggle to make ends meet until the son, Ki-woo, is recommended for a tutoring job at the wealthy Park household.', '2019-05-30', 'uploads/covers/poster_13.jpg', '', 7, 8.5, 1500, 1);

-- 14. Whiplash
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(14, 'Whiplash', 'Damien Chazelle', 'Miles Teller, J.K. Simmons', 'A promising young drummer enrolls at a cut-throat music conservatory where his dreams of greatness are mentored by an instructor who will stop at nothing to realize a student''s potential. Andrew Neiman is an ambitious young jazz drummer, single-minded in his pursuit to rise to the top of his elite east coast music conservatory.', '2014-10-10', 'uploads/covers/poster_14.jpg', '', 1, 8.5, 900, 0);

-- 15. The Prestige
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(15, 'The Prestige', 'Christopher Nolan', 'Christian Bale, Hugh Jackman', 'Two stage magicians engage in a competitive one-upmanship in an attempt to create the ultimate stage illusion. In London at the end of the 19th century, Robert Angier, his beloved wife Julia McCullough, and Alfred Borden are friends and assistants of a magician. When Julia accidentally dies during a performance, Robert blames Alfred for her death, and they become enemies.', '2006-10-20', 'uploads/covers/poster_15.jpg', '', 8, 8.5, 1100, 0);

-- 16. Gladiator
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(16, 'Gladiator', 'Ridley Scott', 'Russell Crowe, Joaquin Phoenix', 'A former Roman General sets out to exact vengeance against the corrupt emperor who murdered his family and sent him into slavery. Maximus is a powerful Roman general, loved by the people and the aging Emperor, Marcus Aurelius. Before his death, the Emperor chooses Maximus to be his heir over his own son, Commodus, and a power struggle for Rome ensues.', '2000-05-05', 'uploads/covers/poster_16.jpg', '', 3, 8.5, 1600, 1);

-- 17. The Departed
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(17, 'The Departed', 'Martin Scorsese', 'Leonardo DiCaprio, Matt Damon', 'An undercover cop and a mole in the police attempt to identify each other while infiltrating an Irish gang in South Boston. In South Boston, the state police force is waging war on Irish-American organized crime. Young undercover cop Billy Costigan is assigned to infiltrate the mob syndicate run by gangland chief Frank Costello.', '2006-10-06', 'uploads/covers/poster_17.jpg', '', 2, 8.5, 1300, 0);

-- 18. The Green Mile
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(18, 'The Green Mile', 'Frank Darabont', 'Tom Hanks, Michael Clarke Duncan', 'The lives of guards on Death Row are affected by one of their charges: a black man accused of child murder and rape, yet who has a mysterious gift. Paul Edgecomb is the head guard of a prison death row called "The Green Mile" for the green color of its floor. He develops a poignant relationship with John Coffey.', '1999-12-10', 'uploads/covers/poster_18.jpg', '', 1, 8.6, 1400, 1);

-- 19. Se7en
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(19, 'Se7en', 'David Fincher', 'Morgan Freeman, Brad Pitt', 'Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives. William Somerset is a homicide detective within a week of retirement. He is partnered with David Mills, a short-tempered but idealistic transfer. Together, they investigate a series of gruesome murders.', '1995-09-22', 'uploads/covers/poster_19.jpg', '', 7, 8.6, 1700, 1);

-- 20. Coco
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(20, 'Coco', 'Lee Unkrich', 'Anthony Gonzalez, Gael García Bernal', 'Aspiring musician Miguel, confronted with his family''s ancestral ban on music, enters the Land of the Dead to find his great-great-grandfather, a legendary singer. Despite his family''s baffling generations-old ban on music, Miguel dreams of becoming an accomplished musician like his idol, Ernesto de la Cruz.', '2017-11-22', 'uploads/covers/poster_20.jpg', '', 6, 8.4, 1800, 1);

-- Insert Carousel Items
-- Assuming IDs 5, 11, 12 (Inception, Avengers, Interstellar) for carousel links
INSERT INTO t_carousel (image_url, target_url, title, sort_order, is_visible) VALUES
('uploads/carousel/carousel_1.jpg', 'user/movie_view?id=12', 'Interstellar - Sci-Fi Masterpiece', 1, 1),
('uploads/carousel/carousel_2.jpg', 'user/movie_view?id=11', 'Avengers: Endgame - The Epic Finale', 2, 1),
('uploads/carousel/carousel_3.jpg', 'user/movie_view?id=5', 'Inception - Dream Within a Dream', 3, 1);

-- Insert sample news
INSERT INTO t_news (title, content, publish_date) VALUES 
('Welcome to the New Movie System', 'We have updated our movie database with 20 classic films. Enjoy!', NOW()),
('Maintenance Schedule', 'The system will undergo maintenance tonight at 2:00 AM.', NOW());

SET FOREIGN_KEY_CHECKS = 1;
