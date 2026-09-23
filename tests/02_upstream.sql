select *
from table(
    pkg_lineage.upstream(
        p_object_name => 'PKG_LN_REPORTING',
        p_max_depth   => 10
    )
)
order by dependency_depth, object_name;
