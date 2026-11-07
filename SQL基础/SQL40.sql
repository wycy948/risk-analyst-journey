-- 第一步，关联三张表，过滤出18-28岁，2022年，周杰伦的歌
with
log as (
        select p.fdate,
                p.song_id
        from play_log as p
        inner join song_info as s on p.song_id = s.song_id
        inner join user_info as u on p.user_id = u.user_id
        where u.age between 18 and 25
                and year(p.fdate) = 2022
                and s.singer_name = '周杰伦'

),
-- 第二步，提取出月份，播放次数，给播放次数排序
ranked as (
        select month(fdate) as month,
                song_id,
                count(*) as play_pv,
                row_number() over (partition by month(fdate) order by count(*) desc,song_id ) as ranking
        from log
        group by month(fdate), song_id
)
-- 第三步，整理输出表格，关联歌曲名，取每月前三名，给最后的表格排序
select r.month,
        r.ranking,
        s.song_name,
        r.play_pv
from ranked as r
inner join song_info as s on s.song_id = r.song_id
where r.ranking <= 3
order by r.month, r.ranking;