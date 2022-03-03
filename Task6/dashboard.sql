-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 02, 2022 at 11:51 PM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.0.15

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dashboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `addresses`
--

CREATE TABLE `addresses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `notes` longtext DEFAULT NULL,
  `street` varchar(50) NOT NULL,
  `building` varchar(50) NOT NULL,
  `floor` varchar(50) NOT NULL,
  `flat` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `user_fk_id` bigint(20) UNSIGNED NOT NULL,
  `region_fk_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name-ar` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `img` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `name_en`, `name-ar`, `status`, `img`, `created_at`, `updated_at`) VALUES
(1, 'Apple', '', 1, '', '2022-03-02 19:12:45', '2022-03-03 10:39:50'),
(2, 'Dell', '', 1, '', '2022-03-02 19:12:46', '2022-03-03 19:13:14'),
(3, 'HP', '', 1, '', '2022-03-02 19:13:14', '2022-03-03 19:13:14'),
(4, 'Nivea', 'نيفيا', 1, '', '2022-03-02 19:14:10', '2022-03-03 19:45:55'),
(5, 'Kiko', 'كيكو', 1, '', '2022-03-02 19:14:10', '2022-03-03 19:14:10'),
(6, 'Ikea', 'ايكيا', 1, '', '2022-03-02 19:14:43', '2022-03-02 23:13:47');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `quantity` smallint(3) UNSIGNED NOT NULL DEFAULT 1,
  `product_fk_id` bigint(20) UNSIGNED NOT NULL,
  `user_fk_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `img` varchar(50) NOT NULL DEFAULT 'default.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name_ar`, `name_en`, `status`, `img`, `created_at`, `updated_at`) VALUES
(1, 'خضروات', 'vegetable', 1, 'default.jpg', '2022-03-02 18:14:32', '2022-03-03 18:14:32'),
(2, 'الكترونيات', 'electronics', 1, 'default.jpg', '2022-03-02 18:14:32', '2022-03-03 18:14:32'),
(3, 'مطبخ', 'kitchin', 1, 'default.jpg', '2022-03-02 18:14:32', '2022-03-03 18:14:32'),
(4, 'عناية للجسم', 'body care', 1, 'default.jpg', '2022-03-02 18:14:32', '2022-03-03 18:14:32');

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `coupons`
--

CREATE TABLE `coupons` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` mediumint(5) UNSIGNED NOT NULL,
  `max_usage_number` tinyint(3) UNSIGNED NOT NULL,
  `max_usage_number_per_user` tinyint(3) UNSIGNED NOT NULL,
  `discount` smallint(5) UNSIGNED NOT NULL,
  `dis_type` varchar(50) NOT NULL,
  `start_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_at` timestamp NULL DEFAULT NULL,
  `max_dis_value` decimal(18,2) NOT NULL,
  `min_dis_value` decimal(18,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `title_ar` longtext NOT NULL,
  `title_en` longtext NOT NULL,
  `img` varchar(50) NOT NULL,
  `start_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `end_at` timestamp NULL DEFAULT NULL,
  `discount` tinyint(3) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `order_number` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `total_price` decimal(18,2) NOT NULL,
  `payment_fk_id` bigint(20) UNSIGNED DEFAULT NULL,
  `coupon_fk_id` bigint(20) UNSIGNED DEFAULT NULL,
  `address_fk_id` bigint(20) UNSIGNED DEFAULT NULL,
  `delivered_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `order_number`, `status`, `total_price`, `payment_fk_id`, `coupon_fk_id`, `address_fk_id`, `delivered_at`, `updated_at`, `created_at`) VALUES
(1, 1, 1, '50.00', NULL, NULL, NULL, '2022-03-03 10:43:41', '2022-03-03 16:05:16', '2022-03-03 10:43:41'),
(2, 2, 1, '100.00', NULL, NULL, NULL, '2022-03-03 10:43:48', '2022-03-03 16:05:16', '2022-03-03 10:43:48'),
(3, 3, 1, '15000.00', NULL, NULL, NULL, '2022-03-03 10:43:52', '2022-03-03 16:05:50', '2022-03-03 10:43:52'),
(4, 4, 1, '21000.00', NULL, NULL, NULL, '2022-03-03 10:43:57', '2022-03-03 16:05:50', '2022-03-03 10:43:57');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `status` tinyint(1) NOT NULL,
  `payment_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `payments_users`
--

