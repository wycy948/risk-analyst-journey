-- 工序1 ：链接两张表，过滤tom，2023年
with
t0 as (
        select t.t_time,
                t.t_amount
        from trade as t
        left join customer as c on t.t_cus = c.c_id
        where c.c_name = 'Tom'
        and year(t.t_time) = 2023
        and t.t_type = 1
),
-- 工序2 ：转换时间格式
t1 as (
        select date_format(t_time, '%Y-%m') as time_1,
                t_amount
        from t0
),
-- 工序3 ：按月份分组，求和sum
t2 as (
        select time_1,
                round(sum(t_amount), 1) as total
        from t1
        group by time_1
)
-- 工序3 ：输出
select time_1 as time,
        total
from t2
order by  time;