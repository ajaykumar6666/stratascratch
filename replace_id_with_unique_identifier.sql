# Write your MySQL query statement below


select ei.unique_id,e.name from Employees e left join EmployeeUNI ei
on ei.id=e.id

