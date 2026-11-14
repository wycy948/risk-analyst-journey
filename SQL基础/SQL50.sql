-- 工序1 ：链接两表，去重
with
t0 as (
        select
                distinct l.user_id, date(l.log_time) as log_time_2
        from register_tb as r
        join login_tb as l on r.user_id = l.user_id
),
-- 工序2 ：窗口函数排序
t1 as (
        select
                user_id,
                log_time_2,
                row_number() over(partition by user_id order by log_time_2) as ranks
        from t0
),
-- 工序3 ：断点标记
t2 as (
        select
                date_sub(log_time_2, interval ranks day) as break_id,
                user_id
        from t1
),
-- 工序4 ：分组计数，过滤>=3day
t3 as (
        select
                user_id,
                break_id,
                count(*) as days
        from t2
        group by user_id, break_id
        having count(*) >=3
)
-- 工序5 ：输出
select
        user_id
from t3
order by user_id;