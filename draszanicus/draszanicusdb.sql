-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Sty 11, 2024 at 01:25 PM
-- Wersja serwera: 8.2.0
-- Wersja PHP: 8.2.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `draszanicusdb`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Posts`
--

CREATE TABLE `Posts` (
  `id` int NOT NULL,
  `description` text,
  `id_user` int DEFAULT NULL,
  `id_team` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Posts`
--

INSERT INTO `Posts` (`id`, `description`, `id_user`, `id_team`) VALUES
(1, 'Post by User 1 in Group A', 1, 1),
(2, 'Post by User 2 in Group A', 2, 1),
(3, 'Post by User 2 in Group B', 2, 2),
(4, 'Post by User 3 in Group C', 3, 3),
(5, 'siema\r\n\r\n', 1, 1),
(6, 'testowy wpis', 1, 1),
(7, 'elo', 1, 1),
(8, 'test', 1, 10),
(9, 'siema', 1, 1),
(10, 'test 2', 1, 10),
(11, 'hej', 1, 10),
(12, 'hej', 1, 10),
(13, 'test post', 1, 11),
(14, 'essa', 1, 10),
(16, 'kawa', 1, 10);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Teams`
--

CREATE TABLE `Teams` (
  `id` int NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `author_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Teams`
--

INSERT INTO `Teams` (`id`, `name`, `description`, `author_id`) VALUES
(1, 'Group A', 'Description for Group A', 1),
(2, 'Group B', 'Description for Group B', 2),
(3, 'Group C', 'Description for Group C', 3),
(10, 'test', 'test test', 1),
(11, 'siema ', 'test', 1),
(12, 'sd', 'sddf', 1),
(13, 'tesciorek', 'test tes', 1),
(14, 'tesciorek', 'test tes', 1),
(15, 'grupa', 'grupka test', 1),
(16, 'grupa', 'grupka test', 1),
(17, 'grupa', 'grupka test', 1),
(18, 'wsb', 'ksksks', 1),
(19, 'wsb', 'ksksks', 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `Users`
--

CREATE TABLE `Users` (
  `id` int NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `Users`
--

INSERT INTO `Users` (`id`, `username`, `password`, `email`) VALUES
(1, 'user1', 'password1', 'user1@example.com'),
(2, 'user2', 'password2', 'user2@example.com'),
(3, 'user3', 'password3', 'user3@example.com'),
(4, 'test1', 'superhaslo123', 'test@test.pl');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `UserToTeam`
--

CREATE TABLE `UserToTeam` (
  `id` int NOT NULL,
  `id_user` int DEFAULT NULL,
  `id_team` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `UserToTeam`
--

INSERT INTO `UserToTeam` (`id`, `id_user`, `id_team`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 2, 2),
(4, 3, 3),
(5, NULL, NULL),
(6, NULL, NULL),
(7, NULL, NULL),
(8, NULL, NULL),
(9, NULL, NULL),
(10, NULL, NULL),
(11, 1, 10),
(12, 1, 11),
(13, 1, 12),
(14, 1, 13),
(15, 1, 14),
(16, 1, 15),
(17, 1, 16),
(18, 1, 17),
(19, 1, 18),
(20, 1, 19);

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `Posts`
--
ALTER TABLE `Posts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_team` (`id_team`);

--
-- Indeksy dla tabeli `Teams`
--
ALTER TABLE `Teams`
  ADD PRIMARY KEY (`id`),
  ADD KEY `author_id` (`author_id`);

--
-- Indeksy dla tabeli `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `UserToTeam`
--
ALTER TABLE `UserToTeam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_team` (`id_team`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `Posts`
--
ALTER TABLE `Posts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `Teams`
--
ALTER TABLE `Teams`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `UserToTeam`
--
ALTER TABLE `UserToTeam`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Posts`
--
ALTER TABLE `Posts`
  ADD CONSTRAINT `Posts_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id`),
  ADD CONSTRAINT `Posts_ibfk_2` FOREIGN KEY (`id_team`) REFERENCES `Teams` (`id`);

--
-- Constraints for table `Teams`
--
ALTER TABLE `Teams`
  ADD CONSTRAINT `Teams_ibfk_1` FOREIGN KEY (`author_id`) REFERENCES `Users` (`id`);

--
-- Constraints for table `UserToTeam`
--
ALTER TABLE `UserToTeam`
  ADD CONSTRAINT `UserToTeam_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `Users` (`id`),
  ADD CONSTRAINT `UserToTeam_ibfk_2` FOREIGN KEY (`id_team`) REFERENCES `Teams` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
