select E.fname, P.pub_name
from employee E
right join publishers P on E.pub_id = P.pub_id
where E.fname is null;
