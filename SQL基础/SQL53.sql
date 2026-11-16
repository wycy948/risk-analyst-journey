-- 工序1 ：去重，提取出22年9月2日下订单的用户
with
t0 as (
        select
                distinct user_id
        from order_tb
        where date(order_time) = '2022-09-02'
),
-- 工序2 ：提取出22年9月2日访问的用户
t1 as (
        select
                user_id
        from visit_tb
        where date(visit_time) = '2022-09-02'
),
-- 工序3 ：链接两表
t2 as (
        select
                t1.user_id
        from t0
        join t1 on t0.user_id = t1.user_id
)
-- 工序4 ：分组，计数,排序，输出

select
        user_id,
        count(*) as visit_nums
from t2
group by user_id
order by visit_nums desc;