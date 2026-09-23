select *
from table(
    pkg_lineage.downstream(
        p_object_name => 'LN_CUSTOMER',
        p_max_depth   => 10
    )
)
order by dependency_depth, object_name;
