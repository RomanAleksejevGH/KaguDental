-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 14 2022 г., 10:36
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `kagudental`
--

-- --------------------------------------------------------

--
-- Структура таблицы `coment`
--

CREATE TABLE `coment` (
  `id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL COMMENT 'user_name',
  `date` date NOT NULL DEFAULT current_timestamp(),
  `doctor_id` varchar(100) NOT NULL,
  `rating_id` int(5) NOT NULL,
  `coment_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `coment`
--

INSERT INTO `coment` (`id`, `name`, `date`, `doctor_id`, `rating_id`, `coment_text`) VALUES
(21, '111', '2022-06-12', 'Doctor1', 1, '11111'),
(22, '222', '2022-06-12', 'Doctor2', 2, '22222'),
(23, '3333', '2022-06-12', 'Doctor3', 3, 'asda'),
(24, '5', '2022-06-12', 'Doctor3', 5, '555'),
(25, 'asda', '2022-06-12', 'Doctor1', 4, 'sadas'),
(26, 'asda', '2022-06-12', 'Doctor1', 4, 'asdasd'),
(27, 'asda', '2022-06-12', 'Doctor1', 4, 'asdads'),
(28, 'asda', '2022-06-12', 'Doctor1', 4, 'asdaa'),
(29, 'asda', '2022-06-12', 'Doctor1', 4, 'asdasd'),
(30, 'asda', '2022-06-12', 'Doctor1', 4, 'aadasd'),
(31, 'asda', '2022-06-12', 'Doctor1', 4, 'asasdasda'),
(35, 'test', '2022-06-13', 'Doctor1', 5, 'text');

-- --------------------------------------------------------

--
-- Структура таблицы `doctor`
--

CREATE TABLE `doctor` (
  `id` int(11) NOT NULL,
  `doctor_name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `doctor`
--

INSERT INTO `doctor` (`id`, `doctor_name`) VALUES
(1, 'Doctor1'),
(2, 'Doctor2'),
(3, 'Doctor3');

-- --------------------------------------------------------

--
-- Структура таблицы `rating`
--

CREATE TABLE `rating` (
  `id` int(11) NOT NULL,
  `rating_mark` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `rating`
--

INSERT INTO `rating` (`id`, `rating_mark`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `coment`
--
ALTER TABLE `coment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_id` (`doctor_id`,`rating_id`),
  ADD KEY `coment_ibfk_2` (`rating_id`);

--
-- Индексы таблицы `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `doctor_name` (`doctor_name`);

--
-- Индексы таблицы `rating`
--
ALTER TABLE `rating`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rating_mark` (`rating_mark`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `coment`
--
ALTER TABLE `coment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT для таблицы `doctor`
--
ALTER TABLE `doctor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `rating`
--
ALTER TABLE `rating`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `coment`
--
ALTER TABLE `coment`
  ADD CONSTRAINT `coment_ibfk_2` FOREIGN KEY (`rating_id`) REFERENCES `rating` (`rating_mark`),
  ADD CONSTRAINT `coment_ibfk_3` FOREIGN KEY (`doctor_id`) REFERENCES `doctor` (`doctor_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
