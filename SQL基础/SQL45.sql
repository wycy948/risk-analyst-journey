select sum((char_length(course) - char_length(replace(course, ',', '')) ) +1) as staff_nums
from cultivate_tb;
