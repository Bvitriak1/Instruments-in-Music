-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: localhost
-- Время создания: Янв 18 2025 г., 18:52
-- Версия сервера: 10.4.28-MariaDB
-- Версия PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `music_db`
--

CREATE DATABASE IF NOT EXISTS `music_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `music_db`;

-- --------------------------------------------------------

--
-- Структура таблицы `instruments`
--

CREATE TABLE `instruments` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `instruments`
--

INSERT INTO `instruments` (`id`, `name`, `description`) VALUES
(1, 'Гитара', 'Струнный музыкальный инструмент, который обычно играют, щипая или проводя по струнам медиатором или пальцами. Широко используется в роке, джазе и блюзе.'),
(2, 'Барабаны', 'Перкуссионный инструмент, состоящий из полого корпуса, обычно покрытого кожей или пластиковым мембраной, по которому играют, нанося удары. Важен в таких жанрах как рок и джаз.'),
(3, 'Пианино', 'Клавишный музыкальный инструмент, в котором струны ударяются молоточками, управляемыми клавишами. Используется в классической музыке, джазе и поп-музыке.'),
(4, 'Скрипка', 'Струнный инструмент, играемый смычком. Отличается выразительным звучанием и является важным инструментом в оркестрах классической музыки.'),
(5, 'Бас-гитара', 'Струнный инструмент с четырьмя струнами, настроенными ниже, чем у обычной гитары. Отвечает за ритм и гармонию в роке, джазе и поп-музыке.'),
(6, 'Саксофон', 'Медный духовой инструмент, часто ассоциируемый с джазовой музыкой. Издает уникальный звук, создаваемый колебанием трости на мундштуке.'),
(7, 'Трубка', 'Медный духовой инструмент с тремя клапанами, часто используемый в джазе и классической музыке. Обладает ярким звучанием, которое хорошо слышно на фоне других инструментов.'),
(8, 'Флейта', 'Духовой инструмент, в котором играют, дув в отверстие на мундштуке. Известна своим ярким и чистым звучанием, используется в классической музыке.'),
(9, 'Клавишные', 'Электронный музыкальный инструмент, который использует клавишу для воспроизведения различных звуков. Может имитировать звуки пианино, органа или синтезатора.'),
(10, 'Виолончель', 'Струнный инструмент, который больше по размеру, чем скрипка, и играется смычком. Важен в классической музыке и известен своим глубоким, насыщенным звучанием.');

-- --------------------------------------------------------

--
-- Структура таблицы `songs`
--

CREATE TABLE `songs` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `genre` varchar(100) DEFAULT NULL,
  `instruments` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Дамп данных таблицы `songs`
--

INSERT INTO `songs` (`id`, `name`, `genre`, `instruments`) VALUES
(1, 'Bohemian Rhapsody', 'Рок', 'Гитара, Барабаны, Пианино'),
(2, 'Imagine', 'Поп', 'Пианино, Гитара'),
(3, 'Hotel California', 'Рок', 'Гитара, Барабаны, Бас-гитара'),
(4, 'Smoke on the Water', 'Рок', 'Гитара, Барабаны, Бас-гитара'),
(5, 'Take Five', 'Джаз', 'Саксофон, Барабаны, Пианино'),
(6, 'Yesterday', 'Поп', 'Гитара, Пианино'),
(7, 'What a Wonderful World', 'Джаз', 'Трубка, Пианино, Бас-гитара'),
(8, 'Clocks', 'Поп', 'Пианино, Гитара, Барабаны'),
(9, 'Vivaldi Spring', 'Классика', 'Скрипка, Виолончель, Пианино'),
(10, 'My Heart Will Go On', 'Поп', 'Пианино, Скрипка, Гитара');

--
-- Индексы таблицы `instruments`
--
ALTER TABLE `instruments`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `songs`
--
ALTER TABLE `songs`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для таблицы `instruments`
--
ALTER TABLE `instruments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `songs`
--
ALTER TABLE `songs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
