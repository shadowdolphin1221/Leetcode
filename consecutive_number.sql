Write a SQL query to find all numbers that appear at least three times consecutively.

+----+-----+
| Id | Num |
+----+-----+
| 1  |  1  |
| 2  |  1  |
| 3  |  1  |
| 4  |  2  |
| 5  |  1  |
| 6  |  2  |
| 7  |  2  |
+----+-----+
For example, given the above Logs table, 1 is the only number that appears consecutively for at least three times.

+-----------------+
| ConsecutiveNums |
+-----------------+
| 1               |
+-----------------+

select distinct(a.Num) as ConsecutiveNums from
(
select Id, Num, lag(Num, 1) over (Order by Id) as lag_last1, lag(Num, 2) over (Order by Id) as lag_last2 From Logs) a
where a.Num = lag_last1 and lag_last1 = lag_last2

