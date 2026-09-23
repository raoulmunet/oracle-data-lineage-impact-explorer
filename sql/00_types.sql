create or replace type lineage_row_ot as object (
    dependency_depth number,
    object_name      varchar2(128),
    object_type      varchar2(30),
    referenced_name  varchar2(128),
    referenced_type  varchar2(30),
    dependency_type  varchar2(30)
);
/

create or replace type lineage_tab_nt as table of lineage_row_ot;
/