CREATE TABLE `payments_users` (
  `payment_fk_id` bigint(20) UNSIGNED NOT NULL,
  `user_fk_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `privilege`
--

CREATE TABLE `privilege` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `privilege_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `privileges_users`
--

CREATE TABLE `privileges_users` (
  `user_fk_id` bigint(20) UNSIGNED NOT NULL,
  `privilege_fk_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `desc_en` longtext NOT NULL,
  `desc_ar` longtext NOT NULL,
  `status` tinyint(1) NOT NULL,
  `img` varchar(50) NOT NULL DEFAULT 'default.jpg',
  `price` decimal(18,2) UNSIGNED NOT NULL,
  `quantity` smallint(6) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `brand_fk_id` bigint(20) UNSIGNED DEFAULT NULL,
  `subcatergories_fk_id` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name_ar`, `name_en`, `desc_en`, `desc_ar`, `status`, `img`, `price`, `quantity`, `created_at`, `updated_at`, `brand_fk_id`, `subcatergories_fk_id`) VALUES
(2, 'كريم', 'Cream Nivea', 'Details', 'تفاصيل', 1, 'Nivea.jpg', '50.00', 1, '2022-03-02 19:34:04', '2022-03-03 19:32:48', 4, 4),
(3, 'نوت بوك', 'note book', 'Details', 'تفاصيل', 1, 'hpnotebook.jpg', '15000.00', 5, '2022-03-02 19:35:12', '2022-03-03 20:20:46', 3, 2),
(4, 'نوت بوك برو', 'note book pro', 'Details', 'تفاصيل', 1, 'hpnotebook0.jpg', '15000.00', 5, '2022-03-02 19:35:39', '2022-03-03 19:19:29', 3, 2),
(5, 'ديل جميز', 'Dell Games', 'Details', 'تفاصيل', 1, 'dell.jpg', '17000.00', 4, '2022-03-02 19:40:18', '2022-03-03 20:10:53', 2, 2),
(6, 'اطباق عشاء', 'Dinner Dishes', 'Details', 'تفاصيل', 1, 'dinner.jpg', '5000.00', 10, '2022-03-02 19:40:18', '2022-03-03 20:10:41', 6, 5);

-- --------------------------------------------------------

--
-- Stand-in structure for view `products_details`
-- (See below for the actual view)
--
CREATE TABLE `products_details` (
`id` bigint(20) unsigned
,`name_ar` varchar(50)
,`name_en` varchar(50)
,`desc_en` longtext
,`desc_ar` longtext
,`status` tinyint(1)
,`img` varchar(50)
,`price` decimal(18,2) unsigned
,`quantity` smallint(6)
,`created_at` timestamp
,`updated_at` timestamp
,`brand_fk_id` bigint(20) unsigned
,`subcatergories_fk_id` bigint(20) unsigned
,`sub_name_en` varchar(50)
,`brand_name_en` varchar(50)
,`category_id` bigint(20) unsigned
,`category_name_en` varchar(50)
,`reviews_count` bigint(21)
,`reviews_average` decimal(2,0)
);

-- --------------------------------------------------------

--
-- Table structure for table `products_offers`
--

CREATE TABLE `products_offers` (
  `product-fk-id` bigint(20) UNSIGNED NOT NULL,
  `offer_fk_id` bigint(20) UNSIGNED NOT NULL,
  `final_price` decimal(18,2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `products_orders`
--

CREATE TABLE `products_orders` (
  `product_fk_id` bigint(20) UNSIGNED NOT NULL,
  `order_fk_id` bigint(20) UNSIGNED NOT NULL,
  `price` decimal(18,2) NOT NULL,
  `quantity` smallint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products_orders`
--

INSERT INTO `products_orders` (`product_fk_id`, `order_fk_id`, `price`, `quantity`) VALUES
(1, 4, '21000.00', 5),
(2, 1, '50.00', 1),
(2, 2, '50.00', 2),
(3, 3, '15000.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `regions`
--

CREATE TABLE `regions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `city_fk_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `value` enum('0','1','2','3','4','5') NOT NULL DEFAULT '1',
  `product_fk_id` bigint(20) UNSIGNED NOT NULL,
  `user_fk_id` bigint(20) UNSIGNED NOT NULL,
  `comment` varchar(1000) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `subcategories`
--

CREATE TABLE `subcategories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name_ar` varchar(50) NOT NULL,
  `name_en` varchar(50) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `img` varchar(50) NOT NULL DEFAULT 'default.jpg',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `categories_fk_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `subcategories`
--

INSERT INTO `subcategories` (`id`, `name_ar`, `name_en`, `status`, `img`, `created_at`, `updated_at`, `categories_fk_id`) VALUES
(1, 'موبيلات', 'mobiles', 1, 'default.jpg', '2022-03-02 18:16:25', '2022-03-03 18:16:25', 2),
(2, 'لابات', 'laptops', 1, 'default.jpg', '2022-03-02 18:16:25', '2022-03-03 18:16:25', 2),
(3, 'عناية للشعر', 'hair care', 1, 'default.jpg', '2022-03-02 18:17:25', '2022-03-03 18:17:25', 4),
(4, 'عناية بالبشرة', 'face care', 1, 'default.jpg', '2022-03-02 18:17:25', '2022-03-03 18:17:25', 4),
(5, 'ادوات التقديم', 'serving equipments', 1, 'default.jpg', '2022-03-02 18:20:57', '2022-03-03 18:20:57', 3),
(6, 'ادوات اعداد الطعام', 'food preparation equipments', 1, 'default.jpg', '2022-03-02 18:20:57', '2022-02-03 18:20:57', 3);

-- --------------------------------------------------------

--
-- Table structure for table `users`
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
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'yasmin magdy ', 'yasminselim0@gmail.com', NULL, '$2y$10$DUATUzGVOujKtGdQoPIjqeDTDsAqa1/b1/Z2dQujZSwCdx2ZCA8C2', NULL, '2021-12-27 16:30:20', '2021-12-27 16:30:20');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `products_fk_id` bigint(20) UNSIGNED NOT NULL,
  `users_fk_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Structure for view `products_details`
--
DROP TABLE IF EXISTS `products_details`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `products_details`  AS   (select `products`.`id` AS `id`,`products`.`name_ar` AS `name_ar`,`products`.`name_en` AS `name_en`,`products`.`desc_en` AS `desc_en`,`products`.`desc_ar` AS `desc_ar`,`products`.`status` AS `status`,`products`.`img` AS `img`,`products`.`price` AS `price`,`products`.`quantity` AS `quantity`,`products`.`created_at` AS `created_at`,`products`.`updated_at` AS `updated_at`,`products`.`brand_fk_id` AS `brand_fk_id`,`products`.`subcatergories_fk_id` AS `subcatergories_fk_id`,`subcategories`.`name_en` AS `sub_name_en`,`brands`.`name_en` AS `brand_name_en`,`categories`.`id` AS `category_id`,`categories`.`name_en` AS `category_name_en`,count(`products`.`id`) AS `reviews_count`,round(if(avg(`reviews`.`value`) is null,0,avg(`reviews`.`value`)),0) AS `reviews_average` from ((((`products` left join `subcategories` on(`products`.`subcatergories_fk_id` = `subcategories`.`id`)) join `brands` on(`brands`.`id` = `products`.`brand_fk_id`)) join `categories` on(`categories`.`id` = `subcategories`.`categories_fk_id`)) left join `reviews` on(`reviews`.`product_fk_id` = `products`.`id`)) where `products`.`status` = 1 group by `products`.`id` order by `products`.`price`,`products`.`name_en`)  ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addresses`
--
ALTER TABLE `addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `addresses_regions_fk` (`region_fk_id`),
  ADD KEY `addresses_users_fk` (`user_fk_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`user_fk_id`,`product_fk_id`),
  ADD KEY `carts_products_fk` (`product_fk_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_orders` (`payment_fk_id`),
  ADD KEY `coupons_orders` (`coupon_fk_id`),
  ADD KEY `addresses_orders` (`address_fk_id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payments_users`
--
ALTER TABLE `payments_users`
  ADD PRIMARY KEY (`payment_fk_id`,`user_fk_id`),
  ADD KEY `Users_fk` (`user_fk_id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `privilege`
--
ALTER TABLE `privilege`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `privileges_users`
--
ALTER TABLE `privileges_users`
  ADD PRIMARY KEY (`user_fk_id`,`privilege_fk_id`),
  ADD KEY `privileges_fk` (`privilege_fk_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `brands_products_fk` (`brand_fk_id`),
  ADD KEY `subcategories_products_fk` (`subcatergories_fk_id`);

--
-- Indexes for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_subcategories_fk` (`categories_fk_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `subcategories`
--
ALTER TABLE `subcategories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `brand_product_fk` FOREIGN KEY (`brand_fk_id`) REFERENCES `brands` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `subcategories_products_fk` FOREIGN KEY (`subcatergories_fk_id`) REFERENCES `subcategories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `subcategories`
--
ALTER TABLE `subcategories`
  ADD CONSTRAINT `categories_subcategories_fk` FOREIGN KEY (`categories_fk_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
