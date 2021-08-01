-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 01-Ago-2021 às 21:40
-- Versão do servidor: 10.4.18-MariaDB
-- versão do PHP: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `fetch_chat`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `chat`
--

CREATE TABLE `chat` (
  `id_chat` int(11) NOT NULL,
  `date_chat` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `first_user` int(11) DEFAULT NULL,
  `second_user` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `chat`
--

INSERT INTO `chat` (`id_chat`, `date_chat`, `first_user`, `second_user`) VALUES
(1, '2021-07-31 01:29:04', 14, 1),
(2, '2021-07-31 01:29:22', 14, 10),
(3, '2021-07-31 02:12:25', 14, 3),
(6, '2021-07-31 07:10:36', 3, 14),
(7, '2021-07-31 07:12:36', 3, 1),
(8, '2021-07-31 07:19:34', 1, 13),
(9, '2021-07-31 07:16:43', 1, 4),
(10, '2021-07-31 07:20:59', 1, 6),
(11, '2021-07-31 07:32:08', 6, 9),
(12, '2021-07-31 07:35:18', 6, 3),
(13, '2021-07-31 07:45:02', 3, 2),
(14, '2021-07-31 15:19:04', 3, 11),
(15, '2021-07-31 15:19:14', 3, 9),
(16, '2021-07-31 15:57:48', 3, 10),
(17, '2021-07-31 16:04:16', 11, 13),
(18, '2021-07-31 16:04:20', 3, 13),
(19, '2021-07-31 16:04:53', 11, 12),
(20, '2021-07-31 17:43:32', 12, 10),
(21, '2021-07-31 17:58:01', 12, 4),
(22, '2021-07-31 18:23:32', 12, 14),
(23, '2021-07-31 18:27:03', 12, 13),
(24, '2021-07-31 20:23:20', 1, 2),
(34, '2021-08-01 01:25:48', 16, 1),
(35, '2021-08-01 04:05:15', 12, 6),
(38, '2021-08-01 16:10:32', 12, 7),
(39, '2021-08-01 16:40:19', 12, 1),
(40, '2021-08-01 16:41:59', 6, 2),
(41, '2021-08-01 17:35:11', 2, 4),
(42, '2021-08-01 17:43:28', 3, 12);

-- --------------------------------------------------------

--
-- Estrutura da tabela `chat_msg`
--

CREATE TABLE `chat_msg` (
  `id_msg` int(11) NOT NULL,
  `msg_content` text DEFAULT NULL,
  `date_msg` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `fk_chat` int(11) DEFAULT NULL,
  `who_send` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `chat_msg`
--

INSERT INTO `chat_msg` (`id_msg`, `msg_content`, `date_msg`, `fk_chat`, `who_send`) VALUES
(77, 'oi yen', '2021-08-01 16:42:29', 40, 6),
(78, 'oi geralt', '2021-08-01 16:42:38', 40, 2),
(79, 'como voc&ecirc; est&aacute;?', '2021-08-01 16:42:47', 40, 2),
(80, 'estamos &agrave; sua procuro', '2021-08-01 16:42:59', 40, 6),
(81, 'indo em dire&ccedil;&atilde;o ao esconderijo do Vilgfortz', '2021-08-01 16:43:15', 40, 6),
(82, 'muito am&aacute;vel da sua parte', '2021-08-01 16:43:26', 40, 2),
(83, 'mas se quer continuar vivo, seja l&aacute; com quem estiver, &eacute; melhor ficar longe', '2021-08-01 16:43:47', 40, 2),
(84, 'considere-me morta depois desta conversa', '2021-08-01 16:44:00', 40, 2),
(85, 'Jamais faria isso', '2021-08-01 16:44:14', 40, 6),
(86, 'estamos atravessando um frio de congelar os osssos pra ir ao seu encontro', '2021-08-01 16:44:51', 40, 6),
(87, 'nada vai nos deter', '2021-08-01 16:45:09', 40, 6),
(88, 'vamos encontr&aacute;-la e matar esse filho da puta', '2021-08-01 16:45:25', 40, 6),
(89, 'infelizmente temo que seus devaneios estejam um pouco exagerados dessa vez', '2021-08-01 16:45:54', 40, 2),
(90, 'me perdoe por n&atilde;o t&ecirc;-lo informado dos meus planos, as coisas seriam diferentes se estiv&eacute;ssemos juntos naquela hora em Thanned', '2021-08-01 16:46:44', 40, 2),
(91, 'Eu o amo, Geralt', '2021-08-01 16:47:15', 40, 2),
(92, 'E sempre penso em voc&ecirc;', '2021-08-01 16:47:23', 40, 2),
(93, 'E eu amo voc&ecirc;', '2021-08-01 16:47:41', 40, 6),
(94, 'Estaremos juntos em breve', '2021-08-01 16:47:47', 40, 6),
(95, 'Onde quer que seja', '2021-08-01 16:48:02', 40, 6),
(96, 'J&aacute; que voc&ecirc; n&atilde;o desiste', '2021-08-01 16:49:20', 40, 2),
(97, 'Estarei esperando por voc&ecirc;', '2021-08-01 16:49:36', 40, 2),
(98, 'E acho que &eacute; de alguma import&acirc;ncia inteir&aacute;-lo sobre a situa&ccedil;&atilde;o atual do Vilgefortz', '2021-08-01 16:50:37', 40, 2),
(99, 'Fale', '2021-08-01 16:50:44', 40, 6),
(100, 'Quando Ciri entrou no portal na Torre da Gaivota a energia acumulada gerou uma explos&atilde;o m&aacute;gica poderosa', '2021-08-01 16:51:39', 40, 2),
(101, 'Vilgfortz estava perseguindo Ciri e a explos&atilde;o o atingiu, mais especificamente, atingiu seu rosto. Destruindo metade da sua face', '2021-08-01 16:52:32', 40, 2),
(102, 'Atualmente ele n&atilde;o tem um dos olhos e utiliza uma joia como substituto', '2021-08-01 16:53:06', 40, 2),
(103, 'mas n&atilde;o se engane, mesmo com esse pequeno incidente ele ainda enxerga atrav&eacute;s dos dois olhos', '2021-08-01 16:55:25', 40, 2),
(104, 'obviamente n&atilde;o t&atilde;o bem com o olho atingido', '2021-08-01 16:55:48', 40, 2),
(105, 'tente usar isso a seu favor, j&aacute; que n&atilde;o est&aacute; sozinho', '2021-08-01 16:56:16', 40, 2),
(106, 'muito bem', '2021-08-01 16:56:34', 40, 6),
(107, 'agrade&ccedil;o as informa&ccedil;&otilde;es', '2021-08-01 16:56:42', 40, 6),
(108, 'N&atilde;o poderei ajud&aacute;-lo em um eventual combate', '2021-08-01 17:04:26', 40, 2),
(109, 'minha For&ccedil;a foi totalmente drenada e qualquer esfor&ccedil;o m&aacute;gico significa uma in&uacute;til morte', '2021-08-01 17:05:02', 40, 2),
(110, 'N&atilde;o se preocupe', '2021-08-01 17:05:41', 40, 6),
(111, 'Estou totalmente recuperado do ocorrido em Thanned', '2021-08-01 17:06:18', 40, 6),
(112, 'Al&eacute;m disso, tenho um amigo poderoso ao meu lado', '2021-08-01 17:07:36', 40, 6),
(113, 'Um Vampiro Superior', '2021-08-01 17:07:45', 40, 6),
(114, 'Se sairmos dessa vivos, adoraria saber como um bruxo e um vampiro superior acabaram amigos t&atilde;o pr&oacute;ximos', '2021-08-01 17:08:34', 40, 2),
(115, 'Vai ser um prazer contar', '2021-08-01 17:08:46', 40, 6),
(116, 'Al&eacute;m dos outros prazeres, &eacute; claro', '2021-08-01 17:09:02', 40, 2),
(117, '&Eacute; claro', '2021-08-01 17:10:02', 40, 6),
(118, 'Geralt?', '2021-08-01 17:44:02', 40, 2),
(121, 'Sim', '2021-08-01 17:45:08', 40, 6),
(122, 'Preciso saber como est&aacute; Ciri', '2021-08-01 17:45:19', 40, 2),
(123, 'Voc&ecirc; conseguiu encontr&aacute;-la?', '2021-08-01 17:45:31', 40, 2),
(124, 'Ainda n&atilde;o', '2021-08-01 17:45:47', 40, 6),
(125, 'Mas sinto estar pr&oacute;ximo, &agrave;s vezes parece que ela est&aacute; mais perto do que eu posso imaginar', '2021-08-01 17:46:32', 40, 6),
(126, 'Apesar de bobo, suas intui&ccedil;&otilde;es quanto &agrave; Ciri dificilmente falham', '2021-08-01 17:47:11', 40, 2),
(127, 'Espero que dessa vez n&atilde;o seja diferente', '2021-08-01 17:47:21', 40, 2),
(128, 'E que voc&ecirc; a encontre o mais brevemente poss&iacute;vel', '2021-08-01 17:47:33', 40, 2),
(129, 'Ela n&atilde;o pode cair nas m&atilde;os do Vilgfortz. N&atilde;o pode em hip&oacute;tese alguma, Geralt.', '2021-08-01 17:48:05', 40, 2),
(130, 'Voc&ecirc; descobriu o que esse merda quer dela?', '2021-08-01 17:48:47', 40, 6),
(131, 'N&atilde;o sei direito, mas o ouvi falando sobre a placenta dela. N&atilde;o entendo se ele pretende ter um filho ou cultivar algum tipo de experimento com os genes. Por isso, Geralt; por isso Ciri n&atilde;o pode cair nas m&atilde;os desse filho da puta!!!', '2021-08-01 17:50:25', 40, 2),
(132, 'Tenho que ir. Algu&eacute;m est&aacute; vindo.', '2021-08-01 18:06:58', 40, 2),
(133, 'Aind t&aacute; a&iacute;?', '2021-08-01 19:28:55', 40, 6),
(134, 'Estou sim', '2021-08-01 19:29:25', 40, 2),
(135, 'Conseguiu se localizar?', '2021-08-01 19:29:38', 40, 2),
(136, 'Estou em uma praia cheia de barcos destru&iacute;dos, tem um tipo de fortaleza na enconsta de um penhasco aqui perto', '2021-08-01 19:34:51', 40, 6),
(137, 'Voc&ecirc; chegou', '2021-08-01 19:35:42', 40, 2),
(138, 'Venha at&eacute; mim', '2021-08-01 19:35:46', 40, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `perfil_img` varchar(12) DEFAULT NULL,
  `created` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `username` varchar(70) DEFAULT NULL,
  `email` varchar(70) DEFAULT NULL,
  `pass` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id_user`, `perfil_img`, `created`, `username`, `email`, `pass`) VALUES
(1, 'macaco.png', '2021-07-30 20:00:13', 'JadsonWv', 'jadson@gmail.com', '$2y$10$RD9dsGl3yOdRuS1FPce47eeQ6Nq/mOHRBNPOe7nJYkRv3sYG/Sfwm'),
(2, 'gato.jpg', '2021-07-30 20:00:30', 'Yennefer', 'yen@gmail.com', '$2y$10$CNMEkTXh/ui5S76/rTSNlOVHKDpQEaA0RxyTmFm/jlvTAbKI5Y/qa'),
(3, 'panda.jpg', '2021-07-30 20:00:46', 'gerciane', 'gerciane@gmail.com', '$2y$10$iiEQectfPv.Y3zeTurirO.P0NHU7JHFOTm69lleBSezwbuZ6keVf2'),
(4, 'gamba.jpg', '2021-07-30 20:01:00', 'Cirilla', 'cirilla@gmail.com', '$2y$10$sGceABjw2zdAUE24JHw3lOByoIVVe39rLqDq7NAaUU4I9mCNa1wTq'),
(6, 'boi.jpg', '2021-07-30 20:04:23', 'Geralt', 'geralt@gmail.com', '$2y$10$BVXG1lU1OjtNTEZSMJCSzeEy1mvG3tqjTkmURPZ1HuxasFQMugE1e'),
(7, 'coco.jpg', '2021-07-30 20:04:50', 'Jaskier', 'jaskier@gmail.com', '$2y$10$8/sV/COquVtpFiz.BCMXiOhUnX7qoA9glfGQbdMZBjcCZtd8DFIYe'),
(8, 'panda.jpg', '2021-07-30 20:06:10', 'Fiona', 'cirilla@hotmail.com', '$2y$10$t6bl467.PGxKCEozg8mCOuG6oxQ71FT84Y/HnKDNCV5T6PyQzi8Uq'),
(9, 'gato.jpg', '2021-07-30 20:08:33', 'Fringilla', 'fringilla@gmail.com', '$2y$10$VqCaFlO1MY0DU.LHIDFyRujoZ.FdR69OHSGKE5PMFQI.L8BCje02W'),
(10, 'macaco.png', '2021-07-30 20:09:20', 'angouleme', 'angouleme@gmail.com', '$2y$10$2cqFhFrJ1cSVUhRyB33rMu59HiajDwHCBTLpUN7fqbTztgDglrHHO'),
(11, 'gamba.jpg', '2021-07-30 20:10:06', 'Matilda', 'matilda@gmail.com', '$2y$10$VFXXott75N87jlRW4yJK8uEAnMkiaU1YGagPFhJVFhgFjkWPg6672'),
(12, 'gato.jpg', '2021-07-30 18:24:03', 'mary', 'mary@gmail.com', '$2y$10$TSAolqrYeOlWX7GJfrBKkOAIF7o6j5C4vAwkFO/G4XaBYm4w/80u.'),
(13, 'macaco.png', '2021-07-30 18:43:04', 'Amendobobo', 'amendobobo@gmail.com', '$2y$10$L1bezaxTJSOuLBpToN7lKOGSUZpL9/XNXuQ4pMGTCwr4godTsD9ie'),
(14, 'macaco.png', '2021-07-30 22:24:47', 'jadson', 'jadson@gmail.comdd', '$2y$10$BCPDD8aKh7/9dUkXdcrTJ.BaduhYT2MVBTwFNr/gulVOaiACq6VJ2'),
(15, 'coco.jpg', '2021-08-01 01:18:20', 'Emyr', 'emyr@gmail.com', '$2y$10$XGTxdAToVr59G8M6GOL5s.VeuLHfEHA1Vk3fHIW9atM93BsHWQskS'),
(16, 'panda.jpg', '2021-08-01 01:25:05', 'Essi-Daven', 'essi@gmail.com', '$2y$10$/08JdAEDZ5SdgS.RqTFn1OsHuGdSPKAKyccDE6aUS96t0cbmff9gq'),
(17, 'macaco.png', '2021-08-01 19:31:11', 'vesemir', 'vesemir@gmail.com', '$2y$10$rge3PNmlx43K2f12ta/RV.JD.Ndxfr/JN/m2tMKms3n.953l1k1Nu');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `chat`
--
ALTER TABLE `chat`
  ADD PRIMARY KEY (`id_chat`),
  ADD KEY `first_user` (`first_user`),
  ADD KEY `second_user` (`second_user`);

--
-- Índices para tabela `chat_msg`
--
ALTER TABLE `chat_msg`
  ADD PRIMARY KEY (`id_msg`),
  ADD KEY `fk_chat` (`fk_chat`),
  ADD KEY `who_send` (`who_send`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `chat`
--
ALTER TABLE `chat`
  MODIFY `id_chat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT de tabela `chat_msg`
--
ALTER TABLE `chat_msg`
  MODIFY `id_msg` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=139;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `chat`
--
ALTER TABLE `chat`
  ADD CONSTRAINT `chat_ibfk_1` FOREIGN KEY (`first_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_ibfk_2` FOREIGN KEY (`second_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `chat_msg`
--
ALTER TABLE `chat_msg`
  ADD CONSTRAINT `chat_msg_ibfk_1` FOREIGN KEY (`fk_chat`) REFERENCES `chat` (`id_chat`) ON DELETE CASCADE,
  ADD CONSTRAINT `chat_msg_ibfk_2` FOREIGN KEY (`who_send`) REFERENCES `users` (`id_user`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
