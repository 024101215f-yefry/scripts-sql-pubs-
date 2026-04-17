-- 9. LEFT JOIN: Títulos sin ventas 
select T.title, S.qty
from titles T
left join sales S on T.title_id = S.title_id
where S.qty is null;
