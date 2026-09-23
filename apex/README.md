# Oracle APEX Build Guide

Suggested application name:

```text
Oracle Lineage Explorer
```

## Page 1 — Object Search

Create an Interactive Report:

```sql
select object_name,
       object_type,
       status,
       created,
       last_ddl_time
from v_lineage_objects
order by object_type, object_name
```

Link `OBJECT_NAME` to Page 2 and pass:

```text
P2_OBJECT_NAME = #OBJECT_NAME#
```

## Page 2 — Downstream Impact

Create page item `P2_OBJECT_NAME`.

```sql
select dependency_depth,
       object_name,
       object_type,
       referenced_name,
       referenced_type,
       dependency_type
from table(
    pkg_lineage.downstream(
        p_object_name => :P2_OBJECT_NAME,
        p_max_depth   => 20
    )
)
order by dependency_depth, object_name
```

## Page 3 — Upstream Dependencies

Create page item `P3_OBJECT_NAME`.

```sql
select dependency_depth,
       object_name,
       object_type,
       referenced_name,
       referenced_type,
       dependency_type
from table(
    pkg_lineage.upstream(
        p_object_name => :P3_OBJECT_NAME,
        p_max_depth   => 20
    )
)
order by dependency_depth, object_name
```

## Page 4 — Object Details

Use `USER_OBJECTS`, `USER_TAB_COLUMNS`, `USER_SOURCE`, and `USER_VIEWS` to show metadata, columns, source code, and view SQL.

## Page 5 — Column Search

Create `P5_COLUMN_NAME` and report from `V_LINEAGE_COLUMNS`.

## Optional graph visualization

For a future enhancement, convert dependency rows into nodes/edges JSON and render them with a JavaScript graph library in a Static Content region.

For the first public version, Interactive Reports keep the project portable and easy to install.
