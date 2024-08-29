-- MySQL dump 10.13  Distrib 8.0.36, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: Movie_database
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booking_seats`
--

DROP TABLE IF EXISTS `booking_seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_seats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `booking_id` int DEFAULT NULL,
  `seat` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `booking_id` (`booking_id`),
  CONSTRAINT `booking_seats_ibfk_1` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_seats`
--

LOCK TABLES `booking_seats` WRITE;
/*!40000 ALTER TABLE `booking_seats` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `movie_title` varchar(255) DEFAULT NULL,
  `showtime` time DEFAULT NULL,
  `snack_combo_id` int DEFAULT NULL,
  `snack_combo_name` varchar(255) DEFAULT NULL,
  `snack_combo_price` decimal(10,2) DEFAULT NULL,
  `booking_code` varchar(50) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `booking_date` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,14,'Game of Thrones','10:00:00',2,'Nachos + Soda',10.00,'',23.60,1,'2024-08-27 12:35:39','2024-08-27 18:19:55');
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Action'),(7,'Adventure'),(9,'Animation'),(2,'Comedy'),(3,'Drama'),(8,'Fantasy'),(10,'Horror'),(6,'Romance'),(4,'Science Fiction'),(5,'Thriller');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movie_genres`
--

DROP TABLE IF EXISTS `movie_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movie_genres` (
  `movie_id` int NOT NULL,
  `genre_id` int NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `genre_id` (`genre_id`),
  CONSTRAINT `movie_genres_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `movie_genres_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movie_genres`
--

LOCK TABLES `movie_genres` WRITE;
/*!40000 ALTER TABLE `movie_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `movie_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text,
  `release_year` varchar(10) DEFAULT NULL,
  `rated` varchar(10) DEFAULT NULL,
  `released` date DEFAULT NULL,
  `duration` varchar(20) DEFAULT NULL,
  `rating` varchar(10) DEFAULT NULL,
  `image_url` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `genre` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `writer` varchar(255) DEFAULT NULL,
  `actors` text,
  `plot` text,
  `language` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `awards` text,
  `metascore` varchar(10) DEFAULT NULL,
  `imdb_rating` decimal(3,1) DEFAULT NULL,
  `imdb_votes` varchar(20) DEFAULT NULL,
  `imdb_id` varchar(20) DEFAULT NULL,
  `type` varchar(20) DEFAULT NULL,
  `total_seasons` varchar(10) DEFAULT NULL,
  `images` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imdb_id` (`imdb_id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
INSERT INTO `movies` VALUES (7,'Avatar',NULL,'2009','PG-13','2009-12-18','162 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMTYwOTEwNjAzMl5BMl5BanBnXkFtZTcwODc5MTUwMw@@._V1_SX300.jpg','2024-08-27 03:22:31','Action, Adventure, Fantasy','James Cameron','James Cameron','Sam Worthington, Zoe Saldana, Sigourney Weaver, Stephen Lang','A paraplegic marine dispatched to the moon Pandora on a unique mission becomes torn between following his orders and protecting the world he feels is his home.','English, Spanish','USA, UK','Won 3 Oscars. Another 80 wins & 121 nominations.','83',7.9,'890,617','tt0499549','movie',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMjEyOTYyMzUxNl5BMl5BanBnXkFtZTcwNTg0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BNzM2MDk3MTcyMV5BMl5BanBnXkFtZTcwNjg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTY2ODQ3NjMyMl5BMl5BanBnXkFtZTcwODg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTMxOTEwNDcxN15BMl5BanBnXkFtZTcwOTg0MTUzNA@@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTYxMDg1Nzk1MV5BMl5BanBnXkFtZTcwMDk0MTUzNA@@._V1_SX1500_CR0,0,1500,999_AL_.jpg\"]'),(8,'I Am Legend',NULL,'2007','PG-13','2007-12-14','101 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMTU4NzMyNDk1OV5BMl5BanBnXkFtZTcwOTEwMzU1MQ@@._V1_SX300.jpg','2024-08-27 12:10:54','Drama, Horror, Sci-Fi','Francis Lawrence','Mark Protosevich (screenplay), Akiva Goldsman (screenplay), Richard Matheson (novel), John William Corrington, Joyce Hooper Corrington','Will Smith, Alice Braga, Charlie Tahan, Salli Richardson-Whitfield','Years after a plague kills most of humanity and transforms the rest into monsters, the sole survivor in New York City struggles valiantly to find a cure.','English','USA','9 wins & 21 nominations.','65',7.2,'533,874','tt0480249','movie',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMTI0NTI4NjE3NV5BMl5BanBnXkFtZTYwMDA0Nzc4._V1_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTIwMDg2MDU4M15BMl5BanBnXkFtZTYwMTA0Nzc4._V1_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTc5MDM1OTU5OV5BMl5BanBnXkFtZTYwMjA0Nzc4._V1_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTA0MTI2NjMzMzFeQTJeQWpwZ15BbWU2MDMwNDc3OA@@._V1_.jpg\"]'),(10,'300',NULL,'2006','R','2007-03-09','117 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMjAzNTkzNjcxNl5BMl5BanBnXkFtZTYwNDA4NjE3._V1_SX300.jpg','2024-08-27 16:11:26','Action, Drama, Fantasy','Zack Snyder','Zack Snyder (screenplay), Kurt Johnstad (screenplay), Michael Gordon (screenplay), Frank Miller (graphic novel), Lynn Varley (graphic novel)','Gerard Butler, Lena Headey, Dominic West, David Wenham','King Leonidas of Sparta and a force of 300 men fight the Persians at Thermopylae in 480 B.C.','English','USA','16 wins & 42 nominations.','52',7.7,'611,046','tt0416449','movie',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMTMwNTg5MzMwMV5BMl5BanBnXkFtZTcwMzA2NTIyMw@@._V1_SX1777_CR0,0,1777,937_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTQwNTgyNTMzNF5BMl5BanBnXkFtZTcwNDA2NTIyMw@@._V1_SX1777_CR0,0,1777,935_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0MjQzOTEwMV5BMl5BanBnXkFtZTcwMzE2NTIyMw@@._V1_SX1777_CR0,0,1777,947_AL_.jpg\"]'),(11,'The Avengers',NULL,'2012','PG-13','2012-05-04','143 min',NULL,'https://images-na.ssl-images-amazon.com/images/M/MV5BMTA0NjY0NzE4OTReQTJeQWpwZ15BbWU3MDczODg2Nzc@._V1_SX1777_CR0,0,1777,999_AL_.jpg','2024-08-27 16:19:54','Action, Sci-Fi, Thriller','Joss Whedon','Joss Whedon (screenplay), Zak Penn (story), Joss Whedon (story)','Robert Downey Jr., Chris Evans, Mark Ruffalo, Chris Hemsworth','Earth\'s mightiest heroes must come together and learn to fight as a team if they are to stop the mischievous Loki and his alien army from enslaving humanity.','English, Russian','USA','Nominated for 1 Oscar. Another 34 wins & 75 nominations.','69',8.0,'1,328,883','tt0848228','movie',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMTA0NjY0NzE4OTReQTJeQWpwZ15BbWU3MDczODg2Nzc@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjE1MzEzMjcyM15BMl5BanBnXkFtZTcwNDM4ODY3Nw@@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjMwMzM2MTg1M15BMl5BanBnXkFtZTcwNjM4ODY3Nw@@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ4NzM2Mjc5MV5BMl5BanBnXkFtZTcwMTkwOTY3Nw@@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTc3MzQ3NjA5N15BMl5BanBnXkFtZTcwMzY5OTY3Nw@@._V1_SX1777_CR0,0,1777,999_AL_.jpg\"]'),(12,'The Wolf of Wall Street',NULL,'2013','R','2013-12-25','180 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMjIxMjgxNTk0MF5BMl5BanBnXkFtZTgwNjIyOTg2MDE@._V1_SX300.jpg','2024-08-27 16:31:12','Biography, Comedy, Crime','Martin Scorsese','Terence Winter (screenplay), Jordan Belfort (book)','Leonardo DiCaprio, Jonah Hill, Margot Robbie, Matthew McConaughey','Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.','English, French','USA','Nominated for 5 Oscars. Another 35 wins & 154 nominations.','75',8.2,'786,985','tt0993846','movie',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BNDIwMDIxNzk3Ml5BMl5BanBnXkFtZTgwMTg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTc0NzAxODAyMl5BMl5BanBnXkFtZTgwMDg0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTExMDk1MDE4NzVeQTJeQWpwZ15BbWU4MDM4NDM0ODAx._V1_SX1500_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTg3MTY4NDk4Nl5BMl5BanBnXkFtZTgwNjc0MzQ4MDE@._V1_SX1500_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTgzMTg4MDI0Ml5BMl5BanBnXkFtZTgwOTY0MzQ4MDE@._V1_SY1000_CR0,0,1553,1000_AL_.jpg\"]'),(13,'Interstellar',NULL,'2014','PG-13','2014-11-07','169 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMjIxNTU4MzY4MF5BMl5BanBnXkFtZTgwMzM4ODI3MjE@._V1_SX300.jpg','2024-08-27 16:39:39','Adventure, Drama, Sci-Fi','Christopher Nolan','Jonathan Nolan, Christopher Nolan','Ellen Burstyn, Matthew McConaughey, Mackenzie Foy, John Lithgow','A team of explorers travel through a wormhole in space in an attempt to ensure humanity\'s survival.','English','USA, UK','Won 1 Oscar. Another 39 wins & 134 nominations.','74',8.6,'937,412','tt0816692','movie',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMjA3NTEwOTMxMV5BMl5BanBnXkFtZTgwMjMyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMzQ5ODE2MzEwM15BMl5BanBnXkFtZTgwMTMyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTg4Njk4MzY0Nl5BMl5BanBnXkFtZTgwMzIyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMzE3MTM0MTc3Ml5BMl5BanBnXkFtZTgwMDIyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BNjYzNjE2NDk3N15BMl5BanBnXkFtZTgwNzEyODgxMzE@._V1_SX1500_CR0,0,1500,999_AL_.jpg\"]'),(14,'Game of Thrones',NULL,'2011–','TV-MA','2011-04-17','56 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMjM5OTQ1MTY5Nl5BMl5BanBnXkFtZTgwMjM3NzMxODE@._V1_SX300.jpg','2024-08-27 16:40:34','Adventure, Drama, Fantasy','N/A','David Benioff, D.B. Weiss','Peter Dinklage, Lena Headey, Emilia Clarke, Kit Harington','While a civil war brews between several noble families in Westeros, the children of the former rulers of the land attempt to rise up to power. Meanwhile a forgotten race, bent on destruction, plans to return after thousands of years in the North.','English','USA, UK','Won 1 Golden Globe. Another 185 wins & 334 nominations.','N/A',9.5,'1,046,830','tt0944947','series',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BNDc1MGUyNzItNWRkOC00MjM1LWJjNjMtZTZlYWIxMGRmYzVlXkEyXkFqcGdeQXVyMzU3MDEyNjk@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BZjZkN2M5ODgtMjQ2OC00ZjAxLWE1MjMtZDE0OTNmNGM0NWEwXkEyXkFqcGdeQXVyNjUxNzgwNTE@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMDk4Y2Y1MDAtNGVmMC00ZTlhLTlmMmQtYjcyN2VkNzUzZjg2XkEyXkFqcGdeQXVyNjUxNzgwNTE@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BNjZjNWIzMzQtZWZjYy00ZTkwLWJiMTYtOWRkZDBhNWJhY2JmXkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_SX1777_CR0,0,1777,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BNTMyMTRjZWEtM2UxMS00ZjU5LWIxMTYtZDA5YmJhZmRjYTc4XkEyXkFqcGdeQXVyMjk3NTUyOTc@._V1_SX1777_CR0,0,1777,999_AL_.jpg\"]'),(15,'Vikings',NULL,'2013–','TV-14','2013-03-03','44 min',NULL,'http://ia.media-imdb.com/images/M/MV5BOTEzNzI3MDc0N15BMl5BanBnXkFtZTgwMzk1MzA5NzE@._V1_SX300.jpg','2024-08-27 16:41:29','Action, Drama, History','N/A','Michael Hirst','Travis Fimmel, Clive Standen, Gustaf Skarsgård, Katheryn Winnick','The world of the Vikings is brought to life through the journey of Ragnar Lothbrok, the first Viking to emerge from Norse legend and onto the pages of history - a man on the edge of myth.','English, Old English, Norse, Old, Latin','Ireland, Canada','Nominated for 7 Primetime Emmys. Another 17 wins & 49 nominations.','N/A',8.6,'198,041','tt2306299','series',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMjM5MTM1ODUxNV5BMl5BanBnXkFtZTgwNTAzOTI2ODE@._V1_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BNzU2NDcxODMyOF5BMl5BanBnXkFtZTgwNDAzOTI2ODE@._V1_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjMzMzIzOTU2M15BMl5BanBnXkFtZTgwODMzMTkyODE@._V1_SY1000_SX1500_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ2NTQ2MDA3NF5BMl5BanBnXkFtZTgwODkxMDUxODE@._V1_SY1000_SX1500_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTcxOTQ3NTA5N15BMl5BanBnXkFtZTgwMzExMDUxODE@._V1_SY1000_SX1500_AL_.jpg\"]'),(28,'Gotham',NULL,'2014–','TV-14','2014-08-01','42 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMTY2MjMwNDE4OV5BMl5BanBnXkFtZTgwNjI1NjU0OTE@._V1_SX300.jpg','2024-08-27 16:54:18','Action, Crime, Drama','N/A','Bruno Heller','Ben McKenzie, Donal Logue, David Mazouz, Sean Pertwee','The story behind Detective James Gordon\'s rise to prominence in Gotham City in the years before Batman\'s arrival.','English','USA','Nominated for 4 Primetime Emmys. Another 3 wins & 22 nominations.','N/A',8.0,'133,375','tt3749900','series',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BNDI3ODYyODY4OV5BMl5BanBnXkFtZTgwNjE5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjA5OTExMTIwNF5BMl5BanBnXkFtZTgwMjI5NDMwMDI@._V1_SY1000_SX1500_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTA3MDY2NjA3MzBeQTJeQWpwZ15BbWU4MDU0MDkzODgx._V1_SX1499_CR0,0,1499,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjM3MzYzNDgzOV5BMl5BanBnXkFtZTgwMjQwOTM4ODE@._V1_SY1000_CR0,0,1498,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjQwODAyNjk0NF5BMl5BanBnXkFtZTgwODU4MzMyODE@._V1_SY1000_CR0,0,1500,1000_AL_.jpg\"]'),(29,'Power',NULL,'2014–','TV-MA',NULL,'50 min',NULL,'http://ia.media-imdb.com/images/M/MV5BOTA4NTkzMjUzOF5BMl5BanBnXkFtZTgwNzg5ODkxOTE@._V1_SX300.jpg','2024-08-27 16:54:18','Crime, Drama','N/A','Courtney Kemp Agboh','Omari Hardwick, Joseph Sikora, Andy Bean, Lela Loren','James \"Ghost\" St. Patrick, a wealthy New York night club owner who has it all, catering for the city\'s elite and dreaming big, lives a double life as a drug kingpin.','English','USA','1 win & 6 nominations.','N/A',8.0,'14,770','tt3281796','series',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMTc2ODg0MzMzM15BMl5BanBnXkFtZTgwODYxODA5NTE@._V1_SY1000_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTcyMjA0MzczNV5BMl5BanBnXkFtZTgwNTIyODA5NTE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTk0MTI0NzQ2NV5BMl5BanBnXkFtZTgwMDkxODA5NTE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ4Mzk1ODcxM15BMl5BanBnXkFtZTgwNDQyODA5NTE@._V1_SY1000_CR0,0,1499,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTUwNTE0NDI1M15BMl5BanBnXkFtZTgwMDQyODA5NTE@._V1_SY1000_CR0,0,1500,1000_AL_.jpg\"]'),(30,'Narcos',NULL,'2015–','TV-MA','2015-08-28','49 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMTU0ODQ4NDg2OF5BMl5BanBnXkFtZTgwNzczNTE4OTE@._V1_SX300.jpg','2024-08-27 16:54:18','Biography, Crime, Drama','N/A','Carlo Bernard, Chris Brancato, Doug Miro, Paul Eckstein','Wagner Moura, Boyd Holbrook, Pedro Pascal, Joanna Christie','A chronicled look at the criminal exploits of Colombian drug lord Pablo Escobar.','English, Spanish','USA','Nominated for 2 Golden Globes. Another 4 nominations.','N/A',8.9,'118,680','tt2707408','series',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMTk2MDMzMTc0MF5BMl5BanBnXkFtZTgwMTAyMzA1OTE@._V1_SY1000_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjIxMDkyOTEyNV5BMl5BanBnXkFtZTgwNjY3Mjc3OTE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjA2NDUwMTU2NV5BMl5BanBnXkFtZTgwNTI1Mzc3OTE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BODA1NjAyMTQ3Ml5BMl5BanBnXkFtZTgwNjI1Mzc3OTE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTU0NzQ0OTAwNl5BMl5BanBnXkFtZTgwMDAyMzA1OTE@._V1_SX1500_CR0,0,1500,999_AL_.jpg\"]'),(31,'Breaking Bad',NULL,'2008–2013','TV-14','2008-01-20','49 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMTQ0ODYzODc0OV5BMl5BanBnXkFtZTgwMDk3OTcyMDE@._V1_SX300.jpg','2024-08-27 16:54:18','Crime, Drama, Thriller','N/A','Vince Gilligan','Bryan Cranston, Anna Gunn, Aaron Paul, Dean Norris','A high school chemistry teacher diagnosed with inoperable lung cancer turns to manufacturing and selling methamphetamine in order to secure his family\'s financial future.','English, Spanish','USA','Won 2 Golden Globes. Another 132 wins & 218 nominations.','N/A',9.5,'889,883','tt0903747','series',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMTgyMzI5NDc5Nl5BMl5BanBnXkFtZTgwMjM0MTI2MDE@._V1_SY1000_CR0,0,1498,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjA5MzE4NjAzOV5BMl5BanBnXkFtZTgwMjk4NTAxMDE@._V1_SY1000_CR0,0,1500,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTc4NzA0MDM2MF5BMl5BanBnXkFtZTgwMDYzOTAyMDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTgxMzc0NjQ1OF5BMl5BanBnXkFtZTgwNjA4NjAzMDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTcwNjA5Mzg0OF5BMl5BanBnXkFtZTgwMDgxMjMwMDE@._V1_SY1000_CR0,0,1500,1000_AL_.jpg\"]'),(32,'The Office',NULL,'2005–2013','TV-PG','2005-03-24','22 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMTY3NTI4MTUyNF5BMl5BanBnXkFtZTcwNzI4ODU5Mw@@._V1_SX300.jpg','2024-08-27 16:54:18','Comedy, Drama','N/A','Greg Daniels','Steve Carell, Rainn Wilson, John Krasinski, Jenna Fischer','A mockumentary on a group of typical office workers, where the workday consists of ego clashes, inappropriate behavior, and tedium.','English','USA','Won 5 Primetime Emmys. Another 45 wins & 154 nominations.','N/A',8.9,'285,890','tt0386676','series',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ4Mzk1NzM1MV5BMl5BanBnXkFtZTcwNzU4MzI1Mw@@._V1_SY1000_CR0,0,1498,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTM5MzAzMzgyNF5BMl5BanBnXkFtZTcwNzE3ODI1Mw@@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjA1Nzg1NzM2M15BMl5BanBnXkFtZTcwNzEyMzI1Mw@@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5MTgyNjU3OTM3MF5BMl5BanBnXkFtZTcwNjk3ODU5Mw@@._V1_SY1000_CR0,0,1498,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTM2NDI5NDMwMl5BMl5BanBnXkFtZTcwNzIwMzI1Mw@@._V1_SY1000_CR0,0,1500,1000_AL_.jpg\"]'),(33,'Sherlock',NULL,'2010–2017','TV-14','2010-07-25','88 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMTY0NjA2NTg5MF5BMl5BanBnXkFtZTgwNzk1MTI2MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg','2024-08-27 16:54:18','Crime, Drama, Mystery','N/A','Mark Gatiss, Steven Moffat','Benedict Cumberbatch, Martin Freeman, Una Stubbs, Rupert Graves','A modern update to the classic British detective tales of Sherlock Holmes.','English','UK','Won 1 Golden Globe. Another 29 wins & 79 nominations.','N/A',9.1,'209,283','tt2077051','series',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMTQ0NjA2NTg5MF5BMl5BanBnXkFtZTgwNzk1MTI2MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTUzNzU2MjkwN15BMl5BanBnXkFtZTgwOTQxNzM4MDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTk1MDY1Mzg0Nl5BMl5BanBnXkFtZTgwNzc1NjAzMDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjA1OTU0MTAyNF5BMl5BanBnXkFtZTgwNjU4NjAzMDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTUwOTQ2Mzc1OF5BMl5BanBnXkFtZTgwNzU4NjAzMDE@._V1_SY1000_CR0,0,1495,1000_AL_.jpg\"]'),(34,'Doctor Strange',NULL,'2016','N/A','2016-11-04','N/A',NULL,'http://ia.media-imdb.com/images/M/MV5BNjgwNzAzNjk1Nl5BMl5BanBnXkFtZTgwMzQ2NjI1OTE@._V1_SX300.jpg','2024-08-27 17:01:22','Action, Adventure, Fantasy','Scott Derrickson','Scott Derrickson (screenplay), C. Robert Cargill (screenplay), Jon Spaihts (story by), Scott Derrickson (story by), C. Robert Cargill (story by), Steve Ditko (comic book)','Rachel McAdams, Benedict Cumberbatch, Mads Mikkelsen, Tilda Swinton','After his career is destroyed, a brilliant but arrogant and conceited surgeon gets a new lease on life when a sorcerer takes him under her wing and trains him to defend the world against evil.','English','USA','N/A',NULL,NULL,NULL,'tt1211837','movie',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMjM3ODc1ODI5Ml5BMl5BanBnXkFtZTgwODMzMDY3OTE@._V1_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTgxNTAyNTU0NV5BMl5BanBnXkFtZTgwNzMzMDY3OTE@._V1_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjE5NDc5NzUwNV5BMl5BanBnXkFtZTgwMDM3MDM2NzE@._V1_.jpg\"]'),(35,'Rogue One: A Star Wars Story',NULL,'2016','N/A','2016-12-16','N/A',NULL,'https://images-na.ssl-images-amazon.com/images/M/MV5BMjQyMzI2OTA3OF5BMl5BanBnXkFtZTgwNDg5NjQ0OTE@._V1_SY1000_CR0,0,674,1000_AL_.jpg','2024-08-27 17:01:22','Action, Adventure, Sci-Fi','Gareth Edwards','Chris Weitz (screenplay), Tony Gilroy (screenplay), John Knoll (story), Gary Whitta (story), George Lucas (characters)','Felicity Jones, Riz Ahmed, Mads Mikkelsen, Ben Mendelsohn','The Rebellion makes a risky move to steal the plans to the Death Star, setting up the epic saga to follow.','English','USA','1 nomination.',NULL,NULL,NULL,'tt3748528','movie',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMjE3MzA4Nzk3NV5BMl5BanBnXkFtZTgwNjAxMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BNDMxMTQzMjQxM15BMl5BanBnXkFtZTgwNzAxMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTUyNjkxOTk5NV5BMl5BanBnXkFtZTgwODAxMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BNjM4MzExNDAyNl5BMl5BanBnXkFtZTgwOTAxMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjE3NTgxMDcyNV5BMl5BanBnXkFtZTgwMDExMTc1ODE@._V1_SX1777_CR0,0,1777,744_AL_.jpg\"]'),(36,'Assassin\'s Creed',NULL,'2016','N/A','2016-12-21','N/A',NULL,'http://ia.media-imdb.com/images/M/MV5BMTU2MTQwMjU1OF5BMl5BanBnXkFtZTgwMDA5NjU5ODE@._V1_SX300.jpg','2024-08-27 17:01:22','Action, Adventure, Fantasy','Justin Kurzel','Bill Collage (screenplay), Adam Cooper (screenplay), Michael Lesslie (screenplay)','Michael Fassbender, Michael Kenneth Williams, Marion Cotillard, Jeremy Irons','When Callum Lynch explores the memories of his ancestor Aguilar and gains the skills of a Master Assassin, he discovers he is a descendant of the secret Assassins society.','English','UK, France, USA, Hong Kong','N/A',NULL,NULL,NULL,'tt2094766','movie',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BN2EyYzgyOWEtNTY2NS00NjRjLWJiNDYtMWViMjg5MWZjYjgzXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTYwOWYzOTctOTc4My00ZmJkLTgzMTctMmUxNDI5ODQzYzNjXkEyXkFqcGdeQXVyNDAyODU1Njc@._V1_SX1500_CR0,0,1500,999_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BZTY5ZGUxMTAtYTU0OC00NGQ2LTkzNzgtZGZmNjlmNjY3MGU0XkEyXkFqcGdeQXVyNTY0MTkxMTg@._V1_SY1000_CR0,0,1500,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BZjA0MWYwZTEtYzc5Yi00NGM2LTg1YTctNjY2YzQ0NDJhZDAwXkEyXkFqcGdeQXVyNDAyODU1Njc@._V1_SY1000_CR0,0,1499,1000_AL_.jpg\"]'),(37,'Luke Cage',NULL,'2016–','TV-MA','2016-09-30','55 min',NULL,'http://ia.media-imdb.com/images/M/MV5BMTcyMzc1MjI5MF5BMl5BanBnXkFtZTgwMzE4ODY2OTE@._V1_SX300.jpg','2024-08-27 17:01:22','Action, Crime, Drama','N/A','Cheo Hodari Coker','Mahershala Ali, Mike Colter, Frankie Faison, Erik LaRay Harvey','Given superstrength and durability by a sabotaged experiment, a wrongly accused man escapes prison to become a superhero for hire.','English','USA','N/A',NULL,NULL,NULL,'tt3322314','series',NULL,'[\"https://images-na.ssl-images-amazon.com/images/M/MV5BMjMxNjc1NjI0NV5BMl5BanBnXkFtZTgwNzA0NzY0ODE@._V1_SY1000_CR0,0,1497,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjI1MDg3NjY2OF5BMl5BanBnXkFtZTgwNDE1NDU4OTE@._V1_SY1000_CR0,0,1497,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BOTYzOTQyNDYxNl5BMl5BanBnXkFtZTgwNzA1NDU4OTE@._V1_SY1000_CR0,0,1498,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMTgxMjA3MTQ5Ml5BMl5BanBnXkFtZTgwOTA1NDU4OTE@._V1_SY1000_CR0,0,1498,1000_AL_.jpg\", \"https://images-na.ssl-images-amazon.com/images/M/MV5BMjMyNjg5ODYwNF5BMl5BanBnXkFtZTgwMTE1NDU4OTE@._V1_SY1000_CR0,0,1477,1000_AL_.jpg\"]');
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `showtimes`
--

DROP TABLE IF EXISTS `showtimes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `showtimes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `movie_id` int DEFAULT NULL,
  `theater_id` int DEFAULT NULL,
  `start_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `theater_id` (`theater_id`),
  CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE,
  CONSTRAINT `showtimes_ibfk_2` FOREIGN KEY (`theater_id`) REFERENCES `theaters` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `showtimes`
--

LOCK TABLES `showtimes` WRITE;
/*!40000 ALTER TABLE `showtimes` DISABLE KEYS */;
/*!40000 ALTER TABLE `showtimes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `theaters`
--

DROP TABLE IF EXISTS `theaters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `theaters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `capacity` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `theaters`
--

LOCK TABLES `theaters` WRITE;
/*!40000 ALTER TABLE `theaters` DISABLE KEYS */;
INSERT INTO `theaters` VALUES (1,'Cineplex Downtown','123 Main St, Downtown',200),(2,'Starlight Cinema','456 Park Ave, Uptown',150),(3,'Riverside Movies','789 River Rd, Riverside',180);
/*!40000 ALTER TABLE `theaters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('admin','consumer') DEFAULT 'consumer',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Admin User','admin@example.com','$2b$10$vXdyGcMZOYL3H0S0SX4wn.3o0NiC.jcNSZgWObjri9tNQfMTdhzfS','admin','2024-08-26 16:33:19'),(2,'John Doe','john@example.com','$2b$10$8KzaNdKIMyOkASCCfkqUXeEn8RDIGZs3oCqJjjRNMhN5AZXS3UBHi','consumer','2024-08-26 16:33:19'),(3,'Jane Smith','jane@example.com','$2b$10$8KzaNdKIMyOkASCCfkqUXeEn8RDIGZs3oCqJjjRNMhN5AZXS3UBHi','consumer','2024-08-26 16:33:19'),(4,'Test User','testuser@example.com','$2b$10$GLoVpALGPE6osrvNoUHpzeDLzF1euNKeuPLnuqdcdGmI/B8GsVetm','consumer','2024-08-26 17:33:00');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-28 11:17:38
