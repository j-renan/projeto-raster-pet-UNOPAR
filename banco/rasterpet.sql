-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 19-Out-2019 às 19:10
-- Versão do servidor: 10.4.6-MariaDB
-- versão do PHP: 7.2.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rasterpet`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_10_17_153327_create_tutors_table', 1),
(5, '2019_10_17_153632_create_pets_table', 1),
(6, '2019_10_17_154006_create_rastreadors_table', 1),
(7, '2019_10_17_154159_create_pet_rastreadors_table', 1),
(8, '2019_10_17_154356_create_pet_rastreador_dados_table', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pets`
--

CREATE TABLE `pets` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idade` int(11) NOT NULL,
  `sexo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tutor_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pets`
--

INSERT INTO `pets` (`id`, `nome`, `tipo`, `idade`, `sexo`, `tutor_id`) VALUES
(1, 'Nino', 'Peixe', 1, 'Masculino', 1),
(2, 'Sara', 'Ave', 2, 'Feminino', 2),
(3, 'Lessi', 'Cachorro', 5, 'Feminino', 3),
(4, 'Kiko', 'Ave', 3, 'Masculino', 4);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pet_rastreadors`
--

CREATE TABLE `pet_rastreadors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `pet_id` bigint(20) UNSIGNED NOT NULL,
  `rastreador_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pet_rastreadors`
--

INSERT INTO `pet_rastreadors` (`id`, `pet_id`, `rastreador_id`) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 1),
(4, 4, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pet_rastreador_dados`
--

CREATE TABLE `pet_rastreador_dados` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data` date NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `pet_rastreador_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `pet_rastreador_dados`
--

INSERT INTO `pet_rastreador_dados` (`id`, `data`, `latitude`, `longitude`, `pet_rastreador_id`) VALUES
(1, '2019-10-18', -22.72163156883816, -47.63814099133015, 1),
(2, '2019-10-18', -22.72104274390506, -47.637754417955875, 1),
(3, '2019-10-18', -22.721469827788063, -47.63691287487745, 1),
(4, '2019-10-18', -22.722142459006413, -47.63728838413954, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `rastreadors`
--

CREATE TABLE `rastreadors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `data_ativacao` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `rastreadors`
--

INSERT INTO `rastreadors` (`id`, `data_ativacao`) VALUES
(1, '2019-10-18'),
(2, '2019-10-18');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tutors`
--

CREATE TABLE `tutors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `telefone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Extraindo dados da tabela `tutors`
--

INSERT INTO `tutors` (`id`, `nome`, `email`, `telefone`, `senha`) VALUES
(1, 'Moisés Olimpio', 'moiza.olimpio@gmail.com', '19999343867', '$2y$10$Snl9/3toyBaAvIx8hfDcM.DY5Hnt18MGm2ajJUsdWKL.pkXyRAEOi'),
(2, 'Renan Celso', 'renan.celso@gmail.com', '19999343869', '$2y$10$dqlM8ydUlqYBzr9c8bh54Oh4lVllzJQmatWzVm6ew0oYdZFA8q2wa'),
(3, 'Dayane Januário', 'dayane.januario@gmail.com', '19999343868', '$2y$10$snKwKPOe86djA1OXDhhtBuL4s0TbN9i1UOgp7dCBTCczWKAVFfO4W'),
(4, 'Valquiria Godoy', 'valquiria.godoy@gmail.com', '19999343860', '$2y$10$Yndg0U/Qmr2Reb5nYndKyOzqBGS64N2hlVpawwGgrVVSfkO1Qf7LW');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Índices para tabela `pets`
--
ALTER TABLE `pets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pets_tutor_id_foreign` (`tutor_id`);

--
-- Índices para tabela `pet_rastreadors`
--
ALTER TABLE `pet_rastreadors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pet_rastreadors_pet_id_foreign` (`pet_id`),
  ADD KEY `pet_rastreadors_rastreador_id_foreign` (`rastreador_id`);

--
-- Índices para tabela `pet_rastreador_dados`
--
ALTER TABLE `pet_rastreador_dados`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pet_rastreador_dados_pet_rastreador_id_foreign` (`pet_rastreador_id`);

--
-- Índices para tabela `rastreadors`
--
ALTER TABLE `rastreadors`
  ADD PRIMARY KEY (`id`);

--
-- Índices para tabela `tutors`
--
ALTER TABLE `tutors`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `tutors_email_unique` (`email`),
  ADD UNIQUE KEY `tutors_telefone_unique` (`telefone`);

--
-- Índices para tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `pets`
--
ALTER TABLE `pets`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pet_rastreadors`
--
ALTER TABLE `pet_rastreadors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `pet_rastreador_dados`
--
ALTER TABLE `pet_rastreador_dados`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `rastreadors`
--
ALTER TABLE `rastreadors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de tabela `tutors`
--
ALTER TABLE `tutors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `pets`
--
ALTER TABLE `pets`
  ADD CONSTRAINT `pets_tutor_id_foreign` FOREIGN KEY (`tutor_id`) REFERENCES `tutors` (`id`);

--
-- Limitadores para a tabela `pet_rastreadors`
--
ALTER TABLE `pet_rastreadors`
  ADD CONSTRAINT `pet_rastreadors_pet_id_foreign` FOREIGN KEY (`pet_id`) REFERENCES `pets` (`id`),
  ADD CONSTRAINT `pet_rastreadors_rastreador_id_foreign` FOREIGN KEY (`rastreador_id`) REFERENCES `rastreadors` (`id`);

--
-- Limitadores para a tabela `pet_rastreador_dados`
--
ALTER TABLE `pet_rastreador_dados`
  ADD CONSTRAINT `pet_rastreador_dados_pet_rastreador_id_foreign` FOREIGN KEY (`pet_rastreador_id`) REFERENCES `pet_rastreadors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
