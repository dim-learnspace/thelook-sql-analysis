-- QUERY ANALISIS

-- 1. Analisis terkait dengan traffic source. melalui apa user mengakses TheLook E-commerce
      SELECT
        traffic_source,
        COUNT(id) AS jumlah_user
      FROM bigquery-public-data.thelook_ecommerce.users
      GROUP BY traffic_source
      ORDER BY jumlah_user DESC;
-- Temuan
-- Berdasarkan data pertanggal 11 November 2026, Channel Traffic terbanyak melalui "Search" sebanyak 69956
-- Sedangkan yang paling sedikit dengan jumlah user sebanyak 3979 adalah "Display"

-- 2. Pendapatan pernegara dan departemen dan diurutkan dari yang paling tinggi

SELECT
  u.country,
  p.department,
  ROUND(SUM(oi.sale_price), 2) AS pendapatan
FROM 
  `bigquery-public-data.thelook_ecommerce.order_items` AS oi
JOIN 
  `bigquery-public-data.thelook_ecommerce.products` AS p
  ON p.id = oi.product_id
JOIN 
  `bigquery-public-data.thelook_ecommerce.users` AS u
  ON oi.user_id = u.id
WHERE oi.status = 'Complete'
GROUP BY u.country, p.department
ORDER BY pendapatan DESC
LIMIT 5;

-- Temuan
-- Department dan Negara yang memberikan pendapatan tertinggi dipegang oleh China bak untuk department 'Men' dan 'Women' yang kemudian disusul oleh united states
-- Sedangkan Brasil berapa di bagian Top 5 Terbawah dengan department Men
