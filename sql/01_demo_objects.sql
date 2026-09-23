create table ln_customer (
    customer_id    number primary key,
    customer_name  varchar2(200) not null,
    status_code    varchar2(20) not null,
    created_at     date default sysdate not null
);

create or replace view vw_ln_customer_active as
select customer_id,
       customer_name,
       status_code
from ln_customer
where status_code = 'ACTIVE';

create or replace package pkg_ln_reporting as
    function active_customer_count return number;
end pkg_ln_reporting;
/

create or replace package body pkg_ln_reporting as
    function active_customer_count return number
    is
        l_count number;
    begin
        select count(*)
          into l_count
          from vw_ln_customer_active;

        return l_count;
    end;
end pkg_ln_reporting;
/

insert into ln_customer values (1, 'Alice', 'ACTIVE', sysdate);
insert into ln_customer values (2, 'Bob', 'INACTIVE', sysdate);
commit;
