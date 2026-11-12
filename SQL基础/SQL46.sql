select s.staff_id,
        s.staff_name

from staff_tb as s
inner join cultivate_tb as c on s.staff_id = c.staff_id
where course like '%course3%'
order by s.staff_id;