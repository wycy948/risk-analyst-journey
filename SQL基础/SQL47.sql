-- 工序1：链接两表，双条件筛出"准确"推荐记录（用户匹配 + 标签一致）
WITH
t0 AS (
    SELECT r.rec_user,
           u.score
    FROM recommend_tb AS r
    JOIN user_action_tb AS u                     -- inner join，语义诚实
      ON r.rec_user = u.user_id
     AND r.rec_info_l = u.hobby_l                -- 标签一致才算准确
),
-- 工序2：按用户去重（一次及以上准确 → 归为准确，一人一行）
t1 AS (
    SELECT DISTINCT rec_user,
                    score
    FROM t0
)
-- 工序3：准确用户平均评分，保留3位小数
SELECT ROUND(AVG(score), 3) AS avg_score
FROM t1;

