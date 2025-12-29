SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE t_comment;
TRUNCATE TABLE t_viewing_record;
TRUNCATE TABLE t_movie;
TRUNCATE TABLE t_carousel;
TRUNCATE TABLE t_category;
TRUNCATE TABLE t_news;

-- Insert Categories
INSERT INTO t_category (id, name) VALUES (1, 'Drama'), (2, 'Crime'), (3, 'Action'), (4, 'Sci-Fi'), (5, 'Romance'), (6, 'Animation'), (7, 'Thriller'), (8, 'Fantasy'), (9, 'Adventure'), (10, 'Comedy');

-- Insert Movies
INSERT INTO t_movie (id, name, director, actors, description, release_date, cover_image, file_path, category_id, rating, rating_count, is_hot) VALUES
(1, 'The Shawshank Redemption', 'Frank Darabont', 'Tim Robbins, Morgan Freeman', 'Rank #1. Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.', '1994-01-01', 'uploads/covers/poster_1.jpg', '', 1, 9.3, 2900000, 1),
(2, 'The Godfather', 'Francis Ford Coppola', 'Marlon Brando, Al Pacino', 'Rank #2. The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.', '1972-01-01', 'uploads/covers/poster_2.jpg', '', 2, 9.2, 2000000, 1),
(3, 'The Dark Knight', 'Christopher Nolan', 'Christian Bale, Heath Ledger', 'Rank #3. When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.', '2008-01-01', 'uploads/covers/poster_3.jpg', '', 3, 9.0, 2800000, 1),
(4, 'The Godfather Part II', 'Francis Ford Coppola', 'Al Pacino, Robert De Niro', 'Rank #4. The early life and career of Vito Corleone in 1920s New York City is portrayed, while his son, Michael, expands and tightens his grip on the family crime syndicate.', '1974-01-01', 'uploads/covers/poster_4.jpg', '', 2, 9.0, 1300000, 1),
(5, '12 Angry Men', 'Sidney Lumet', 'Henry Fonda, Lee J. Cobb', 'Rank #5. The jury in a New York City murder trial is frustrated by a single member whose skeptical caution forces them to more carefully consider the evidence before jumping to a hasty verdict.', '1957-01-01', 'uploads/covers/poster_5.jpg', '', 1, 9.0, 850000, 1),
(6, 'The Lord of the Rings: The Return of the King', 'Peter Jackson', 'Elijah Wood, Viggo Mortensen', 'Rank #6. Gandalf and Aragorn lead the World of Men against Sauron''s army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.', '2003-01-01', 'uploads/covers/poster_6.jpg', '', 8, 9.0, 2000000, 1),
(7, 'Schindler''s List', 'Steven Spielberg', 'Liam Neeson, Ralph Fiennes', 'Rank #7. In German-occupied Poland during World War II, industrialist Oskar Schindler gradually becomes concerned for his Jewish workforce after witnessing their persecution by the Nazis.', '1993-01-01', 'uploads/covers/poster_7.jpg', '', 1, 9.0, 1400000, 1),
(8, 'The Lord of the Rings: The Fellowship of the Ring', 'Peter Jackson', 'Elijah Wood, Ian McKellen', 'Rank #8. A meek Hobbit from the Shire and eight companions set out on a journey to destroy the powerful One Ring and save Middle-earth from the Dark Lord Sauron.', '2001-01-01', 'uploads/covers/poster_8.jpg', '', 8, 8.9, 2000000, 1),
(9, 'Pulp Fiction', 'Quentin Tarantino', 'John Travolta, Uma Thurman', 'Rank #9. The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.', '1994-01-01', 'uploads/covers/poster_9.jpg', '', 2, 8.9, 2200000, 1),
(10, 'Il buono, il brutto, il cattivo', 'Sergio Leone', 'Clint Eastwood, Eli Wallach', 'Rank #10. A bounty hunting scam joins two men in an uneasy alliance against a third in a race to find a fortune in gold buried in a remote cemetery.', '1966-01-01', 'uploads/covers/poster_10.jpg', '', 9, 8.8, 800000, 1),
(11, 'The Lord of the Rings: The Two Towers', 'Peter Jackson', 'Elijah Wood, Ian McKellen', 'Rank #11. While Frodo and Sam edge closer to Mordor with the help of the shifty Gollum, the divided fellowship makes a stand against Sauron''s new ally, Saruman, and his hordes of Isengard.', '2002-01-01', 'uploads/covers/poster_11.jpg', '', 8, 8.8, 1800000, 1),
(12, 'Forrest Gump', 'Robert Zemeckis', 'Tom Hanks, Robin Wright', 'Rank #12. The presidencies of Kennedy and Johnson, the events of Vietnam, Watergate and other historical events unfold from the perspective of an Alabama man with an IQ of 75.', '1994-01-01', 'uploads/covers/poster_12.jpg', '', 1, 8.8, 2200000, 1),
(13, 'Fight Club', 'David Fincher', 'Brad Pitt, Edward Norton', 'Rank #13. An insomniac office worker and a devil-may-care soap maker form an underground fight club that evolves into much more.', '1999-01-01', 'uploads/covers/poster_13.jpg', '', 1, 8.8, 2300000, 1),
(14, 'Inception', 'Christopher Nolan', 'Leonardo DiCaprio, Joseph Gordon-Levitt', 'Rank #14. A thief who steals corporate secrets through the use of dream-sharing technology is given the inverse task of planting an idea into the mind of a C.E.O.', '2010-01-01', 'uploads/covers/poster_14.jpg', '', 4, 8.8, 2500000, 1),
(15, 'Star Wars: Episode V - The Empire Strikes Back', 'Irvin Kershner', 'Mark Hamill, Harrison Ford', 'Rank #15. After the Rebels are brutally overpowered by the Empire on the ice planet Hoth, Luke Skywalker begins Jedi training with Yoda, while his friends are pursued by Darth Vader.', '1980-01-01', 'uploads/covers/poster_15.jpg', '', 4, 8.7, 1400000, 1),
(16, 'The Matrix', 'Lana Wachowski, Lilly Wachowski', 'Keanu Reeves, Laurence Fishburne', 'Rank #16. A computer hacker learns from mysterious rebels about the true nature of his reality and his role in the war against its controllers.', '1999-01-01', 'uploads/covers/poster_16.jpg', '', 4, 8.7, 2000000, 1),
(17, 'GoodFellas', 'Martin Scorsese', 'Robert De Niro, Ray Liotta', 'Rank #17. The story of Henry Hill and his life in the mob, covering his relationship with his wife Karen Hill and his mob partners Jimmy Conway and Tommy DeVito.', '1990-01-01', 'uploads/covers/poster_17.jpg', '', 2, 8.7, 1200000, 1),
(18, 'Interstellar', 'Christopher Nolan', 'Matthew McConaughey, Anne Hathaway', 'Rank #18. A team of explorers travel through a wormhole in space in an attempt to ensure humanity''s survival.', '2014-01-01', 'uploads/covers/poster_18.jpg', '', 4, 8.7, 2000000, 1),
(19, 'One Flew Over the Cuckoo''s Nest', 'Milos Forman', 'Jack Nicholson, Louise Fletcher', 'Rank #19. A criminal pleads insanity and is admitted to a mental institution, where he rebels against the oppressive nurse and rallies up the scared patients.', '1975-01-01', 'uploads/covers/poster_19.jpg', '', 1, 8.7, 1000000, 1),
(20, 'Se7en', 'David Fincher', 'Morgan Freeman, Brad Pitt', 'Rank #20. Two detectives, a rookie and a veteran, hunt a serial killer who uses the seven deadly sins as his motives.', '1995-01-01', 'uploads/covers/poster_20.jpg', '', 2, 8.6, 1800000, 1);

-- Insert Carousel Items (Top 3) using Landscape Wallpapers as requested
INSERT INTO t_carousel (image_url, target_url, title, sort_order, is_visible) VALUES
('uploads/carousel/carousel_1.jpg', 'user/movie_view?id=1', 'The Shawshank Redemption - #1 Top Rated', 1, 1),
('uploads/carousel/carousel_2.jpg', 'user/movie_view?id=3', 'The Dark Knight - Masterpiece', 2, 1),
('uploads/carousel/carousel_3.jpg', 'user/movie_view?id=18', 'Interstellar - Emotional Journey', 3, 1);

-- Insert sample news
INSERT INTO t_news (title, content, publish_date) VALUES 
('Database Updated', 'We have updated the system with the actual IMDb Top 20 movies.', NOW());

SET FOREIGN_KEY_CHECKS = 1;
