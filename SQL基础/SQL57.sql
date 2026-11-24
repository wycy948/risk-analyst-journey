-- 工序1：分组，求和
with
t0 as (
        select
                user_id,
                sum(order_price) as point_sum
        from order_tb
        where order_price >100
        group by user_id
),
-- 链接两表，相加
t1 as (
        select
                t0.user_id,
                t0.point_sum + u.point as point
        from t0
        join uservip_tb as u on t0.user_id = u.user_id
)
-- 输出
select
        user_id,
        point
from t1
order by point desc;