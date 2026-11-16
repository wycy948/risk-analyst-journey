-- 工序1 ：链接两表（外链接）
with
t0 as (
        select
                o.user_id,
                o.order_price,
                u.vip
        from uservip_tb as u
        left join order_tb as o  on o.user_id = u.user_id
),
-- 工序2 ：分组，求和
t1 as (
        select
               vip,
               sum(case           -- 兜底在聚合后   COALESCE(SUM(order_price), 0) AS order_total
                        when order_price is not null then order_price
                        else 0
                        end) as order_total
        from t0
        group by vip
)
-- 工序3 ：输出，排序
select
        vip,
        order_total
from t1
order by order_total desc;