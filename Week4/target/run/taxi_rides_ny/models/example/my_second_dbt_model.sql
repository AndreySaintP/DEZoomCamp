

  create or replace view `glass-arcade-339214`.`dbt_andrey`.`my_second_dbt_model`
  OPTIONS()
  as -- Use the `ref` function to select from other models

select *
from `glass-arcade-339214`.`dbt_andrey`.`my_first_dbt_model`
where id = 1;

