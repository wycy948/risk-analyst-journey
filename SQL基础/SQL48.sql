-- 工序1 ：链接两表
with
t0 as (
        select
                p.name,
                p.category,
                o.quantity,
                p.product_id
        from products as p
        join orders as o on p.product_id = o.product_id
),
-- 工序2 ：分组求销售总量，窗口函数排序
t1 as (
        select
                category,
                sum(quantity) as total_sales,
                rank() over(partition by category order by sum(quantity) desc, product_id) as category_rank,
                name as product_name
        from t0
        group by product_id, name, category


)
-- 输出
select
        product_name,
        total_sales,
        category_rank
from t1
order by category, total_sales desc;