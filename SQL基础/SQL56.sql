-- 工序1：行级算积分（单位直接用分钟，整数 DIV 才是纯地板）
WITH
t0 AS (
    SELECT user_id,
           TIMESTAMPDIFF(MINUTE, visit_time, leave_time) DIV 10 AS point_num
    FROM visit_tb
)
-- 工序2：按人求和，输出排序
SELECT user_id,
       SUM(point_num) AS point
FROM t0
GROUP BY user_id
ORDER BY point DESC;