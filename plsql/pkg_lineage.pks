create or replace package pkg_lineage as

    function downstream(
        p_object_name in varchar2,
        p_max_depth   in number default 10
    ) return lineage_tab_nt pipelined;

    function upstream(
        p_object_name in varchar2,
        p_max_depth   in number default 10
    ) return lineage_tab_nt pipelined;

end pkg_lineage;
/
