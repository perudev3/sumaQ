-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 10-11-2021 a las 15:08:34
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sumaq`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
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
-- Estructura de tabla para la tabla `mae_categories`
--

CREATE TABLE `mae_categories` (
  `categories_id` int(10) UNSIGNED NOT NULL,
  `categories_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `categories_image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mae_categories`
--

INSERT INTO `mae_categories` (`categories_id`, `categories_name`, `categories_image_url`, `created_at`, `updated_at`) VALUES
(1, 'Abalorio', 'category-1-10c9492d-dda2-44ea-ba4a-93ba54695c28.jpg', '2021-07-26 20:00:51', '2021-07-26 20:00:53'),
(2, 'Amatista', 'category-2-6d16c2d3-f485-4ff0-aaea-fcce68280c98.jfif', '2021-07-26 20:01:43', '2021-07-26 20:01:43'),
(3, 'Andalucita', 'category-3-3c64cd5a-7aac-48e5-92d2-325ef0254470.jfif', '2021-07-26 20:02:30', '2021-07-26 20:02:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mae_collections`
--

CREATE TABLE `mae_collections` (
  `collections_id` int(10) UNSIGNED NOT NULL,
  `collections_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collections_image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mae_collections`
--

INSERT INTO `mae_collections` (`collections_id`, `collections_name`, `collections_image_url`, `created_at`, `updated_at`) VALUES
(1, 'Clash Cartier', 'colletion-1-ef9178be-3eda-4a1d-85e4-2ceecf303120.jpg', '2021-07-26 20:06:57', '2021-07-26 20:06:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mae_discounts`
--

CREATE TABLE `mae_discounts` (
  `discounts_id` int(10) UNSIGNED NOT NULL,
  `discounts_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discounts_porcentaje` int(11) DEFAULT NULL,
  `discounts_start_date` date DEFAULT NULL,
  `discounts_end_date` date DEFAULT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `discounts_stock_max` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mae_discounts`
--

INSERT INTO `mae_discounts` (`discounts_id`, `discounts_name`, `discounts_porcentaje`, `discounts_start_date`, `discounts_end_date`, `user_id`, `discounts_stock_max`, `created_at`, `updated_at`) VALUES
(1, 'Descuento Temporada Invierno', 10, '2021-07-27', '2021-07-31', 1, 50, '2021-07-26 21:12:19', '2021-07-26 21:12:19');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mae_materials`
--

CREATE TABLE `mae_materials` (
  `materials_id` int(10) UNSIGNED NOT NULL,
  `materials_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `materials_image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mae_materials`
--

INSERT INTO `mae_materials` (`materials_id`, `materials_name`, `materials_image_url`, `created_at`, `updated_at`) VALUES
(1, 'Material 1', 'material-1-3c8dd2d1-5c23-424c-b5a0-6ca0d443f958.jfif', '2021-07-26 20:11:52', '2021-07-26 20:11:52');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mae_providers`
--

CREATE TABLE `mae_providers` (
  `providers_id` int(10) UNSIGNED NOT NULL,
  `providers_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `providers_id_number` int(11) DEFAULT NULL,
  `providers_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `providers_encargado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `providers_mobile` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `providers_is_active` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mae_providers`
--

INSERT INTO `mae_providers` (`providers_id`, `providers_name`, `providers_id_number`, `providers_address`, `providers_encargado`, `providers_mobile`, `providers_is_active`, `created_at`, `updated_at`) VALUES
(1, 'Proveedor 01', 82149365, 'linea 1, linea 2', 'Juan Perez', '989906922', 1, '2021-08-13 21:51:33', '2021-08-13 21:51:33');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mae_roles`
--

CREATE TABLE `mae_roles` (
  `roles_id` int(10) UNSIGNED NOT NULL,
  `rol_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mae_roles`
--

INSERT INTO `mae_roles` (`roles_id`, `rol_name`, `created_at`, `updated_at`) VALUES
(1, 'Ejecutivo', NULL, NULL),
(2, 'Gerentes Master', NULL, NULL),
(3, 'Gerente Departamental', NULL, NULL),
(4, 'Empleados', NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mae_sizes`
--

CREATE TABLE `mae_sizes` (
  `sizes_id` int(10) UNSIGNED NOT NULL,
  `medidas` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mae_sizes`
--

INSERT INTO `mae_sizes` (`sizes_id`, `medidas`, `created_at`, `updated_at`) VALUES
(1, '50x40', '2021-07-26 22:05:06', '2021-07-26 22:05:06'),
(2, '10x10', '2021-07-26 22:05:07', '2021-07-26 22:05:07'),
(3, '40x30', '2021-07-26 22:05:07', '2021-07-26 22:05:07'),
(4, '100x100', '2021-07-26 22:09:30', '2021-07-26 22:09:30'),
(5, '50x50', '2021-08-26 03:03:40', '2021-08-26 03:03:40'),
(6, '20x20', '2021-08-28 02:12:35', '2021-08-28 02:12:35'),
(7, '10x10', '2021-08-28 02:15:45', '2021-08-28 02:15:45'),
(8, '40x40', '2021-08-28 02:15:45', '2021-08-28 02:15:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mae_sucursals`
--

CREATE TABLE `mae_sucursals` (
  `sucursals_id` int(10) UNSIGNED NOT NULL,
  `sucursals_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sucursals_address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sucursals_is_active` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `mae_sucursals`
--

INSERT INTO `mae_sucursals` (`sucursals_id`, `sucursals_name`, `sucursals_address`, `sucursals_is_active`, `created_at`, `updated_at`) VALUES
(1, 'Tienda 1', 'Linea 1, Linea 2', 1, NULL, NULL),
(2, 'Tienda 2', 'Linea 1, Linea 2', 1, NULL, NULL),
(3, 'Tienda 3', 'Linea 1, Linea 2', 1, NULL, NULL),
(4, 'Tienda 4', 'Linea 1, Linea 2', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(21, '2014_10_12_000000_create_users_table', 1),
(22, '2014_10_12_100000_create_password_resets_table', 1),
(23, '2019_08_19_000000_create_failed_jobs_table', 1),
(24, '2021_06_10_195057_create_mae_collections_table', 1),
(25, '2021_06_10_195215_create_mae_categories_table', 1),
(26, '2021_06_10_195346_create_mae_materials_table', 1),
(27, '2021_06_10_195645_create_mae_sucursals_table', 1),
(28, '2021_06_10_200144_create_mae_discounts_table', 1),
(29, '2021_06_10_200237_create_tbl_products_table', 1),
(30, '2021_06_10_200549_create_mae_providers_table', 1),
(31, '2021_06_10_201209_create_tbl_purchase_orders_table', 1),
(32, '2021_06_10_201633_create_tbl_districts_table', 1),
(33, '2021_06_10_201722_create_tbl_addresses_table', 1),
(34, '2021_06_10_201801_create_tbl_customers_table', 1),
(35, '2021_06_11_014814_create_tbl_sales_table', 1),
(36, '2021_06_11_020124_create_tbl_sales_details_table', 1),
(37, '2021_06_11_020234_create_tbl_inventories_table', 1),
(38, '2021_06_20_060829_create_purchase_order_details_table', 1),
(39, '2021_06_25_163143_create_tbl_group_discounts_table', 1),
(40, '2021_07_18_070031_create_mae_sizes_table', 2),
(41, '2021_07_26_220129_create_mae_roles_table', 3),
(43, '2021_08_04_145614_create_tbl_customer_users_table', 4),
(44, '2021_08_07_164300_create_tbl_sales_profits_table', 5),
(45, '2021_08_13_150030_create_tbl_layaways_table', 6),
(46, '2021_08_13_150226_create_tbl_layaway_details_table', 6),
(47, '2021_08_13_150432_create_tbl_layaway_profits_table', 6),
(50, '2021_08_24_150024_create_tbl_solicitudes_table', 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `purchase_order_details`
--

CREATE TABLE `purchase_order_details` (
  `purchase_order_details_id` int(10) UNSIGNED NOT NULL,
  `purchase_orders_id` int(10) UNSIGNED NOT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `total_products` int(11) DEFAULT NULL,
  `total_price` double(8,2) DEFAULT NULL,
  `net_price` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `purchase_order_details`
--

INSERT INTO `purchase_order_details` (`purchase_order_details_id`, `purchase_orders_id`, `products_id`, `total_products`, `total_price`, `net_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 3, 16500.00, NULL, '2021-08-13 23:26:44', '2021-08-13 23:26:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_addresses`
--

CREATE TABLE `tbl_addresses` (
  `addresses_id` int(10) UNSIGNED NOT NULL,
  `addresses_first_line` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addresses_second_line` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addresses_reference` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `districts_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_addresses`
--

INSERT INTO `tbl_addresses` (`addresses_id`, `addresses_first_line`, `addresses_second_line`, `addresses_reference`, `districts_id`, `created_at`, `updated_at`) VALUES
(1, 'Linea 1', ' Linea 2', 'alguna referencia', NULL, '2021-07-26 23:02:24', '2021-07-26 23:02:24'),
(2, 'Av Polvorines 56', ' Cercado de Bolivar', 'Av Circunvalacion', NULL, '2021-07-28 03:52:13', '2021-07-28 03:52:13'),
(3, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-10 11:50:54', '2021-08-10 11:50:54'),
(4, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 14:12:09', '2021-08-17 14:12:09'),
(5, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 14:40:29', '2021-08-17 14:40:29'),
(6, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 14:42:19', '2021-08-17 14:42:19'),
(7, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 14:43:08', '2021-08-17 14:43:08'),
(8, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 14:47:29', '2021-08-17 14:47:29'),
(9, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 14:49:01', '2021-08-17 14:49:01'),
(10, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 14:51:22', '2021-08-17 14:51:22'),
(11, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 14:52:25', '2021-08-17 14:52:25'),
(12, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 14:53:10', '2021-08-17 14:53:10'),
(13, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 14:57:42', '2021-08-17 14:57:42'),
(14, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-17 21:35:34', '2021-08-17 21:35:34'),
(15, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-08-26 00:53:34', '2021-08-26 00:53:34'),
(16, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-04 21:44:23', '2021-11-04 21:44:23'),
(17, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-04 21:47:24', '2021-11-04 21:47:24'),
(18, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-04 21:48:53', '2021-11-04 21:48:53'),
(19, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-04 21:51:45', '2021-11-04 21:51:45'),
(20, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-04 21:53:11', '2021-11-04 21:53:11'),
(21, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-04 21:58:32', '2021-11-04 21:58:32'),
(22, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-04 21:59:48', '2021-11-04 21:59:48'),
(23, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-04 22:02:33', '2021-11-04 22:02:33'),
(24, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-05 19:17:26', '2021-11-05 19:17:26'),
(25, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-05 19:21:32', '2021-11-05 19:21:32'),
(26, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-05 19:30:56', '2021-11-05 19:30:56'),
(27, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-05 19:33:59', '2021-11-05 19:33:59'),
(28, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-05 19:38:02', '2021-11-05 19:38:02'),
(29, 'Linea 1', '  Linea 2', 'alguna referencia', NULL, '2021-11-05 19:39:41', '2021-11-05 19:39:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_customers`
--

CREATE TABLE `tbl_customers` (
  `customers_id` int(10) UNSIGNED NOT NULL,
  `customers_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customers_mail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `customers_phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `addresses_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_customers`
--

INSERT INTO `tbl_customers` (`customers_id`, `customers_name`, `customers_mail`, `customers_phone`, `addresses_id`, `created_at`, `updated_at`) VALUES
(1, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 1, '2021-07-26 23:02:24', '2021-07-26 23:02:24'),
(2, 'Diana Valverde', 'diana@gmail.com', '969241574', 2, '2021-07-28 03:52:13', '2021-07-28 03:52:13'),
(3, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 3, '2021-08-10 11:50:54', '2021-08-10 11:50:54'),
(4, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 4, '2021-08-17 14:12:09', '2021-08-17 14:12:09'),
(5, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 5, '2021-08-17 14:40:30', '2021-08-17 14:40:30'),
(6, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 6, '2021-08-17 14:42:19', '2021-08-17 14:42:19'),
(7, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 7, '2021-08-17 14:43:08', '2021-08-17 14:43:08'),
(8, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 8, '2021-08-17 14:47:29', '2021-08-17 14:47:29'),
(9, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 9, '2021-08-17 14:49:01', '2021-08-17 14:49:01'),
(10, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 10, '2021-08-17 14:51:22', '2021-08-17 14:51:22'),
(11, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 11, '2021-08-17 14:52:25', '2021-08-17 14:52:25'),
(12, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 12, '2021-08-17 14:53:10', '2021-08-17 14:53:10'),
(13, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 13, '2021-08-17 14:57:42', '2021-08-17 14:57:42'),
(14, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 14, '2021-08-17 21:35:34', '2021-08-17 21:35:34'),
(15, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 15, '2021-08-26 00:53:34', '2021-08-26 00:53:34'),
(16, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 16, '2021-11-04 21:44:23', '2021-11-04 21:44:23'),
(17, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 17, '2021-11-04 21:47:24', '2021-11-04 21:47:24'),
(18, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 18, '2021-11-04 21:48:53', '2021-11-04 21:48:53'),
(19, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 19, '2021-11-04 21:51:45', '2021-11-04 21:51:45'),
(20, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 20, '2021-11-04 21:53:11', '2021-11-04 21:53:11'),
(21, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 21, '2021-11-04 21:58:32', '2021-11-04 21:58:32'),
(22, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 22, '2021-11-04 21:59:48', '2021-11-04 21:59:48'),
(23, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 23, '2021-11-04 22:02:33', '2021-11-04 22:02:33'),
(24, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 24, '2021-11-05 19:17:26', '2021-11-05 19:17:26'),
(25, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 25, '2021-11-05 19:21:32', '2021-11-05 19:21:32'),
(26, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 26, '2021-11-05 19:30:56', '2021-11-05 19:30:56'),
(27, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 27, '2021-11-05 19:33:59', '2021-11-05 19:33:59'),
(28, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 28, '2021-11-05 19:38:02', '2021-11-05 19:38:02'),
(29, 'Samuel Rivas', 'rivasrivas506@gmail.com', '989906922', 29, '2021-11-05 19:39:41', '2021-11-05 19:39:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_customer_users`
--

CREATE TABLE `tbl_customer_users` (
  `customer_users_id` int(10) UNSIGNED NOT NULL,
  `identification_document` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `movil` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_customer_users`
--

INSERT INTO `tbl_customer_users` (`customer_users_id`, `identification_document`, `movil`, `address`, `area`, `id`, `created_at`, `updated_at`) VALUES
(1, '86952301', '985301744', 'Linea 1, Linea 2', 'Area 1', 4, '2021-08-04 20:40:38', '2021-08-04 20:40:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_districts`
--

CREATE TABLE `tbl_districts` (
  `districts_id` int(10) UNSIGNED NOT NULL,
  `districts_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `districts_delivery_price` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_group_discounts`
--

CREATE TABLE `tbl_group_discounts` (
  `group_discounts_id` int(10) UNSIGNED NOT NULL,
  `group_discounts_name` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `discounts_id` int(10) UNSIGNED NOT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `categories_id` int(10) UNSIGNED NOT NULL,
  `collections_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_group_discounts`
--

INSERT INTO `tbl_group_discounts` (`group_discounts_id`, `group_discounts_name`, `discounts_id`, `products_id`, `categories_id`, `collections_id`, `created_at`, `updated_at`) VALUES
(1, 'Grupo 1', 1, 1, 2, 1, '2021-07-26 21:18:44', '2021-07-26 21:18:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_inventories`
--

CREATE TABLE `tbl_inventories` (
  `inventories_id` int(10) UNSIGNED NOT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `sucursals_id` int(10) UNSIGNED DEFAULT NULL,
  `sizes_id` int(11) DEFAULT NULL,
  `inventories_image_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `inventories_codigo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_id` int(10) UNSIGNED DEFAULT NULL,
  `layaway_id` int(11) DEFAULT NULL,
  `purchase_orders_id` int(10) UNSIGNED DEFAULT NULL,
  `user_id` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_inventories`
--

INSERT INTO `tbl_inventories` (`inventories_id`, `products_id`, `sucursals_id`, `sizes_id`, `inventories_image_url`, `inventories_codigo`, `sales_id`, `layaway_id`, `purchase_orders_id`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, 1, 'inventories-ec6a9522-96e3-4487-9ffe-4f9e0f4b054f-2021-07-26.jpeg', 'rcQZ', 1, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-07-26 23:02:24'),
(2, 1, NULL, 1, 'inventories-3ed1acf7-0e01-469e-9d75-d92f1f68d5bb-2021-07-26.png', 'AIvz', 3, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-08-10 11:50:54'),
(3, 1, NULL, 1, NULL, '0PA3', 3, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-08-10 11:50:54'),
(4, 1, NULL, 1, NULL, '3Noi', 2, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-07-28 03:52:13'),
(5, 1, NULL, 1, NULL, 'zqhj', 4, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-08-17 14:12:10'),
(6, 1, NULL, 1, NULL, 'Aybb', NULL, 4, NULL, 1, '2021-07-26 22:05:06', '2021-08-17 14:57:42'),
(7, 1, NULL, 1, NULL, 'g2ZT', 5, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-08-17 21:35:34'),
(8, 1, 1, 1, NULL, '7QAJ', NULL, 5, NULL, 1, '2021-07-26 22:05:06', '2021-08-26 00:53:34'),
(9, 1, 2, 1, NULL, 'BwOb', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(10, 1, 2, 1, NULL, 'DTbs', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(11, 1, 2, 1, NULL, 'GsdQ', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(12, 1, 2, 1, NULL, 'ycjn', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(13, 1, 2, 1, NULL, 'mPhb', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(14, 1, 2, 1, NULL, 'K9fl', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(15, 1, 2, 1, NULL, 'vZ64', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(16, 1, 2, 1, NULL, 'ueT4', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(17, 1, 2, 1, NULL, 'pB7p', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(18, 1, 2, 1, NULL, 'RpFF', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(19, 1, 2, 1, NULL, '5ucG', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(20, 1, 2, 1, NULL, 'AbE6', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(21, 1, 2, 1, NULL, 'KL4B', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(22, 1, 2, 1, NULL, 'Aprz', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(23, 1, 2, 1, NULL, 'ILRz', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-03 21:04:53'),
(24, 1, 1, 1, NULL, 'hixq', 19, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-05 19:39:41'),
(25, 1, 1, 1, NULL, 'YhwJ', 19, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-05 19:39:41'),
(26, 1, 1, 1, NULL, 'sbqj', 19, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-11-05 19:39:41'),
(27, 1, 1, 1, NULL, '3Gdg', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-09-01 00:09:53'),
(28, 1, 1, 1, NULL, 'Plij', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-09-01 00:09:53'),
(29, 1, 1, 1, NULL, '89h1', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-09-01 00:09:53'),
(30, 1, 1, 1, NULL, 'I0FV', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-09-01 00:09:53'),
(31, 1, 1, 1, NULL, 'W4tZ', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-09-01 00:09:53'),
(32, 1, 1, 1, NULL, 'n6fY', NULL, NULL, NULL, 1, '2021-07-26 22:05:06', '2021-09-01 00:09:53'),
(33, 1, 1, 1, NULL, 'mn9n', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(34, 1, 1, 1, NULL, 'zzEB', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(35, 1, 1, 1, NULL, 'FTX4', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(36, 1, 1, 1, NULL, 'OhTN', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(37, 1, 1, 1, NULL, 'kjYQ', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(38, 1, 1, 1, NULL, 'bYKj', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(39, 1, 1, 1, NULL, 'Jmrx', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(40, 1, 1, 1, NULL, 'SvxL', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(41, 1, 1, 1, NULL, '1tDf', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(42, 1, 1, 1, NULL, 'BqQk', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(43, 1, 1, 1, NULL, 'BGDK', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(44, 1, 1, 1, NULL, 'rVJc', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(45, 1, 1, 1, NULL, 'D15P', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(46, 1, 1, 1, NULL, 'i91K', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(47, 1, 1, 1, NULL, 'SEYD', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(48, 1, 1, 1, NULL, '8E9B', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(49, 1, 1, 1, NULL, 'MIB7', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(50, 1, 1, 1, NULL, 'XHNB', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(51, 1, 1, 2, NULL, 'cFZz', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(52, 1, 1, 2, NULL, 'BSL8', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(53, 1, 1, 2, NULL, 'kSCs', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(54, 1, 1, 2, NULL, '7Z4g', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(55, 1, 1, 2, NULL, 'Wc0y', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(56, 1, 1, 2, NULL, 'GPUH', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(57, 1, 1, 2, NULL, 'LjIm', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(58, 1, 1, 2, NULL, 'HlH6', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(59, 1, 1, 2, NULL, 'NYGA', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(60, 1, 1, 2, NULL, 'mrva', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(61, 1, 1, 2, NULL, 'tZRO', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(62, 1, 1, 2, NULL, 'WLrV', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(63, 1, 1, 2, NULL, 'LBrL', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(64, 1, 1, 2, NULL, '7RwV', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(65, 1, 1, 2, NULL, 'quz8', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(66, 1, 1, 2, NULL, 'S6Pj', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(67, 1, 1, 2, NULL, 'rvrG', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(68, 1, 1, 2, NULL, 'dcnA', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(69, 1, 1, 2, NULL, 'HtMO', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(70, 1, 1, 2, NULL, 'UJww', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(71, 1, 1, 3, NULL, '78Zu', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(72, 1, 1, 3, NULL, 'c2uv', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(73, 1, 1, 3, NULL, 'bFQL', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(74, 1, 1, 3, NULL, 'wR0r', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(75, 1, 1, 3, NULL, 'rgwl', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(76, 1, 1, 3, NULL, 'GV7R', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(77, 1, 1, 3, NULL, 'cvJ4', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(78, 1, 1, 3, NULL, 'yFNQ', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(79, 1, 1, 3, NULL, '1j6w', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(80, 1, 1, 3, NULL, 'LK6B', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(81, 1, 1, 3, NULL, 'Ru0A', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(82, 1, 1, 3, NULL, '6uEp', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(83, 1, 1, 3, NULL, 'SAsI', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(84, 1, 1, 3, NULL, 'psk8', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(85, 1, 1, 3, NULL, 'E4qJ', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(86, 1, 1, 3, NULL, 'XLHM', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(87, 1, 1, 3, NULL, 'X4qz', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(88, 1, 1, 3, NULL, '66W6', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(89, 1, 1, 3, NULL, 'CFxs', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(90, 1, 1, 3, NULL, 'XPP2', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(91, 1, 1, 3, NULL, 'EtJU', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(92, 1, 1, 3, NULL, 'jeDT', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(93, 1, 1, 3, NULL, 'uK1u', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(94, 1, 1, 3, NULL, 'HdIy', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(95, 1, 1, 3, NULL, 'gKIM', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(96, 1, 1, 3, NULL, 'Nkou', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(97, 1, 1, 3, NULL, 'LR98', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(98, 1, 1, 3, NULL, 'b0xj', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(99, 1, 1, 3, NULL, 'c5sS', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(100, 1, 1, 3, NULL, 'Odxx', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(101, 1, 1, 3, NULL, 'So0E', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(102, 1, 1, 3, NULL, 'zUS3', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(103, 1, 1, 3, NULL, 'ASAv', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(104, 1, 1, 3, NULL, 'Bwtc', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(105, 1, 1, 3, NULL, 'AI9g', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(106, 1, 1, 3, NULL, 'NO2U', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(107, 1, 1, 3, NULL, 'B8z5', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(108, 1, 1, 3, NULL, 'WC5z', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(109, 1, 1, 3, NULL, 'hZ1Y', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(110, 1, 1, 3, NULL, 'taUP', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(111, 1, 1, 3, NULL, 'pf42', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(112, 1, 1, 3, NULL, 'FoPm', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(113, 1, 1, 3, NULL, 'CA5b', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(114, 1, 1, 3, NULL, 'F1RX', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(115, 1, 1, 3, NULL, 'NdhD', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(116, 1, 1, 3, NULL, 'yI5B', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(117, 1, 1, 3, NULL, 'dfs8', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(118, 1, 1, 3, NULL, 'smCC', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(119, 1, 1, 3, NULL, '6P6K', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(120, 1, 1, 3, NULL, 'b7Xa', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(121, 1, 1, 3, NULL, '1rN3', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(122, 1, 1, 3, NULL, 'rytq', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(123, 1, 1, 3, NULL, 'MSim', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(124, 1, 1, 3, NULL, 'RBMy', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(125, 1, 1, 3, NULL, '0AJd', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(126, 1, 1, 3, NULL, '0gQe', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(127, 1, 1, 3, NULL, 'YA1N', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(128, 1, 1, 3, NULL, 'n1hs', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(129, 1, 1, 3, NULL, 'cphK', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(130, 1, 1, 3, NULL, 'VCoC', NULL, NULL, NULL, 1, '2021-07-26 22:05:07', '2021-09-01 00:09:53'),
(131, 1, 1, 4, NULL, 'w56A', NULL, NULL, NULL, 1, '2021-07-26 22:09:30', '2021-09-01 00:09:53'),
(132, 1, 1, 5, NULL, 'oYKF', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(133, 1, 1, 5, NULL, 'seDQ', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(134, 1, 1, 5, NULL, 'Tbhb', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(135, 1, 1, 5, NULL, 'wd8I', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(136, 1, 1, 5, NULL, '3PFg', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(137, 1, 1, 5, NULL, 'l4r7', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(138, 1, 1, 5, NULL, 'N9s8', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(139, 1, 1, 5, NULL, 'HoBB', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(140, 1, 1, 5, NULL, '3yaX', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(141, 1, 1, 5, NULL, 'cX1D', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(142, 1, 1, 5, NULL, 'doqc', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(143, 1, 1, 5, NULL, 'OzL3', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(144, 1, 1, 5, NULL, 'crl6', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(145, 1, 1, 5, NULL, 'eHp9', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(146, 1, 1, 5, NULL, 'Zrig', NULL, NULL, NULL, 1, '2021-08-26 03:03:40', '2021-09-01 00:09:53'),
(147, 1, 1, 6, 'inventories-3feb8d94-3447-4ac7-91bb-ba94f483c3aa-2021-08-27.jpg', 'QVzS', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(148, 1, 1, 6, NULL, 'NCq5', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(149, 1, 1, 6, NULL, '8bNJ', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(150, 1, 1, 6, NULL, 'sodB', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(151, 1, 1, 6, NULL, '8NvJ', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(152, 1, 1, 6, NULL, 'okkf', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(153, 1, 1, 6, NULL, 'Tarw', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(154, 1, 1, 6, NULL, 'bsor', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(155, 1, 1, 6, NULL, 'Utto', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(156, 1, 1, 6, NULL, '0My5', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(157, 1, 1, 6, NULL, 'wKUq', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(158, 1, 1, 6, NULL, '7puK', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(159, 1, 1, 6, NULL, '4YI0', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(160, 1, 1, 6, NULL, 'mcuo', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(161, 1, 1, 6, NULL, 'tRQI', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(162, 1, 1, 6, NULL, 'zQvL', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(163, 1, 1, 6, NULL, '39hb', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(164, 1, 1, 6, NULL, 'QNjX', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(165, 1, 1, 6, NULL, '3uyy', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(166, 1, 1, 6, NULL, 'fxpc', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(167, 1, 1, 6, NULL, 'VPOV', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(168, 1, 1, 6, NULL, 'Se58', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(169, 1, 1, 6, NULL, '3AMM', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(170, 1, 1, 6, NULL, '65BQ', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(171, 1, 1, 6, NULL, 'Copt', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(172, 1, 1, 6, NULL, 'F0iw', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(173, 1, 1, 6, NULL, 'BsZh', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(174, 1, 1, 6, NULL, 'N0un', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(175, 1, 1, 6, NULL, 'yc4y', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(176, 1, 1, 6, NULL, 'o7WH', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(177, 1, 1, 6, NULL, '1ovo', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(178, 1, 1, 6, NULL, 'u3RW', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(179, 1, 1, 6, NULL, '6fRp', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(180, 1, 1, 6, NULL, 'ZqFj', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(181, 1, 1, 6, NULL, '2Oll', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(182, 1, 1, 6, NULL, '0KrW', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(183, 1, 1, 6, NULL, 'PVdG', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(184, 1, 1, 6, NULL, 'tjN9', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(185, 1, 1, 6, NULL, 'wbkn', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(186, 1, 1, 6, NULL, 'LJ9L', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(187, 1, 1, 6, NULL, 'aTh4', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(188, 1, 1, 6, NULL, 'ZwLk', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(189, 1, 1, 6, NULL, '5AJ9', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(190, 1, 1, 6, NULL, 'Ykoe', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(191, 1, 1, 6, NULL, 'H5LT', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(192, 1, 1, 6, NULL, 'dmOd', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(193, 1, 1, 6, NULL, '3QeL', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(194, 1, 1, 6, NULL, 'ZiUl', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(195, 1, 1, 6, NULL, 'Z96K', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(196, 1, 1, 6, NULL, '2yPv', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(197, 1, 1, 6, NULL, 'VwMy', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(198, 1, 1, 6, NULL, '2v0H', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(199, 1, 1, 6, NULL, '8UsU', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(200, 1, 1, 6, NULL, 'guJe', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(201, 1, 1, 6, NULL, 'Q7vr', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(202, 1, 1, 6, NULL, 'nUDr', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(203, 1, 1, 6, NULL, 'SPtE', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(204, 1, 1, 6, NULL, 'hAyt', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(205, 1, 1, 6, NULL, '2leq', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(206, 1, 1, 6, NULL, 'FmbH', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(207, 1, 1, 6, NULL, '4K0L', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(208, 1, 1, 6, NULL, 'S13i', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(209, 1, 1, 6, NULL, 'qSLp', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(210, 1, 1, 6, NULL, 'emce', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(211, 1, 1, 6, NULL, 'nMWb', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(212, 1, 1, 6, NULL, 'dZLZ', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(213, 1, 1, 6, NULL, 'NPQt', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(214, 1, 1, 6, NULL, 'umdJ', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(215, 1, 1, 6, NULL, 'f2h1', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(216, 1, 1, 6, NULL, 'YHbL', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(217, 1, 1, 6, NULL, 'zTmm', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(218, 1, 1, 6, NULL, 'QqwK', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(219, 1, 1, 6, NULL, 'ETsW', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(220, 1, 1, 6, NULL, '2GzC', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(221, 1, 1, 6, NULL, 'xI0q', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(222, 1, 1, 6, NULL, 'VFlz', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(223, 1, 1, 6, NULL, 'f2tq', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(224, 1, 1, 6, NULL, '0doD', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(225, 1, 1, 6, NULL, 'ssQv', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(226, 1, 1, 6, NULL, 'Glk5', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(227, 1, 1, 6, NULL, 'tj4N', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(228, 1, 1, 6, NULL, 'FSlB', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(229, 1, 1, 6, NULL, 'hbZl', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(230, 1, 1, 6, NULL, 'me4Q', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(231, 1, 1, 6, NULL, 'bL1b', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(232, 1, 1, 6, NULL, 'taAE', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(233, 1, 1, 6, NULL, 'YSJV', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(234, 1, 1, 6, NULL, 'lKwk', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(235, 1, 1, 6, NULL, 'Fpgs', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(236, 1, 1, 6, NULL, 'uLYa', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(237, 1, 1, 6, NULL, '3XZj', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(238, 1, 1, 6, NULL, 'S2o6', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(239, 1, 1, 6, NULL, 'qS1T', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(240, 1, 1, 6, NULL, 'R6wY', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(241, 1, 1, 6, NULL, 'U6T2', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(242, 1, 1, 6, NULL, 'Ttll', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(243, 1, 1, 6, NULL, 'ddr3', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(244, 1, 1, 6, NULL, 'B1Vs', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(245, 1, 1, 6, NULL, 'Lewg', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(246, 1, 1, 6, NULL, 'chSw', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(247, 1, 1, 6, NULL, 'kwrN', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(248, 1, 1, 6, NULL, 'FdPY', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(249, 1, 1, 6, NULL, 'VSxO', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(250, 1, 1, 6, NULL, '9PIP', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(251, 1, 1, 6, NULL, 'fBJn', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(252, 1, 1, 6, NULL, 'GfPy', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(253, 1, 1, 6, NULL, 'g4XW', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(254, 1, 1, 6, NULL, 'Vhgo', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(255, 1, 1, 6, NULL, 'TVWN', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(256, 1, 1, 6, NULL, 'a8H1', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(257, 1, 1, 6, NULL, 'hgqU', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(258, 1, 1, 6, NULL, 'FT1F', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(259, 1, 1, 6, NULL, '84Vo', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(260, 1, 1, 6, NULL, '1Lgn', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(261, 1, 1, 6, NULL, 'dc7y', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(262, 1, 1, 6, NULL, 'sk05', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(263, 1, 1, 6, NULL, 'GATD', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(264, 1, 1, 6, NULL, 'el7L', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(265, 1, 1, 6, NULL, 'VTQt', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(266, 1, 1, 6, NULL, '12UC', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(267, 1, 1, 6, NULL, 'VnBk', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(268, 1, 1, 6, NULL, 'TUBZ', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(269, 1, 1, 6, NULL, '4zaO', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(270, 1, 1, 6, NULL, 'cUYw', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(271, 1, 1, 6, NULL, 'y7WT', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(272, 1, 1, 6, NULL, 'lIy1', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(273, 1, 1, 6, NULL, 'fNMz', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(274, 1, 1, 6, NULL, 'Qt0Y', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(275, 1, 1, 6, NULL, 'rm5S', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(276, 1, 1, 6, NULL, 'dHS2', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(277, 1, 1, 6, NULL, 'pi1i', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(278, 1, 1, 6, NULL, 'DtQ5', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(279, 1, 1, 6, NULL, 'nANh', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(280, 1, 1, 6, NULL, 'aTpf', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(281, 1, 1, 6, NULL, 'ubf1', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(282, 1, 1, 6, NULL, 'cNhx', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(283, 1, 1, 6, NULL, 'MnzF', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(284, 1, 1, 6, NULL, 'qurq', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(285, 1, 1, 6, NULL, 'Up3A', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(286, 1, 1, 6, NULL, 'ssMK', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(287, 1, 1, 6, NULL, 'x8cO', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(288, 1, 1, 6, NULL, 'uZWk', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(289, 1, 1, 6, NULL, 'pnj5', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(290, 1, 1, 6, NULL, 'JF4H', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(291, 1, 1, 6, NULL, 'Mfo7', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(292, 1, 1, 6, NULL, 'SMqz', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(293, 1, 1, 6, NULL, '2vk1', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(294, 1, 1, 6, NULL, 'b5Hk', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(295, 1, 1, 6, NULL, 'IEnw', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(296, 1, 1, 6, NULL, 'SSoo', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(297, 1, 1, 6, NULL, 'xe8B', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(298, 1, 1, 6, NULL, '8lGE', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(299, 1, 1, 6, NULL, 'VDGt', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(300, 1, 1, 6, NULL, 'pvmK', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(301, 1, 1, 6, NULL, '86CB', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(302, 1, 1, 6, NULL, 'TWYk', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(303, 1, 1, 6, NULL, 'przW', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(304, 1, 1, 6, NULL, 'mRvy', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(305, 1, 1, 6, NULL, 'lks1', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(306, 1, 1, 6, NULL, 'UKLj', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(307, 1, 1, 6, NULL, 'MITS', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(308, 1, 1, 6, NULL, 'dKKY', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(309, 1, 1, 6, NULL, 'bHEo', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(310, 1, 1, 6, NULL, '1OKj', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(311, 1, 1, 6, NULL, '3Yzq', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(312, 1, 1, 6, NULL, 'SMmU', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(313, 1, 1, 6, NULL, 'FNxI', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(314, 1, 1, 6, NULL, 'hP2e', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(315, 1, 1, 6, NULL, 'xdCs', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(316, 1, 1, 6, NULL, 'Nx7I', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(317, 1, 1, 6, NULL, '9t62', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(318, 1, 1, 6, NULL, 'h01M', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(319, 1, 1, 6, NULL, 'T17T', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(320, 1, 1, 6, NULL, 'z8sv', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(321, 1, 1, 6, NULL, '9lIL', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(322, 1, 1, 6, NULL, 'h1Sy', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(323, 1, 1, 6, NULL, 'Fygz', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(324, 1, 1, 6, NULL, 'iI9Y', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(325, 1, 1, 6, NULL, 'ufp9', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(326, 1, 1, 6, NULL, 'IrXF', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(327, 1, 1, 6, NULL, '0QCC', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(328, 1, 1, 6, NULL, 'b85E', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(329, 1, 1, 6, NULL, 'Hbmo', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(330, 1, 1, 6, NULL, 'lDhX', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(331, 1, 1, 6, NULL, 'sY0C', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(332, 1, 1, 6, NULL, 'TkUL', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(333, 1, 1, 6, NULL, 'nZLo', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(334, 1, 1, 6, NULL, 'sOWA', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(335, 1, 1, 6, NULL, 'QDF8', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(336, 1, 1, 6, NULL, '221k', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(337, 1, 1, 6, NULL, 'zxZm', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(338, 1, 1, 6, NULL, 'WXhm', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(339, 1, 1, 6, NULL, 'vZbd', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(340, 1, 1, 6, NULL, 'SDXM', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(341, 1, 1, 6, NULL, 'IZby', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(342, 1, 1, 6, NULL, '6tqi', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(343, 1, 1, 6, NULL, 'C2yb', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(344, 1, 1, 6, NULL, 'KBYY', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(345, 1, 1, 6, NULL, 'P1W7', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(346, 1, 1, 6, NULL, 'kgUQ', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(347, 1, 1, 6, NULL, '30v9', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(348, 1, 1, 6, NULL, 'arjg', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(349, 1, 1, 6, NULL, 't2KI', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(350, 1, 1, 6, NULL, 'PYZE', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(351, 1, 1, 6, NULL, 'qTut', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(352, 1, 1, 6, NULL, 'FkBg', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(353, 1, 1, 6, NULL, 'pUtc', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(354, 1, 1, 6, NULL, 'L3s5', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(355, 1, 1, 6, NULL, '4l0N', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(356, 1, 1, 6, NULL, 'PBGk', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(357, 1, 1, 6, NULL, 'BveX', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(358, 1, 1, 6, NULL, 'daOk', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(359, 1, 1, 6, NULL, 'iVXm', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(360, 1, 1, 6, NULL, 'qDFE', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(361, 1, 1, 6, NULL, 'rqu4', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(362, 1, 1, 6, NULL, 'UAEq', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(363, 1, 1, 6, NULL, 'qG53', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(364, 1, 1, 6, NULL, 'lFAq', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(365, 1, 1, 6, NULL, '8IQ7', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(366, 1, 1, 6, NULL, 'cle8', NULL, NULL, NULL, 1, '2021-08-28 02:12:35', '2021-09-01 00:09:53'),
(367, 1, 1, 6, NULL, 'Tcc7', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(368, 1, 1, 6, NULL, 'jEMR', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(369, 1, 1, 6, NULL, 'e6OF', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(370, 1, 1, 6, NULL, 'kY9X', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(371, 1, 1, 6, NULL, 'JSTO', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(372, 1, 1, 6, NULL, 'MbAH', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(373, 1, 1, 6, NULL, '9bjf', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(374, 1, 1, 6, NULL, 'ZqRf', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(375, 1, 1, 6, NULL, 'aLtS', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(376, 1, 1, 6, NULL, 'Z9ue', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(377, 1, 1, 6, NULL, '9pDA', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(378, 1, 1, 6, NULL, 't2EM', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(379, 1, 1, 6, NULL, 'alcl', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(380, 1, 1, 6, NULL, 'HHP9', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(381, 1, 1, 6, NULL, '4lNF', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(382, 1, 1, 6, NULL, '2kAQ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(383, 1, 1, 6, NULL, 'dvBM', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(384, 1, 1, 6, NULL, 'UTOi', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(385, 1, 1, 6, NULL, 'U2TS', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(386, 1, 1, 6, NULL, 'CLNn', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(387, 1, 1, 6, NULL, 'LLpI', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(388, 1, 1, 6, NULL, '3u9x', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(389, 1, 1, 6, NULL, 'rWlU', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(390, 1, 1, 6, NULL, 'LHxH', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(391, 1, 1, 6, NULL, 'KLDB', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(392, 1, 1, 6, NULL, 'ArNn', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(393, 1, 1, 6, NULL, 'XVsY', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(394, 1, 1, 6, NULL, '1OXT', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(395, 1, 1, 6, NULL, '9zCs', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(396, 1, 1, 6, NULL, '6nAN', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(397, 1, 1, 6, NULL, 'et1d', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(398, 1, 1, 6, NULL, 'lm9C', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(399, 1, 1, 6, NULL, 'dz3X', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(400, 1, 1, 6, NULL, 'MjAn', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(401, 1, 1, 6, NULL, 'nPfI', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(402, 1, 1, 6, NULL, 'S7PA', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(403, 1, 1, 6, NULL, 'Gx8M', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(404, 1, 1, 6, NULL, 'fOMJ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(405, 1, 1, 6, NULL, 'b5wY', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(406, 1, 1, 6, NULL, 'MiFo', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(407, 1, 1, 6, NULL, 'kTSH', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(408, 1, 1, 6, NULL, 'x7uc', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(409, 1, 1, 6, NULL, 'ZSZi', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(410, 1, 1, 6, NULL, 'GDKW', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(411, 1, 1, 6, NULL, 'Fw50', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(412, 1, 1, 6, NULL, 'dVC0', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(413, 1, 1, 6, NULL, 'A68p', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(414, 1, 1, 6, NULL, 'lss0', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(415, 1, 1, 6, NULL, 'aznq', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(416, 1, 1, 6, NULL, '6R1j', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(417, 1, 1, 6, NULL, '2VtJ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(418, 1, 1, 6, NULL, 'Ox4l', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(419, 1, 1, 6, NULL, '9LWa', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(420, 1, 1, 6, NULL, 'C0FI', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(421, 1, 1, 6, NULL, 'EGd9', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(422, 1, 1, 6, NULL, 'lKP5', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(423, 1, 1, 6, NULL, 'wcuB', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(424, 1, 1, 6, NULL, 'HUsw', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(425, 1, 1, 6, NULL, 'aWdN', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(426, 1, 1, 6, NULL, 'SoR8', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(427, 1, 1, 6, NULL, '51EM', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(428, 1, 1, 6, NULL, 'F4KX', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(429, 1, 1, 6, NULL, 'PzO6', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(430, 1, 1, 6, NULL, 'hvds', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(431, 1, 1, 6, NULL, '8DgS', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(432, 1, 1, 6, NULL, 'NVRN', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(433, 1, 1, 6, NULL, 'WdMU', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(434, 1, 1, 6, NULL, '4rJJ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(435, 1, 1, 6, NULL, '25p9', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(436, 1, 1, 6, NULL, 'lqFB', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(437, 1, 1, 6, NULL, '51VI', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(438, 1, 1, 6, NULL, 'NT8T', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(439, 1, 1, 6, NULL, 'X8mn', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(440, 1, 1, 6, NULL, 'o36X', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(441, 1, 1, 6, NULL, 'a161', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(442, 1, 1, 6, NULL, 'r5C4', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(443, 1, 1, 6, NULL, 'brHs', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(444, 1, 1, 6, NULL, 'xjfb', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(445, 1, 1, 6, NULL, '02mm', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(446, 1, 1, 6, NULL, 'EOBN', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(447, 1, 1, 6, NULL, 'vbKn', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(448, 1, 1, 6, NULL, '04jM', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(449, 1, 1, 6, NULL, 'BBNj', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(450, 1, 1, 6, NULL, '9dBe', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(451, 1, 1, 6, NULL, 'cuW2', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(452, 1, 1, 6, NULL, 'lhzQ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(453, 1, 1, 6, NULL, 'OL6M', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(454, 1, 1, 6, NULL, 'cLhR', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(455, 1, 1, 6, NULL, 'e0p2', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(456, 1, 1, 6, NULL, 'XrQH', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(457, 1, 1, 6, NULL, 'ftKu', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(458, 1, 1, 6, NULL, 'JxNq', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(459, 1, 1, 6, NULL, 'P5AJ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(460, 1, 1, 6, NULL, '5MgN', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(461, 1, 1, 6, NULL, 'nfew', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(462, 1, 1, 6, NULL, 'tpEr', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(463, 1, 1, 6, NULL, 'RIVg', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(464, 1, 1, 6, NULL, '8ttm', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(465, 1, 1, 6, NULL, 'RZhw', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(466, 1, 1, 6, NULL, 'O9oJ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(467, 1, 1, 6, NULL, 'o3qa', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(468, 1, 1, 6, NULL, 'aMQy', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(469, 1, 1, 6, NULL, '3KcT', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(470, 1, 1, 6, NULL, 'qPW1', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(471, 1, 1, 6, NULL, 'KkID', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(472, 1, 1, 6, NULL, 'FOjC', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(473, 1, 1, 6, NULL, 'HT8Y', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(474, 1, 1, 6, NULL, 'fqMR', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(475, 1, 1, 6, NULL, 'Xl62', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(476, 1, 1, 6, NULL, 'xiZR', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(477, 1, 1, 6, NULL, 'N5NQ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(478, 1, 1, 6, NULL, 'fNd1', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(479, 1, 1, 6, NULL, 'DbDE', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(480, 1, 1, 6, NULL, '9jCn', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(481, 1, 1, 6, NULL, '8F8P', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(482, 1, 1, 6, NULL, 'vi5w', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(483, 1, 1, 6, NULL, 'uATI', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(484, 1, 1, 6, NULL, 'lgtL', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(485, 1, 1, 6, NULL, '45tX', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(486, 1, 1, 6, NULL, '9Kw6', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(487, 1, 1, 6, NULL, 'gD1P', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(488, 1, 1, 6, NULL, 't4TE', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(489, 1, 1, 6, NULL, 'sXln', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(490, 1, 1, 6, NULL, 'G8bj', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(491, 1, 1, 6, NULL, 'FLmM', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(492, 1, 1, 6, NULL, 'VQVx', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(493, 1, 1, 6, NULL, 'oL58', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(494, 1, 1, 6, NULL, '9dMR', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(495, 1, 1, 6, NULL, 'CqjF', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(496, 1, 1, 6, NULL, 'xIJW', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(497, 1, 1, 6, NULL, 'aFAb', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(498, 1, 1, 6, NULL, 'LgCD', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(499, 1, 1, 6, NULL, 'BD6i', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(500, 1, 1, 6, NULL, 'CQ60', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(501, 1, 1, 6, NULL, 'sppP', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(502, 1, 1, 6, NULL, '7Ozz', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(503, 1, 1, 6, NULL, 'R8Ae', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(504, 1, 1, 6, NULL, 'LOsb', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(505, 1, 1, 6, NULL, 'Y3pZ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(506, 1, 1, 6, NULL, '4AVz', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(507, 1, 1, 6, NULL, 'yaLJ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(508, 1, 1, 6, NULL, 'OLd0', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(509, 1, 1, 6, NULL, 'wmvU', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(510, 1, 1, 6, NULL, 'tWgE', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(511, 1, 1, 6, NULL, 'Ahgh', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(512, 1, 1, 6, NULL, 'HR0S', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(513, 1, 1, 6, NULL, 'gG5Q', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(514, 1, 1, 6, NULL, 'yagN', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(515, 1, 1, 6, NULL, 'Fz2o', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(516, 1, 1, 6, NULL, 'GmBF', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(517, 1, 1, 6, NULL, '2spf', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(518, 1, 1, 6, NULL, 'kNmm', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(519, 1, 1, 6, NULL, 'DJwu', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(520, 1, 1, 6, NULL, 'bv7r', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(521, 1, 1, 6, NULL, 'xnPb', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(522, 1, 1, 6, NULL, 'iYdh', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(523, 1, 1, 6, NULL, 'eXoV', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53');
INSERT INTO `tbl_inventories` (`inventories_id`, `products_id`, `sucursals_id`, `sizes_id`, `inventories_image_url`, `inventories_codigo`, `sales_id`, `layaway_id`, `purchase_orders_id`, `user_id`, `created_at`, `updated_at`) VALUES
(524, 1, 1, 6, NULL, 'YX51', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(525, 1, 1, 6, NULL, 'r2Ca', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(526, 1, 1, 6, NULL, '6OaF', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(527, 1, 1, 6, NULL, 'WmJG', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(528, 1, 1, 6, NULL, 'UUcn', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(529, 1, 1, 6, NULL, 'jiM1', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(530, 1, 1, 6, NULL, 'Zcjc', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(531, 1, 1, 6, NULL, 'XrF3', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(532, 1, 1, 6, NULL, 'UsLI', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(533, 1, 1, 6, NULL, 'bm6K', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(534, 1, 1, 6, NULL, 'Dr70', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(535, 1, 1, 6, NULL, 'Q9G5', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(536, 1, 1, 6, NULL, 'BXLS', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(537, 1, 1, 6, NULL, 'tPyZ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(538, 1, 1, 6, NULL, 'rj6z', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(539, 1, 1, 6, NULL, 'XNfw', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(540, 1, 1, 6, NULL, 'XktV', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(541, 1, 1, 6, NULL, 'MMfj', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(542, 1, 1, 6, NULL, 'q8u3', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(543, 1, 1, 6, NULL, 'eftz', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(544, 1, 1, 6, NULL, '3Ehh', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(545, 1, 1, 6, NULL, 'IlD0', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(546, 1, 1, 6, NULL, 'NsMi', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(547, 1, 1, 6, NULL, '8917', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(548, 1, 1, 6, NULL, 'IM5K', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(549, 1, 1, 6, NULL, 'ZSvS', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(550, 1, 1, 6, NULL, 'gm1A', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(551, 1, 1, 6, NULL, 'dKys', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(552, 1, 1, 6, NULL, 'IWdD', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(553, 1, 1, 6, NULL, 'bG7g', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(554, 1, 1, 6, NULL, 'aLiz', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(555, 1, 1, 6, NULL, 'ZcWg', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(556, 1, 1, 6, NULL, 'tRdL', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(557, 1, 1, 6, NULL, 'tGJn', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(558, 1, 1, 6, NULL, 'LMpH', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(559, 1, 1, 6, NULL, 'auw5', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(560, 1, 1, 6, NULL, 'sdHE', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(561, 1, 1, 6, NULL, 'qEao', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(562, 1, 1, 6, NULL, 'Jo5V', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(563, 1, 1, 6, NULL, 'rMb4', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(564, 1, 1, 6, NULL, 'CuYE', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(565, 1, 1, 6, NULL, 'YJ85', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(566, 1, 1, 6, NULL, 'XJBe', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(567, 1, 1, 6, NULL, '7EbX', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(568, 1, 1, 6, NULL, 'uWUz', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(569, 1, 1, 6, NULL, 'EmPi', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(570, 1, 1, 6, NULL, 'c1LQ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(571, 1, 1, 6, NULL, 'TscC', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(572, 1, 1, 6, NULL, 'dco9', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(573, 1, 1, 6, NULL, 'bOrR', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(574, 1, 1, 6, NULL, '1TOh', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(575, 1, 1, 6, NULL, 'C0FI', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(576, 1, 1, 6, NULL, 's71N', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(577, 1, 1, 6, NULL, 'Tqcu', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(578, 1, 1, 6, NULL, 'Qt7S', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(579, 1, 1, 6, NULL, 'Qti4', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(580, 1, 1, 6, NULL, '3krF', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(581, 1, 1, 6, NULL, 'qTM6', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(582, 1, 1, 6, NULL, 'RUh4', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(583, 1, 1, 6, NULL, '9o0U', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(584, 1, 1, 6, NULL, 'JrGd', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(585, 1, 1, 6, NULL, 'J01Y', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(586, 1, 1, 6, NULL, 'V8ap', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(587, 1, 1, 6, NULL, '2Afy', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(588, 1, 1, 6, NULL, 'knLI', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(589, 1, 1, 6, NULL, 'wcnl', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(590, 1, 1, 6, NULL, 'eQI0', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(591, 1, 1, 6, NULL, 'zxrs', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(592, 1, 1, 6, NULL, 'yLFv', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(593, 1, 1, 6, NULL, 'Gmhe', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(594, 1, 1, 6, NULL, 'jvDA', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(595, 1, 1, 6, NULL, '9YSZ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(596, 1, 1, 6, NULL, 'FEfV', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(597, 1, 1, 6, NULL, 'OuzC', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(598, 1, 1, 6, NULL, 'gPak', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(599, 1, 1, 6, NULL, 'hfp1', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(600, 1, 1, 6, NULL, 'RzRg', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(601, 1, 1, 6, NULL, 'dnUC', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(602, 1, 1, 6, NULL, 'Ofrb', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(603, 1, 1, 6, NULL, 'BGNv', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(604, 1, 1, 6, NULL, 'HCa6', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(605, 1, 1, 6, NULL, 'AAHX', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(606, 1, 1, 6, NULL, 'A6LW', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(607, 1, 1, 6, NULL, '84lZ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(608, 1, 1, 6, NULL, 'rWgb', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(609, 1, 1, 6, NULL, 'EmlZ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(610, 1, 1, 6, NULL, '1nI1', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(611, 1, 1, 6, NULL, 'Abos', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(612, 1, 1, 6, NULL, '0TW3', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(613, 1, 1, 6, NULL, 'Xwy0', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(614, 1, 1, 6, NULL, 'Uchc', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(615, 1, 1, 6, NULL, 'KTfA', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(616, 1, 1, 6, NULL, 'ijTj', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(617, 1, 1, 6, NULL, 'iNw8', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(618, 1, 1, 6, NULL, 'qKXT', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(619, 1, 1, 6, NULL, 'gpbe', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(620, 1, 1, 6, NULL, 'ANDk', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(621, 1, 1, 6, NULL, 'ZSe1', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(622, 1, 1, 6, NULL, 'SOdy', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(623, 1, 1, 6, NULL, 'Jps8', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(624, 1, 1, 6, NULL, 'jLVu', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(625, 1, 1, 6, NULL, '8jrx', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(626, 1, 1, 6, NULL, '2dQ9', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(627, 1, 1, 6, NULL, 'YaEs', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(628, 1, 1, 6, NULL, '3HIp', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(629, 1, 1, 6, NULL, 'u1K2', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(630, 1, 1, 6, NULL, 'mviC', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(631, 1, 1, 6, NULL, 'DBN1', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(632, 1, 1, 6, NULL, 'DfvD', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(633, 1, 1, 6, NULL, 'zHm9', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(634, 1, 1, 6, NULL, '7KXq', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(635, 1, 1, 6, NULL, 'X3Lz', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(636, 1, 1, 6, NULL, 'T40T', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(637, 1, 1, 6, NULL, 'rlwm', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(638, 1, 1, 6, NULL, 'GrDB', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(639, 1, 1, 6, NULL, 'kTfE', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(640, 1, 1, 6, NULL, 'mXLH', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(641, 1, 1, 6, NULL, 'Yc4q', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(642, 1, 1, 6, NULL, 'jJk4', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(643, 1, 1, 6, NULL, '1VM9', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(644, 1, 1, 6, NULL, 'EdSQ', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(645, 1, 1, 6, NULL, 'OrRN', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(646, 1, 1, 6, NULL, 'J6rS', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(647, 1, 1, 6, NULL, 'hV1T', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(648, 1, 1, 6, NULL, 'yVbm', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(649, 1, 1, 6, NULL, 'F2p9', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(650, 1, 1, 6, NULL, 'sZIe', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(651, 1, 1, 6, NULL, 'amYV', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(652, 1, 1, 6, NULL, 'jLcW', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(653, 1, 1, 6, NULL, '5GxK', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(654, 1, 1, 6, NULL, 'Xfkf', NULL, NULL, NULL, 1, '2021-08-28 02:12:36', '2021-09-01 00:09:53'),
(655, 1, 1, 6, NULL, 'RK9u', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(656, 1, 1, 6, NULL, 'CDSj', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(657, 1, 1, 6, NULL, 'I0dA', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(658, 1, 1, 6, NULL, 'gebm', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(659, 1, 1, 6, NULL, '621H', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(660, 1, 1, 6, NULL, 'p2M6', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(661, 1, 1, 6, NULL, 'kwuV', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(662, 1, 1, 6, NULL, '027M', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(663, 1, 1, 6, NULL, 'nPAP', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(664, 1, 1, 6, NULL, 'h8Nw', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(665, 1, 1, 6, NULL, 'BbOW', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(666, 1, 1, 6, NULL, 'mhMy', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(667, 1, 1, 6, NULL, 'yARX', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(668, 1, 1, 6, NULL, '33O1', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(669, 1, 1, 6, NULL, 'M4nX', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(670, 1, 1, 6, NULL, 'rkOk', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(671, 1, 1, 6, NULL, '5TVD', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(672, 1, 1, 6, NULL, 'paeU', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(673, 1, 1, 6, NULL, 'Fh3p', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(674, 1, 1, 6, NULL, 'RSva', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(675, 1, 1, 6, NULL, 'mzoh', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(676, 1, 1, 6, NULL, 'YFQw', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(677, 1, 1, 6, NULL, '8hA7', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(678, 1, 1, 6, NULL, 'BatN', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(679, 1, 1, 6, NULL, '8GOf', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(680, 1, 1, 6, NULL, 'Od0u', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(681, 1, 1, 6, NULL, 'CClD', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(682, 1, 1, 6, NULL, 'l7wm', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(683, 1, 1, 6, NULL, 'gsQB', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(684, 1, 1, 6, NULL, 'vdPC', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(685, 1, 1, 6, NULL, 'FL0u', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(686, 1, 1, 6, NULL, 'f2pg', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(687, 1, 1, 6, NULL, 'ITq3', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(688, 1, 1, 6, NULL, 'lrcW', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(689, 1, 1, 6, NULL, 'kh3b', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(690, 1, 1, 6, NULL, 'bBlZ', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(691, 1, 1, 6, NULL, 'lbrX', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(692, 1, 1, 6, NULL, 'iF3x', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(693, 1, 1, 6, NULL, 'u7i3', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(694, 1, 1, 6, NULL, '6JMQ', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(695, 1, 1, 6, NULL, 'W9fQ', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(696, 1, 1, 6, NULL, 'Mv0o', NULL, NULL, NULL, 1, '2021-08-28 02:12:37', '2021-09-01 00:09:53'),
(697, 1, 1, 7, NULL, 'dYha', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(698, 1, 1, 7, NULL, '6yjA', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(699, 1, 1, 7, NULL, 'qZA6', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(700, 1, 1, 7, NULL, '8UuN', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(701, 1, 1, 7, NULL, 'WkKh', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(702, 1, 1, 7, NULL, 'wG9d', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(703, 1, 1, 7, NULL, 'ip5x', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(704, 1, 1, 7, NULL, 'UCxX', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(705, 1, 1, 7, NULL, 'v6Bc', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(706, 1, 1, 7, NULL, 'qVu4', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(707, 1, 1, 7, NULL, 'y76m', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(708, 1, 1, 7, NULL, 'kfAc', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(709, 1, 1, 7, NULL, 'psZe', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(710, 1, 1, 7, NULL, 'c5tt', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(711, 1, 1, 7, NULL, 'p0DY', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(712, 1, 1, 7, NULL, 'iLca', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(713, 1, 1, 7, NULL, 'ilTH', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(714, 1, 1, 7, NULL, 'V9Jd', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(715, 1, 1, 7, NULL, 'xTOk', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(716, 1, 1, 7, NULL, 'vMTn', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(717, 1, 1, 7, NULL, 'SJn9', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(718, 1, 1, 7, NULL, '2Iln', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(719, 1, 1, 7, NULL, 'yJ3F', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(720, 1, 1, 7, NULL, 'ZoLB', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(721, 1, 1, 7, NULL, 'Mazv', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(722, 1, 1, 7, NULL, 'qnDO', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(723, 1, 1, 7, NULL, 'mzWD', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(724, 1, 1, 7, NULL, '78kh', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(725, 1, 1, 7, NULL, 'Lyw5', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(726, 1, 1, 7, NULL, 'UH4A', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(727, 1, 1, 7, NULL, 'wSdb', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(728, 1, 1, 7, NULL, 'gMlp', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(729, 1, 1, 7, NULL, 'mH3H', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(730, 1, 1, 7, NULL, 'Nnaf', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(731, 1, 1, 7, NULL, 'D6vF', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(732, 1, 1, 7, NULL, 'pPIs', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(733, 1, 1, 7, NULL, 'AV4n', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(734, 1, 1, 7, NULL, 'umms', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(735, 1, 1, 7, NULL, 'xLPa', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(736, 1, 1, 7, NULL, 'rvzb', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(737, 1, 1, 8, NULL, 'V9sM', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(738, 1, 1, 8, NULL, 'qcGP', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(739, 1, 1, 8, NULL, '144x', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(740, 1, 1, 8, NULL, 'IMZM', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(741, 1, 1, 8, NULL, '49jV', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(742, 1, 1, 8, NULL, 'Qrzf', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(743, 1, 1, 8, NULL, 'L7Qp', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(744, 1, 1, 8, NULL, 'JG9S', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(745, 1, 1, 8, NULL, 'JCig', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(746, 1, 1, 8, NULL, 'WRPE', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(747, 1, 1, 8, NULL, 'wnh8', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(748, 1, 1, 8, NULL, 'FgQ0', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(749, 1, 1, 8, NULL, 'c3SW', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(750, 1, 1, 8, NULL, 'onDh', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(751, 1, 1, 8, NULL, 'D4RH', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(752, 1, 1, 8, NULL, 'RP4D', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(753, 1, 1, 8, NULL, 'HFwN', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(754, 1, 1, 8, NULL, 'mcTv', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(755, 1, 1, 8, NULL, 'pHxC', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(756, 1, 1, 8, NULL, 'M01l', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(757, 1, 1, 8, NULL, 'evSq', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(758, 1, 1, 8, NULL, 'GFT3', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(759, 1, 1, 8, NULL, 'WXZ7', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(760, 1, 1, 8, NULL, '4A9X', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(761, 1, 1, 8, NULL, '5kDj', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(762, 1, 1, 8, NULL, '98xC', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(763, 1, 1, 8, NULL, '0hl5', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(764, 1, 1, 8, NULL, 'ENob', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(765, 1, 1, 8, NULL, 'ShuP', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(766, 1, 1, 8, NULL, 'a4G8', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(767, 1, 1, 8, NULL, 'LiU4', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(768, 1, 1, 8, NULL, 'a52K', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(769, 1, 1, 8, NULL, 'Mp8f', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(770, 1, 1, 8, NULL, 'mphi', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(771, 1, 1, 8, NULL, 't8ot', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(772, 1, 1, 8, NULL, '7hos', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(773, 1, 1, 8, NULL, 'sBgd', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(774, 1, 1, 8, NULL, 'cXcJ', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(775, 1, 1, 8, NULL, 'RtC1', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(776, 1, 1, 8, NULL, 'U30E', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(777, 1, 1, 8, NULL, 'SMIw', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(778, 1, 1, 8, NULL, 'wjiZ', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(779, 1, 1, 8, NULL, 'gh0L', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(780, 1, 1, 8, NULL, '7uDJ', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(781, 1, 1, 8, NULL, 'R73W', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(782, 1, 1, 8, NULL, 'gYvY', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(783, 1, 1, 8, NULL, '6AzA', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(784, 1, 1, 8, NULL, '9pDC', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(785, 1, 1, 8, NULL, 'c2Rg', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(786, 1, 1, 8, NULL, 'oaqV', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(787, 1, 1, 8, NULL, '5iye', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(788, 1, 1, 8, NULL, 'y4tX', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(789, 1, 1, 8, NULL, 'hQH0', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(790, 1, 1, 8, NULL, '6j0n', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(791, 1, 1, 8, NULL, 'RPxG', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(792, 1, 1, 8, NULL, 'QEW5', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(793, 1, 1, 8, NULL, 'zNLy', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(794, 1, 1, 8, NULL, 'OCEX', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(795, 1, 1, 8, NULL, 'uqDO', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(796, 1, 1, 8, NULL, 'rAqY', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(797, 1, 1, 8, NULL, 'ZDXP', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(798, 1, 1, 8, NULL, 'OVIn', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(799, 1, 1, 8, NULL, 'wttX', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(800, 1, 1, 8, NULL, 'uRj5', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(801, 1, 1, 8, NULL, 'Ns2c', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(802, 1, 1, 8, NULL, '12cL', NULL, NULL, NULL, 1, '2021-08-28 02:15:45', '2021-09-01 00:09:53'),
(803, 1, 1, 8, NULL, '1bhz', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(804, 1, 1, 8, NULL, 'TEpd', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(805, 1, 1, 8, NULL, '5L6O', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(806, 1, 1, 8, NULL, 'HRme', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(807, 1, 1, 8, NULL, 'acUP', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(808, 1, 1, 8, NULL, '56hw', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(809, 1, 1, 8, NULL, 'xMHE', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(810, 1, 1, 8, NULL, 'YZ72', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(811, 1, 1, 8, NULL, 'CTVy', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(812, 1, 1, 8, NULL, 'd9tx', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(813, 1, 1, 8, NULL, '5HlJ', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(814, 1, 1, 8, NULL, 'APLh', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(815, 1, 1, 8, NULL, 'gT55', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(816, 1, 1, 8, NULL, 'OXle', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(817, 1, 1, 8, NULL, 'OJHv', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(818, 1, 1, 8, NULL, 'EAhY', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(819, 1, 1, 8, NULL, 'vPTk', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(820, 1, 1, 8, NULL, 'WrV8', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(821, 1, 1, 8, NULL, 'aRMZ', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(822, 1, 1, 8, NULL, 'YESd', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(823, 1, 1, 8, NULL, 'CRI2', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(824, 1, 1, 8, NULL, '6hA4', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(825, 1, 1, 8, NULL, '4Cvx', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(826, 1, 1, 8, NULL, 'xHKf', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(827, 1, 1, 8, NULL, 'KbPQ', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(828, 1, 1, 8, NULL, 'DyDH', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(829, 1, 1, 8, NULL, 'WOQJ', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(830, 1, 1, 8, NULL, 'OezR', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(831, 1, 1, 8, NULL, 'PS9W', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(832, 1, 1, 8, NULL, 'Is66', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(833, 1, 1, 8, NULL, 'UL1P', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(834, 1, 1, 8, NULL, 'wdpw', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(835, 1, 1, 8, NULL, 'nQJl', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53'),
(836, 1, 1, 8, NULL, 'vD0c', NULL, NULL, NULL, 1, '2021-08-28 02:15:46', '2021-09-01 00:09:53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_layaways`
--

CREATE TABLE `tbl_layaways` (
  `layaway_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sucursals_id` int(10) UNSIGNED NOT NULL,
  `customers_id` int(10) UNSIGNED NOT NULL,
  `layaway_payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layaway_entrega_date` date DEFAULT NULL,
  `layaway_despacho_date` date DEFAULT NULL,
  `layaway_canceled_date` date DEFAULT NULL,
  `layaway_canceled_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `layaway_payment_date` date DEFAULT NULL,
  `layaway_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_layaways`
--

INSERT INTO `tbl_layaways` (`layaway_id`, `user_id`, `sucursals_id`, `customers_id`, `layaway_payment_method`, `layaway_entrega_date`, `layaway_despacho_date`, `layaway_canceled_date`, `layaway_canceled_reason`, `layaway_payment_date`, `layaway_status`, `created_at`, `updated_at`) VALUES
(2, 1, 1, 11, 'efectivo', NULL, NULL, NULL, NULL, '2021-08-17', 0, '2021-08-17 14:52:25', '2021-08-17 14:52:25'),
(5, 1, 2, 15, 'efectivo', NULL, NULL, NULL, NULL, '2021-08-25', 0, '2021-08-26 00:53:34', '2021-08-26 00:53:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_layaway_details`
--

CREATE TABLE `tbl_layaway_details` (
  `layaway_details_id` int(10) UNSIGNED NOT NULL,
  `layaway_id` int(10) UNSIGNED NOT NULL,
  `customers_id` int(10) UNSIGNED NOT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `sucursals_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_layaway_details`
--

INSERT INTO `tbl_layaway_details` (`layaway_details_id`, `layaway_id`, `customers_id`, `products_id`, `sucursals_id`, `created_at`, `updated_at`) VALUES
(1, 3, 12, 1, NULL, '2021-08-17 14:53:10', '2021-08-17 14:53:10'),
(2, 4, 13, 1, NULL, '2021-08-17 14:57:42', '2021-08-17 14:57:42'),
(3, 5, 15, 1, NULL, '2021-08-26 00:53:34', '2021-08-26 00:53:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_layaway_profits`
--

CREATE TABLE `tbl_layaway_profits` (
  `layaway_profits_id` int(10) UNSIGNED NOT NULL,
  `layaway_id` int(10) UNSIGNED NOT NULL,
  `total_bussines_layaway` decimal(10,2) DEFAULT NULL,
  `total_cancel_layaway` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_layaway_profits`
--

INSERT INTO `tbl_layaway_profits` (`layaway_profits_id`, `layaway_id`, `total_bussines_layaway`, `total_cancel_layaway`, `created_at`, `updated_at`) VALUES
(1, 2, '4950.00', '4000.00', '2021-08-17 14:52:25', '2021-08-17 14:52:25'),
(2, 3, '4950.00', '4000.00', '2021-08-17 14:53:10', '2021-08-17 14:53:10'),
(3, 4, '4950.00', '4000.00', '2021-08-17 14:57:42', '2021-08-17 14:57:42'),
(4, 5, '4950.00', '4000.00', '2021-08-26 00:53:34', '2021-08-26 00:53:34');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_products`
--

CREATE TABLE `tbl_products` (
  `products_id` int(10) UNSIGNED NOT NULL,
  `products_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products_image_url` varchar(225) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `collections_id` int(10) UNSIGNED NOT NULL,
  `categories_id` int(10) UNSIGNED NOT NULL,
  `materials_id` int(10) UNSIGNED NOT NULL,
  `products_caracts` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `products_price` double(8,2) DEFAULT NULL,
  `products_net_price` double(8,2) DEFAULT NULL,
  `discounts_id` int(11) DEFAULT NULL,
  `products_is_active` int(11) DEFAULT NULL,
  `suplidor` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_products`
--

INSERT INTO `tbl_products` (`products_id`, `products_name`, `products_image_url`, `collections_id`, `categories_id`, `materials_id`, `products_caracts`, `products_price`, `products_net_price`, `discounts_id`, `products_is_active`, `suplidor`, `created_at`, `updated_at`) VALUES
(1, 'Anillos dos piedras Rubi Oro Amarillo', 'products-4a58b036-c7a3-4c78-b681-77cba0024781.png', 1, 2, 1, 'Bonito anillo', 5500.00, 4950.00, 1, 1, NULL, '2021-07-26 21:07:20', '2021-07-26 21:18:44'),
(2, 'TOMMY HILFIGER', 'products-068d9718-5ded-4d8b-bd2a-a91362144fdf.jpg', 1, 2, 1, 'Reloj Mujer Tommy Hilfiger 1782272\nSKU:REL0019225', 599.60, NULL, NULL, 1, 1, '2021-08-21 21:46:53', '2021-08-21 21:46:54');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_purchase_orders`
--

CREATE TABLE `tbl_purchase_orders` (
  `purchase_orders_id` int(10) UNSIGNED NOT NULL,
  `purchase_orders_solicited_by` int(11) DEFAULT NULL,
  `purchase_orders_solicited_date` date DEFAULT NULL,
  `providers_id` int(10) UNSIGNED NOT NULL,
  `preview_arrival_date` date DEFAULT NULL,
  `purchase_orders_confirmed_by` int(11) DEFAULT NULL,
  `purchase_orders_confirmed_at` date DEFAULT NULL,
  `purchase_orders_received_by` int(11) DEFAULT NULL,
  `purchase_orders_arrived_at` date DEFAULT NULL,
  `purchase_orders_observation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_orders_status` int(11) DEFAULT NULL,
  `purchase_orders_is_ok` int(11) DEFAULT NULL,
  `purchase_orders_complain` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `purchase_orders_total_price` double(8,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_purchase_orders`
--

INSERT INTO `tbl_purchase_orders` (`purchase_orders_id`, `purchase_orders_solicited_by`, `purchase_orders_solicited_date`, `providers_id`, `preview_arrival_date`, `purchase_orders_confirmed_by`, `purchase_orders_confirmed_at`, `purchase_orders_received_by`, `purchase_orders_arrived_at`, `purchase_orders_observation`, `purchase_orders_status`, `purchase_orders_is_ok`, `purchase_orders_complain`, `purchase_orders_total_price`, `created_at`, `updated_at`) VALUES
(1, 1, '2021-08-13', 1, '2021-08-19', NULL, NULL, NULL, NULL, 'vasos fragiles', 0, NULL, NULL, 16500.00, '2021-08-13 23:26:44', '2021-08-13 23:26:44');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sales`
--

CREATE TABLE `tbl_sales` (
  `sales_id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `sucursals_id` int(10) UNSIGNED NOT NULL,
  `customers_id` int(10) UNSIGNED NOT NULL,
  `sales_payment_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_entrega_date` date DEFAULT NULL,
  `sales_despacho_date` date DEFAULT NULL,
  `sales_canceled_date` date DEFAULT NULL,
  `sales_canceled_reason` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sales_payment_date` date DEFAULT NULL,
  `sales_status` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_sales`
--

INSERT INTO `tbl_sales` (`sales_id`, `user_id`, `sucursals_id`, `customers_id`, `sales_payment_method`, `sales_entrega_date`, `sales_despacho_date`, `sales_canceled_date`, `sales_canceled_reason`, `sales_payment_date`, `sales_status`, `created_at`, `updated_at`) VALUES
(3, 1, 1, 1, 'efectivo', NULL, '2021-08-27', NULL, NULL, '2021-08-10', 1, '2021-08-10 11:50:54', '2021-08-28 02:27:48'),
(6, 1, 1, 16, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-04', 0, '2021-11-04 21:44:23', '2021-11-04 21:44:23'),
(7, 1, 1, 17, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-04', 0, '2021-11-04 21:47:24', '2021-11-04 21:47:24'),
(8, 1, 1, 18, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-04', 0, '2021-11-04 21:48:53', '2021-11-04 21:48:53'),
(9, 1, 1, 19, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-04', 0, '2021-11-04 21:51:45', '2021-11-04 21:51:45'),
(10, 1, 1, 20, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-04', 0, '2021-11-04 21:53:11', '2021-11-04 21:53:11'),
(11, 1, 1, 21, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-04', 0, '2021-11-04 21:58:32', '2021-11-04 21:58:32'),
(12, 1, 1, 22, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-04', 0, '2021-11-04 21:59:48', '2021-11-04 21:59:48'),
(13, 1, 1, 23, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-04', 0, '2021-11-04 22:02:33', '2021-11-04 22:02:33'),
(14, 1, 1, 24, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-05', 0, '2021-11-05 19:17:26', '2021-11-05 19:17:26'),
(15, 1, 1, 25, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-05', 0, '2021-11-05 19:21:32', '2021-11-05 19:21:32'),
(16, 1, 1, 26, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-05', 0, '2021-11-05 19:30:56', '2021-11-05 19:30:56'),
(17, 1, 1, 27, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-05', 0, '2021-11-05 19:33:59', '2021-11-05 19:33:59'),
(18, 1, 1, 28, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-05', 0, '2021-11-05 19:38:02', '2021-11-05 19:38:02'),
(19, 1, 1, 29, 'efectivo', NULL, NULL, NULL, NULL, '2021-11-05', 0, '2021-11-05 19:39:41', '2021-11-05 19:39:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sales_details`
--

CREATE TABLE `tbl_sales_details` (
  `sales_details_id` int(10) UNSIGNED NOT NULL,
  `sales_id` int(10) UNSIGNED NOT NULL,
  `customers_id` int(10) UNSIGNED NOT NULL,
  `products_id` int(10) UNSIGNED NOT NULL,
  `sucursals_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_sales_details`
--

INSERT INTO `tbl_sales_details` (`sales_details_id`, `sales_id`, `customers_id`, `products_id`, `sucursals_id`, `created_at`, `updated_at`) VALUES
(1, 3, 3, 1, 1, '2021-07-26 23:02:24', '2021-07-26 23:02:24'),
(2, 3, 3, 1, 1, '2021-07-28 03:52:13', '2021-07-28 03:52:13'),
(6, 5, 14, 1, NULL, '2021-08-17 21:35:34', '2021-08-17 21:35:34'),
(7, 6, 16, 1, NULL, '2021-11-04 21:44:23', '2021-11-04 21:44:23'),
(8, 7, 17, 1, NULL, '2021-11-04 21:47:24', '2021-11-04 21:47:24'),
(9, 7, 17, 1, NULL, '2021-11-04 21:47:24', '2021-11-04 21:47:24'),
(10, 8, 18, 1, NULL, '2021-11-04 21:48:53', '2021-11-04 21:48:53'),
(11, 8, 18, 1, NULL, '2021-11-04 21:48:53', '2021-11-04 21:48:53'),
(12, 9, 19, 1, NULL, '2021-11-04 21:51:46', '2021-11-04 21:51:46'),
(13, 9, 19, 1, NULL, '2021-11-04 21:51:46', '2021-11-04 21:51:46'),
(14, 10, 20, 1, NULL, '2021-11-04 21:53:12', '2021-11-04 21:53:12'),
(15, 10, 20, 1, NULL, '2021-11-04 21:53:12', '2021-11-04 21:53:12'),
(16, 11, 21, 1, NULL, '2021-11-04 21:58:32', '2021-11-04 21:58:32'),
(17, 11, 21, 1, NULL, '2021-11-04 21:58:32', '2021-11-04 21:58:32'),
(18, 12, 22, 1, NULL, '2021-11-04 21:59:48', '2021-11-04 21:59:48'),
(19, 12, 22, 1, NULL, '2021-11-04 21:59:48', '2021-11-04 21:59:48'),
(20, 13, 23, 1, NULL, '2021-11-04 22:02:33', '2021-11-04 22:02:33'),
(21, 13, 23, 1, NULL, '2021-11-04 22:02:33', '2021-11-04 22:02:33'),
(22, 14, 24, 1, NULL, '2021-11-05 19:17:26', '2021-11-05 19:17:26'),
(23, 14, 24, 1, NULL, '2021-11-05 19:17:26', '2021-11-05 19:17:26'),
(24, 14, 24, 1, NULL, '2021-11-05 19:17:26', '2021-11-05 19:17:26'),
(25, 15, 25, 1, NULL, '2021-11-05 19:21:32', '2021-11-05 19:21:32'),
(26, 15, 25, 1, NULL, '2021-11-05 19:21:32', '2021-11-05 19:21:32'),
(27, 15, 25, 1, NULL, '2021-11-05 19:21:32', '2021-11-05 19:21:32'),
(28, 16, 26, 1, NULL, '2021-11-05 19:30:56', '2021-11-05 19:30:56'),
(29, 16, 26, 1, NULL, '2021-11-05 19:30:56', '2021-11-05 19:30:56'),
(30, 16, 26, 1, NULL, '2021-11-05 19:30:56', '2021-11-05 19:30:56'),
(31, 17, 27, 1, NULL, '2021-11-05 19:33:59', '2021-11-05 19:33:59'),
(32, 17, 27, 1, NULL, '2021-11-05 19:33:59', '2021-11-05 19:33:59'),
(33, 17, 27, 1, NULL, '2021-11-05 19:33:59', '2021-11-05 19:33:59'),
(34, 18, 28, 1, NULL, '2021-11-05 19:38:03', '2021-11-05 19:38:03'),
(35, 18, 28, 1, NULL, '2021-11-05 19:38:03', '2021-11-05 19:38:03'),
(36, 18, 28, 1, NULL, '2021-11-05 19:38:03', '2021-11-05 19:38:03'),
(37, 19, 29, 1, NULL, '2021-11-05 19:39:41', '2021-11-05 19:39:41'),
(38, 19, 29, 1, NULL, '2021-11-05 19:39:41', '2021-11-05 19:39:41'),
(39, 19, 29, 1, NULL, '2021-11-05 19:39:41', '2021-11-05 19:39:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_sales_profits`
--

CREATE TABLE `tbl_sales_profits` (
  `sales_profits_id` int(10) UNSIGNED NOT NULL,
  `sales_id` int(10) UNSIGNED NOT NULL,
  `total_bussines` decimal(10,2) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_sales_profits`
--

INSERT INTO `tbl_sales_profits` (`sales_profits_id`, `sales_id`, `total_bussines`, `created_at`, `updated_at`) VALUES
(1, 3, '9900.00', '2021-08-10 11:50:54', '2021-08-10 11:50:54'),
(4, 6, '4950.00', '2021-11-04 21:44:23', '2021-11-04 21:44:23'),
(5, 7, '9900.00', '2021-11-04 21:47:24', '2021-11-04 21:47:24'),
(6, 8, '9900.00', '2021-11-04 21:48:53', '2021-11-04 21:48:53'),
(7, 9, '9900.00', '2021-11-04 21:51:45', '2021-11-04 21:51:45'),
(8, 10, '9900.00', '2021-11-04 21:53:11', '2021-11-04 21:53:11'),
(9, 11, '9900.00', '2021-11-04 21:58:32', '2021-11-04 21:58:32'),
(10, 12, '9900.00', '2021-11-04 21:59:48', '2021-11-04 21:59:48'),
(11, 13, '9900.00', '2021-11-04 22:02:33', '2021-11-04 22:02:33'),
(12, 14, '14850.00', '2021-11-05 19:17:26', '2021-11-05 19:17:26'),
(13, 15, '14850.00', '2021-11-05 19:21:32', '2021-11-05 19:21:32'),
(14, 16, '14850.00', '2021-11-05 19:30:56', '2021-11-05 19:30:56'),
(15, 17, '14850.00', '2021-11-05 19:33:59', '2021-11-05 19:33:59'),
(16, 18, '14850.00', '2021-11-05 19:38:03', '2021-11-05 19:38:03'),
(17, 19, '14850.00', '2021-11-05 19:39:41', '2021-11-05 19:39:41');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tbl_solicitudes`
--

CREATE TABLE `tbl_solicitudes` (
  `solicitudes_id` int(10) UNSIGNED NOT NULL,
  `solictudes_fecha` date DEFAULT NULL,
  `solicitudes_from` int(11) DEFAULT NULL,
  `sucursals_id` int(11) DEFAULT NULL,
  `solicitudes_subject` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `solicitudes_message` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cantidad` int(11) DEFAULT NULL,
  `products_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `tbl_solicitudes`
--

INSERT INTO `tbl_solicitudes` (`solicitudes_id`, `solictudes_fecha`, `solicitudes_from`, `sucursals_id`, `solicitudes_subject`, `solicitudes_message`, `cantidad`, `products_id`, `created_at`, `updated_at`) VALUES
(1, '2021-08-26', 1, 2, 'Transferir un lote', 'Requiero 15 existencias de anillos dorado.', 15, 1, '2021-08-26 20:01:42', '2021-08-26 20:01:42'),
(2, '2021-08-28', 2, 1, 'Enviar 5 items', 'enviar', 5, 1, '2021-08-28 21:43:30', '2021-08-28 21:43:30'),
(3, '2021-08-28', 2, 1, 'Transferir 10 anillos de oro', 'Urgente', 10, 1, '2021-08-28 23:18:21', '2021-08-28 23:18:21'),
(7, '2021-08-31', 1, 2, '5 anillos de oro', 'urgente', 5, 1, '2021-09-01 00:03:39', '2021-09-01 00:03:39');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles_id` int(11) DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `roles_id`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Testing Update', 'testing@gmail.com', NULL, '$2y$10$8CvIpXDSTlpyD6OMgIFaPeqXHT7YCQeet7TQ74gQ5WP1qnz1mHbWG', 1, NULL, '2021-07-16 14:08:18', '2021-07-27 21:54:58'),
(4, 'Ana Calle Saldarriaga', 'ana@gmail.com', NULL, '$2y$10$MwOsrc6AJajB6GZgjjyc3OwJhBI/7aJuic3ABTMqifblwWHU9YkxK', 4, NULL, '2021-08-04 20:40:38', '2021-08-04 20:40:38');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `mae_categories`
--
ALTER TABLE `mae_categories`
  ADD PRIMARY KEY (`categories_id`);

--
-- Indices de la tabla `mae_collections`
--
ALTER TABLE `mae_collections`
  ADD PRIMARY KEY (`collections_id`);

--
-- Indices de la tabla `mae_discounts`
--
ALTER TABLE `mae_discounts`
  ADD PRIMARY KEY (`discounts_id`),
  ADD KEY `mae_discounts_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `mae_materials`
--
ALTER TABLE `mae_materials`
  ADD PRIMARY KEY (`materials_id`);

--
-- Indices de la tabla `mae_providers`
--
ALTER TABLE `mae_providers`
  ADD PRIMARY KEY (`providers_id`);

--
-- Indices de la tabla `mae_roles`
--
ALTER TABLE `mae_roles`
  ADD PRIMARY KEY (`roles_id`);

--
-- Indices de la tabla `mae_sizes`
--
ALTER TABLE `mae_sizes`
  ADD PRIMARY KEY (`sizes_id`);

--
-- Indices de la tabla `mae_sucursals`
--
ALTER TABLE `mae_sucursals`
  ADD PRIMARY KEY (`sucursals_id`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD PRIMARY KEY (`purchase_order_details_id`),
  ADD KEY `purchase_order_details_purchase_orders_id_foreign` (`purchase_orders_id`);

--
-- Indices de la tabla `tbl_addresses`
--
ALTER TABLE `tbl_addresses`
  ADD PRIMARY KEY (`addresses_id`),
  ADD KEY `tbl_addresses_districts_id_foreign` (`districts_id`);

--
-- Indices de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD PRIMARY KEY (`customers_id`),
  ADD KEY `tbl_customers_addresses_id_foreign` (`addresses_id`);

--
-- Indices de la tabla `tbl_customer_users`
--
ALTER TABLE `tbl_customer_users`
  ADD PRIMARY KEY (`customer_users_id`),
  ADD KEY `tbl_customer_users_user_id_foreign` (`id`);

--
-- Indices de la tabla `tbl_districts`
--
ALTER TABLE `tbl_districts`
  ADD PRIMARY KEY (`districts_id`);

--
-- Indices de la tabla `tbl_group_discounts`
--
ALTER TABLE `tbl_group_discounts`
  ADD PRIMARY KEY (`group_discounts_id`),
  ADD KEY `tbl_group_discounts_discounts_id_foreign` (`discounts_id`),
  ADD KEY `tbl_group_discounts_products_id_foreign` (`products_id`),
  ADD KEY `tbl_group_discounts_categories_id_foreign` (`categories_id`),
  ADD KEY `tbl_group_discounts_collections_id_foreign` (`collections_id`);

--
-- Indices de la tabla `tbl_inventories`
--
ALTER TABLE `tbl_inventories`
  ADD PRIMARY KEY (`inventories_id`),
  ADD KEY `tbl_inventories_products_id_foreign` (`products_id`),
  ADD KEY `tbl_inventories_sucursals_id_foreign` (`sucursals_id`),
  ADD KEY `tbl_inventories_sales_id_foreign` (`sales_id`),
  ADD KEY `tbl_inventories_purchase_orders_id_foreign` (`purchase_orders_id`),
  ADD KEY `tbl_inventories_user_id_foreign` (`user_id`);

--
-- Indices de la tabla `tbl_layaways`
--
ALTER TABLE `tbl_layaways`
  ADD PRIMARY KEY (`layaway_id`),
  ADD KEY `tbl_layaway_user_id_foreign` (`user_id`),
  ADD KEY `tbl_layaway_sucursals_id_foreign` (`sucursals_id`),
  ADD KEY `tbl_layaway_customers_id_foreign` (`customers_id`);

--
-- Indices de la tabla `tbl_layaway_details`
--
ALTER TABLE `tbl_layaway_details`
  ADD PRIMARY KEY (`layaway_details_id`),
  ADD KEY `tbl_layaway_details_layaway_id_foreign` (`layaway_id`),
  ADD KEY `tbl_layaway_details_customers_id_foreign` (`customers_id`),
  ADD KEY `tbl_layaway_details_products_id_foreign` (`products_id`);

--
-- Indices de la tabla `tbl_layaway_profits`
--
ALTER TABLE `tbl_layaway_profits`
  ADD PRIMARY KEY (`layaway_profits_id`),
  ADD KEY `tbl_layaway_profits_layaway_id_foreign` (`layaway_id`);

--
-- Indices de la tabla `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD PRIMARY KEY (`products_id`),
  ADD KEY `tbl_products_collections_id_foreign` (`collections_id`),
  ADD KEY `tbl_products_category_id_foreign` (`categories_id`),
  ADD KEY `tbl_products_material_id_foreign` (`materials_id`);

--
-- Indices de la tabla `tbl_purchase_orders`
--
ALTER TABLE `tbl_purchase_orders`
  ADD PRIMARY KEY (`purchase_orders_id`),
  ADD KEY `tbl_purchase_orders_providers_id_foreign` (`providers_id`);

--
-- Indices de la tabla `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD PRIMARY KEY (`sales_id`),
  ADD KEY `tbl_sales_user_id_foreign` (`user_id`),
  ADD KEY `tbl_sales_sucursals_id_foreign` (`sucursals_id`),
  ADD KEY `tbl_sales_customers_id_foreign` (`customers_id`);

--
-- Indices de la tabla `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  ADD PRIMARY KEY (`sales_details_id`),
  ADD KEY `tbl_sales_details_sales_id_foreign` (`sales_id`),
  ADD KEY `tbl_sales_details_customers_id_foreign` (`customers_id`),
  ADD KEY `tbl_sales_details_products_id_foreign` (`products_id`);

--
-- Indices de la tabla `tbl_sales_profits`
--
ALTER TABLE `tbl_sales_profits`
  ADD PRIMARY KEY (`sales_profits_id`),
  ADD KEY `tbl_sales_profits_sales_id_foreign` (`sales_id`);

--
-- Indices de la tabla `tbl_solicitudes`
--
ALTER TABLE `tbl_solicitudes`
  ADD PRIMARY KEY (`solicitudes_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mae_categories`
--
ALTER TABLE `mae_categories`
  MODIFY `categories_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `mae_collections`
--
ALTER TABLE `mae_collections`
  MODIFY `collections_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mae_discounts`
--
ALTER TABLE `mae_discounts`
  MODIFY `discounts_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mae_materials`
--
ALTER TABLE `mae_materials`
  MODIFY `materials_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mae_providers`
--
ALTER TABLE `mae_providers`
  MODIFY `providers_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `mae_roles`
--
ALTER TABLE `mae_roles`
  MODIFY `roles_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `mae_sizes`
--
ALTER TABLE `mae_sizes`
  MODIFY `sizes_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `mae_sucursals`
--
ALTER TABLE `mae_sucursals`
  MODIFY `sucursals_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  MODIFY `purchase_order_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_addresses`
--
ALTER TABLE `tbl_addresses`
  MODIFY `addresses_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  MODIFY `customers_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT de la tabla `tbl_customer_users`
--
ALTER TABLE `tbl_customer_users`
  MODIFY `customer_users_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_districts`
--
ALTER TABLE `tbl_districts`
  MODIFY `districts_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tbl_group_discounts`
--
ALTER TABLE `tbl_group_discounts`
  MODIFY `group_discounts_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_inventories`
--
ALTER TABLE `tbl_inventories`
  MODIFY `inventories_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=837;

--
-- AUTO_INCREMENT de la tabla `tbl_layaways`
--
ALTER TABLE `tbl_layaways`
  MODIFY `layaway_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tbl_layaway_details`
--
ALTER TABLE `tbl_layaway_details`
  MODIFY `layaway_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `tbl_layaway_profits`
--
ALTER TABLE `tbl_layaway_profits`
  MODIFY `layaway_profits_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `tbl_products`
--
ALTER TABLE `tbl_products`
  MODIFY `products_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `tbl_purchase_orders`
--
ALTER TABLE `tbl_purchase_orders`
  MODIFY `purchase_orders_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `tbl_sales`
--
ALTER TABLE `tbl_sales`
  MODIFY `sales_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  MODIFY `sales_details_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT de la tabla `tbl_sales_profits`
--
ALTER TABLE `tbl_sales_profits`
  MODIFY `sales_profits_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `tbl_solicitudes`
--
ALTER TABLE `tbl_solicitudes`
  MODIFY `solicitudes_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mae_discounts`
--
ALTER TABLE `mae_discounts`
  ADD CONSTRAINT `mae_discounts_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `purchase_order_details`
--
ALTER TABLE `purchase_order_details`
  ADD CONSTRAINT `purchase_order_details_purchase_orders_id_foreign` FOREIGN KEY (`purchase_orders_id`) REFERENCES `tbl_purchase_orders` (`purchase_orders_id`);

--
-- Filtros para la tabla `tbl_addresses`
--
ALTER TABLE `tbl_addresses`
  ADD CONSTRAINT `tbl_addresses_districts_id_foreign` FOREIGN KEY (`districts_id`) REFERENCES `tbl_districts` (`districts_id`);

--
-- Filtros para la tabla `tbl_customers`
--
ALTER TABLE `tbl_customers`
  ADD CONSTRAINT `tbl_customers_addresses_id_foreign` FOREIGN KEY (`addresses_id`) REFERENCES `tbl_addresses` (`addresses_id`);

--
-- Filtros para la tabla `tbl_customer_users`
--
ALTER TABLE `tbl_customer_users`
  ADD CONSTRAINT `tbl_customer_users_user_id_foreign` FOREIGN KEY (`id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `tbl_group_discounts`
--
ALTER TABLE `tbl_group_discounts`
  ADD CONSTRAINT `tbl_group_discounts_categories_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `mae_categories` (`categories_id`),
  ADD CONSTRAINT `tbl_group_discounts_collections_id_foreign` FOREIGN KEY (`collections_id`) REFERENCES `mae_collections` (`collections_id`),
  ADD CONSTRAINT `tbl_group_discounts_discounts_id_foreign` FOREIGN KEY (`discounts_id`) REFERENCES `mae_discounts` (`discounts_id`),
  ADD CONSTRAINT `tbl_group_discounts_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `tbl_products` (`products_id`);

--
-- Filtros para la tabla `tbl_inventories`
--
ALTER TABLE `tbl_inventories`
  ADD CONSTRAINT `tbl_inventories_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `tbl_products` (`products_id`),
  ADD CONSTRAINT `tbl_inventories_purchase_orders_id_foreign` FOREIGN KEY (`purchase_orders_id`) REFERENCES `tbl_purchase_orders` (`purchase_orders_id`),
  ADD CONSTRAINT `tbl_inventories_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `tbl_sales` (`sales_id`),
  ADD CONSTRAINT `tbl_inventories_sucursals_id_foreign` FOREIGN KEY (`sucursals_id`) REFERENCES `mae_sucursals` (`sucursals_id`),
  ADD CONSTRAINT `tbl_inventories_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `tbl_layaways`
--
ALTER TABLE `tbl_layaways`
  ADD CONSTRAINT `tbl_layaway_customers_id_foreign` FOREIGN KEY (`customers_id`) REFERENCES `tbl_customers` (`customers_id`),
  ADD CONSTRAINT `tbl_layaway_sucursals_id_foreign` FOREIGN KEY (`sucursals_id`) REFERENCES `mae_sucursals` (`sucursals_id`),
  ADD CONSTRAINT `tbl_layaway_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `tbl_layaway_details`
--
ALTER TABLE `tbl_layaway_details`
  ADD CONSTRAINT `tbl_layaway_details_customers_id_foreign` FOREIGN KEY (`customers_id`) REFERENCES `tbl_customers` (`customers_id`),
  ADD CONSTRAINT `tbl_layaway_details_layaway_id_foreign` FOREIGN KEY (`layaway_id`) REFERENCES `tbl_layaways` (`layaway_id`),
  ADD CONSTRAINT `tbl_layaway_details_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `tbl_products` (`products_id`);

--
-- Filtros para la tabla `tbl_layaway_profits`
--
ALTER TABLE `tbl_layaway_profits`
  ADD CONSTRAINT `tbl_layaway_profits_layaway_id_foreign` FOREIGN KEY (`layaway_id`) REFERENCES `tbl_layaways` (`layaway_id`);

--
-- Filtros para la tabla `tbl_products`
--
ALTER TABLE `tbl_products`
  ADD CONSTRAINT `tbl_products_category_id_foreign` FOREIGN KEY (`categories_id`) REFERENCES `mae_categories` (`categories_id`),
  ADD CONSTRAINT `tbl_products_collections_id_foreign` FOREIGN KEY (`collections_id`) REFERENCES `mae_collections` (`collections_id`),
  ADD CONSTRAINT `tbl_products_material_id_foreign` FOREIGN KEY (`materials_id`) REFERENCES `mae_materials` (`materials_id`);

--
-- Filtros para la tabla `tbl_purchase_orders`
--
ALTER TABLE `tbl_purchase_orders`
  ADD CONSTRAINT `tbl_purchase_orders_providers_id_foreign` FOREIGN KEY (`providers_id`) REFERENCES `mae_providers` (`providers_id`);

--
-- Filtros para la tabla `tbl_sales`
--
ALTER TABLE `tbl_sales`
  ADD CONSTRAINT `tbl_sales_customers_id_foreign` FOREIGN KEY (`customers_id`) REFERENCES `tbl_customers` (`customers_id`),
  ADD CONSTRAINT `tbl_sales_sucursals_id_foreign` FOREIGN KEY (`sucursals_id`) REFERENCES `mae_sucursals` (`sucursals_id`),
  ADD CONSTRAINT `tbl_sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Filtros para la tabla `tbl_sales_details`
--
ALTER TABLE `tbl_sales_details`
  ADD CONSTRAINT `tbl_sales_details_customers_id_foreign` FOREIGN KEY (`customers_id`) REFERENCES `tbl_customers` (`customers_id`),
  ADD CONSTRAINT `tbl_sales_details_products_id_foreign` FOREIGN KEY (`products_id`) REFERENCES `tbl_products` (`products_id`),
  ADD CONSTRAINT `tbl_sales_details_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `tbl_sales` (`sales_id`);

--
-- Filtros para la tabla `tbl_sales_profits`
--
ALTER TABLE `tbl_sales_profits`
  ADD CONSTRAINT `tbl_sales_profits_sales_id_foreign` FOREIGN KEY (`sales_id`) REFERENCES `tbl_sales` (`sales_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
