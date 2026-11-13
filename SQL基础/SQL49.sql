-- 工序1：链接两表补岗位，行级算出每人工时（小时）
WITH
t0 AS (
    SELECT s.post,
           TIMESTAMPDIFF(SECOND, a.first_clockin, a.last_clockin) / 3600 AS hours
    FROM staff_tb AS s
    JOIN attendent_tb AS a
      ON s.staff_id = a.staff_id
),
-- 工序2：按岗位求平均（NULL 行被 AVG 自动跳过）
t1 AS (
    SELECT post,
           AVG(hours) AS avg_hours
    FROM t0
    GROUP BY post
)
-- 工序3：保留3位小数 + 降序输出
SELECT post,
       ROUND(avg_hours, 3) AS work_hours
FROM t1
ORDER BY work_hours DESC;
