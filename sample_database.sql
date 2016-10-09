SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


-- --------------------------------------------------------

--
-- Table structure for table `items`
--

CREATE TABLE `items` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `items`
--

INSERT INTO `items` (`id`, `user_id`, `title`, `description`, `created_at`, `updated_at`) VALUES
(2, 1, 'aaaaaaaaaaa555r', 'dsadasdas', '2016-10-07 11:52:11', '2016-10-08 11:35:25'),
(10, 1, 'bvnbvnbv', 'fsdfs', '2016-10-07 11:53:13', '2016-10-07 11:53:13'),
(13, 1, 'итем 1', 'дескриптион', '2016-10-07 12:24:14', '2016-10-07 12:24:14'),
(15, 1, 'dsadsaffffffffffffff', 'д дасд асд адс дса', '2016-10-07 12:48:20', '2016-10-08 18:39:28'),
(62, 1, 'dsdsalll', 'dsadas', '2016-10-08 13:40:01', '2016-10-08 13:47:22'),
(64, 1, 'dsdsalllddd', 'dsadas', '2016-10-08 18:37:15', '2016-10-09 04:24:53');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`migration`, `batch`) VALUES
('2014_10_12_000000_create_users_table', 1),
('2014_10_12_100000_create_password_resets_table', 1),
('2016_10_07_094510_create_items_table', 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `password_resets`
--


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `api_token` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `api_token`, `remember_token`, `created_at`, `updated_at`) VALUES
'2016-10-07 06:29:45', '2016-10-08 13:16:31'),
(1, 'Tester', 'testuser@test.com', '$2y$10$5t5lGynkbxV4X8t3sysbPOqW5HrfSIUgEYdg5Od8rqw54/kACUx2G', 'o1kJ8NxVh4bWYAf0ewWxTnFc04kGJwRKpgPfifnQno3HeHhfdmvBmY979hcH', 'vOGs06u7T3KUGZZhF9Vtf4SGgYONeLpQU2U0ipEWH1GSR7uIS96FUbrcyTlF', '2016-10-08 09:31:46', '2016-10-08 12:30:04'),
(2, 'Tester', 'tester@test.com', '$2y$10$e3xrC9ynnfMQkNghPKW8b.bRw5LgjKeoL2rS5BdWdf47myL/8NrkC', 'aRVIU4E6JQ1cDK2YCJjiUzEwu5QvTsXmELTHgZqzR6qJ1esyHWX7FMKc8pm1', NULL, NULL, NULL),
(3, 'gfdgfd', 'gdf@fdsf.com', '$2y$10$KtOSbh1DwTpQfNpS8ZDveuefmcWbiYDu8m4ylv8Y6bbLmuLIJklYG', 'Yd6YdqqfTUcPap8Dl4pNJESgR7EbLymRzRa9UWgH2y90D9MM8Ov8aNEsaqHX', 'aotS55A5DNC89sg7bDBzAlT0qgqlsTB7D4K48ovVJa51T7n0fJbx7t6vUq0t', '2016-10-08 13:16:45', '2016-10-09 04:24:45');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `items_title_unique` (`title`),
  ADD KEY `items_user_id_foreign` (`user_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`),
  ADD KEY `password_resets_token_index` (`token`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`),
  ADD UNIQUE KEY `users_api_token_unique` (`api_token`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `items`
--
ALTER TABLE `items`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=132;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
