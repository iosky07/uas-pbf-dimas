-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jan 2021 pada 04.35
-- Versi server: 10.4.11-MariaDB
-- Versi PHP: 7.2.27

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `forum`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `comments`
--

CREATE TABLE `comments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `commentable_id` int(11) NOT NULL,
  `commentable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `comments`
--

INSERT INTO `comments` (`id`, `user_id`, `content`, `commentable_id`, `commentable_type`, `created_at`, `updated_at`) VALUES
(1, 1, 'iyajkfjasdkl', 16, 'App\\forum', '2021-01-04 09:27:25', '2021-01-04 09:27:25'),
(2, 1, 'ini baru', 16, 'App\\forum', '2021-01-04 09:30:52', '2021-01-04 09:30:52'),
(3, 1, 'iya hgggg', 1, 'App\\forum', '2021-01-04 14:45:05', '2021-01-04 14:45:05'),
(4, 1, 'ya tinggal buat aja kok susah', 1, 'App\\forum', '2021-01-04 15:12:13', '2021-01-04 15:12:13'),
(5, 1, 'skip', 2, 'App\\forum', '2021-01-04 15:18:18', '2021-01-04 15:18:18'),
(6, 1, 'ini saha teh?', 18, 'App\\forum', '2021-01-05 17:06:19', '2021-01-05 17:06:19'),
(7, 3, 'waalaikumsalam akhi', 20, 'App\\forum', '2021-01-06 10:47:17', '2021-01-06 10:47:17'),
(8, 3, 'oogheey', 1, 'App\\forum', '2021-01-06 10:56:21', '2021-01-06 10:56:21'),
(9, 3, 'sertakan source code nya sekalian gan biar gampang heheheh', 22, 'App\\forum', '2021-01-06 19:39:56', '2021-01-06 19:39:56'),
(10, 4, 'bisa cek disini kawan, lengkap banget :D  https://www.dewaweb.com/blog/panduan-phpmyadmin-untuk-pemula/', 1, 'App\\forum', '2021-01-06 19:58:39', '2021-01-06 19:58:39'),
(11, 4, 'petanikode bisa, tau ke w3school juga lengkap banget. tapi kalo masih kurang bisa ke web saya gan di dimasandcandra.com (promo dikit hehehe :3)', 2, 'App\\forum', '2021-01-06 20:02:19', '2021-01-06 20:02:19'),
(13, 4, 'cek disini gan https://www.malasngoding.com/membuat-navigation-bar-bootstrap/ -------- kemarin ane coba bisa responsif', 21, 'App\\forum', '2021-01-06 20:06:53', '2021-01-06 20:06:53'),
(14, 4, 'haduh udah nyoba googling belum, jangan maunya gampang aja wkwkwk :D', 22, 'App\\forum', '2021-01-06 20:08:12', '2021-01-06 20:08:12');

-- --------------------------------------------------------

--
-- Struktur dari tabel `forums`
--

CREATE TABLE `forums` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `tittle` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `forums`
--

INSERT INTO `forums` (`id`, `user_id`, `tittle`, `slug`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 1, 'Localhost', 'localhost', 'Permisi teman teman, mau nanya gimana sih caranya gunain localhost phpmyadmin ? atau kasih rekomen web atau vhannel yutub yang buat belajar localhost. terima kasih', '1609717611.jpg', '2021-01-03 16:34:04', '2021-01-06 19:46:25'),
(2, 1, 'Belajar Java', 'belajar-java', 'Guys ada yang tau gak web yang bagus buat belajar Java ? Kasih saran dong makasih', '1609716906.PNG', '2021-01-03 16:35:06', '2021-01-06 19:50:25'),
(21, 3, 'Bagaimana ya cara membuat navbar responsive dengan bootstrap', 'bagaimana-ya-cara-membuat-navbar-responsive-dengan-bootstrap', 'Saya sudah belajar membuat navbar menggunakan bootstrap akhir-akhir ini, tapi masih susah kalo mau buat navbar yang bisa responsif. Kira kira cara nya yang efektif ? Terima kasih', '1609986614.png', '2021-01-06 10:51:50', '2021-01-06 19:30:16'),
(22, 3, 'Bikin Form Sederhana', 'bikin-form-sederhana', 'Mau nanya suhu, caranya bikin form html yang sederhana dan gampang gimana ya gan ? masih newbie nih hehehehe', NULL, '2021-01-06 19:38:51', '2021-01-06 19:38:51');

-- --------------------------------------------------------

--
-- Struktur dari tabel `forum_tag`
--

CREATE TABLE `forum_tag` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `forum_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `forum_tag`
--

INSERT INTO `forum_tag` (`id`, `forum_id`, `tag_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(15, 18, 1, NULL, NULL),
(16, 19, 1, NULL, NULL),
(18, 21, 2, NULL, NULL),
(20, 21, 3, NULL, NULL),
(21, 22, 6, NULL, NULL),
(22, 1, 2, NULL, NULL),
(23, 1, 6, NULL, NULL),
(24, 2, 4, NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2021_01_02_185647_create_forums_table', 2),
(4, '2021_01_02_202015_create_tags_table', 3),
(5, '2021_01_02_202546_create_forum_tag_table', 3),
(6, '2021_01_04_155943_create_comments_table', 4);

-- --------------------------------------------------------

--
-- Struktur dari tabel `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Struktur dari tabel `tags`
--

CREATE TABLE `tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `tags`
--

INSERT INTO `tags` (`id`, `name`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'PHP', 'php', NULL, NULL),
(2, 'Javascript', 'javascript', NULL, NULL),
(3, 'Phyton', 'Phyton', NULL, NULL),
(4, 'Java', 'java', NULL, NULL),
(5, 'C#', 'c#', NULL, NULL),
(6, 'HTML', 'html', NULL, NULL);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'weka', 'weka@gmail.com', NULL, '$2y$10$oP9RHMhqZUsk3mcUjNg3l.kqu7TIOMvzSV7qQWp.WBsMzeXLm/tK.', '6AL5egZZQSVQrWskt5uJa4xOWh8wzqMG6koAbSbSt2QYgrQE8m2wOeGx9eJK', '2021-01-02 11:53:59', '2021-01-02 11:53:59'),
(2, 'user1', 'user1@gmail.com', NULL, '$2y$10$V4lnZFPhSm9z.KsZuvwHSu/vAaejGYYQarcpiuNUriFXPjTJwvmLi', NULL, '2021-01-04 17:40:09', '2021-01-04 17:40:09'),
(3, 'Rizang', 'rizang@gmail.com', NULL, '$2y$10$zQPNiNlcNV3uZnhq7hN96e6CNDrd0SUCDC2lRYlZHToJmr.hGFusy', NULL, '2021-01-06 10:30:51', '2021-01-06 10:30:51'),
(4, 'Dimas Candra', 'dimcan@gmail.com', NULL, '$2y$10$2qsy8cvDRA7ZHOlDxktuZuwWflDjYqb732daQlBwKtbqJRtpbmccu', NULL, '2021-01-06 19:57:18', '2021-01-06 19:57:18');

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `forums`
--
ALTER TABLE `forums`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `forum_tag`
--
ALTER TABLE `forum_tag`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indeks untuk tabel `tags`
--
ALTER TABLE `tags`
  ADD PRIMARY KEY (`id`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `comments`
--
ALTER TABLE `comments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT untuk tabel `forums`
--
ALTER TABLE `forums`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT untuk tabel `forum_tag`
--
ALTER TABLE `forum_tag`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT untuk tabel `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `tags`
--
ALTER TABLE `tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
