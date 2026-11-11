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

