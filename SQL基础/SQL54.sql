-- 工序1 ：算每天下单人数
with
t0 as (
        select
                date(order_time) as time_1,
                count(distinct user_id) as order_nums
        from order_tb
        group by date(order_time)
),
-- 工序2 ：算每天访问人数
t1 as (
        select
                date(visit_time) as time_2,
                count(distinct user_id) as visit_nums
        from visit_tb
        group by date(visit_time)
),
-- 链接两表
t2 as (
        select
                order_nums,
                visit_nums,
                time_2 as 'date'
        from t1
        left join t0 on time_1 = time_2      -- 选用left join 而不是join
                                             -- 可能有某一天访问了但是无一人下单，链接完输出null,使用coalesce
)
-- 计算转化率，排序，输出
select
        date,
        concat(round(coalesce(order_nums, 0)*100/visit_nums, 1), '%') as cr
from t2
order by date;