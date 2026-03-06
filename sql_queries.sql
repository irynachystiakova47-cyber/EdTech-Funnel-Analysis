SELECT *
FROM edtech_dataset ed 
LIMIT 10;

SELECT
AVG(completed )
FROM edtech_dataset

-- Який відсоток завершення у кожній категорії курсів?
SELECT 
course_category 
, COUNT(student_id) AS total_student
, SUM (completed) AS total_completed
, ROUND (SUM (completed) * 100.0 / COUNT(student_id), 2) AS completion_rate_percent
FROM edtech_dataset
GROUP BY course_category ;

--Який середній прогрес і середній час навчання по країнах?
SELECT
country
, ROUND (AVG (progress_percent)) AS avg_progress
, ROUND (AVG (hours_spent)) AS avg_hours_spent
FROM edtech_dataset
GROUP BY 1;

-- Чи студенти, які витрачають більше середнього часу, мають вищий Completion Rate?
SELECT 
SUM (completed) AS completed_students
, COUNT(student_id) AS total_students
, ROUND (SUM (completed) * 100.0 / COUNT(student_id), 2) AS completion_rate_percent
FROM edtech_dataset
WHERE hours_spent > (SELECT AVG(hours_spent)FROM edtech_dataset);

--Студенти, які поставили високий рейтинг, але НЕ завершили курс.
SELECT 
student_id 
, progress_percent 
, hours_spent 
, course_rating 
, completed 
FROM edtech_dataset
WHERE course_rating > 4
AND completed = 0;

