-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 25, 2020 lúc 11:14 AM
-- Phiên bản máy phục vụ: 10.4.11-MariaDB
-- Phiên bản PHP: 7.4.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `start`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_customer` bigint(20) UNSIGNED NOT NULL,
  `total` double NOT NULL,
  `payment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ready'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bills`
--

INSERT INTO `bills` (`id`, `id_customer`, `total`, `payment`, `note`, `created_at`, `updated_at`, `status`) VALUES
(1, 1, 67, 'Online', 'Giao vào buổi sáng 7h', '2020-04-11 18:33:54', '2020-04-13 07:36:02', 'Ship'),
(2, 2, 52, 'cod', 'Giao Nhanh', '2020-04-12 17:52:01', '2020-04-12 17:52:01', 'ready'),
(3, 3, 35, 'cod', 's', '2020-04-12 18:18:15', '2020-04-12 18:18:15', 'ready'),
(4, 4, 34, 'cod', 'd', '2020-04-12 18:21:15', '2020-04-12 18:21:15', 'ready'),
(5, 5, 15, 'cod', 's', '2020-04-12 18:21:51', '2020-04-12 18:21:51', 'ready'),
(6, 6, 11687, 'cod', 'sáng', '2020-04-14 08:12:23', '2020-04-14 08:12:23', 'ready'),
(7, 7, 32, 'cod', '12', '2020-04-20 07:02:58', '2020-04-20 07:02:58', 'ready'),
(8, 8, 603, 'cod', 'Giao Cho tôi vào buổi sáng', '2020-04-20 07:04:49', '2020-04-20 07:04:49', 'ready');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_detail`
--

CREATE TABLE `bill_detail` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_bill` bigint(20) UNSIGNED NOT NULL,
  `id_product` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` double NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_detail`
--

