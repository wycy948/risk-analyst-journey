-- 工序1：dep1 员工关联薪资，留数值列（不去重：JOIN 粒度一人一行）
WITH
t0 AS (
    SELECT s.staff_id,
           s.staff_name,
           s2.dock_salary,
           s2.normal_salary
    FROM staff_tb AS s
    JOIN salary_tb AS s2 ON s.staff_id = s2.staff_id   -- INNER：无薪资不参与占比
    WHERE s.department = 'dep1'
),
-- 工序2：只算数值占比，格式化留到输出层
t1 AS (
    SELECT staff_id,
           staff_name,
           dock_salary * 100 / normal_salary AS dock_ratio_num   -- 数值，排序靠它
    FROM t0
)
-- 工序3：输出层才拼 '%'，按数值降序
SELECT staff_id,
       staff_name,
       CONCAT(ROUND(dock_ratio_num, 1), '%') AS dock_ratio
FROM t1
ORDER BY dock_ratio_num DESC;      -- 排数值，不排字符串
