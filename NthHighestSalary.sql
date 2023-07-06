CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
  RETURN (
      # Write your MySQL query statement below.
      select a.salary from(
        select salary, dense_rank() over (order by salary desc) "rank_sal" from
        Employee 
      ) a where a.rank_sal=N limit 1
  );
END