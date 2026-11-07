-- 工序1 ：去重，过滤
with
t0 as (
        select distinct fdate, user_id
        from tb_dau
        where fdate between '2023-01-01' and '2023-01-31'
),
-- 工序2 ：窗口函数分组（uesr_id)，看前一天lag()，判断日期差，断点标记
t1 as (
        select fdate,
                user_id,
                lag(fdate) over(partition by user_id order by fdate) as prev_fdate,
                sum(if(
                        datediff(fdate, lag(fdate) over(partition by user_id order by fdate) )= 1, 0, 1)
                )over(
                       partition by user_id order by fdate
                ) as consec_id
        from t0
),
-- 工序3 ：group 分组，计数
t2 as (
        select user_id,
                consec_id,
                count(*) as consec_days
        from t1
        group by user_id, consec_id
)
--  group 分组，输出最长连续天数
select user_id,
        max(consec_days) as max_consec_days
from t2
group by user_id;