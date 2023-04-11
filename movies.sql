-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Gegenereerd op: 11 apr 2023 om 12:10
-- Serverversie: 10.4.24-MariaDB
-- PHP-versie: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `movies`
--

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20230405092722', '2023-04-05 11:27:28', 155),
('DoctrineMigrations\\Version20230405093623', '2023-04-05 11:36:26', 181),
('DoctrineMigrations\\Version20230405093807', '2023-04-05 11:38:09', 135);

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `genre`
--

CREATE TABLE `genre` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `genre`
--

INSERT INTO `genre` (`id`, `name`) VALUES
(1, 'komedie'),
(2, 'sciencefiction'),
(3, 'superhero fiction');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint(20) NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `movie`
--

CREATE TABLE `movie` (
  `id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  `top_actor_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `year` int(11) NOT NULL,
  `buget` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `movie`
--

INSERT INTO `movie` (`id`, `genre_id`, `top_actor_id`, `title`, `description`, `year`, `buget`) VALUES
(1, 1, 3, 'Notting Hill', 'William Thacker gelooft zijn ogen niet als Anna Scott, een Amerikaanse filmster, zijn boekwinkel bezoekt. Hij voelt zich tot haar en haar ongewone leven aangetrokken en er ontwikkelt zich tussen hen een fragiele liefde die zwaar beproefd wordt.', 1999, '4200000.00'),
(2, 2, 2, 'Deadpool', 'Wade Wilson wordt door een gestoorde wetenschapper gemarteld maar ook van superkrachten voorzien. Gewapend met zijn krachten - en gevoel voor humor - besluit hij wraak te nemen.', 2016, '0.00'),
(3, 1, 1, 'Red Notice', 'Interpol-agent John Hartley wordt opgedragen de meest gezochte kunstdief ter wereld op te sporen. Tijdens zijn zoektocht kruist zijn pad dat van Nolan Booth, de beruchte zwendelaar. Noodgedwongen slaan ze de handen ineen.', 2021, '700000.00'),
(4, 2, 4, 'Avatars', 'Een avatar is een plaatje dat als gebruikersafbeelding op het internet gehanteerd wordt, bijvoorbeeld op internetforums als Twitter of in chatprogramma\'s als Windows Live Messenger.', 2009, '0.00'),
(5, 3, 5, 'Avengers: Endgame', 'Tony Stark vaart stuurloos door de ruimte zonder eten of drinken. Terwijl zijn zuurstofvoorraad begint af te nemen, stuurt hij een bericht naar Pepper Potts.', 2019, '0.00');

-- --------------------------------------------------------

--
-- Tabelstructuur voor tabel `top_actor`
--

CREATE TABLE `top_actor` (
  `id` int(11) NOT NULL,
  `fname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Gegevens worden geëxporteerd voor tabel `top_actor`
--

INSERT INTO `top_actor` (`id`, `fname`, `lname`) VALUES
(1, 'Dwayne', 'Johnsen'),
(2, 'Ryan ', 'Reynolds'),
(3, 'Julia', 'Roberts'),
(4, 'Zoe', 'Saldana'),
(5, 'Chris ', 'Hemsworth');

--
-- Indexen voor geëxporteerde tabellen
--

--
-- Indexen voor tabel `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Indexen voor tabel `genre`
--
ALTER TABLE `genre`
  ADD PRIMARY KEY (`id`);

--
-- Indexen voor tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E0FB7336F0` (`queue_name`),
  ADD KEY `IDX_75EA56E0E3BD61CE` (`available_at`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Indexen voor tabel `movie`
--
ALTER TABLE `movie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_1D5EF26F4296D31F` (`genre_id`),
  ADD KEY `IDX_1D5EF26FB1EF3806` (`top_actor_id`);

--
-- Indexen voor tabel `top_actor`
--
ALTER TABLE `top_actor`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT voor geëxporteerde tabellen
--

--
-- AUTO_INCREMENT voor een tabel `genre`
--
ALTER TABLE `genre`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT voor een tabel `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT voor een tabel `movie`
--
ALTER TABLE `movie`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT voor een tabel `top_actor`
--
ALTER TABLE `top_actor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Beperkingen voor geëxporteerde tabellen
--

--
-- Beperkingen voor tabel `movie`
--
ALTER TABLE `movie`
  ADD CONSTRAINT `FK_1D5EF26F4296D31F` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`),
  ADD CONSTRAINT `FK_1D5EF26FB1EF3806` FOREIGN KEY (`top_actor_id`) REFERENCES `top_actor` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