INSERT INTO `bill_detail` (`id`, `id_bill`, `id_product`, `quantity`, `unit_price`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 1, 5, '2020-04-11 18:33:54', '2020-04-11 18:33:54'),
(2, 1, 4, 1, 12, '2020-04-11 18:33:54', '2020-04-11 18:33:54'),
(3, 1, 2, 1, 20, '2020-04-11 18:33:54', '2020-04-11 18:33:54'),
(4, 1, 3, 3, 10, '2020-04-11 18:33:54', '2020-04-11 18:33:54'),
(5, 2, 1, 2, 5, '2020-04-12 17:52:01', '2020-04-12 17:52:01'),
(6, 2, 4, 1, 12, '2020-04-12 17:52:01', '2020-04-12 17:52:01'),
(7, 2, 2, 1, 20, '2020-04-12 17:52:01', '2020-04-12 17:52:01'),
(8, 2, 3, 1, 10, '2020-04-12 17:52:01', '2020-04-12 17:52:01'),
(9, 3, 1, 7, 5, '2020-04-12 18:18:15', '2020-04-12 18:18:15'),
(10, 4, 1, 2, 5, '2020-04-12 18:21:15', '2020-04-12 18:21:15'),
(11, 4, 4, 2, 12, '2020-04-12 18:21:15', '2020-04-12 18:21:15'),
(12, 5, 1, 3, 5, '2020-04-12 18:21:52', '2020-04-12 18:21:52'),
(13, 6, 4, 1, 12, '2020-04-14 08:12:23', '2020-04-14 08:12:23'),
(14, 6, 1, 3, 5, '2020-04-14 08:12:23', '2020-04-14 08:12:23'),
(15, 6, 5, 1, 5800, '2020-04-14 08:12:23', '2020-04-14 08:12:23'),
(16, 6, 6, 1, 5500, '2020-04-14 08:12:23', '2020-04-14 08:12:23'),
(17, 6, 7, 3, 120, '2020-04-14 08:12:23', '2020-04-14 08:12:23'),
(18, 7, 4, 1, 12, '2020-04-20 07:02:58', '2020-04-20 07:02:58'),
(19, 7, 12, 1, 20, '2020-04-20 07:02:58', '2020-04-20 07:02:58'),
(20, 8, 1, 2, 5, '2020-04-20 07:04:49', '2020-04-20 07:04:49'),
(21, 8, 4, 4, 12, '2020-04-20 07:04:49', '2020-04-20 07:04:49'),
(22, 8, 12, 2, 20, '2020-04-20 07:04:49', '2020-04-20 07:04:49'),
(23, 8, 2, 3, 20, '2020-04-20 07:04:49', '2020-04-20 07:04:49'),
(24, 8, 18, 3, 45, '2020-04-20 07:04:49', '2020-04-20 07:04:49'),
(25, 8, 20, 1, 90, '2020-04-20 07:04:49', '2020-04-20 07:04:49'),
(26, 8, 43, 2, 30, '2020-04-20 07:04:49', '2020-04-20 07:04:49'),
(27, 8, 48, 4, 40, '2020-04-20 07:04:49', '2020-04-20 07:04:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cancel_order`
--

CREATE TABLE `cancel_order` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `id_customer` bigint(20) UNSIGNED NOT NULL,
  `id_bill` bigint(20) UNSIGNED NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'ready',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `cancel_order`
--

INSERT INTO `cancel_order` (`id`, `id_customer`, `id_bill`, `note`, `status`, `created_at`, `updated_at`) VALUES
(1, 6, 6, 's', 'OK', '2020-04-14 17:28:39', '2020-04-14 18:06:55'),
(2, 6, 6, 's', 'ready', '2020-04-14 17:29:42', '2020-04-14 17:29:42'),
(3, 8, 8, 'Tôi Không thích sản phầm này nữa', 'ready', '2020-04-20 07:05:24', '2020-04-20 07:05:24');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `customer`
--

CREATE TABLE `customer` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `customer`
--

INSERT INTO `customer` (`id`, `name`, `gender`, `email`, `address`, `phone`, `note`, `created_at`, `updated_at`) VALUES
(1, 'Đinh Hồng Hà', 'm', 'hadinhcpr1233@gmail.com', 'Thôn Hợp Hòa Xã iaDrang Huyện Chuprong Tỉnh Gia Lai', '0372466133', 'Giao vào buổi sáng', '2020-04-11 18:33:54', '2020-04-11 18:33:54'),
(2, 'Cường Lìn', 'm', 'Cuongiabong@bong', 'Gia Lai', '0372222222', 'Giao Nhanh', '2020-04-12 17:52:01', '2020-04-12 17:52:01'),
(3, 's', 'f', 's', 's', 's', 's', '2020-04-12 18:18:15', '2020-04-12 18:18:15'),
(4, 'd', 'f', 's', 's', 's', 'd', '2020-04-12 18:21:15', '2020-04-12 18:21:15'),
(5, 'd', 'f', 'ss', 's', 's', 's', '2020-04-12 18:21:51', '2020-04-12 18:21:51'),
(6, 'Trần Phúc Chương', 'm', 'chuongtran@email', 'Ben luc', '0372222222', 'sáng', '2020-04-14 08:12:23', '2020-04-14 08:12:23'),
(7, 'dsa', 'm', '21', '12', '121', '12', '2020-04-20 07:02:58', '2020-04-20 07:02:58'),
(8, 'Đinh Hồng Hà', 'm', 'hadinhcpr1233@gmail.com', 'Gia Lai', '0372466133', 'Giao Cho tôi vào buổi sáng', '2020-04-20 07:04:49', '2020-04-20 07:04:49');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `failed_jobs`
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
-- Cấu trúc bảng cho bảng `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2020_04_06_140803_create_customer-table', 1),
(5, '2020_04_06_141421_create_bills_table', 1),
(6, '2020_04_06_150424_create_type_products_table', 1),
(7, '2020_04_06_151042_create_products_table', 2),
(8, '2020_04_06_151542_create_bill_detail_table', 3),
(9, '2020_04_06_151916_create_news_table', 4),
(10, '2020_04_06_151947_create_slide_table', 4),
(11, '2020_04_13_133915_add_column_status_in_bills_table', 5),
(14, '2020_04_15_000638_create_cancel_order_table', 6),
(16, '2020_04_15_151854_create_staff_table', 7);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `news`
--

CREATE TABLE `news` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('admin@admin', '$2y$10$O5J8cPKHybbbzW0t3dcr8ObuOeCnU071aZXxQ6WaPIqYbjmPTaGR2', '2020-04-07 08:57:37');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_type` bigint(20) UNSIGNED NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` double(8,2) NOT NULL,
  `promotion_price` double(8,2) NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `name`, `id_type`, `description`, `unit_price`, `promotion_price`, `image`, `unit`, `created_at`, `updated_at`) VALUES
(1, 'Cá bảy màu', 2, 'Cá Bảy Màu Nhập Hàng Thái', 5.00, 3.00, '/img/products/Full-Red-1-1-1.jpg', 'Con', '2020-04-06 19:33:35', '2020-04-12 20:20:12'),
(2, 'Cây Cỏ Đỏ', 1, 'Cây trang trí nền cho hồ thủy sinh với vóc dáng nhỏ nhắn được nhiều anh em yêu mến', 20.00, 20.00, '/img/products/codo.jpg', 'cây', '2020-04-06 19:37:33', '2020-04-13 18:48:15'),
(3, 'Tôm Kiểng', 3, 'Tép kiểng chơi thủy sinh cực đẹp', 10.00, 10.00, '/img/products/ho-thuy-sinh-choi-tep-1.jpg', 'con', '2020-04-06 19:49:16', '2020-04-06 19:49:16'),
(4, 'Cá Neon', 2, 'Vẻ đẹp của chúng là không thể bàn cãi, thật tuyệt vời khi ngắm nhìn một đàn cá Neon bơi lội trong bể thủy sinh', 12.00, 12.00, '/img/products/ca-dan-ca-neon.jpg', 'Con', '2020-04-06 19:52:31', '2020-04-13 18:48:40'),
(5, 'Đèn thủy sinh Chihiros Vivid 2', 4, 'Chihiros Vivid 2 là mẫu đèn cho hồ thủy sinh được ra mắt vào cuối năm 2019 với sự cải tiến nhỏ gọn hơn so với bản đèn Vivid 1. Sau khi phiên bản đèn thủy sinh Vivid 2 được ra mắt đã nhận được sự đón nhận rất nồng nhiệt từ anh em chơi thủy sinh không chỉ bởi mẫu mã thiết kế mà còn vì hiệu năng của dòng đèn này mang lại. Máng đèn thủy sinh Chihiros Vivid 2 cũng được làm từ chất liệu nhôm cao cấp với những đường rãnh tản nhiệt giúp đèn hoạt động bền bỉ. Đối với phiên bản Chihiros Vivid 2 này bạn cần tải ứng dụng có tên My Chihiros về Smartphone của mình để có thể điều chỉnh các tone màu theo ý muốn của mình.', 5800.00, 5600.00, '/img/products/den1.jpg', 'Cái', '2020-04-13 18:15:02', '2020-04-13 18:15:02'),
(6, 'Đèn Chihiros RGB ViVid', 4, 'Đèn thủy sinh Chihiros RGB ViVid là một trong những dòng đèn cao cấp nhất của hãng Chihiros chuyên dụng đặc thù cho các dòng cây thủy sinh có màu sắc rực như đỏ, tím, đen. Được chế tác theo công thức phân bố ánh sáng độc quyền qua nhiều kỹ sư chuyên nghiên cứu về các loại tia sáng và cách phân bố ánh sáng của hãng. Thân đèn thủy sinh Chihiros RGB được làm từ chất liệu nhôm cao cấp giúp tản nhiệt cho các bóng đèn hiệu quả. Khác với các dòng đèn RGB khác của hãng Chihiros, đèn Chihiros RGB ViVid được trang bị thêm 2 quạt tản nhiệt ngay trên thân đèn nhằm giúp đèn tản nhiệt tốt và ổn định khi chiếu sáng, vì như chúng ta đã biết các dòng đèn RGB đại đa số đều sử dụng bóng có công suất cao nên rất nóng khi chiếu sáng.', 5500.00, 5300.00, '/img/products/den3.jpg', 'Cái', '2020-04-13 18:16:02', '2020-04-14 08:09:25'),
(7, 'Đèn led thủy sinh dạng rọi hình trái trứng của Up-Aqua Pro Led MF-R', 4, 'Đèn led thủy sinh dạng rọi có hình trứng đen của Up-Aqua Small Ball một sản phẩm mang độ thẩm mỹ cao, phù hợp với các dạng hồ, bể cá mini, đặc biệt đẹp hơn khi dùng hồ cubic hoặc bể cá mini tròn. Đèn có công suất 2w là một mẫu đèn gim kẹp trên thành hồ cá và hồ thủy sinh, được thiết kế với tone màu đen làm tăng thêm vẻ đẹp lung linh của chiếc hồ cá của bạn.', 120.00, 120.00, '/img/products/den4.jpg', 'Cái', '2020-04-13 18:16:53', '2020-04-13 18:16:53'),
(8, 'Đèn led kẹp Xuanmeilong', 4, 'Đèn led kẹp Xuanmeilong cho hồ thủy sinh 30cm trở xuống, với mẫu mã sản phẩm mới này hãng Xuanmeilong đã nhanh chóng đáp ứng kịp thời cho những anh em chơi hồ mini, phù hợp nhất là cho những hồ có kích thước 30cm trở lại. Đèn led kẹp Xuanmeilong được thiết kế vô cùng mỏng với tone màu trắng bao phủ rất sang trọng. Đèn led kẹp Xuanmeilong có thể kẹp ở mọi vị trí quanh hồ mà bạn muốn nhờ thanh kẹp tiện lợi. Nên xử dụng đèn 5-7 tiếng một ngày để đạt hiệu quả tốt nhất. (Đèn có 2 màu là sáng trắng và sáng xanh)', 150.00, 150.00, '/img/products/den5.jpg', 'Cái', '2020-04-13 18:17:44', '2020-04-14 08:09:50'),
(9, 'Đèn uv chuyên diệt rêu hại của SOBO', 4, 'Đèn diệt rêu hại UV của hãng SOBO nhiều công suất khác nhau như Uv001, uv002 và uv003, đèn UV SOBO được cấu tạo từ thạch anh cao cấp nâng cao chất lượng của tia cực tím. Do đèn nằm chìm dưới nước nên nhà sản xuất đã gia công rất kỹ lưỡng phần bên ngoài chống giật tuyệt đối bạn có thể an tâm khi sử dụng. Đèn UV diệt rêu hại và máy bơm thổi luồng chảy của Sobo được trang bị hai thiết bị nguồn riêng biệt, nên bạn hoàn tàn có thể tắt từng trang bị riêng khi muốn rất tiện lợi.', 350.00, 340.00, '/img/products/den6.jpg', 'Cái', '2020-04-13 18:19:39', '2020-04-14 08:10:03'),
(10, 'Đèn Led Chihiros RGB', 4, 'Đèn Led Chihiros RGB là một sản phẩm đèn thủy sinh chuyên dụng được thiết kế tinh tế bởi máng nhôm nguyên khối tạo nên sự sang trọng. Có thể tăng giảm ánh sáng đèn theo 7 cấp độ cộng và 7 cấp độ trừ (cần mua thêm Dimmer). Đèn Led Chihiros RGB là dòng đèn led cao cấp phù hợp cho các loài cây ưa lên màu như bucep, và một số loài cây lá màu khác.', 1150.00, 1100.00, '/img/products/den7.jpg', 'Cái', '2020-04-13 18:20:34', '2020-04-14 08:10:13'),
(11, 'Đèn Odyssea 180-200cm 4 bóng', 4, 'Đèn Odyssea 180-200cm 4 bóng phù hợp cho các bạn đang sở hữu một chiếc hồ thủy sinh cỡ lớn, mặc dù có kích thước dài nhưng đèn Odyssea vẫn giữ cho mình được vẻ bên ngoài rất chắc chắn. Với một kích thước hồ lớn mà bạn chỉ cần dùng một cây đèn tầm trung Odyssea là đã đạt hiệu quả như mong muốn, đây cũng là mẫu đèn được hầu hết anh em chơi thủy sinh đã trải nghiệm do đó hiệu năng của nó được đánh giá rất cao.', 1900.00, 1850.00, '/img/products/den8.jpg', 'Cái', '2020-04-13 18:21:45', '2020-04-13 18:21:45'),
(12, 'Tỳ bà bướm dòng cá vệ sinh hồ tuyệt mỹ', 2, 'Tỳ bà bướm là dòng cá cảnh với chức năng vệ sinh các loại thức ăn dư thừa có trong hồ thủy sinh và cá cảnh, chúng siêng năng hoạt động và đạt hiệu quả cao trong việc vệ sinh hồ. Với thân hình hoa văn kẻ sọc được bao phủ toàn thân mình loài cá cảnh này không chỉ có công năng vệ sinh hồ đơn thuần, mà chúng còn có một sức hút người đam mê cá cảnh vô cùng mãnh liệt.', 20.00, 20.00, '/img/products/ca1.jpg', 'Con', '2020-04-13 18:34:00', '2020-04-13 18:34:00'),
(13, 'Cá otto diệt rêu hại và vệ sinh hồ thủy sinh', 2, 'Otto là dòng cá thủy sinh chuyên vệ sinh hồ và ăn các loại rêu bám kính, Cá otto có thể nuôi chung với hầu hết tất cả các dòng cá cảnh khác bởi tập tính của chúng rất hiền lành. Là một dòng cá thủy sinh dễ thích nghi với môi trường, làm việc chăm chỉ lại có vẻ đẹp rất thu hút người chơi, Otto được xếp vào những dòng cá mà giới anh em chơi thủy sinh săn lùng rất nhiều.', 35.00, 35.00, '/img/products/ca2.jpg', 'Con', '2020-04-13 18:34:38', '2020-04-13 18:34:38'),
(14, 'Hồng Mi Ấn Độ', 2, 'Hồng Mi Ấn Độ là một trong những dòng cá cảnh thủy sinh bơi theo đàn được anh em giới thủy sinh rất yêu thích, khi đạt kích thước tối đa dòng cá này có thể đạt tới 9-12cm. trong một điều kiện môi trường tốt, hồng mi ấn độ có thể đạt kích thước tối đa lên tới 15cm. Thoạt nhìn cá cảnh Hồng Mi Ấn Độ sẽ rất giống với cá bút chì bởi đường kẻ sọc dọc thân cá, tuy nhiên Hồng mi ấn độ sẽ có phần khác biệt rõ rệt đó, đó chính là các đường sọc đỏ ở phần đầu và vây lưng.', 50.00, 50.00, '/img/products/ca3.jpg', 'Con', '2020-04-13 18:35:25', '2020-04-14 08:10:27'),
(15, 'Cá 7 màu', 2, 'Cá bày màu, hay còn gọi là cá guppy : Đây là loài cá dễ nuôi nhất, dễ sinh sản. Cá bảy màu chợ có giá khoảng 4k/cặp. Lưu ý riêng các loại cá 7 màu thái sẽ có giá cao hơn', 4.00, 4.00, '/img/products/ca4.jpg', 'Cặp', '2020-04-13 18:36:29', '2020-04-13 18:43:24'),
(16, 'Cángựa văn', 2, 'Cá ngựa vằn có thân mỏng hay hơi dẹp bên, có 2 cặp râu. Cá cái hơi lớn hơn cá đực, có bụng tròn hơn. Lưng màu ôliu nâu, bụng trăng trắng. Màu sắc và đường nét trang trí của hông rất đặc trưng.Ở cá đực, màu nền là vàng kim, điểm xuyết thêm bốn vạch dọc màu lam đậm trải ra suốt chiều dài của cơ thể, từ nắp mang cho đến tận cùng vây đuôi. Bức họa này cũng lặp lại trên vây hậu môn. Vây lưng màu ôliu, viền trắng lam, trong khi các vây ngực và vây bụng lại không có màu. Khe mang mang những vệt màu lam hơi khó phân biệt. Đầu mõm và bụng trắng bạc óng ánh.', 5.00, 5.00, '/img/products/ca5.jpg', 'Cặp', '2020-04-13 18:37:29', '2020-04-13 18:39:11'),
(17, 'Cá đuôi kiếm', 2, 'Cá đuôi kiếm với đặc điểm cá trống có chiếc đuôi kiếm dài nổi bật. Chiếc đuôi này không phải là vũ khí mà chỉ là vật trang trí giúp cá trống đẹp hơn trong mắt cá mái', 6.00, 6.00, '/img/products/ca6.jpg', 'Cặp', '2020-04-13 18:39:59', '2020-04-13 18:39:59'),
(18, 'Cây thủy sinh Dương Xỉ Java vị trí trung cảnh', 1, 'Dương xỉ Java có tên tiếng anh là microsorum pteropus là dòng cây thủy sinh xuất hiện từ rất lâu đời và được rất nhiều anh em chơi thủy sinh yêu thích. Đây là dòng cây thủy sinh dễ trồng, dễ chăm sóc và mang vẻ đẹp rất cổ điển và điển hình của dòng Dương xỉ. Dương xỉ Java có nguồn gốc từ Châu Ắ thường sống trên các viên đá dọc bờ suối nơi có dòng nước chảy qua, hoặc dưới thác nước. Dương xỉ Java cũng là dòng cây thủy sinh cần ít dinh dưỡng và thường được dán lên các giá thể trong hồ thủy sinh như viên đá, gốc lũa, hoặc làm các bụi cây với vai trò trung cảnh trong hồ thủy sinh.', 45.00, 45.00, '/img/products/cay1.jpg', 'cây', '2020-04-13 18:42:03', '2020-04-13 18:42:03'),
(19, 'Tiêu thảo nâu', 1, 'Có thể nói cây thủy sinh Tiêu thảo nâu là một trong những dòng cây rất phổ biến thường xuyên xuất hiện bên trong các bố cục hồ thủy sinh. Tiêu thảo nâu có một đặc điểm rất khác và nổi bật so với các dòng cây thủy sinh khác, nó có một màu nâu ấm tạo điểm nhấn cho hồ thủy sinh, đặc biệt đối với các loại hồ có bố cục hà lan, hồ thủy sinh bố cục rừng dùng làm điểm các gốc cây tuyệt đẹp.', 50.00, 50.00, '/img/products/cay2.jpg', 'cây', '2020-04-13 18:42:46', '2020-04-14 08:10:46'),
(20, 'Tiêu thảo Lagenandra meeboldii red đột biến', 1, 'Tiêu thảo Lagenandra meeboldii red đột biến là dòng cây thủy sinh mang màu sắc rất đặc biệt, đối với môi trường ánh sáng và dinh dưỡng tốt cây sẽ cho ra sắc màu hồng phấn cực kì đẹp. Tiêu thảo Lagenandra meeboldii red thuộc dòng cây thủy sinh dễ trồng, dễ chăm sóc, tuy nhiên để cây phát triển đẹp và khỏe chúng ta cũng nên đáp ứng đầy đủ nhu cầu thiết yếu như co2, dinh dưỡng tốt, ánh sáng trung bình. Thoạt nhìn thì cây thủy sinh Tiêu thảo Lagenandra meeboldii red đột biến khá giống với tiêu thảo Lagenandra meeboldii về From thân và lá, nhưng điều dễ phân biệt nhất giữa hai loại cây này đó là màu sắc.', 90.00, 90.00, '/img/products/cay3.jpg', 'cây', '2020-04-13 18:45:32', '2020-04-13 18:45:32'),
(21, 'Cây thủy sinh Dương Xỉ Châu Phi loại thường và Mini', 1, 'Dương Xỉ Châu Phi là dòng cây thủy sinh sống trên giá thể, thường được bố trí trong bố cục hồ thủy sinh ở các vị trí gốc lũa và hốc đá. Là dòng cây thủy sinh tương đối dễ trồng, chúng cần một lượng dinh dưỡng ít, dòng chảy liên tục sẽ giúp dòng cây này phát triển nhanh hơn. Dương Xỉ Châu Phi hiện có hai chủng loại bao gồm dòng lá to và dòng lá mini, tùy vào bố cục hồ thủy sinh, kích thước của hồ mà chúng ta sẽ có lựa chọn dòng cây hợp lý hơn.', 120.00, 120.00, '/img/products/cay4.jpg', 'cây', '2020-04-13 18:46:19', '2020-04-13 18:46:19'),
(22, 'Ráy nana white dòng cây thủy sinh cao cấp dễ trồng', 1, 'Ráy nana white hay còn gọi là ráy trắng là dòng cây thủy sinh được rất nhiều anh em giới chơi thuỷ sinh săn lùng bởi vẻ đẹp sang trọng của chúng. Với những chiếc lá màu trắng cũng là điểm nổi bật so với các loại cây ráy thông thường, chúng thường được dùng làm trang trí tạo điểm nhấn cho các bố cục hồ thuỷ sinh rất ấn tượng. Cây thuỷ sinh ráy nana white cũng như các dòng cây ráy khác, chúng rất dễ chăm sóc yêu cầu ánh sáng trung bình, dinh dưỡng ít.', 300.00, 290.00, '/img/products/cay5.jpg', 'cây', '2020-04-13 18:47:10', '2020-04-13 18:47:10'),
(23, 'Hồng Hồ Điệp loại cây thủy sinh mang sắc thái mê hoặc', 1, 'Cây thủy sinh Hồng Hồ Điệp có tên tiếng anh là rotala macrandra red là dòng cây cắt cắm dễ trồng, thường xuất hiện trong các bố cục hồ thủy sinh Hà Lan. Với những tán lá rộng, mỏng và to loài cây thủy sinh này thường đảm nhận vị trí hậu cảnh bên trong hồ thủy sinh. Đặc điểm nổi bật của Cây thủy sinh Hồng Hồ Điệp đó là chúng có một chiếc lá mỏng và to, khi được nuôi trồng ở môi trường hồ nuôi lý tưởng bao gồm (ánh sáng màu wrgb, dinh dưỡng tốt) chúng sẽ cho ra một màu sắc hồng đỏ vô cùng thu hút người chơi thủy sinh.', 25.00, 25.00, '/img/products/cay6.jpg', 'cây', '2020-04-13 18:49:35', '2020-04-13 18:49:35'),
(24, 'Tép Yamato diệt rêu hại cho hồ thủy sinh chuyên nghiệp', 3, 'Yamato là một dòng tép cảnh nước lợ, chúng được anh em chơi thủy sinh rất yêu thích bởi công năng của loài tép này có thể xử lý các rêu hại bên trong hồ thủy sinh, giúp chiếc hồ luôn xanh và sạch. Yamato cũng là một trong những dòng tép dễ nuôi, chúng không yêu cầu điều kiện môi trường như các dòng tép cảnh khác. Yamato có thể sống khỏe trong môi trường nước ngọt từ 2-3 năm, chúng là dòng ăn tạp, do đó ngoài rêu hại bên trong hồ thủy sinh thì các loại thức ăn cho cá, tép chúng đều có thể ăn được. tép Yamato khi trưởng thành có thể đặt chiều dài từ 5-7cm', 30.00, 30.00, '/img/products/tep1.jpg', 'Con', '2020-04-13 18:50:39', '2020-04-13 18:50:39'),
(25, 'Tép vàng thuộc dòng tép cảnh quyền quý', 3, 'Có thể nói Tép Vàng là một trong những loại tép cảnh đại diện cho dòng tép màu có sức hút người chơi vô cùng to lớn, với vẻ ngoài phủ vàng tạo nên sự quyền quý của người chơi tép. Sở dĩ tép vàng được các anh em chơi tép màu yêu thích vì cũng chỉ vì 2 lý do đơn giản đó là chúng rất nổi bật bên trong hồ nuôi, phù hợp với hầu hết các loại màu nền. Điều thứ 2 đó là chúng rất dễ nuôi, dễ chăm sóc, khi sống trong diều kiện môi trường tốt tép vàng có thể sinh sản rất nhanh. Cũng như dòng tép đỏ, tép vàng cũng có nhiều chủng loại khác nhau bao gồm vàng thường, vàng toàn thân, vàng cam, vàng sọc (golden line). Tuy nhiên để nói về mức thông dụng và được nhiều người yêu thích nhất có lẽ vẫn là dòng tép vàng thuần túy và vàng sọc.', 12.00, 12.00, '/img/products/tep2.jpg', 'Con', '2020-04-13 18:51:35', '2020-04-13 18:51:35'),
(26, 'Tép SRC dòng tép cảnh dễ nuôi nhất', 3, 'Tép SRC là từ viết tắt của Super Red Cherry, là dòng tép cảnh có màu đỏ phủ toàn thân vô cùng bắt mắt, đặc biệt đối với những anh em mới chơi dòng tép này có một sức hút lạ kì. Dòng tép đỏ có nhiều loại tuy nhiên dòng tép SRC là một trong những dòng phổ biến bởi chúng dễ nuôi, tỉ lệ các chú tép con khi sinh ra dữ được gen bố mẹ khá cao.', 10.00, 10.00, '/img/products/tep3.jpg', 'Con', '2020-04-13 18:54:07', '2020-04-13 18:54:07'),
(27, 'Tép rili đen hay còn gọi là rili carbon', 3, 'Rili đen hay còn gọi là rili carbon là dòng tép cảnh đẹp với đặc điểm nổi bật là các khoang màu đen phân cách bởi phần thân giữa trong suốt rất thu hút người chơi. Cũng như các dòng tép cảnh khác, rili đen có kích thước tối đa chỉ bằng đầu đũa chúng là loài ăn tạp. Bạn có thể cho chúng các loại thức ăn dạng viên đóng gói sẵn, hoặc có thể cho ăn các loại rau củ quả luộc.', 15.00, 15.00, '/img/products/tep4.jpg', 'Con', '2020-04-13 18:54:45', '2020-04-13 18:54:45'),
(28, 'Ốc Táo vệ sinh hồ chuyên ăn thức ăn thừa và phân cá', 3, 'Ốc Táo hiện nay đang rất được ưa chuộng không chỉ làm cảnh trong hồ thủy sinh, mà chúng còn có tác dụng dọn vệ sinh hồ vô cùng hiệu quả. Ốc Táo đa dạng về màu sắc điển hình như ốc táo vàng, ốc táo tím, ốc táo trắng, ốc táo đen… Chính vì sự đa dạng về màu sắc nhu vậy nên loại ốc này được các anh em chơi thủy sinh và cá cảnh rất yêu thích. Loại ốc này di chuyển nhanh và làm việc vệ sinh hồ liên tục, giúp giữ gìn vệ sinh hệ sinh thái bên trong hồ cá thủy sinh hiệu quả. Tùy theo thời điểm mà cửa hàng sẽ có nhiều màu, hoặc ít màu cho khách hàng lựa chọn.', 10.00, 10.00, '/img/products/oc1.jpg', 'Con', '2020-04-13 18:59:18', '2020-04-13 18:59:18'),
(29, 'Hồ thủy sinh cao cấp Gex Glassterior LX Tank', 5, 'Gex Glassterior LX Tank là mẫu hồ thủy sinh cao cấp của hãng Gex, với một kiểu dáng rất thu hút người chơi. Hồ được làm từ chất liệu kính siêu trong. với 3 mặt được phủ lớp sơn đen cao cấp công nghệ Asahi Glass làm nổi bật các cảnh quan và tạo chiều sâu bên trong hồ thủy sinh. Các góc kính được mài vát 45 độ và được ráp vào nhau tạo nên sự khác biệt so với các loại hồ kính thông thường.', 900.00, 900.00, '/img/products/ho1.jpg', 'Cái', '2020-04-13 19:02:11', '2020-04-13 19:02:11'),
(30, 'Set bể cá mini hình lục giác cực đẹp Aquael Hexa Set Aquarium', 5, 'Aquael Hexa Set Aquarium là loại bể cá mini trọn bộ bao gồm đèn, hồ và lọc. Đây là mẫu bể cá mini vô cùng độc đáo với thiết kế hình lục giác mới lạ. Đáy bể được gia cố bằng khung rất chắc chắn. Bể cá mini này được làm bằng các tấm kính dày, bền được liên kết với silicone đen đặc biệt. Điều này không chỉ làm cho bể cứng và kín nước mà còn làm giảm bụi bẩn. Phần trên của bể cá mini được bảo vệ với nắp màu đen với hệ thống chiếu sáng tiết kiệm năng lượng LED hiện đại và bộ lọc dòng chảy dựa trên bơm tuần hoàn. Bộ lọc, được tích hợp vào nắp do đó bạn sẽ không cần phải mua thêm lọc ngoài thêm rườm rà.', 3600.00, 3500.00, '/img/products/ho2.jpg', 'Cái', '2020-04-13 19:03:01', '2020-04-13 19:03:01'),
(31, 'Mẫu bể cá mini nhập khẩu Aquael Classic Oval Aquarium Set 40', 5, 'Bể cá mini nhập khẩu Aquael Classic Oval Aquarium Set 40 được trang bị hồ, đèn, lọc nội bộ rất nhỏ gọn cho anh em chơi thủy sinh và cá cảnh. Bể cá mini có kích thước 40 x 25 x 25cm, chất liệu kính siêu trong tạo nên sự  tinh tế để tôn vinh cảnh vật bên trong hồ. Bể cá mini của Aquael phù hợp với các bạn mới chơi thủy sinh và cá cảnh ít có thời gian chăm sóc cho hồ.', 2100.00, 2000.00, '/img/products/ho3.jpg', 'Cái', '2020-04-13 19:03:47', '2020-04-13 19:03:47'),
(32, 'Lọc vángmini Dophin Hk200', 6, 'Dophin Hk200 là mẫu lọc váng mini sử dụng phù hợp cho các hồ có kich thước nhỏ tới trung bình khoảng 30-60cm, lọc váng được thiết kế nhỏ gọn với dộ thẩm mỹ cao tôn vinh vẻ đẹp của chiếc hồ thủy sinh của bạn. Mặt trên của lọc được trang bị miếng ngăn các rác thải lớn, cá, ốc chui vào bên trong lọc vô cùng tiện lợi.', 120.00, 120.00, '/img/products/loc1.jpg', 'Cái', '2020-04-13 19:11:14', '2020-04-13 19:11:14'),
(33, 'Lọc thác cho hồ cá và hồ thủy sinh Dophin', 6, 'Dophin là một trong những hãng lâu đời hoạt động trong lĩnh vực sản xuất các phụ kiện cho hồ cá và hồ thủy sinh, trong đó có dòng lọc thác Dophin với nhiều công suất và kích cỡ khác nhau do đó sẽ phù hợp cho nhiều kích cỡ hồ mà bạn đang chơi. Lọc thác Dophin có giá thành ở mức bình dân, hiệu năng của máy lọc ở mức tối ưu (tối ưu về hệ thông khoang lọc rộng) đây cũng là một điểm cộng đáng lưu ý về dòng sản phẩm lọc thác này.', 130.00, 130.00, '/img/products/loc2.jpg', 'Cái', '2020-04-13 19:11:52', '2020-04-13 19:11:52'),
(34, 'Lọc thác mini Gex Slim Filter Size SS', 6, 'Mới đây hãng Gex của Nhật đã cho ra thêm một mẫu lọc thác mini mới với size là SS, lọc thác này phù hợp cho các hồ có kích thước 20-30cm. Lọc thác mini Gex size ss được làm từ chất liệu mica trong suốt với cấu tạo nhỏ gọn, dễ dàng lắp đặt. Đây là mẫu lọc thác được nhiều anh em đam mê lọc mini yêu thích nhất hiện nay. Lọc thác mini được trang bị 1 miếng bông lọc, bên trong là than hoạt tính, bạn có thể trang bị thêm cho lọc các loại đá lọc để việc xử lý nước trở nên tốt hơn.', 225.00, 220.00, '/img/products/loc3.jpg', 'Cái', '2020-04-13 19:12:33', '2020-04-13 19:12:33'),
(35, 'Lọc thác Gex Slim Filter size S M L', 6, 'Lọc thác Gex Slim Filter là loại lọc có thể sử dụng cho các hồ cá và hồ thủy sinh, hồ nuôi tép cảnh. Với mẫu mã đẹp, lạ hiệu năng cao đây là mẫu lọc được yêu thích nhất hiện nay. Toàn bộ vỏ bọc bên ngoài của lọc thác Gex Slim Filter được làm từ chất liệu Mica trong suốt tạo cảm giác thích thú cho người sử dụng khi mà có thể quan sát được toàn bộ quá trình lọc nước diễn ra. Lọc thác Gex Slim Filter được trang bị máy bơm đặt bên trong hồ, và 1 miếng mút ngăn chạn bụi bẩn, tép con, cá con chui vào bên trong lọc được trang bị ở phần đầu hút của máy bơm. Các miếng lọc của lọc thác Gex Slim Filter được thiết kế dạng bông ngăn chạn bụi bẩn, chất dơ, và phía bên trong là các vật liệu lọc than hoạt tính. Với 3 mẫu lọc thác Gex Slim Filter bao gồm size S, M, L phù hợp với nhiều kích thước bể cá khác nhau.', 270.00, 270.00, '/img/products/loc4.jpg', 'Cái', '2020-04-13 19:13:14', '2020-04-13 19:13:14'),
(36, 'Lọc thác cho hồ cá Aquablue HF-500', 6, 'Lọc thác Aquablue HF-500 là dòng lọc mini sử dụng cho hồ có kích thước từ 50cm trở xuống, Bộ lọc được trang bị các ngăn lọc xử lý nước ưu việt. Bên ngoài vỏ hộp lọc được thiết kế dưới dạng mica trong suốt, tạo điểm nhấn cho chiếc hồ cá thủy sinh của bạn. Chiều dài của ống hút nước dài từ 20-30cm tùy theo bạn có nhu cầu gắn dài hay ngắn bằng các ống dẫn nhà sản xuất cung cấp sẵn cho chúng ta. Cũng như các dòng lọc thác khác Aquablue HF-500 cũng được trang bị nút điều chỉnh lưu lượng của dòng chảy rất tiện lợi. Ngoài ra phần đầu hút nước của lọc thác Aquablue còn được trang bị mút ngăn bụi bẩn, cá con, tép con, đây là ưu điểm lớn nhất của chiếc lọc thác này. Bởi nhờ có miếng mút ngăn này mà chúng ta hoàn toàn có thể yên tâm các chú cá, tép con sẽ không bị hút vào bên trong hộp lọc như các dòng lọc thác khác.', 150.00, 150.00, '/img/products/loc5.jpg', 'Cái', '2020-04-13 19:14:02', '2020-04-13 19:14:02'),
(37, 'Lọc váng cao cấp cho hồ thủy sinh OF Surfclear Aquatic Surface Skimmer', 6, 'OF Surfclear Aquatic Surface Skimmer là loại lọc váng cao cấp cho hồ thủy sinh được nhập khẩu chính hãng yihufish Sigapore, với thiết kế độc đáo, loại bỏ đi các chất bẩn, váng trên bề mặt hồ thủy sinh gây mất cảm quan. Đặc điểm nổi bật của dòng sản phẩm này là có thể điều chỉnh được tốc độ dòng chảy. Phần phao thông minh sẽ nâng lên hoạc hạ xuống luôn cân bằng với bề mặt nước trong hồ.', 400.00, 400.00, '/img/products/loc6.jpg', 'Cái', '2020-04-13 19:14:42', '2020-04-13 19:14:42'),
(38, 'Lọc thác mini cho bể cá cảnh Sunsun HBL-403', 6, 'Lọc thác mini cho bể cá cảnh Sunsun HBL-403, cùng với kiểu mẫu như dòng 402 tuy nhiên ở dòng hbl 403 này kích thước sẽ lớn hơn so với mẫu 402. Sunsun HBL-403 được tăng cường ống lọc váng do đó đối với các anh em chơi hồ thủy sinh sẽ không cần phải trang bị thêm máy lọc váng. Thác nước lớn cho ra dòng chảy đều và êm, lọc thác Sunsun HBL-403 phù hợp cho các bể cá cảnh có kích thước 30-40cm.', 130.00, 130.00, '/img/products/loc7.jpg', 'Cái', '2020-04-13 19:15:21', '2020-04-13 19:15:21'),
(39, 'Thức ăn cho tép cảnh Red Food', 7, 'Red Food là loại thức ăn giàu đạm, với công thức đặc biệt giúp tăng màu sắc của cá và tép cảnh, bạn sẽ cảm nhận được mức độ chuyển biến màu sắc ngay từ lần đầu sử dụng thức ăn Red Food. Có thể nói đây là loại thức ăn chuyên dụng cho tép cảnh hiện nay có thể giúp các chú tép cảnh tăng màu rõ rệt nhất. Thức ăn cho tép cảnh Red Food được tạo thành từ các loại nguyên liệu dinh dưỡng cao cấp, chất kết dính tự nhiên đảm bảo sức khỏe của những chú tép luôn ở trạng thái khỏe mạnh và màu sắc rực rỡ nhất. Ưu điểm của thức ăn Red Food là có thể sử đụng được cho cả cá lẫn tép, đặc biệt các dòng cá tầng đáy như cá otto, cá tỳ bà bướm, cá lau kiếng…', 50.00, 50.00, '/img/products/food1.jpg', 'Hộp', '2020-04-13 19:17:46', '2020-04-13 19:17:46'),
(40, 'Thức ăn viên dán cho cá cảnh AquaFin 13', 7, 'AquaFin 13 là loại thức ăn cung cấp đầy đủ các loại vitamin thiết yếu giúp những chú cá của bạn phát triển khỏe mạnh, thức ăn phù hợp với các loài cá như cá neon, cá bảy màu, cá lau kiếng… và rất nhiều dòng cá có from cá nhỏ khác. Thức ăn viên dán cho cá Aquafin 13 được kết dính bởi chất kết dính tự nhiên an toàn tuyệt đối cho cá cảnh. Thức ăn có dạng viên giống như viên thuốc và có thể dính chắc lên thành kính không thể rơi như các loại thức ăn viên dán thông thường. Thức ăn viên dán có nguồn gốc xuất xứ từ taiwan. Hướng dẫn sử dụng thức ăn viên dán: Mở nắp hộp viên dán và dán trực tiếp vào bên trong hồ nuôi cá, dùng ngón tay nhấn mạnh viên dán vào thành hồ sau đó bỏ tay ra. 1 viên thức ăn dán có thể sử dụng cho 20 chú cá neon, cá bảy màu… và các loài cá có From nhỏ khác.', 60.00, 60.00, '/img/products/food2.jpg', 'Hộp', '2020-04-13 19:18:25', '2020-04-13 19:18:25'),
(41, 'Thức ăn cho cá cảnh bảy màu Sera Guppy Gran', 7, 'Sera Guppy Gran là loại thức ăn cho cá bảy màu và các dòng cá cảnh nhỏ khác, sản phẩm được sản xuất bởi hãng Sera của Đức và được nhập khẩu bởi cty Sinh Cảnh Việt. Sera Guppy Gran có kích thước hạt cám nhỏ, phù hợp với các chú cá bảy màu bột (cá nhỏ). Đây là dạng thức ăn được hãng Sera nghiên cứu kì công để giúp phù hợp nhất với thể trạng của những chú cá bảy màu, giúp cá ăn ngon, kích thích hệ tiêu hóa, không gặp hiện tượng khó tiêu gây sình bụng như các loại cám thức ăn thông thường.', 150.00, 150.00, '/img/products/food3.jpg', 'Hộp', '2020-04-13 19:19:09', '2020-04-13 19:19:09'),
(42, 'Thức ăn cho cá ba đuôi Sera Goldy Gran', 7, 'Sera Goldy Gran là dòng sản phẩm thức ăn chuyên dụng cho cá Vàng, bao gồm các thành phần lúa mì (4%), axit béo omega và mannan oligosacarit giúp hỗ trợ tối đa hệ tiêu hóa cho cá vàng. Thức ăn cho cá vàng Sera Goldy Gran được sản xuất dưới dạng viên tròn nhỏ, không tan trong nước và có đặc điểm nổi trên mặt nước, phù hợp với tất cả các dòng cá vàng (cá ba đuôi)', 110.00, 110.00, '/img/products/food4.jpg', 'Hộp', '2020-04-13 19:19:55', '2020-04-13 19:19:55'),
(43, 'Thức ăn cho cá cảnh La Hán XO EVER RED', 7, 'Thức ăn cho cá cảnh La Hán XO EVER RED được sản xuất tại Singapore hỗ trợ tăng màu cho cá La Hán và tăng kích thước đầu của cá. Công thức của loại thức ăn cho cá cảnh này bao gồm Tảo Spirulina, vitamin , các khoáng chất và carotene ….', 30.00, 30.00, '/img/products/food5.jpg', 'Hộp', '2020-04-13 19:20:38', '2020-04-13 19:20:38'),
(44, 'Thức ăn nhập khẩu cho cá La Hán JBL NovoFlower Maxi', 7, 'JBL NovoFlower Maxi là loại thức ăn cho cá cảnh La Hán được sản xuất và nhập khẩu từ Đức, thức ăn dạng cám hạt chuyên hỗ trợ cho cá La Hán tăng kích thước đầu, và các hoa văn trên đầu của cá. Là loại thức ăn chứa hàm lượng dinh dưỡng đạt chuẩn cho những chú cá La Hán có kích thước tối thiểu 15cm trở lên. Với hỗn hợp vitamin tổng hợp tạo khả năng kháng bệnh, hàm lượng cân bằng của protein và chất béo đảm bảo sự phát triển khỏe mạnh và sự hình thành của bướu trán điển hình. Sử dụng trong vòng 4 tháng sau khi mở hộp. Trong bao bì chống ánh sáng và kín khí với niêm phong lá, có thể lưu trữ trong vòng 3 năm.', 370.00, 370.00, '/img/products/food6.jpg', 'Hộp', '2020-04-13 19:21:21', '2020-04-13 19:21:21'),
(45, 'Dung dịch test nồng độ Ph trong nước chính hãng Sera của Đức', 8, 'Test Ph của Sera là một trong những dòng sản phẩm test độ cứng ph của nước vô cùng chính xác nhờ phản ứng dung dịch hóa học. Bạn sẽ hoàn toàn yên tâm khi có trong tay sản phẩm test PH Sera này, bạn sẽ là người chủ động nắm vững nguồn nước nuôi cá của mình. Bộ sản phẩm test Ph bao gồm 1 chai dung dịch chứa 15ml, 1 hũ thủy tinh có kèm vạch chia thể kích giúp bạn dễ dàng cân lượng nước để đo PH một cách chính xác nhất.', 135.00, 135.00, '/img/products/pk1.jpg', 'Cái', '2020-04-13 19:24:15', '2020-04-13 19:24:15'),
(46, 'Gex Ph Down dung dịch giúp giảm Ph trong nước', 8, 'Gex Ph Down là một dòng sản phẩm tuyệt vời để giúp bạn giảm độ ph trong nước (độ cứng của nước), một cách an toàn và hiệu quả nhất hiện nay. Ph Down là sản phẩm thuộc thương hiệu Gex được rất nhiều anh em chơi thủy sinh và cá cảnh tin dung bởi độ hiệu quả mà sản phẩm này mang lại. Các thành phần chính có trong dung dịch này bao gồm axit photphoric, axit sunfuric và chất tạo màu. Cách dùng và liều dùng cũng tương tự như sản phẩm Gex PH Up: nhỏ 2cc (2cc tương ứng 15giọt) cho 10lit nước, đợi kết quả sau 12h sử dụng, nếu ph vẫn thấp hoặc cao thì tiếp tục tái sử dụng với liều lượng như ban đầu. Bên trong hộp đã có sẵn cốc đo lưu lượng.', 100.00, 100.00, '/img/products/pk2.jpg', 'Cái', '2020-04-13 19:24:59', '2020-04-13 19:24:59'),
(47, 'Phao châm nước cho hồ thủy sinh hoặc hồ tép', 8, 'Phao châm nước là một trong những bộ phụ kiện thủy sinh khá phổ biến đối với các anh em chơi thủy sinh dùng quạt để làm mát cho hồ. Việc dùng phao châm nước tự động sẽ giúp bạn tiết kiệm thời gian chăm sóc hồ của mình, thay vì hàng ngày phải châm thêm nước khi bị hụt nước do quạt tản nhiệt làm bay hơi nước gây nên. Phao châm nước tự động có thể sử dụng có các hồ thủy sinh, và hồ tép. Sản phẩm dễ sử dụng có độ bền cao, nên được rất nhiều anh em giới thủy sinh tin dùng.', 60.00, 60.00, '/img/products/pk3.jpg', 'Cái', '2020-04-13 19:25:32', '2020-04-13 19:25:32'),
(48, 'San hô vụn giúp tăng ph cho hồ cá thủy sinh', 8, 'San hô vụn là một dạng san hô khai thác từ biển khơi, thường được dùng làm tăng ph cho các hồ cá, hồ thủy sinh một cách tự nhiên nhất. Khả năng làm tăng ph tối đa của san hô vụn có thể tăng từ 1-2 độ PH. San hô vụn với các hình thể khác nhau, với các lỗ nhỏ liti trên bề mặt giúp làm giá thể sinh sống cho vinh sinh. Đây cũng là một lợi điểm mà san hô vụn thường được trang bị trong các hộp lọc của hồ cá cảnh.', 40.00, 40.00, '/img/products/pk4.jpg', 'Cái', '2020-04-13 19:26:10', '2020-04-13 19:26:10'),
(49, 'Vợt lọc vỏ trứng artemia và lọc thức ăn cho Artemia', 8, 'Vợt lọc vỏ trứng artemia được làm từ chất liệu vải sợi cao cấp với những lỗ nhỏ nano giúp bạn lọc các vỏ trúng artemia sau khi ấp và lọc thức ăn cho artemia rất hiệu quả. Vợt lọc vỏ trứng artemia có kích thước dài 27cm và đường kính là 17cm, với kích thước vợt lớn này sẽ phù hợp với các bạn ấp số lượng artemia lớn. Vợt lọc vỏ trứng artemia được làm từ chất liệu kim loại không gỉ, rất cứng, bền. Bên cạnh đó, các sợi vải lưới của vợt lọc, được may bổ sung loại vải siêu bền nhằm hạn chế trong thời gian sử dụng vợt sẽ bị bung.', 50.00, 50.00, '/img/products/pk5.jpg', 'Cái', '2020-04-13 19:26:48', '2020-04-13 19:26:48'),
(50, 'Viên sủi oxy cho bể cá cảnh thuận tiện khi ship cá đi xa', 8, 'Viên sủi oxy là một sản phẩm tinh tế hỗ trợ người nuôi cá cảnh phục vụ cho những lúc mất điện, ship cá đi xa, bạn sẽ hoàn toàn yên tâm không lo sợ cá bị thiếu oxy. Viên sủi oxy được sản xuất dưới dạng viên nén, thời gian tan trong nước từ 3-5 tiếng. Những hạt bọt khí oxy nhỏ, tan chậm trong nước gúp những chú cá có được cung cấp lượng oxy phù hợp.', 80.00, 80.00, '/img/products/pk6.jpg', 'Hộp', '2020-04-13 19:28:12', '2020-04-13 19:28:12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `slide`
--

CREATE TABLE `slide` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `link` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `salary` double(8,2) NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `work` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `birthday` date NOT NULL,
  `identity_card` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `staff`
--

INSERT INTO `staff` (`id`, `name`, `address`, `gender`, `salary`, `email`, `work`, `birthday`, `identity_card`, `created_at`, `updated_at`) VALUES
(1, 'Trần Phúc Chương', 'Bến Lức Long An', 'm', 3000.00, 'chuongtran@gmail.com', 'Dọn Vệ Sinh', '2000-05-12', '231024575', '2020-04-15 09:16:00', '2020-04-15 09:19:34');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `type_products`
--

CREATE TABLE `type_products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `type_products`
--

INSERT INTO `type_products` (`id`, `name`, `description`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Cây Thủy Sinh', 'Loại cây sống được ở dưới nước, ít cần CO2', '/img/typeProduct/Cay Thuy Sinh.jpg', '2020-04-06 18:01:02', '2020-04-13 06:17:20'),
(2, 'Cá', 'Cá Cảnh Đẹp', '/img/typeProduct/Ca.jpg', '2020-04-06 18:03:10', '2020-04-06 18:03:10'),
(3, 'Tép, Ốc', 'Tôm Thủy Sinh Nước Ngọt', '/img/typeProduct/Tom.jpg', '2020-04-06 18:04:27', '2020-04-13 18:59:32'),
(4, 'Đèn Thủy Sinh', 'Đèn thủy sinh gọn gàng, dễ sử dụng, giá tiền bình dân phù hợp với các anh em mới bắt đầu chơi thủy sinh', '/img/typeProduct/den2.jpg', '2020-04-13 18:13:33', '2020-04-13 18:13:33'),
(5, 'Hồ thủy sinh', 'Nuôi thủy sinh', '/img/typeProduct/ho.jpg', '2020-04-13 19:01:31', '2020-04-13 19:01:31'),
(6, 'Máy Lọc', 'Máy Lọc', '/img/typeProduct/loc.jfif', '2020-04-13 19:10:28', '2020-04-13 19:10:28'),
(7, 'Thức ăn', 'Thức ăn cho cá thủy sinh', '/img/typeProduct/food.jpg', '2020-04-13 19:17:04', '2020-04-13 19:17:04'),
(8, 'Phụ kiện', 'Phụ kiện thủy sinh', '/img/typeProduct/pk.jpg', '2020-04-13 19:23:41', '2020-04-13 19:23:41');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `level` int(11) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `email`, `level`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'Đinh Hồng Hà', 'admin', 'hadinhcpr1233@gmail.com', 1, NULL, '$2y$10$PApbfSgJu7FknjOxX2N2nO3vzc5Plzuh2BeoAwkmqtu5jkOE1UwwO', 'altjnzPYMiLSJBROOyt5CM9dLIENEHC5eJvLspUv72CwdGrPpHw4EzHrNin6', '2020-04-15 06:40:48', '2020-04-15 06:40:48'),
(2, 'Nguyễn Bỉnh Khiêm', 'marketing', 'nguyenbinhkhiem1233@gmail.com', 2, NULL, '$2y$10$G9ahevA1gnJetfFnXFIwgeOtlUlDOz75RMF16WAocqrnGVJ7oY8TW', NULL, '2020-04-15 06:44:28', '2020-04-15 06:44:28'),
(3, 'Nguyễn Tiến Tới', 'transport', 'nguyentientoi@gmail.com', 3, NULL, '$2y$10$FJ2MvtL8gbLGR5QUW66Y1ubZZDIW5QV6NlH/bvd/OYzEjmnhzpuga', NULL, '2020-04-15 06:45:39', '2020-04-15 06:45:39'),
(4, 'Lê Hoàng Long', 'humanresource', 'lehoanglong@gmail.com', 4, NULL, '$2y$10$i4EyYBPX1650uqA8WTBgu.swFDQp3YTsdbmjTPIoY5rOIbsr0v10O', NULL, '2020-04-15 06:47:06', '2020-04-15 06:47:06'),
(5, 'Trần Tấn Trung', 'manageproduct', 'trantantrung@gmail.com', 5, NULL, '$2y$10$CWJWUdzruyFBHmJdY.CR3uohsfCJ1UZZ/qjTAUCYix4LrRNGggCHW', NULL, '2020-04-15 06:48:53', '2020-04-15 06:48:53');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_id_customer_foreign` (`id_customer`);

--
-- Chỉ mục cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bill_detail_id_bill_foreign` (`id_bill`),
  ADD KEY `bill_detail_id_product_foreign` (`id_product`);

--
-- Chỉ mục cho bảng `cancel_order`
--
ALTER TABLE `cancel_order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cancel_order_id_customer_foreign` (`id_customer`),
  ADD KEY `cancel_order_id_bill_foreign` (`id_bill`);

--
-- Chỉ mục cho bảng `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `news`
--
ALTER TABLE `news`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_id_type_foreign` (`id_type`);

--
-- Chỉ mục cho bảng `slide`
--
ALTER TABLE `slide`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `type_products`
--
ALTER TABLE `type_products`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT cho bảng `cancel_order`
--
ALTER TABLE `cancel_order`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `customer`
--
ALTER TABLE `customer`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `news`
--
ALTER TABLE `news`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT cho bảng `slide`
--
ALTER TABLE `slide`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT cho bảng `type_products`
--
ALTER TABLE `type_products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `bill_detail`
--
ALTER TABLE `bill_detail`
  ADD CONSTRAINT `bill_detail_id_bill_foreign` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `bill_detail_id_product_foreign` FOREIGN KEY (`id_product`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `cancel_order`
--
ALTER TABLE `cancel_order`
  ADD CONSTRAINT `cancel_order_id_bill_foreign` FOREIGN KEY (`id_bill`) REFERENCES `bills` (`id`),
  ADD CONSTRAINT `cancel_order_id_customer_foreign` FOREIGN KEY (`id_customer`) REFERENCES `customer` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_id_type_foreign` FOREIGN KEY (`id_type`) REFERENCES `type_products` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
