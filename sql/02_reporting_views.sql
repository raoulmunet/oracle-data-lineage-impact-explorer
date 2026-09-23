create or replace view v_lineage_objects as
select object_name,
       object_type,
       status,
       created,
       last_ddl_time
from user_objects
where object_type in (
    'TABLE','VIEW','MATERIALIZED VIEW',
    'PACKAGE','PACKAGE BODY',
    'PROCEDURE','FUNCTION','TRIGGER'
);

create or replace view v_lineage_columns as
select table_name,
       column_id,
       column_name,
       data_type,
       data_length,
       data_precision,
       data_scale,
       nullable
from user_tab_columns;
