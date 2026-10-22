-- BLP105 - Odev 1
-- Bolum 4: Gruplama ve NULL

-- Soru 1: Toplam cagri sayisi
SELECT COUNT(*) AS toplam_cagri
FROM llm_calls;
-- Sonuc: Calistirinca kac cagri oldugunu yaz.

-- Soru 2: 2 saniyeden yavas cagrilar
SELECT COUNT(*) AS yavas_cagri
FROM llm_calls
WHERE latency_ms > 2000;
-- Sonuc: Calistirinca kac yavas cagri oldugunu yaz.

-- Soru 3: Toplam maliyet ve token sayisi
SELECT SUM(cost_usd) AS toplam_maliyet,
       SUM(prompt_tokens + completion_tokens) AS toplam_token
FROM llm_calls;
-- Yorum: Toplam maliyet ve token sayisini calistirinca yorumla.

-- Soru 4: Ortalama gecikme
SELECT ROUND(AVG(latency_ms), 1) AS ortalama_gecikme
FROM llm_calls;
-- Yorum: Ortalama gecikmeyi calistirinca yorumla.

-- Soru 5: En hizli ve en yavas cagri
SELECT MIN(latency_ms) AS en_hizli,
       MAX(latency_ms) AS en_yavas
FROM llm_calls;
-- Yorum: En dusuk ve en yuksek gecikmeyi yorumla.

-- Soru 6: Her is turundeki cagri sayisi
SELECT task_type, COUNT(*) AS cagri_sayisi
FROM llm_calls
GROUP BY task_type;
-- Yorum: Her is turunden kac cagri oldugunu yaz.

-- Soru 7: Her modelin cagri sayisi ve toplam maliyeti
SELECT model_name, COUNT(*) AS cagri_sayisi,
       SUM(cost_usd) AS toplam_maliyet
FROM llm_calls
GROUP BY model_name
ORDER BY toplam_maliyet DESC;
-- Yorum: Modelleri toplam maliyetlerine gore karsilastir.

-- Soru 8: Her kullanicinin her is turundeki cagri sayisi
SELECT user_name, task_type, COUNT(*) AS cagri_sayisi
FROM llm_calls
GROUP BY user_name, task_type
ORDER BY user_name, task_type;
-- Yorum: Kullanici ve is turu kombinasyonlarini yorumla.

-- Soru 9: Ikiden fazla cagri alan modeller
SELECT model_name, COUNT(*) AS cagri_sayisi
FROM llm_calls
GROUP BY model_name
HAVING COUNT(*) > 2;
-- Yorum: Ikiden fazla cagri alan modelleri belirt.

-- Soru 10: 500 ms'den yavas cagrilar; en az 2 cagri alan modeller
SELECT model_name, COUNT(*) AS cagri_sayisi,
       AVG(latency_ms) AS ortalama_gecikme
FROM llm_calls
WHERE latency_ms > 500
GROUP BY model_name
HAVING COUNT(*) >= 2;
-- Yorum: WHERE ve HAVING filtrelerinin farkini acikla.

-- Soru 11: NULL avı
SELECT COUNT(*) AS satir_sayisi,
       COUNT(id) AS id_dolu,
       COUNT(model_name) AS model_dolu,
       COUNT(user_name) AS kullanici_dolu,
       COUNT(task_type) AS is_turu_dolu,
       COUNT(latency_ms) AS gecikme_dolu,
       COUNT(cost_usd) AS maliyet_dolu,
       COUNT(prompt_tokens) AS prompt_token_dolu,
       COUNT(completion_tokens) AS completion_token_dolu
FROM llm_calls;
-- Yorum: Her sutundaki eksik veri sayisini toplamdan dolu sayiyi cikararak bul.

-- Soru 12: Faturasi gelmemis cagrilar
SELECT *
FROM llm_calls
WHERE cost_usd IS NULL;
-- Yorum: Faturasi eksik cagri sayisini yaz.

-- Soru 13: Bos maliyetleri atlayarak ve sifir sayarak ortalama
SELECT AVG(cost_usd) AS boslari_atlayan_ortalama,
       AVG(COALESCE(cost_usd, 0)) AS boslari_sifir_sayan_ortalama
FROM llm_calls;
-- Yorum: Iki ortalama arasindaki farki acikla.

-- Soru 14: Gunluk cagri sayisi ve toplam maliyet
SELECT DATE(created_at) AS gun,
       COUNT(*) AS cagri_sayisi,
       SUM(cost_usd) AS toplam_maliyet
FROM llm_calls
GROUP BY DATE(created_at)
ORDER BY gun;
-- Yorum: En cok cagri alan gunu ve maliyeti yorumla.

-- Soru 15: Gecikmeye gore kategori
SELECT
  CASE
    WHEN latency_ms < 1000 THEN 'Hizli'
    WHEN latency_ms < 2500 THEN 'Orta'
    ELSE 'Yavas'
  END AS kategori,
  COUNT(*) AS cagri_sayisi,
  AVG(latency_ms) AS ortalama_gecikme
FROM llm_calls
GROUP BY kategori
ORDER BY kategori;
-- Yorum: Her gecikme kategorisindeki cagri sayisini ve ortalamayi yorumla.