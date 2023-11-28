-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2023. Nov 24. 13:50
-- Kiszolgáló verziója: 10.4.28-MariaDB
-- PHP verzió: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `project_database`
--
CREATE DATABASE IF NOT EXISTS `project_database` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_hungarian_ci;
USE `project_database`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `effect`
--

CREATE TABLE `effect` (
  `id` int(11) NOT NULL,
  `Type` varchar(10) DEFAULT NULL,
  `Target` varchar(50) DEFAULT NULL,
  `Target_id` int(11) DEFAULT NULL,
  `effect` varchar(255) DEFAULT NULL,
  `effect_id` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `god`
--

CREATE TABLE `god` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `god_abilities`
--

CREATE TABLE `god_abilities` (
  `id` int(11) NOT NULL,
  `Type_id` tinyint(4) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Ability_type` varchar(255) DEFAULT NULL,
  `Ability_id_type` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Location_id` int(11) DEFAULT NULL,
  `IMG` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `map`
--

CREATE TABLE `map` (
  `id` int(11) NOT NULL,
  `IMG` varchar(255) DEFAULT NULL,
  `Location_name` varchar(255) DEFAULT NULL,
  `Location_id` int(11) DEFAULT NULL,
  `Path_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `npc`
--

CREATE TABLE `npc` (
  `id` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Location_id` int(11) DEFAULT NULL,
  `Faithfull` tinyint(1) DEFAULT NULL,
  `Faithful_cost` int(11) DEFAULT NULL,
  `Faith` int(11) DEFAULT NULL,
  `NPC_id` int(11) DEFAULT NULL,
  `Welcome_txt` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `npc_action`
--

CREATE TABLE `npc_action` (
  `id` int(11) NOT NULL,
  `NPC_id` int(11) DEFAULT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Cost` decimal(19,2) DEFAULT NULL,
  `Type` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `paths`
--

CREATE TABLE `paths` (
  `id` int(11) NOT NULL,
  `Path_start` varchar(50) DEFAULT NULL,
  `Path_end` varchar(50) DEFAULT NULL,
  `Path_id` int(11) DEFAULT NULL,
  `Secret` tinyint(1) DEFAULT NULL,
  `Path_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `runing_data`
--

CREATE TABLE `runing_data` (
  `id` int(11) NOT NULL,
  `Actual_place` varchar(100) NOT NULL,
  `Actual_place_id` int(11) DEFAULT NULL,
  `All_faith` int(11) NOT NULL,
  `All_hour` int(11) NOT NULL,
  `Used_hours` int(11) NOT NULL,
  `Followers` int(11) NOT NULL,
  `Hours_since_last_sleep` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `settings`
--

CREATE TABLE `settings` (
  `id` int(11) NOT NULL,
  `End_game_hour` int(11) DEFAULT NULL,
  `Win_faith_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_hungarian_ci;

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `effect`
--
ALTER TABLE `effect`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `god`
--
ALTER TABLE `god`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Type_id` (`Type_id`);

--
-- A tábla indexei `god_abilities`
--
ALTER TABLE `god_abilities`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `npc`
--
ALTER TABLE `npc`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `npc_action`
--
ALTER TABLE `npc_action`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `paths`
--
ALTER TABLE `paths`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `runing_data`
--
ALTER TABLE `runing_data`
  ADD PRIMARY KEY (`id`);

--
-- A tábla indexei `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `effect`
--
ALTER TABLE `effect`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `god`
--
ALTER TABLE `god`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT a táblához `god_abilities`
--
ALTER TABLE `god_abilities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT a táblához `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `map`
--
ALTER TABLE `map`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `npc`
--
ALTER TABLE `npc`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `npc_action`
--
ALTER TABLE `npc_action`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `paths`
--
ALTER TABLE `paths`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT a táblához `runing_data`
--
ALTER TABLE `runing_data`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT a táblához `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `god`
--
ALTER TABLE `god`
  ADD CONSTRAINT `god_ibfk_1` FOREIGN KEY (`Type_id`) REFERENCES `runing_data` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
