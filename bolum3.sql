-- Soru 1: Butun cagrilarin id ve model adini listele
SELECT id, model_name
FROM llm_calls;
-- Gercek satir sayisini calistirinca yaz.

-- Soru 2: Model adi ve toplam token
SELECT model_name AS model,
       prompt_tokens + completion_tokens AS total_tokens
FROM llm_calls;
-- Gercek satir sayisini calistirinca yaz.

-- Soru 3: Gecikmesi 2 saniyeyi asan cagrilar
SELECT *
FROM llm_calls
WHERE latency_ms > 2000;
-- Gercek satir sayisini calistirinca yaz.

-- Soru 4: Ece'nin yaptigi cagrilar
SELECT *
FROM llm_calls
WHERE user_name = 'Ece';
-- Gercek satir sayisini calistirinca yaz.

-- Soru 5: Sohbet disindaki cagrilar
SELECT *
FROM llm_calls
WHERE task_type <> 'chat';
-- Gercek satir sayisini calistirinca yaz.

-- Soru 6: Claude modellerinde 1 saniyeden yavas cagrilar
SELECT *
FROM llm_calls
WHERE model_name LIKE 'claude%'
  AND latency_ms > 1000;
-- Gercek satir sayisini calistirinca yaz.

-- Soru 7: Kod veya ceviri, maliyet 0.01 dolardan fazla
SELECT *
FROM llm_calls
WHERE (task_type = 'code' OR task_type = 'translation')
  AND cost_usd > 0.01;
-- Gercek satir sayisini calistirinca yaz.

-- Soru 8: Gecikmesi 500-1500 ms arasinda olanlar
SELECT *
FROM llm_calls
WHERE latency_ms BETWEEN 500 AND 1500;
-- Gercek satir sayisini calistirinca yaz.

-- Soru 9: GPT-4o ve GPT-4o-mini cagrilari
SELECT *
FROM llm_calls
WHERE model_name IN ('gpt-4o', 'gpt-4o-mini');
-- Gercek satir sayisini calistirinca yaz.

-- Soru 10: Model adinda mini gecen cagrilar
SELECT *
FROM llm_calls
WHERE model_name ILIKE '%mini%';
-- Gercek satir sayisini calistirinca yaz.

-- Soru 11: Kullaniciya, sonra maliyete gore sirala
SELECT *
FROM llm_calls
ORDER BY user_name ASC, cost_usd DESC;
-- Gercek satir sayisini calistirinca yaz.

-- Soru 12: En pahali 3 cagri
SELECT *
FROM llm_calls
ORDER BY cost_usd DESC
LIMIT 3;
-- 3 satir beklenir.

-- Soru 13: Tekrarsiz is turleri
SELECT DISTINCT task_type
FROM llm_calls;
-- Gercek satir sayisini calistirinca yaz.

-- Soru 14: Tekrarsiz kullanicilari Turkce alfabe sirasinda listele
SELECT DISTINCT user_name
FROM llm_calls
ORDER BY user_name COLLATE "tr-TR-x-icu";
-- Gercek satir sayisini calistirinca yaz.

-- Soru 15: 14 Ekim'den sonra, 1 saniyeden yavas cagrilar
SELECT id, model_name, latency_ms
FROM llm_calls
WHERE created_at > DATE '2026-10-14'
  AND latency_ms > 1000
ORDER BY latency_ms DESC;
-- Gercek satir sayisini calistirinca yaz.