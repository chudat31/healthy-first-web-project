-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th6 07, 2022 lúc 04:41 PM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `web_project`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `certificates`
--

CREATE TABLE `certificates` (
  `id` bigint(20) NOT NULL,
  `end_date` date DEFAULT NULL,
  `start_date` date DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `certificates`
--

INSERT INTO `certificates` (`id`, `end_date`, `start_date`) VALUES
(24, '2022-12-12', '2021-12-12'),
(20, '2022-12-16', '2021-12-16'),
(26, '2022-02-11', '2020-11-11'),
(25, '2022-12-13', '2021-12-13'),
(23, '2021-12-16', '2019-12-16'),
(22, '2022-09-16', '2021-12-16'),
(29, '2022-10-10', '2021-10-10'),
(31, '2022-12-12', '2021-12-12'),
(32, '2022-06-17', '2021-06-05'),
(33, '2022-05-24', '2021-05-24'),
(59, '2022-06-11', '2022-03-11'),
(35, '2023-03-11', '2021-03-11'),
(36, '2022-09-11', '2021-09-11'),
(37, '2023-12-12', '2021-12-12'),
(39, '2023-12-26', '2021-05-05'),
(40, '2022-05-05', '2021-06-16'),
(41, '2022-03-11', '2021-03-11'),
(42, '2023-11-11', '2022-11-11'),
(53, '2024-11-26', '2022-05-26'),
(44, '2022-12-30', '2021-12-30'),
(45, '2023-08-11', '2021-08-11'),
(46, '2022-07-12', '2021-07-12'),
(47, '2022-05-05', '2021-05-05'),
(48, '2021-08-16', '2020-08-16'),
(49, '2022-10-14', '2021-10-14'),
(50, '2021-12-31', '2020-01-01'),
(51, '2022-04-14', '2023-04-14'),
(52, '2023-01-01', '2022-01-01'),
(54, '2024-01-01', '2022-01-01'),
(55, '2022-03-22', '2021-03-22'),
(56, '2021-10-23', '2020-10-23'),
(58, '2022-09-18', '2021-09-18'),
(61, '2022-12-12', '2021-12-12'),
(63, '2022-12-12', '2021-12-12');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `plans`
--

CREATE TABLE `plans` (
  `id` bigint(20) NOT NULL,
  `end_date` date DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL,
  `stage_id` bigint(20) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `plans`
--

INSERT INTO `plans` (`id`, `end_date`, `restaurant_id`, `stage_id`, `start_date`, `status`) VALUES
(1, '2022-01-23', 13, 0, '2021-10-23', 'Đã Kiểm Tra'),
(2, '2022-11-30', 14, 0, '2022-06-30', 'Chưa Kiểm Tra'),
(3, '2022-08-30', 24, 0, '2022-04-30', 'Chưa Hoàn Thiện'),
(4, '2021-11-12', 25, 0, '2021-09-12', 'Đã Kiểm Tra'),
(5, '2023-01-21', 26, 0, '2022-10-21', 'Chưa Kiểm Tra'),
(6, '2022-11-26', 28, 0, '2022-09-26', 'Chưa Kiểm Tra'),
(7, '2022-07-20', 29, 0, '2022-03-20', 'Chưa Hoàn Thiện'),
(8, '2022-10-20', 30, 0, '2022-06-20', 'Chưa Kiểm Tra'),
(9, '2022-09-26', 31, 0, '2022-06-26', 'Chưa Kiểm Tra'),
(10, '2021-11-11', 84, 0, '2022-01-11', 'Đã Kiểm Tra'),
(11, '2022-01-20', 34, 0, '2021-11-20', 'Đã Kiểm Tra'),
(12, '2022-06-30', 37, 0, '2022-03-30', 'Chưa Hoàn Thiện'),
(13, '2021-10-10', 38, 0, '2021-08-10', 'Đã Kiểm Tra'),
(14, '2022-10-11', 45, 0, '2022-07-11', 'Chưa Kiểm Tra'),
(15, '2021-09-23', 47, 0, '2021-06-23', 'Đã Kiểm Tra'),
(16, '2022-01-20', 48, 0, '2022-04-20', 'Đã Kiểm Tra'),
(17, '2021-10-12', 50, 0, '2022-01-12', 'Đã Kiểm Tra'),
(18, '2022-02-11', 70, 0, '2021-12-11', 'Đã Kiểm Tra'),
(19, '2022-05-12', 86, 4, '2021-12-12', 'Đã Hoàn Thiện'),
(20, '2022-08-16', 87, 0, '2022-06-16', 'Chưa Kiểm Tra'),
(21, '2023-03-11', 89, 0, '2022-12-11', 'Chưa Kiểm Tra'),
(22, '2022-08-12', 37, 0, '2022-06-12', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `restaurants`
--

CREATE TABLE `restaurants` (
  `id` bigint(20) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `cert_id` bigint(20) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `restaurants`
--

INSERT INTO `restaurants` (`id`, `address`, `name`, `phone`, `type`, `cert_id`, `district`) VALUES
(14, 'Hà Nội', 'BBQ', '0933928928', 'Restaurant', NULL, 'Cầu Giấy'),
(24, 'Hà Nội', 'The Coffee House', '0983054792', 'Restaurant', 0, 'Nam Từ Liêm'),
(18, 'Hà Nội', 'Meat', '0989430792', 'Production', NULL, 'Hoàn Kiếm'),
(25, 'Hà Nội', 'Cộng Coffee', '0983792827', 'Restaurant', 0, 'Đống Đa'),
(26, 'Hà Nội', 'Meat', '0366792872', 'Production', 0, 'Thanh Xuân'),
(28, 'Hà Nội', 'Noodles', '0933792878', 'Production', 0, 'Đống Đa'),
(29, 'Hà Nội', 'Royal Tea', '0989430792', 'Restaurant', 0, 'Cầu Giấy'),
(30, 'Hà Nội', 'Ding Tea', '0933096472', 'Production', 0, 'Bắc Từ Liêm'),
(31, 'Hà Nội', 'Highlands', '0933892782', 'Restaurant', NULL, 'Hà Đông'),
(84, NULL, 'Bánh Đa Trộn', '0936894673', 'Restaurant', NULL, 'Hai Bà Trưng'),
(34, 'Hà Nội', 'Meat', '0933098274', 'Production', 0, 'Thanh Xuân'),
(37, 'Hà Nội', 'Meat', '0123456789', 'Production', 0, 'Cầu Giấy'),
(38, 'Hà Nội', 'Milk Tea', '0388972165', 'Production', 0, 'Bắc Từ Liêm'),
(45, 'Hà Nội', 'Ding Tea', '0933092886', 'Restaurant', 0, 'Bắc Từ Liêm '),
(48, 'Hà Nội', 'The Alley', '0933892069', 'Restaurant', NULL, 'Hoàng Mai'),
(47, 'Hà Nội', 'Milk Tea', '0388972165', 'Production', NULL, 'Bắc Từ Liêm'),
(82, 'Hà Nội', 'Cơm Rang', '0933894765', 'Production', NULL, 'Long Biên'),
(50, 'Hà Nội', 'Noodles', '0966792866', 'Production', NULL, 'Long Biên'),
(51, 'Hà Nội', 'The Coffee House', '0933892782', 'Restaurant', 31, 'Ba Đình'),
(52, NULL, 'The Coffee House', '0983902826', 'Restaurant', 32, 'Nam Từ Liêm'),
(53, 'Hà Nội', 'Nhà Hàng Sen', '0989782095', 'Restaurant', 33, 'Bắc Từ Liêm'),
(54, 'Hà Nội', 'Bún Trộn', '0987682934', 'Restaurant', NULL, 'Hai Bà Trưng'),
(55, 'Hà Nội', 'Highlands', '0366982785', 'Restaurant', 35, 'Hoàng Mai'),
(56, 'Hà Nội', 'Meat', '0966782352', 'Production', 36, 'Ba Đình'),
(83, 'Hà Nội', 'Xôi Trứng', '0936894672', 'Restaurant', 0, 'Hai Bà Trưng'),
(58, 'Hà Nội', 'Beer', '0983076982', 'Production', 39, 'Hai Bà Trưng'),
(59, 'Hà Nội', 'Tiệm Trà Chanh', '0398472974', 'Restaurant', 40, 'Hà Đông'),
(60, 'Hà Nội', 'Bún Cá Cay', '0989438902', 'Restaurant', NULL, 'Cầu Giấy'),
(61, 'Hà Nội', 'Cá Ngon', '0987462964', 'Production', 41, 'Ba Đình'),
(62, 'Hà Nội', 'Cộng Coffee', '0975839671', 'Restaurant', 42, 'Tây Hồ'),
(63, 'Hà Nội', 'Cơm Rang', '0947893674', 'Restaurant', NULL, 'Nam Từ Liêm'),
(64, 'Hà Nội', 'Mì Xào Bò', '0957936754', 'Restaurant', 44, 'Hà Đông'),
(65, 'Hà Nội', 'Bánh Đa Trộn', '0378946582', 'Restaurant', 45, 'Cầu Giấy'),
(66, 'Hà Nội', 'Bánh Mì Trứng', '0984573982', 'Product ', 46, 'Hoàn Kiếm'),
(67, 'Hà Nội', 'Bún Riêu ', '0847793825', 'Restaurant', 47, 'Hai Bà Trưng'),
(86, 'Hà Nội', 'Hàng Rong', '0946893772', 'Production', 59, 'Hoàng Mai'),
(69, 'Hà Nội', 'The Coffee House', '0947582935', 'Restaurant', 49, 'Cầu Giấy'),
(70, 'Hà Nội', 'Aha Coffee', '0957939724', 'Restaurant', 50, 'Tây Hồ'),
(71, 'Hà Nội', 'The Alley', '0367892573', 'Restaurant', 51, 'Long Biên'),
(72, 'Hà Nội', 'Bún Hải Sản', '0945783921', 'Production', 52, 'Cầu Giấy'),
(73, 'Hà Nội', 'Trà chanh bụi phố', '0936784924', 'Restaurant', 0, 'Hoàn Kiếm'),
(74, 'Hà Nội', 'Trà Chanh Phố Cổ', '0967893402', 'Restaurant', 53, 'Nam Từ Liêm'),
(75, 'Hà Nội', 'Bún Chả Hồ Gươm', '0939876403', 'Restaurant', 54, 'Ba Đình'),
(76, 'Hà Nội', 'Pizza Hut', '0946783984', 'Restaurant', 0, 'Bắc Từ Liêm'),
(77, 'Hà Nội', 'Water', '0936894672', 'Production', 56, 'Thanh Xuân'),
(85, 'Hà Nội', 'Meat', '0986702693', 'Production', 58, 'Bắc Từ Liêm'),
(87, 'Hà Nội', 'Kichi Kichi', '0933892683', 'Restaurant', 61, 'Hai Bà Trưng'),
(88, 'Hà Nội', 'Beer', '0947793082', 'Production', 0, 'Cầu Giấy'),
(89, 'Hà Nội', 'Aha Coffee', '0948903892', 'Restaurant', NULL, 'Hai Bà Trưng'),
(108, 'Hà Nội', 'Cơm Rang', '0985903902', 'Restaurant', 0, 'Hai Bà Trưng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `roles`
--

INSERT INTO `roles` (`id`, `name`) VALUES
(1, 'ROLE_USER'),
(2, 'ROLE_MANAGER'),
(3, 'ROLE_ADMIN'),
(4, 'ROLE_SUPER_ADMIN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `samples`
--

CREATE TABLE `samples` (
  `id` bigint(20) NOT NULL,
  `end_date` date DEFAULT NULL,
  `laboratory` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `plan_id` bigint(20) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `samples`
--

INSERT INTO `samples` (`id`, `end_date`, `laboratory`, `name`, `plan_id`, `status`) VALUES
(1, '2022-12-10', 'Nhà Máy 1', 'Bánh Mì', 9, 'Đang Kiểm Tra'),
(2, '2021-11-11', 'Nhà Máy 2', 'Mì', 10, 'Đã Hoàn Thành'),
(3, '2022-12-12', 'Nhà Máy 1', 'Thịt Lợn', 20, 'None'),
(4, '2023-02-11', 'Nhà Máy 2', 'Thịt Gà', 21, 'None'),
(5, '2022-06-12', 'Nhà Máy 1', 'Meat', 37, 'None');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` bigint(20) NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `position` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `location`, `password`, `position`, `username`) VALUES
(2, 'Hà Đông', '$2a$10$z/wSOZ6ahqhPKiZ.ontk2ebzb140umChDvzkUPl5pg0z6PzcH6LOO', 'Chuyên Viên', 'haiduy'),
(26, 'Bắc Từ Liêm', '$2a$10$NL0Ndj1haVENh35ehxy5QueRanXgIuXPUsFTUZ9yy4een2kFutoqO', 'Chuyên Viên', 'manhhung'),
(4, 'Toàn Thành Phố', '$2a$10$U3uP37a8/phlll/x8qCQVe.EL17Koomp48QmMVf66JEpauNKpTGVq', 'Quản Lý', 'chudat'),
(14, 'Hoàn Kiếm', '$2a$10$PejovxSy78ybwt0TqvNhru1Q6GWWiDet1yVphqJhzHFJNZvQwzW9i', 'Chuyên Viên', 'minhkhang'),
(29, 'Ba Đình', '$2a$10$s/EZNLBZsJQbtZJqTjbvre2epYfkwRNfHkqwbyeS683XDa1LSuXau', 'Chuyên Viên', 'tranhung'),
(7, 'Cầu Giấy', '$2a$10$ILlhHOWE5ZeFAP4/njXCHODe/FblXSF3w1sGZhPCDK2tzUNMTGf7i', 'Chuyên Viên', 'anhtu'),
(8, 'Hoàng Mai', '$2a$10$110D6amOAelH66uP7RW.PuQr2OR8FdtI0.1blcaEdMGWHedMoZdVe', 'Chuyên Viên', 'phukhang'),
(9, 'Hai Bà Trưng', '$2a$10$AUZGVlbNyz/ksmRjWML6P.03y7VMbPipnZdoPepsb53ipKVQtaBri', 'Chuyên Viên', 'halinh'),
(10, 'Nam Từ Liêm', '$2a$10$gd8/k00ZDLt6RNr.MbsFOuYxlYpqgB22uDcDwApWa/qCukpg3vpue', 'Chuyên Viên', 'hoanganh'),
(11, 'Thanh Xuân', '$2a$10$ckKtRwv6.0Sd4JtbesSmGuvuvRr8xNrdeEyactZvYPOxPVzzcTPb2', 'Chuyên Viên', 'huyjerry'),
(12, 'Long Biên', '$2a$10$t7BVb45wAMuilgRffORPzul0A8dBca95tC3hqiIIXdJdauFeytYfC', 'Chuyên Viên', 'tuanminh'),
(13, 'Đống Đa', '$2a$10$.9z9hpeyPVnQMMyrUErj4.41cajVmjF0RiMe9TPtLpa0GgFdkJ4Qe', 'Chuyên Viên', 'duyanh'),
(16, 'Tây Hồ', '$2a$10$f5T9AyMbNEjBuUxaeCf/w.cf8R6kfQ8q7aviOGByhwi63cowE5.4K', 'Chuyên Viên', 'thienvu'),
(24, 'Bắc Từ Liêm', '$2a$10$i4O8aBoohfwTZ8lDX7fFR.bihug9IyX6rxWibhEh1wWQwjAwAyj5K', 'Chuyên Viên', 'duchiep'),
(25, 'Nam Từ Liêm', '$2a$10$vwpEFK9VFyv3uCJQMA5D6eba3YKKMUowQx15WcB.qNOztcuzPM/Hi', 'Chuyên Viên', 'thaian'),
(30, 'Ba Đình', '$2a$10$G02bP58tiz190c1vHnvkKeDtOKIgEvwD7KbzunsDD34du7L7fxgFa', 'Chuyên Viên', 'huonglan'),
(28, 'Hà Đông', '$2a$10$sP3SiPrrqsdaBz.bBJ72SO4nTYFq86ajkZxseYBSuhLdED2FE6GJC', 'Chuyên Viên', 'maiphuong'),
(31, 'Bắc Từ Liêm', '$2a$10$DAFWi4YkrifVAD87H2JsJuUb51oNEofBZgyAXZ4WnvVsD8fn0vcn2', 'Chuyên Viên', 'ngocanh'),
(32, 'Thanh Xuân', '$2a$10$U/a2k3zvqCWntTcVKNdb4.eTmNvvDNw1w6T.IkKGoSwMc2broE9A.', 'Chuyên Viên', 'duchung');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users_roles`
--

CREATE TABLE `users_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` bigint(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `users_roles`
--

INSERT INTO `users_roles` (`user_id`, `roles_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(4, 4),
(4, 1),
(5, 3),
(13, 2),
(7, 2),
(8, 2),
(10, 2),
(9, 2),
(11, 2),
(12, 2),
(14, 2),
(16, 2),
(24, 2),
(25, 2),
(26, 2),
(27, 2),
(28, 2),
(30, 2),
(31, 2),
(32, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `certificates`
--
ALTER TABLE `certificates`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `plans`
--
ALTER TABLE `plans`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `restaurants`
--
ALTER TABLE `restaurants`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKr3epl46x5c9fgsqfduu5ugtvm` (`cert_id`);

--
-- Chỉ mục cho bảng `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `samples`
--
ALTER TABLE `samples`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users_roles`
--
ALTER TABLE `users_roles`
  ADD KEY `FKa62j07k5mhgifpp955h37ponj` (`roles_id`),
  ADD KEY `FK2o0jvgh89lemvvo17cbqvdxaa` (`user_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `certificates`
--
ALTER TABLE `certificates`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT cho bảng `plans`
--
ALTER TABLE `plans`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `restaurants`
--
ALTER TABLE `restaurants`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT cho bảng `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT cho bảng `samples`
--
ALTER TABLE `samples`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
