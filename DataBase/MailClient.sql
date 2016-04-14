-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 14 2016 г., 17:34
-- Версия сервера: 5.5.48
-- Версия PHP: 7.0.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `MailClient`
--

-- --------------------------------------------------------

--
-- Структура таблицы `Basket`
--

CREATE TABLE IF NOT EXISTS `Basket` (
  `id` int(10) unsigned NOT NULL,
  `mail_id` int(10) unsigned NOT NULL,
  `recipient_id` int(10) unsigned NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Drafts`
--

CREATE TABLE IF NOT EXISTS `Drafts` (
  `id` int(10) unsigned NOT NULL,
  `mail_id` int(10) unsigned NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Files`
--

CREATE TABLE IF NOT EXISTS `Files` (
  `id` int(10) unsigned NOT NULL,
  `path_to_file` varchar(1000) NOT NULL,
  `mail_id` int(10) unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Inbox`
--

CREATE TABLE IF NOT EXISTS `Inbox` (
  `id` int(10) unsigned NOT NULL,
  `mail_id` int(10) unsigned NOT NULL,
  `recipient_id` int(10) unsigned NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Inbox`
--

INSERT INTO `Inbox` (`id`, `mail_id`, `recipient_id`, `add_date`) VALUES
(1, 1, 1, '2016-04-14 12:11:50');

-- --------------------------------------------------------

--
-- Структура таблицы `Outbox`
--

CREATE TABLE IF NOT EXISTS `Outbox` (
  `id` int(10) unsigned NOT NULL,
  `mail_id` int(10) unsigned NOT NULL,
  `recipient_id` int(10) unsigned NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Outbox`
--

INSERT INTO `Outbox` (`id`, `mail_id`, `recipient_id`, `add_date`) VALUES
(1, 1, 1, '2016-04-14 12:11:50');

-- --------------------------------------------------------

--
-- Структура таблицы `Spam`
--

CREATE TABLE IF NOT EXISTS `Spam` (
  `id` int(10) unsigned NOT NULL,
  `mail_id` int(10) unsigned NOT NULL,
  `recipient_id` int(10) unsigned NOT NULL,
  `add_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `Users`
--

CREATE TABLE IF NOT EXISTS `Users` (
  `id` int(10) unsigned NOT NULL,
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Users`
--

INSERT INTO `Users` (`id`, `firstname`, `lastname`, `email`, `password`) VALUES
(1, 'Vasya', 'Pupkin', 'a4d9adbac94efe6cb7e0aee9f4a2fde9', '7ffc7d0f10f8887609a61895df758610');

-- --------------------------------------------------------

--
-- Структура таблицы `Writing`
--

CREATE TABLE IF NOT EXISTS `Writing` (
  `id` int(10) unsigned NOT NULL,
  `theme` varchar(50) DEFAULT NULL,
  `body` text,
  `send_user_id` int(10) unsigned NOT NULL,
  `create_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `Writing`
--

INSERT INTO `Writing` (`id`, `theme`, `body`, `send_user_id`, `create_date`) VALUES
(1, 'Theme', '<p>Hello !</p>', 1, '2016-04-14 12:11:50');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Basket`
--
ALTER TABLE `Basket`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_id` (`mail_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Индексы таблицы `Drafts`
--
ALTER TABLE `Drafts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_id` (`mail_id`);

--
-- Индексы таблицы `Files`
--
ALTER TABLE `Files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_id` (`mail_id`);

--
-- Индексы таблицы `Inbox`
--
ALTER TABLE `Inbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_id` (`mail_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Индексы таблицы `Outbox`
--
ALTER TABLE `Outbox`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_id` (`mail_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Индексы таблицы `Spam`
--
ALTER TABLE `Spam`
  ADD PRIMARY KEY (`id`),
  ADD KEY `mail_id` (`mail_id`),
  ADD KEY `recipient_id` (`recipient_id`);

--
-- Индексы таблицы `Users`
--
ALTER TABLE `Users`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `Writing`
--
ALTER TABLE `Writing`
  ADD PRIMARY KEY (`id`),
  ADD KEY `send_user_id` (`send_user_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Basket`
--
ALTER TABLE `Basket`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Drafts`
--
ALTER TABLE `Drafts`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Files`
--
ALTER TABLE `Files`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Inbox`
--
ALTER TABLE `Inbox`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `Outbox`
--
ALTER TABLE `Outbox`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `Spam`
--
ALTER TABLE `Spam`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT для таблицы `Users`
--
ALTER TABLE `Users`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `Writing`
--
ALTER TABLE `Writing`
  MODIFY `id` int(10) unsigned NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=2;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Basket`
--
ALTER TABLE `Basket`
  ADD CONSTRAINT `basket_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `Writing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `basket_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Drafts`
--
ALTER TABLE `Drafts`
  ADD CONSTRAINT `drafts_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `Writing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Files`
--
ALTER TABLE `Files`
  ADD CONSTRAINT `files_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `Writing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Inbox`
--
ALTER TABLE `Inbox`
  ADD CONSTRAINT `inbox_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `Writing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inbox_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Outbox`
--
ALTER TABLE `Outbox`
  ADD CONSTRAINT `outbox_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `Writing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `outbox_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Spam`
--
ALTER TABLE `Spam`
  ADD CONSTRAINT `spam_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `Writing` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `spam_ibfk_2` FOREIGN KEY (`recipient_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ограничения внешнего ключа таблицы `Writing`
--
ALTER TABLE `Writing`
  ADD CONSTRAINT `writing_ibfk_1` FOREIGN KEY (`send_user_id`) REFERENCES `Users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
