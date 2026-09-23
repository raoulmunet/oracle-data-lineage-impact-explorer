select *
from v_lineage_columns
where upper(column_name) = upper('STATUS_CODE')
order by table_name, column_id;

select name,
       type,
       line,
       text
from user_source
where upper(text) like '%STATUS_CODE%'
order by name, type, line;
