with
t0 as (
    select l.customer_id,
           l.overdue_days,
           c.pay_ability
    from loan_tb as l
    left join customer_tb as c on l.customer_id = c.customer_id
),
t1 as (
    select pay_ability,
           count(distinct case when overdue_days is not null
                               then customer_id end) * 100.0
           / count(distinct customer_id) as ratio_num    -- 纯数值，负责排序
    from t0
    group by pay_ability
)
select pay_ability,
       concat(round(ratio_num, 1), '%') as overdue_ratio  -- 最后才格式化
from t1                                                 -- 不再需要 group by
order by ratio_num desc;
