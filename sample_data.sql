INSERT INTO users VALUES
(1, '2024-12-01', 'IN'),
(2, '2024-12-02', 'IN'),
(3, '2024-12-10', 'US'),
(4, '2024-12-15', 'US'),
(5, '2025-01-01', 'IN'),
(6, '2025-01-03', 'IN');

INSERT INTO events VALUES
-- User 1 (desktop - success)
(1, 1, 'visit', '2025-01-01 10:00:00', 'desktop'),
(2, 1, 'add_to_cart', '2025-01-01 10:05:00', 'desktop'),
(3, 1, 'checkout', '2025-01-01 10:10:00', 'desktop'),
(4, 1, 'purchase', '2025-01-01 10:12:00', 'desktop'),

-- User 2 (mobile - success)
(5, 2, 'visit', '2025-01-01 11:00:00', 'mobile'),
(6, 2, 'add_to_cart', '2025-01-01 11:06:00', 'mobile'),
(7, 2, 'checkout', '2025-01-01 11:09:00', 'mobile'),
(8, 2, 'purchase', '2025-01-01 11:11:00', 'mobile');

INSERT INTO events VALUES
-- User 3 (desktop - still fine)
(9, 3, 'visit', '2025-01-08 14:00:00', 'desktop'),
(10, 3, 'add_to_cart', '2025-01-08 14:05:00', 'desktop'),
(11, 3, 'checkout', '2025-01-08 14:10:00', 'desktop'),
(12, 3, 'purchase', '2025-01-08 14:12:00', 'desktop'),

-- User 4 (mobile - failure)
(13, 4, 'visit', '2025-01-08 15:00:00', 'mobile'),
(14, 4, 'add_to_cart', '2025-01-08 15:05:00', 'mobile'),
(15, 4, 'checkout', '2025-01-08 15:10:00', 'mobile'),
(16, 4, 'payment_failed', '2025-01-08 15:11:00', 'mobile'),

-- User 5 (mobile - failure)
(17, 5, 'visit', '2025-01-09 18:00:00', 'mobile'),
(18, 5, 'add_to_cart', '2025-01-09 18:04:00', 'mobile'),
(19, 5, 'checkout', '2025-01-09 18:08:00', 'mobile'),
(20, 5, 'payment_failed', '2025-01-09 18:09:00', 'mobile');
