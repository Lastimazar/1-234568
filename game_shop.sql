-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1:3306
-- Время создания: Апр 28 2025 г., 11:55
-- Версия сервера: 10.1.48-MariaDB
-- Версия PHP: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `game_shop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT '1',
  `session_id` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `genre` varchar(100) NOT NULL,
  `image_url` varchar(255) NOT NULL,
  `release_date` date NOT NULL,
  `developer` varchar(100) NOT NULL,
  `platform` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `products`
--

INSERT INTO `products` (`id`, `name`, `description`, `price`, `genre`, `image_url`, `release_date`, `developer`, `platform`) VALUES
(1, 'Cyberpunk 2077', 'Приключенческая ролевая игра в открытом мире, в которой происходит в Найт-Сити — мегаполисе будущего, где власть, роскошь и модификации тела ценятся выше всего.', '10000.00', 'RPG', 'cp2077.jpg', '2020-12-10', 'CD Projekt Red', 'PC, PS4, PS5, Xbox'),
(2, 'The Witcher 3: Wild Hunt', 'Продолжение приключений Геральта из Ривии, ведьмака, охотника на чудовищ. На этот раз перед ним стоит личная задача — найти Цири, Дитя Предназначения.', '39.99', 'RPG', 'wich3.jpg', '2015-05-19', 'CD Projekt Red', 'PC, PS4, Xbox'),
(3, 'Red Dead Redemption 2', 'Артур Морган и другие подручные Датча ван дер Линде в бега. Их банде предстоит участвовать в кражах, грабежах и перестрелках в самом сердце Америки. За ними по пятам идут федеральные агенты и лучшие в стране охотники за головами, а саму банду разрывают внутренние противоречия. Артуру предстоит выбрать, что для него важнее: его собственные идеалы или же верность людям, которые его взрастили.', '49.99', 'Action', 'rdr2.jpg', '2018-10-26', 'Rockstar Games', 'PC, PS4, Xbox'),
(4, 'Elden Ring', 'НОВЫЙ ФЭНТЕЗИЙНЫЙ РОЛЕВОЙ БОЕВИК. Восстань, погасшая душа! Междуземье ждёт своего повелителя. Пусть благодать приведёт тебя к Кольцу Элден.', '59.99', 'RPG', 'eldenring.jpg', '2022-02-25', 'FromSoftware', 'PC, PS4, PS5, Xbox'),
(5, 'God of War', 'Отомстив богам Олимпа, Кратос живет в царстве скандинавских божеств и чудовищ. В этом суровом беспощадном мире он должен не только самостоятельно бороться за выживание... но и научить этому сына.', '49.99', 'Action', 'gow.jpg', '2018-04-20', 'Santa Monica Studio', 'PS4, PC'),
(6, 'Clair Obscur: Expedition 33', 'Возглавьте Экспедицию 33 и уничтожьте Художницу, чтобы она никогда больше не смогла нарисовать смерть. Исследуйте мир чудес, созданный на основе Прекрасной эпохи Франции, и побеждайте уникальных врагов в пошаговой ролевой игре с механикой реального времени.', '38.60', 'RPG', 'COE33.jpg', '2025-04-25', 'Sandfall Interactive', 'PC, PS5, Xbox');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
