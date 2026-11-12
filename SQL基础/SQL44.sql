-- 工序1：链接两表补房间类型，算出每条入住的天数
with
t0 as (
    select c.user_id,
           c.room_id,
           g.room_type,
           datediff(c.checkout_time, c.checkin_time) as days   -- 直接用日期列，不转字符串
    from checkin_tb as c
    join guestroom_tb as g on c.room_id = g.room_id            -- inner join 语义更准
    where c.checkin_time >= '2022-06-12'                       -- 列不套函数，可走索引
),
-- 工序2：过滤多晚客户（引用t0已造好的days列，无需重复表达式）
t1 as (
    select user_id,
           room_id,
           room_type,
           days
    from t0
    where days >= 2
)
-- 工序3：输出，排序只在最终层
select user_id,
       room_id,
       room_type,
       days
from t1
order by days, room_id, user_id desc;
