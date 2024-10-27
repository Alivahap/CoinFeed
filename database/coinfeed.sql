-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 27 Eki 2024, 16:02:58
-- Sunucu sürümü: 8.3.0
-- PHP Sürümü: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `coinfeed`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache`
--

DROP TABLE IF EXISTS `cache`;
CREATE TABLE IF NOT EXISTS `cache` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cache_locks`
--

DROP TABLE IF EXISTS `cache_locks`;
CREATE TABLE IF NOT EXISTS `cache_locks` (
  `key` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `owner` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE IF NOT EXISTS `failed_jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `jobs`
--

DROP TABLE IF EXISTS `jobs`;
CREATE TABLE IF NOT EXISTS `jobs` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint UNSIGNED NOT NULL,
  `reserved_at` int UNSIGNED DEFAULT NULL,
  `available_at` int UNSIGNED NOT NULL,
  `created_at` int UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `job_batches`
--

DROP TABLE IF EXISTS `job_batches`;
CREATE TABLE IF NOT EXISTS `job_batches` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_jobs` int NOT NULL,
  `pending_jobs` int NOT NULL,
  `failed_jobs` int NOT NULL,
  `failed_job_ids` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` mediumtext COLLATE utf8mb4_unicode_ci,
  `cancelled_at` int DEFAULT NULL,
  `created_at` int NOT NULL,
  `finished_at` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `migrations`
--

DROP TABLE IF EXISTS `migrations`;
CREATE TABLE IF NOT EXISTS `migrations` (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2024_10_26_123304_create_news_currencies_table', 1),
(6, '2024_10_26_125229_create_news_table', 2);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `news`
--

DROP TABLE IF EXISTS `news`;
CREATE TABLE IF NOT EXISTS `news` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `source` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `published_at` timestamp NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=83 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `news`
--

INSERT INTO `news` (`id`, `title`, `source`, `published_at`, `created_at`, `updated_at`) VALUES
(82, 'BlackRock Makes History With 400,000 Bitcoin (BTC)', 'U.Today', '2024-10-27 10:48:00', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(81, 'XRPL Reports Record Network Activity – What’s Behind the Surge?', 'cryptodnes', '2024-10-27 11:00:45', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(80, 'Arch Network Review, a Great Opportunity for Bitcoin Holders', 'Crypto Economy', '2024-10-27 11:03:00', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(78, ' MicroStrategy is the 6th most traded stock in the USA. \n\nMore trading volume than Amazon and Google. \n\n#Bitcoin strategy is winning ', 'X - btc_archive', '2024-10-27 11:14:22', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(79, '5 Strategies to Minimize Crypto Transaction Costs', 'coinscreed.com', '2024-10-27 11:09:18', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(75, '2 ways investors can earn passive income with crypto in 2024', 'Finbold', '2024-10-27 11:23:52', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(76, 'I wrote about why low float high FDV was bad in 2021. Back then projects started to copy the Serum model of 1% circulating - I pushed that projects should have at very minimum 15-20% circulating on TGE. Now I believe even that is too low. The standard should be 65-75%+…', 'Twitter - rewkang', '2024-10-27 11:19:27', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(77, 'It’s counterintuitive, but the best tokenomic design for a project (and retail) is to not have investor lock ups and have as much tokens to be as circulating as possible on Day 1 (except team, treasury)\n\nOne year cliff and 3-4 year vests are a poor standard that came about from a…', 'Twitter - rewkang', '2024-10-27 11:19:25', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(73, '‘Textbook’ Breakout Underway for Bitcoin As Critical Support Level Holds: Crypto Analyst', 'The Daily Hodl', '2024-10-27 11:30:26', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(74, 'We\'ve given a lot of this advice to new founders, but its tough because you are fighting against bad tokenomics advice from lawyers that misinterpret securities law and other VCs that try to push the status quo\n\nBut talk to any past founder and most will tell you that vesting +…', 'Twitter - rewkang', '2024-10-27 11:29:47', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(71, 'Bitcoin Short Positions at Risk Above $68,500 as Market Eyes New Highs', 'Crypto Currency News & Updates', '2024-10-27 11:33:41', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(72, 'Cardano To Host Nation States By 2030 – Charles Hoskinson', 'The Coin Republic', '2024-10-27 11:33:00', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(70, 'Crypto Transaction Scams: How to Identify and Avoid Them', 'coinscreed.com', '2024-10-27 11:48:31', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(69, 'Ripple v. SEC: XRP Future Still Unclear on State Level, Lawyer Confirms', 'U.Today', '2024-10-27 11:55:00', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(68, 'Russia’s New Cryptocurrency Law Expected to Come Into Effect Soon', 'cryptodnes', '2024-10-27 12:00:08', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(67, 'SEC Delays Ripple Appeal to 2025—Experts Call It “Paperwork”', 'Dailycoin', '2024-10-27 12:05:00', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(65, 'Jack Mallers: Who\'s Adopts Bitcoin Next?', 'Simply Bitcoin', '2024-10-27 12:30:00', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(66, '3 signs Ethereum price is gearing up for a rebound toward $6K', 'CoinTelegraph', '2024-10-27 12:06:03', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(64, 'Ethereum Price Holds Strong Above $2,400 — Is $2,650 The Next Stop?', 'NewsBTC', '2024-10-27 12:30:29', '2024-10-27 12:47:04', '2024-10-27 12:47:04'),
(63, 'All vesting does is kick the can down the road, makes something that shouldn’t be an issue an issue. It becomes a constant struggle for founders that then have to decide how to handle unlocks that go on forever\n\nAll private and public market investors are potential sellers…', 'Twitter - rewkang', '2024-10-27 12:30:36', '2024-10-27 12:47:04', '2024-10-27 12:47:04');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `news_currencies`
--

DROP TABLE IF EXISTS `news_currencies`;
CREATE TABLE IF NOT EXISTS `news_currencies` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `news_id` bigint UNSIGNED NOT NULL,
  `currency_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency_url` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `news_currencies_news_id_foreign` (`news_id`)
) ENGINE=MyISAM AUTO_INCREMENT=785 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `news_currencies`
--

INSERT INTO `news_currencies` (`id`, `news_id`, `currency_code`, `currency_title`, `currency_url`, `created_at`, `updated_at`) VALUES
(767, 64, 'ETH', 'Bridged Ether (StarkGate)', 'https://cryptopanic.com/news/bridged-wrapped-ether-starkgate/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(768, 64, 'ALI', 'Artificial Liquid Intelligence', 'https://cryptopanic.com/news/alethea-artificial-liquid-intelligence-token/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(764, 64, 'BTC', 'Bitcoin', 'https://cryptopanic.com/news/bitcoin/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(765, 64, 'ETH', 'Ethereum', 'https://cryptopanic.com/news/ethereum/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(766, 64, 'USDT', 'Tether', 'https://cryptopanic.com/news/tether/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(769, 65, 'BTC', 'Bitcoin', 'https://cryptopanic.com/news/bitcoin/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(771, 66, 'ETH', 'Ethereum', 'https://cryptopanic.com/news/ethereum/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(770, 66, 'BTC', 'Bitcoin', 'https://cryptopanic.com/news/bitcoin/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(772, 67, 'XRP', 'XRP', 'https://cryptopanic.com/news/ripple/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(773, 69, 'XRP', 'XRP', 'https://cryptopanic.com/news/ripple/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(774, 70, 'BTC', 'Bitcoin', 'https://cryptopanic.com/news/bitcoin/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(775, 71, 'BTC', 'Bitcoin', 'https://cryptopanic.com/news/bitcoin/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(776, 72, 'ADA', 'Cardano', 'https://cryptopanic.com/news/cardano/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(777, 73, 'BTC', 'Bitcoin', 'https://cryptopanic.com/news/bitcoin/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(778, 75, 'DEFI', 'DeFi', 'https://cryptopanic.com/news/de-fi/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(779, 78, 'BTC', 'Bitcoin', 'https://cryptopanic.com/news/bitcoin/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(781, 79, 'ETH', 'Ethereum', 'https://cryptopanic.com/news/ethereum/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(780, 79, 'BTC', 'Bitcoin', 'https://cryptopanic.com/news/bitcoin/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(782, 80, 'BTC', 'Bitcoin', 'https://cryptopanic.com/news/bitcoin/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(783, 81, 'XRP', 'XRP', 'https://cryptopanic.com/news/ripple/', '2024-10-27 12:49:04', '2024-10-27 12:49:04'),
(784, 82, 'BTC', 'Bitcoin', 'https://cryptopanic.com/news/bitcoin/', '2024-10-27 12:49:04', '2024-10-27 12:49:04');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
CREATE TABLE IF NOT EXISTS `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sessions`
--

DROP TABLE IF EXISTS `sessions`;
CREATE TABLE IF NOT EXISTS `sessions` (
  `id` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_user_id_index` (`user_id`),
  KEY `sessions_last_activity_index` (`last_activity`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Tablo döküm verisi `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('ewmLx5B346JczAFfAZv6aGOAZ9NMzerk03SFRstX', NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/130.0.0.0 Safari/537.36', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoieU9jUlhZMDJHWFVHbXJCR3llakZFM0xCOExHdEZ2cjZ4TEVtN25VaiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6ODg6Imh0dHA6Ly9sb2NhbGhvc3Q6ODAwMC9uZXdzL2ZpbHRlcj9jdXJyZW5jeT1FVEgmZW5kX2RhdGU9MjAyNC0xMC0yNyZzdGFydF9kYXRlPTIwMjQtMTAtMTgiO319', 1730044169);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
