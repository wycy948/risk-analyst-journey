-- 工序1 ：链接两表
with
t0 as (
        select
                u.user_id,
                u.vip
        from visit_tb as v
        join uservip_tb as u on v.user_id = u.user_id
),
-- 工序2 ：分组，计数
t1 as (
        select
                count(*) as visit_nums,
                count(distinct user_id) as visit_users,
                vip
        from t0
        group by vip

)
-- 工序3 ：输出
select
        vip,
        visit_nums,
        visit_users
from t1
order by visit_nums desc