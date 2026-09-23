begin execute immediate 'drop package pkg_lineage'; exception when others then null; end;
/
begin execute immediate 'drop view v_lineage_columns'; exception when others then null; end;
/
begin execute immediate 'drop view v_lineage_objects'; exception when others then null; end;
/
begin execute immediate 'drop package pkg_ln_reporting'; exception when others then null; end;
/
begin execute immediate 'drop view vw_ln_customer_active'; exception when others then null; end;
/
begin execute immediate 'drop table ln_customer purge'; exception when others then null; end;
/
begin execute immediate 'drop type lineage_tab_nt force'; exception when others then null; end;
/
begin execute immediate 'drop type lineage_row_ot force'; exception when others then null; end;
/
