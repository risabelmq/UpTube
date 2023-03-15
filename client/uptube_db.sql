-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13-Jan-2023 às 11:51
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `uptube`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `achievements`
--

CREATE TABLE `achievements` (
  `achievements_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL,
  `ranking` varchar(45) NOT NULL,
  `achievement_level_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `achievements`
--

INSERT INTO `achievements` (`achievements_id`, `name`, `ranking`, `achievement_level_id`) VALUES
(1, 'Adoram-me', '100 likes', 1),
(2, 'Adoram-me', '20 likes', 2),
(3, 'Adoram-me', '5 likes', 3),
(4, 'Influencer', '1000 views', 1),
(5, 'Influencer', '200 views', 2),
(6, 'Influencer', ' 50 views', 3),
(7, 'Rising star', '20 followers', 1),
(8, 'Rising star', '5 followers', 2),
(9, 'Rising star', '1 followers', 3),
(10, 'Socielate', '200 comments', 1),
(11, 'Socielate', '50 comments', 2),
(12, 'Socielate', '10 comments', 3),
(14, 'Só a começar', '0  videos', NULL),
(15, 'Stalker', '20 subscriptions', 1),
(16, 'Stalker', '10 subscriptions', 2),
(17, 'Stalker', '5 subscriptions', 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `achievement_level`
--

CREATE TABLE `achievement_level` (
  `achievement_level_id` int(11) NOT NULL,
  `level` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `achievement_level`
--

INSERT INTO `achievement_level` (`achievement_level_id`, `level`) VALUES
(1, 'Gold'),
(2, 'Silver'),
(3, 'Bronze');

-- --------------------------------------------------------

--
-- Estrutura da tabela `comments`
--

CREATE TABLE `comments` (
  `comment_id` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `comment` longtext NOT NULL,
  `sender_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `feedback`
--

CREATE TABLE `feedback` (
  `feedback_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `feedback` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notifications`
--

CREATE TABLE `notifications` (
  `notification_id` int(11) NOT NULL,
  `sender_id` int(11) DEFAULT NULL,
  `receiver_id` int(11) NOT NULL,
  `comment_id` int(11) DEFAULT NULL,
  `seen` tinyint(1) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `notifications_type`
--

CREATE TABLE `notifications_type` (
  `type_id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL,
  `send_notification` tinyint(1) NOT NULL,
  `send_email` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `notifications_type`
--

INSERT INTO `notifications_type` (`type_id`, `type`, `send_notification`, `send_email`) VALUES
(1, 'Like video', 1, 0),
(2, 'dislike video', 1, 0),
(3, 'comment', 1, 0),
(4, 'subscription', 1, 1),
(5, 'sign up', 0, 1),
(6, 'password recovery', 0, 1),
(7, 'report warning', 1, 1),
(8, 'report channel suspension', 0, 1),
(9, 'report banned', 0, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `playlist`
--

CREATE TABLE `playlist` (
  `playlist_id` int(11) NOT NULL,
  `title` varchar(45) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp(),
  `creator_id` int(11) NOT NULL,
  `thumbnail` varchar(100) NOT NULL,
  `visibility` enum('public','private') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `playlist`
--

INSERT INTO `playlist` (`playlist_id`, `title`, `timestamp`, `creator_id`, `thumbnail`, `visibility`) VALUES
(1, 'Videos para adormecer', '2022-11-13 18:33:17', 1, 'http://localhost:5000/header/photo-28.jpg', 'public'),
(2, 'Fails', '2022-11-14 20:15:18', 1, 'url/imagens/imagem7', 'public'),
(3, 'playlist3', '2022-12-13 16:21:55', 1, 'url/imagens/imagem1', 'public'),
(4, 'playlist 4', '2022-12-13 16:37:54', 7, 'url/imagens/imagem1', 'public'),
(5, 'playlistTeste', '2022-12-13 13:40:26', 28, 'http://localhost:5000/header/photo-28.jpg', 'public'),
(6, 'playlistTeste 2', '2022-12-20 14:01:56', 28, 'http://localhost:5000/header/photo-28.jpg', 'public'),
(7, 'playlistTeste 3', '2022-12-20 14:02:13', 28, 'http://localhost:5000/header/photo-28.jpg', 'public'),
(8, 'playlistTeste 4', '2022-12-20 14:02:26', 28, 'http://localhost:5000/header/photo-28.jpg', 'public'),
(9, 'banana', '2023-01-08 22:41:50', 28, 'http://localhost:3001/videos/SRIh4qVEc/tn_1.p', 'public'),
(10, 'delete me', '2023-01-08 22:44:55', 28, 'http://localhost:3001/videos/SRIh4qVEc/tn_1.p', 'public'),
(12, 'teste c imagem', '2023-01-08 22:48:13', 28, 'http://localhost:3001/videos/SRIh4qVEc/tn_1.p', 'public'),
(14, 'teste img', '2023-01-08 22:55:53', 28, 'http://localhost:3001/videos/SRIh4qVEc/tn_1.png', 'public'),
(15, 'favoritos', '2023-01-11 19:45:13', 61, 'http://localhost:3001/playlistFiller/noVideoFound.jpg', 'public'),
(16, 'mix louca', '2023-01-11 19:53:57', 61, 'http://localhost:3001/playlistFiller/noVideoFound.jpg', 'public'),
(17, 'Cozinha 5minutos', '2023-01-11 19:54:34', 61, 'http://localhost:3001/playlistFiller/noVideoFound.jpg', 'public'),
(18, 'animais', '2023-01-11 19:54:57', 61, 'http://localhost:3001/playlistFiller/noVideoFound.jpg', 'public'),
(19, 'camarao com pão', '2023-01-11 20:07:26', 61, 'http://localhost:3001/videos/SRIh4qVEc/tn_1.png', 'public'),
(20, 'Playlist final', '2023-01-12 19:40:56', 28, 'http://localhost:3001/header/photo-28.png', 'public'),
(21, 'playlist finalissima', '2023-01-12 19:43:43', 28, 'http://localhost:3001/header/photo-28.png', 'public'),
(22, 'afinal nao', '2023-01-12 19:44:46', 28, 'http://localhost:3001/header/photo-28.png', 'public'),
(23, 'mais 1 vez', '2023-01-12 19:46:31', 28, 'http://localhost:3001/header/photo-28.png', 'public'),
(24, 'hello', '2023-01-12 23:06:48', 28, 'http://localhost:3001/videos/SRIh4qVEc/tn_1.png', 'public'),
(25, 'hello hello', '2023-01-12 23:07:53', 28, 'http://localhost:3001/videos/SRIh4qVEc/tn_1.png', 'public'),
(26, 'arroz', '2023-01-13 00:46:21', 63, 'http://localhost:3001/playlistFiller/noVideoFound.jpg', 'public'),
(27, 'Playlist da Vanessa', '2023-01-13 10:37:13', 61, '/videos/qtUv2-ZfA/tn_2.png', 'public'),
(28, 'Vida Selvagem', '2023-01-13 10:37:53', 64, '/videos/IFJcN8JFjtn_1.png', 'public');

-- --------------------------------------------------------

--
-- Estrutura da tabela `playlist_has_invitees`
--

CREATE TABLE `playlist_has_invitees` (
  `playlist_id` int(11) NOT NULL,
  `invited_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `playlist_has_invitees`
--

INSERT INTO `playlist_has_invitees` (`playlist_id`, `invited_id`) VALUES
(7, 61),
(8, 61),
(15, 28),
(19, 28);

-- --------------------------------------------------------

--
-- Estrutura da tabela `playlist_has_videos`
--

CREATE TABLE `playlist_has_videos` (
  `playlist_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `timestamp_video_add` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `playlist_has_videos`
--

INSERT INTO `playlist_has_videos` (`playlist_id`, `video_id`, `timestamp_video_add`) VALUES
(27, 38, '2023-01-13 10:38:35'),
(27, 39, '2023-01-13 10:38:35'),
(28, 31, '2023-01-13 10:40:37'),
(28, 33, '2023-01-13 10:40:37'),
(28, 34, '2023-01-13 10:40:54'),
(28, 37, '2023-01-13 10:40:54');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reaction`
--

CREATE TABLE `reaction` (
  `user_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `video_id` int(11) NOT NULL,
  `reaction_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `reaction_type`
--

CREATE TABLE `reaction_type` (
  `reaction_type_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `reaction_type`
--

INSERT INTO `reaction_type` (`reaction_type_id`, `name`) VALUES
(1, 'Like'),
(2, 'Dislike');

-- --------------------------------------------------------

--
-- Estrutura da tabela `reports`
--

CREATE TABLE `reports` (
  `report_id` int(11) NOT NULL,
  `report_type_id` varchar(45) NOT NULL,
  `video_id` int(11) DEFAULT NULL,
  `timestamp_report` timestamp NOT NULL DEFAULT current_timestamp(),
  `details` longtext DEFAULT NULL,
  `reporter_id` int(11) NOT NULL,
  `report_state` int(11) NOT NULL,
  `action` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `reports`
--

INSERT INTO `reports` (`report_id`, `report_type_id`, `video_id`, `timestamp_report`, `details`, `reporter_id`, `report_state`, `action`) VALUES
(16, '5', 1, '2023-01-10 17:02:46', 'Péssimo', 61, 1, 'None');

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_state`
--

CREATE TABLE `report_state` (
  `report_state_id` int(11) NOT NULL,
  `report_state_title` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `report_state`
--

INSERT INTO `report_state` (`report_state_id`, `report_state_title`) VALUES
(1, 'solved'),
(2, 'pending');

-- --------------------------------------------------------

--
-- Estrutura da tabela `report_type`
--

CREATE TABLE `report_type` (
  `report_id` int(11) NOT NULL,
  `type` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `report_type`
--

INSERT INTO `report_type` (`report_id`, `type`) VALUES
(1, 'Inappropriate Content'),
(2, 'Violent or Graphic Content'),
(3, 'Hateful Speech'),
(4, 'Spam'),
(5, 'Other');

-- --------------------------------------------------------

--
-- Estrutura da tabela `searchhistory`
--

CREATE TABLE `searchhistory` (
  `search_id` int(11) NOT NULL,
  `input` varchar(45) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `subscriptions`
--

CREATE TABLE `subscriptions` (
  `user_following_id` int(11) NOT NULL,
  `user_followed_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `subscriptions`
--

INSERT INTO `subscriptions` (`user_following_id`, `user_followed_id`, `date`) VALUES
(1, 1, '2023-01-04 13:09:21'),
(1, 61, '2023-01-04 10:51:11'),
(4, 1, '2022-11-14 01:30:54'),
(5, 17, '2022-11-17 13:01:25'),
(6, 18, '2023-01-02 10:40:20'),
(6, 28, '2023-01-02 10:38:47'),
(7, 23, '2023-01-02 10:38:29'),
(8, 1, '2023-01-04 17:05:04'),
(8, 4, '2023-01-02 10:39:07'),
(10, 1, '2022-11-14 21:40:47'),
(11, 6, '2023-01-02 10:38:29'),
(12, 16, '2023-01-02 10:39:31'),
(18, 61, '2023-01-02 10:40:49'),
(19, 8, '2023-01-02 10:39:31'),
(19, 10, '2023-01-02 10:39:07'),
(20, 1, '2023-01-04 16:16:26'),
(21, 23, '2023-01-02 10:38:47'),
(22, 61, '2022-12-14 11:55:13'),
(28, 6, '2023-01-02 10:40:49'),
(61, 1, '2023-01-10 10:19:57'),
(61, 4, '2023-01-10 11:07:19'),
(61, 5, '2023-01-02 10:40:20'),
(61, 7, '2022-12-15 17:27:19'),
(61, 28, '2022-12-16 10:40:31');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tags`
--

CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL,
  `name` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `tags`
--

INSERT INTO `tags` (`tag_id`, `name`) VALUES
(1, 'Comédia'),
(2, 'Drama'),
(3, 'futebol'),
(4, 'Tenis'),
(5, 'Jogos de tabuleiro'),
(6, 'Musica Africana'),
(7, 'Food'),
(8, 'Programming'),
(9, 'Javascript'),
(10, 'Cats');

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `username` varchar(45) DEFAULT NULL,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(60) NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `bio` longtext DEFAULT NULL,
  `photo` varchar(70) NOT NULL DEFAULT 'http://localhost:3001/avatar/photo-undefined.png',
  `header` varchar(70) DEFAULT 'http://localhost:3001/header/header-undefined.png',
  `birthday` date DEFAULT NULL,
  `administrator` tinyint(1) NOT NULL DEFAULT 0,
  `account_opening` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `token_timestamp` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `user`
--

INSERT INTO `user` (`user_id`, `username`, `name`, `email`, `password`, `token`, `bio`, `photo`, `header`, `birthday`, `administrator`, `account_opening`, `token_timestamp`) VALUES
(1, 'FernandoS', 'Fernando', 'fernandoS@hotmail.com', '$2b$10$.of696SgKdJ6sqdeNBA.9eIK65DQNjedLxInI4FTGzSoblGdSnyAW', '973771468cae425ed22d9337bd15bfdef8fe1770dbc91cbf9f17b4ed79df0ebf4dbb2b99d859360c6cd4b42b120a7ae9', 'lelelelelelel', 'http://localhost:3001/avatar/photo-1.jpg', 'http://localhost:3001/header/photo-1.jpg', '0000-00-00', 0, '2023-01-09 14:22:19', '1670951232294'),
(4, 'Sandruxa05', 'Sandra chan', 'sandrachan@mail.com', 'teste123', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'http://localhost:3001/avatar/photo-4.jpg', 'http://localhost:3001/header/photo-4.png', '1975-05-31', 1, '2023-01-13 02:17:57', NULL),
(5, 'Catso', 'Catia Sofia', 'catiasofia@mail.com', 'password', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'http://localhost:3001/avatar/photo-5.jpg', 'http://localhost:3001/header/photo-5.png', '1985-12-01', 1, '2023-01-09 14:22:58', NULL),
(6, 'Oneofthemastermind\'s', 'Vanessa Avila', 'vanessa.3bl@gmail.com', '$2b$10$k8SHPWI76QENP78aS3sixeV5tl3//GSd1L5ehMIwkmQA/3mAw/FUq', NULL, 'Na odisseia da aprendizagem de programação', 'http://localhost:3001/avatar/photo-6.jpg', 'http://localhost:3001/header/photo-6.png', '1984-08-31', 1, '2023-01-09 14:23:22', NULL),
(7, 'Ellonusk', 'Ellon Musk', 'EllyMonk@gmail.com', '1234567', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'http://localhost:3001/avatar/photo-7.jpg', 'http://localhost:3001/header/photo-7.png', '1982-11-30', 0, '2023-01-07 15:06:03', NULL),
(8, 'Billy', 'Bill Gates', 'microBill@gmail.com', 'benfica', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'http://localhost:3001/avatar/photo-8.jpg', 'http://localhost:3001/header/photo-8.jpg', '1952-09-30', 0, '2023-01-13 02:28:36', NULL),
(9, 'AdaLove22', 'Ada Lovelace', 'Ad_love@gmail.com', 'teste123', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'http://localhost:3001/avatar/photo-9.jpg', 'http://localhost:3001/header/photo-9.png', '1996-07-15', 1, '2023-01-07 15:12:32', NULL),
(10, 'MaddamC', 'Madam Curry', 'mcurry@gmail.com', 'teste123', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'http://localhost:3001/avatar/photo-10.jpg', 'http://localhost:3001/header/photo-10.jpg', '1976-02-15', 1, '2023-01-13 02:29:11', NULL),
(11, 'Joker', 'asjkfbkasj', 'fer@gmailc.om', 'fsdfdsf', NULL, 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.', 'http://localhost:3001/avatar/photo-11.jpg', 'http://localhost:3001/header/photo-11.png', '1982-11-30', 1, '2023-01-07 15:12:32', NULL),
(12, 'Gabi', 'Gabriel Pensador', 'Gabi_pensa@gmail.com', '123456', NULL, 'jdsngfijdsnfosdniadsjngidas', 'http://localhost:3001/avatar/photo-12.jpg', 'http://localhost:3001/header/photo-12.png', '1992-11-01', 0, '2023-01-07 15:12:32', NULL),
(13, 'Snowball', 'Otavio Gomes', 'OtaGom@gmail.com', '123456', NULL, 'Have you ever wanted to listen to music that helps you sleep? I have the perfect playlist for you. Whether it\'s a lullaby or a background sound of nature, these melodies will help you fall asleep faster and stay asleep longer. Get to sleep faster with Lullaby BM! ', 'http://localhost:3001/avatar/photo-13.jpg', 'http://localhost:3001/header/photo-13.png', '2022-12-06', 0, '2023-01-07 15:12:32', NULL),
(16, 'Stardust', 'lara pinto', 'lara@gmail.com', '123245', NULL, 'We are here to bring deep insights &\r\ntools to help you understand the omens &\r\nsigns that surround us all 🌙 🍃', 'http://localhost:3001/avatar/photo-16.jpg', 'http://localhost:3001/header/photo-16.png', NULL, 0, '2023-01-07 15:12:32', NULL),
(17, 'Relaxing music', 'Eder', 'eder@gmail.com', '$2b$10$Ii8vUdMce27UEi3KmKzEBOHN1WAHSE5CxcP0TC', NULL, ' Welcome to the new relaxing music live on the channel \"4K Video Nature - Focus Music\". They can leave the video at a low volume and start working on things like studying, working, reading... or just relaxing or sleeping.', 'http://localhost:3001/avatar/photo-17.jpg', 'http://localhost:3001/header/photo-17.png', NULL, 0, '2023-01-07 15:12:32', NULL),
(18, 'Fernando silva', 'Fernando silva', 'fernandoadmin@gmail.com', '$2b$10$vWzCYAW.3PpZnWC0lgMCNu5Fo4qLjTvmRspWN6', NULL, 'Cursos em vídeo totalmente gratuitos.', 'http://localhost:3001/avatar/photo-18.jpg', 'http://localhost:3001/header/photo-18.png', NULL, 0, '2023-01-07 15:12:32', NULL),
(19, 'Dev tips', 'fernando', 'fer@sil.com', '$2b$10$uD.C4WLvBFZOuN8ffkVqDOnLaJqEjjVTiqthMo', NULL, 'Meu último emprego antes de decidir focar 100% no YouTube foi ser CTO do Pagar.me. Lá tive o prazer de ser responsável por um time com mais de 100 pessoas e aprendi MUITO sobre gestão (principalmente gestão de times grandes) e sobre como lidar com tecnologia em escala. Ambos conhecimentos que quero compartilhar nesse canal.', 'http://localhost:3001/avatar/photo-19.jpg', 'http://localhost:3001/header/photo-19.png', NULL, 0, '2023-01-07 15:12:32', NULL),
(20, 'Simply Learn', 'fer', 'fer@sil.pt', '$2b$10$ZvslxG1afx9Dh3m3jeowk.edqG8P3XBUFcNhjL', NULL, 'Simplilearn is the world’s #1 online Bootcamp and one of the world’s leading certification training providers. Based in San Francisco, California, and Bangalore, India, we provide training in areas where technologies and best practices are changing rapidly, and the demand for qualified candidates significantly exceeds the supply. We have trained over 3,000,000 professionals, have over 2000 qualified trainers on board, and offer over 400 courses with 40 plus global accreditations. With live instructions from leading experts, interactive labs & projects, peer-to-peer collaboration, on-demand lessons, and 24/7 learning support, we provide learners with a comprehensive curriculum at a fraction of the cost of an on-campus program. \r\n', 'http://localhost:3001/avatar/photo-20.jpg', 'http://localhost:3001/header/photo-20.png', NULL, 0, '2023-01-07 15:12:32', NULL),
(21, 'Cup of tea', 'tea', 'tea@sil.com', '$2b$10$1aKkVEMDXgYRefobU5Ms.eQQLjDusypbhf3p0C', NULL, 'We make videos about video games. Enjoy our Top 10s, the Friday news show, Before You Buy reviews and first impressions, and more.', 'http://localhost:3001/avatar/photo-21.jpg', 'http://localhost:3001/header/photo-21.png', NULL, 0, '2023-01-07 15:12:32', NULL),
(22, 'Admin', 'admin', 'admin@gmail.com', '$2b$10$s6OjDdXIHKn6xwo3kBwU7udvBttW3UOrVc.X2LVl9paoqmEkfKoPG', NULL, 'Administradores:\r\n\r\nFernando Silva\r\nVanessa Ávila\r\nRita Isabel', 'http://localhost:3001/avatar/photo-22.jpg', 'http://localhost:3001/header/photo-22.png', NULL, 0, '2023-01-07 15:12:32', NULL),
(23, 'Helder Lencastre', 'helder', 'hel@der.com', '$2b$10$yAQe.odKrDzFOur1RpNIm.tGdZFmK5t2bBC2C54cwwCwZOa2RpZYO', NULL, NULL, 'http://localhost:3001/avatar/photo-23.jpg', 'http://localhost:3001/header/photo-23.png', NULL, 0, '2023-01-07 15:12:32', NULL),
(25, 'Martin Scorsese', 'Martim Lobo', 'martinlob@hotmail.com', '$2b$10$3AASQLRg4bR5TBAzk5/t8eQ0rM/9LERqGRIqivXY/KMvuPtEZqe3i', 'efe0f11fee4150b23784bf523d4a3d8825e1bed16eefe3f630a6084cb7049872ca6340e1620dca79856f4a6c87b7bdaa', '🎮 This is a retro gaming channel with heavy emphasis on RPG games, such as Final Fantasy and Chrono Trigger, especially from the NES/SNES era!\r\nBUT going beyond just video games, I also LOVE to talk about table top gaming, such as DUNGEONS & DRAGONS or card games like MAGIC: THE GATHERING!', 'http://localhost:3001/avatar/photo-25.jpg', 'http://localhost:3001/header/photo-25.png', NULL, 0, '2023-01-07 15:12:32', '1669932230159'),
(28, 'Fernando Pro', 'fernando', 'fernandoxslik@gmail.com', '$2b$10$K3THYMNUrlg/AHcPt8VDRelWUg7MPmsbiu8mH5pweFYuj2jQvSAxS', NULL, 'lkasmglkdsmglkmdslkgmdslkmglksmglksdmlgkmdslkgmdslkmglkdsmglkdsmflkds ldkfsmdsklm kdsfm kfmd lkmfdskl mdskl mfdkslm flkldsm flksdm flkdsmkf nsdk fkj jn fdsjkj n skjadnjsandjksandjksandsajkdnsajkdnsajkvdskj dsjk wjkdnsakj FINAL', 'http://localhost:3001/avatar/photo-28.jpg', 'http://localhost:3001/header/photo-28.jpg', '1992-12-25', 0, '2023-01-13 02:29:36', NULL),
(61, 'Vishwakarma', 'Vanessa Avila ', 'nessyfairy@gmail.com', '$2b$10$/9FhHeJC5ZicWPWM/0IfduPVUhnC6h7X1cJZSiFePkv8uKKB5GYdC', NULL, 'Videos about Web Development! ReactJS, NodeJS, MySQL, Express, Javacript and much more!', 'http://localhost:3001/avatar/photo-61.jpg', 'http://localhost:3001/header/photo-61.png', NULL, 1, '2023-01-07 15:12:32', NULL),
(63, 'Antoninho', 'Antonio Costa', 'socrates@gmail.com', '$2b$10$WYzH78ntfOGy3im/IG1Pget.HLulQ0VpA5KVBJq5.eQ8w6EBI7n22', NULL, 'arroz abata hello red true saudkgikjni nia nond aosni ni n inb ij bni  uih uho opuigh iy orb t tfb jrtdfbtufuyk fitf bi nu', 'http://localhost:3001/avatar/photo-63.jpg', 'http://localhost:3001/header/photo-63.jpg', '1992-12-26', 0, '2023-01-13 00:24:59', NULL),
(64, 'National Geographic', 'National Geographic', 'nationalgeographic@email.com', '$2b$10$o6ZroUPBxh3JysR04cg1oO1qlW9ccJPTkBLN3cUmq9oiDWUENI./a', NULL, NULL, 'http://localhost:3001/avatar/photo-64.png', 'http://localhost:3001/header/photo-64.png', NULL, 0, '2023-01-13 09:02:22', NULL),
(65, NULL, 'Everything Javascript', 'javascript@email.com', '$2b$10$p0pN0axtG3x.uFpu74hSuuJYGT9RitSDCjCIGj7XIzFCNDUGTNJ5C', NULL, 'Want to become a professional software engineer? All you need is passion and determination, not a degree. Universities make you pay for the subjects you\'ll never use in the real world.   You can become a software developer right from your bedroom. ', 'http://localhost:3001/avatar/photo-undefined.png', 'http://localhost:3001/header/photo-undefined.jpeg', NULL, 0, '2023-01-13 07:51:31', NULL),
(66, 'Babish Culinary Universe ', 'Babish Culinary Universe ', 'babish@email.com', '$2b$10$arQ/wviQgaI8xz.lRT4eXuTRQtbOi6rsdVgrcIBXtUHKz.hb0lAuq', NULL, 'Binging with Babish is the realization of a young(ish) man\'s dream to combine his love of film and cooking, and to have some fun in the process.  Join us each week as we recreate the foods you\'ve always wanted to try in movies and television - and if you\'re not careful, you just might learn a thing or two.', 'http://localhost:3001/avatar/photo-66.png', 'http://localhost:3001/header/photo-66.png', NULL, 0, '2023-01-13 09:06:25', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `user_has_achievements`
--

CREATE TABLE `user_has_achievements` (
  `user_id` int(11) NOT NULL,
  `achievements_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `user_has_achievements`
--

INSERT INTO `user_has_achievements` (`user_id`, `achievements_id`) VALUES
(1, 14),
(5, 14),
(6, 2),
(6, 14),
(8, 14),
(9, 14),
(28, 14),
(61, 1),
(61, 6),
(61, 7),
(61, 14),
(61, 15);

-- --------------------------------------------------------

--
-- Estrutura da tabela `video`
--

CREATE TABLE `video` (
  `video_id` int(11) NOT NULL,
  `video_key` varchar(20) NOT NULL,
  `title` varchar(100) NOT NULL,
  `thumbnail` varchar(45) NOT NULL,
  `description` longtext NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_id` int(11) NOT NULL,
  `duration` time NOT NULL,
  `url_video` longtext NOT NULL,
  `popularity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `video`
--

INSERT INTO `video` (`video_id`, `video_key`, `title`, `thumbnail`, `description`, `date`, `user_id`, `duration`, `url_video`, `popularity`) VALUES
(31, 'IFJcN8JFj', 'Sunset landscapes', '/videos/IFJcN8JFjtn_1.png', 'Enjoy 10 mins of amazing nature scenery. This video features beautiful nature scenes that are ideal for relaxation and stress relief.    #nature #naturescenery #relaxing  Thank you for watching! I love to create videos and my aim is to show you how beautiful the world is by taking you on a journey with amazing nature scenery and relaxing music!   My videos are ideal for sleep, study, meditation and stress relief. My goal is to provide high quality relaxing content that doesn\'t contain any annoying talking or commentary. If you would like to find out more, please visit my website https://cattrumpetmusic.com/ or consider checking out the Community tab. ', '2023-01-13 04:04:04', 64, '00:33:00', '/videos/IFJcN8JFj/IFJcN8JFj.mp4', NULL),
(33, 't8OUONcQL', 'Flower blossoms', '/videos/t8OUONcQL/tn_2.png', 'In botany, blossoms are the flowers of stone fruit trees and of some other plants with a similar appearance that flower profusely for a period of time in spring. Colloquially, flowers of orange are referred to as such as well. Peach blossoms, most cherry blossoms, and some almond blossoms are usually pink. Wikipedia', '2023-01-13 04:04:20', 64, '03:04:00', '/videos/t8OUONcQL/t8OUONcQL.mp4', NULL),
(34, 'W6jXvZjRJ', 'Waves - Short Cinematic Video', '/videos/W6jXvZjRJ/tn_4.png', 'Waves in my town', '2023-01-13 04:04:34', 64, '01:00:00', '/videos/W6jXvZjRJ/W6jXvZjRJ.mp4', NULL),
(37, 'kNisWdNMh', 'Baby Penguin Tries To Make Friends | Snow Chick: A Penguin\'s Tale | BBC Earth', '/videos/kNisWdNMh/tn_3.png', 'This enchanting film follows the adventures of one charismatic emperor penguin from the time he emerges from the egg to the moment he leaves for the sea. Emperor penguins grow up during the winter in one of the coldest places on Earth - the Antarctic. The conditions are harsh and chicks must endure temperatures of minus 60 degrees Celsius and terrifying blizzards. This film follows the trials and tribulations of one adorable fluffy chick - from his first tentative steps on the ice, to getting lost, to hanging out with the other chicks. It also shows the lengths his parents will go to provide food, overcoming huge obstacles, avoiding predators like leopard seals, and enduring freezing conditions. Full of tense and moving moments as well as comedy and character, Snow Chick follows the emperor penguin\'s life story in a level of detail never attempted before.', '2023-01-13 04:05:12', 64, '04:22:00', '/videos/kNisWdNMh/kNisWdNMh.mp4', NULL),
(38, 'qtUv2-ZfA', 'Kitties', '/videos/qtUv2-ZfA/tn_2.png', 'We\'ve scoured the internet and found the cutest and funniest cat videos of all time. Any we missed? Let us know! What should we count down ...', '2023-01-13 04:11:11', 61, '04:12:00', '/videos/qtUv2-ZfA/qtUv2-ZfA.mp4', NULL),
(39, 'cqp43o-Af', 'This Hawaiian Cat Loves Surfing With His Parents', '/videos/cqp43o-Af/tn_2.png', 'In Honolulu, Hawaii, Hokule\'a is one special cat. He loves surfing and swimming with his human parents!  You can keep up with Hokule’a and all of his surfing adventures on Instagram.', '2023-01-13 04:13:27', 61, '03:32:00', '/videos/cqp43o-Af/cqp43o-Af.mp4', NULL),
(42, 'fUyh7EIzA', 'JavaScript for the Haters', '/videos/fUyh7EIzA/tn_1.png', 'Why does everybody hate JavaScript so much? A complete roast of JS that highlights the strongest criticisms against the world\'s most popular programming language. ', '2023-01-13 07:55:53', 65, '02:49:00', '/videos/fUyh7EIzA/fUyh7EIzA.mp4', NULL),
(43, 'Z2_cSv3XB', 'JavaScript in 100 Seconds', '/videos/Z2_cSv3XB/tn_4.png', 'JavaScript is the the programming language that built the web. Learn how it evolved into a powerful tool for building websites, servers with Node.js, mobile apps, desktop software, and more https://fireship.io/courses/javascript/', '2023-01-13 07:57:53', 65, '02:35:00', '/videos/Z2_cSv3XB/Z2_cSv3XB.mp4', NULL),
(45, 'kABQMORMO', 'What is Javascript?', '/videos/kABQMORMO/tn_2.png', 'What is JavaScript? This short video explains it in 5 minutes', '2023-01-13 08:01:25', 65, '05:11:00', '/videos/kABQMORMO/kABQMORMO.mp4', NULL),
(46, 'pfi8JAJ9Y', 'Bœuf bourguignon sans Alcool', '/videos/pfi8JAJ9Y/tn_3.png', '800 g de bœuf  2 cas d’huile d’olive Un morceau de beurre  1 cas de vinaigre balsamique( facultatif) 2 oignon 2 carottes 1/2 càc de poivre 1 cac de sel 2 gousse d’ail 2 cas de farine Des feuilles de lauriers et quelques brins de thym frais  Des champignons Petits Oignons 1l de bouillon de bœuf  1 cac de concentré de tomate ', '2023-01-13 08:11:47', 66, '03:44:00', '/videos/pfi8JAJ9Y/pfi8JAJ9Y.mp4', NULL),
(47, 'xOZgTvfE6', 'Binging with Babish: Arepas con Queso from Encanto', '/videos/xOZgTvfE6/tn_2.png', 'Quick and easy episode this week folks! Arepas con queso may be the comfort food of choice for family matriarchs who can heal wounds using ancient magic, but they can also be whipped up by anyone with some masarepa (a kind of pre-cooked corn flour) and some cheese. Let\'s see if the shortest-ever episode of Binging is still worth watching!', '2023-01-13 08:13:37', 66, '02:56:00', '/videos/xOZgTvfE6/xOZgTvfE6.mp4', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `video_has_tags`
--

CREATE TABLE `video_has_tags` (
  `video_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `video_has_tags`
--

INSERT INTO `video_has_tags` (`video_id`, `tag_id`) VALUES
(31, 2),
(33, 10),
(34, 2),
(37, 7),
(38, 10),
(39, 10),
(42, 8),
(42, 9),
(43, 8),
(43, 9),
(45, 8);

-- --------------------------------------------------------

--
-- Estrutura da tabela `views`
--

CREATE TABLE `views` (
  `view_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `video_id` int(11) NOT NULL,
  `timestamp_start` datetime NOT NULL,
  `timestamp_end` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `achievements`
--
ALTER TABLE `achievements`
  ADD PRIMARY KEY (`achievements_id`),
  ADD KEY `achievement_level_id` (`achievement_level_id`);

--
-- Índices para tabela `achievement_level`
--
ALTER TABLE `achievement_level`
  ADD PRIMARY KEY (`achievement_level_id`);

--
-- Índices para tabela `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`,`sender_id`) USING BTREE,
  ADD KEY `user_id` (`sender_id`),
  ADD KEY `video_id` (`video_id`);

--
-- Índices para tabela `feedback`
--
ALTER TABLE `feedback`
  ADD PRIMARY KEY (`feedback_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notification_id`),
  ADD KEY `user_id` (`sender_id`),
  ADD KEY `notifications_ibfk_2` (`type_id`),
  ADD KEY `notifications_ibfk_6` (`comment_id`),
  ADD KEY `notifications_ibfk_7` (`receiver_id`);

--
-- Índices para tabela `notifications_type`
--
ALTER TABLE `notifications_type`
  ADD PRIMARY KEY (`type_id`);

--
-- Índices para tabela `playlist`
--
ALTER TABLE `playlist`
  ADD PRIMARY KEY (`playlist_id`,`creator_id`) USING BTREE,
  ADD KEY `creator_id` (`creator_id`);

--
-- Índices para tabela `playlist_has_invitees`
--
ALTER TABLE `playlist_has_invitees`
  ADD PRIMARY KEY (`playlist_id`,`invited_id`),
  ADD KEY `invited_id` (`invited_id`,`playlist_id`) USING BTREE;

--
-- Índices para tabela `playlist_has_videos`
--
ALTER TABLE `playlist_has_videos`
  ADD PRIMARY KEY (`playlist_id`,`video_id`),
  ADD KEY `video_id` (`video_id`,`playlist_id`) USING BTREE;

--
-- Índices para tabela `reaction`
--
ALTER TABLE `reaction`
  ADD PRIMARY KEY (`user_id`,`video_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `reaction_type_id` (`reaction_type_id`) USING BTREE;

--
-- Índices para tabela `reaction_type`
--
ALTER TABLE `reaction_type`
  ADD PRIMARY KEY (`reaction_type_id`);

--
-- Índices para tabela `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`report_id`),
  ADD KEY `video_id` (`video_id`),
  ADD KEY `reporter_id` (`reporter_id`);

--
-- Índices para tabela `report_state`
--
ALTER TABLE `report_state`
  ADD PRIMARY KEY (`report_state_id`);

--
-- Índices para tabela `report_type`
--
ALTER TABLE `report_type`
  ADD PRIMARY KEY (`report_id`) USING BTREE;

--
-- Índices para tabela `searchhistory`
--
ALTER TABLE `searchhistory`
  ADD PRIMARY KEY (`search_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD PRIMARY KEY (`user_following_id`,`user_followed_id`),
  ADD KEY `user_follower_id` (`user_followed_id`);

--
-- Índices para tabela `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`tag_id`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Índices para tabela `user_has_achievements`
--
ALTER TABLE `user_has_achievements`
  ADD PRIMARY KEY (`user_id`,`achievements_id`),
  ADD KEY `achievements_id` (`achievements_id`);

--
-- Índices para tabela `video`
--
ALTER TABLE `video`
  ADD PRIMARY KEY (`video_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Índices para tabela `video_has_tags`
--
ALTER TABLE `video_has_tags`
  ADD PRIMARY KEY (`video_id`,`tag_id`),
  ADD KEY `tag_id` (`tag_id`);

--
-- Índices para tabela `views`
--
ALTER TABLE `views`
  ADD PRIMARY KEY (`view_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `video_id` (`video_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `achievements`
--
ALTER TABLE `achievements`
  MODIFY `achievements_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de tabela `achievement_level`
--
ALTER TABLE `achievement_level`
  MODIFY `achievement_level_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `feedback`
--
ALTER TABLE `feedback`
  MODIFY `feedback_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de tabela `notifications_type`
--
ALTER TABLE `notifications_type`
  MODIFY `type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `playlist`
--
ALTER TABLE `playlist`
  MODIFY `playlist_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT de tabela `reaction_type`
--
ALTER TABLE `reaction_type`
  MODIFY `reaction_type_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `reports`
--
ALTER TABLE `reports`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `report_type`
--
ALTER TABLE `report_type`
  MODIFY `report_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `searchhistory`
--
ALTER TABLE `searchhistory`
  MODIFY `search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tags`
--
ALTER TABLE `tags`
  MODIFY `tag_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de tabela `video`
--
ALTER TABLE `video`
  MODIFY `video_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT de tabela `views`
--
ALTER TABLE `views`
  MODIFY `view_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `achievements`
--
ALTER TABLE `achievements`
  ADD CONSTRAINT `achievements_ibfk_1` FOREIGN KEY (`achievement_level_id`) REFERENCES `achievement_level` (`achievement_level_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `feedback`
--
ALTER TABLE `feedback`
  ADD CONSTRAINT `feedback_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);

--
-- Limitadores para a tabela `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`type_id`) REFERENCES `notifications_type` (`type_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_4` FOREIGN KEY (`sender_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_6` FOREIGN KEY (`comment_id`) REFERENCES `comments` (`comment_id`),
  ADD CONSTRAINT `notifications_ibfk_7` FOREIGN KEY (`receiver_id`) REFERENCES `user` (`user_id`);

--
-- Limitadores para a tabela `playlist`
--
ALTER TABLE `playlist`
  ADD CONSTRAINT `playlist_ibfk_1` FOREIGN KEY (`creator_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `playlist_has_invitees`
--
ALTER TABLE `playlist_has_invitees`
  ADD CONSTRAINT `playlist_has_invitees_ibfk_1` FOREIGN KEY (`invited_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `playlist_has_invitees_ibfk_2` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `playlist_has_videos`
--
ALTER TABLE `playlist_has_videos`
  ADD CONSTRAINT `playlist_has_videos_ibfk_1` FOREIGN KEY (`playlist_id`) REFERENCES `playlist` (`playlist_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `playlist_has_videos_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `reaction`
--
ALTER TABLE `reaction`
  ADD CONSTRAINT `reaction_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reaction_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reaction_ibfk_3` FOREIGN KEY (`reaction_type_id`) REFERENCES `reaction_type` (`reaction_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `searchhistory`
--
ALTER TABLE `searchhistory`
  ADD CONSTRAINT `searchhistory_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `subscriptions`
--
ALTER TABLE `subscriptions`
  ADD CONSTRAINT `subscriptions_ibfk_1` FOREIGN KEY (`user_followed_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subscriptions_ibfk_2` FOREIGN KEY (`user_following_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `user_has_achievements`
--
ALTER TABLE `user_has_achievements`
  ADD CONSTRAINT `user_has_achievements_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `user_has_achievements_ibfk_2` FOREIGN KEY (`achievements_id`) REFERENCES `achievements` (`achievements_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `video`
--
ALTER TABLE `video`
  ADD CONSTRAINT `video_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `video_has_tags`
--
ALTER TABLE `video_has_tags`
  ADD CONSTRAINT `video_has_tags_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `video_has_tags_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limitadores para a tabela `views`
--
ALTER TABLE `views`
  ADD CONSTRAINT `views_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `views_ibfk_2` FOREIGN KEY (`video_id`) REFERENCES `video` (`video_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
