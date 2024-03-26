-- 1280. 学生们参加各科测试的次数

--输入：
--Students table:
--+------------+--------------+
--| student_id | student_name |
--+------------+--------------+
--| 1          | Alice        |
--| 2          | Bob          |
--| 13         | John         |
--| 6          | Alex         |
--+------------+--------------+
--Subjects table:
--+--------------+
--| subject_name |
--+--------------+
--| Math         |
--| Physics      |
--| Programming  |
--+--------------+
--Examinations table:
--+------------+--------------+
--| student_id | subject_name |
--+------------+--------------+
--| 1          | Math         |
--| 1          | Physics      |
--| 1          | Programming  |
--| 2          | Programming  |
--| 1          | Physics      |
--| 1          | Math         |
--| 13         | Math         |
--| 13         | Programming  |
--| 13         | Physics      |
--| 2          | Math         |
--| 1          | Math         |
--+------------+--------------+
--输出：
--+------------+--------------+--------------+----------------+
--| student_id | student_name | subject_name | attended_exams |
--+------------+--------------+--------------+----------------+
--| 1          | Alice        | Math         | 3              |
--| 1          | Alice        | Physics      | 2              |
--| 1          | Alice        | Programming  | 1              |
--| 2          | Bob          | Math         | 1              |
--| 2          | Bob          | Physics      | 0              |
--| 2          | Bob          | Programming  | 1              |
--| 6          | Alex         | Math         | 0              |
--| 6          | Alex         | Physics      | 0              |
--| 6          | Alex         | Programming  | 0              |
--| 13         | John         | Math         | 1              |
--| 13         | John         | Physics      | 1              |
--| 13         | John         | Programming  | 1              |
--+------------+--------------+--------------+----------------+
--解释：
--结果表需包含所有学生和所有科目（即便测试次数为0）：
--Alice 参加了 3 次数学测试, 2 次物理测试，以及 1 次编程测试；
--Bob 参加了 1 次数学测试, 1 次编程测试，没有参加物理测试；
--Alex 啥测试都没参加；
--John  参加了数学、物理、编程测试各 1 次。

SELECT s.student_id, s.student_name, sub.subject_name, COUNT(e.subject_name) AS attended_exams
FROM Students AS s CROSS JOIN Subjects AS sub 
LEFT JOIN Examinations AS e
ON s.student_id = e.student_id AND sub.subject_name = e.subject_name
GROUP BY s.student_name, sub.subject_name
ORDER BY s.student_id, sub.subject_name
;
