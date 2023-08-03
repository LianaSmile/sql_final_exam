-- CREATE TABLE "faculties" (
--   "id" SERIAL PRIMARY KEY,
--   "title" varchar(100) NOT NULL,
--   "created_at" timestamp,
--   "updated_at" timestamp
-- );

-- CREATE TABLE "years" (
--   "id" SERIAL PRIMARY KEY,
--   "level" integer NOT NULL,
--   "created_at" timestamp,
--   "updated_at" timestamp,
--   check (level BETWEEN 1 AND 4)
-- );

-- CREATE TABLE "deans" (
--   "id" SERIAL PRIMARY KEY,
--   "name" varchar(100) NOT NULL,
--   "last_name" varchar(100) NOT NULL,
--   "faculty_id" integer,
--   "created_at" timestamp,
--   "updated_at" timestamp
-- );

-- CREATE TABLE "lecturers" (
--   "id" SERIAL PRIMARY KEY,
--   "name" varchar(100) NOT NULL,
--   "last_name" varchar(100) NOT NULL,
--   "created_at" timestamp,
--   "updated_at" timestamp
-- );

-- CREATE TABLE "subjects" (
--   "id" SERIAL PRIMARY KEY,
--   "title" varchar(100) NOT NULL,
--   "price_per_hour" numeric NOT NULL,
--   "created_at" timestamp,
--   "updated_at" timestamp
-- );

-- CREATE TABLE "students" (
--   "id" SERIAL PRIMARY KEY,
--   "name" varchar(100) NOT NULL,
--   "last_name" varchar(100) NOT NULL,
--   "created_at" timestamp,
--   "updated_at" timestamp
-- );

-- CREATE TABLE "student_faculty_year" (
--   "id" SERIAL PRIMARY KEY,
--   "year_id" integer,
--   "student_id" integer UNIQUE,
--   "faculty_id" integer,
--   unique(student_id, year_id, faculty_id)
-- );

-- CREATE TABLE "study_plan" (
--   "id" SERIAL PRIMARY KEY,
--   "hours" integer NOT NULL,
--   "subject_id" integer NOT NULL,
--   "lecturer_id" integer,
--   "year_id" integer,
--   "faculty_id" integer
-- );

-- CREATE TABLE "special_courses" (
--   "id" SERIAL PRIMARY KEY,
--   "title" varchar(100) NOT NULL,
--   "cost" numeric NOT NULL,
--   "duration_of_semesters" integer NOT NULL,
--   "created_at" timestamp,
--   "updated_at" timestamp,
--   check (duration_of_semesters IN (1, 2))
-- );

-- CREATE TABLE "student_special_courses" (
--   "id" SERIAL PRIMARY KEY,
--   "special_course_id" integer,
--   "student_id" integer,
--   unique(student_id, special_course_id)
-- );

-- CREATE TABLE "exams" (
--   "id" SERIAL PRIMARY KEY,
--   "student_id" integer,
--   "subject_id" integer,
--   "grade" numeric,
--   unique(student_id, subject_id),
--   "created_at" timestamp
-- );

-- ALTER TABLE "deans" ADD FOREIGN KEY ("faculty_id") REFERENCES "faculties" ("id") ON DELETE CASCADE;

-- ALTER TABLE "student_faculty_year" ADD FOREIGN KEY ("student_id") REFERENCES "students" ("id") ON DELETE CASCADE;

-- ALTER TABLE "student_faculty_year" ADD FOREIGN KEY ("year_id") REFERENCES "years" ("id") ON DELETE CASCADE;

-- ALTER TABLE "student_faculty_year" ADD FOREIGN KEY ("faculty_id") REFERENCES "faculties" ("id") ON DELETE CASCADE;

-- ALTER TABLE "study_plan" ADD FOREIGN KEY ("year_id") REFERENCES "years" ("id") ON DELETE CASCADE;

-- ALTER TABLE "study_plan" ADD FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE;

-- ALTER TABLE "study_plan" ADD FOREIGN KEY ("faculty_id") REFERENCES "faculties" ("id") ON DELETE CASCADE;

-- ALTER TABLE "study_plan" ADD FOREIGN KEY ("lecturer_id") REFERENCES "lecturers" ("id") ON DELETE CASCADE;

-- ALTER TABLE "student_special_courses" ADD FOREIGN KEY ("special_course_id") REFERENCES "special_courses" ("id") ON DELETE CASCADE;

-- ALTER TABLE "student_special_courses" ADD FOREIGN KEY ("student_id") REFERENCES "students" ("id") ON DELETE CASCADE;

-- ALTER TABLE "exams" ADD FOREIGN KEY ("subject_id") REFERENCES "subjects" ("id") ON DELETE CASCADE;

-- ALTER TABLE "exams" ADD FOREIGN KEY ("student_id") REFERENCES "students" ("id") ON DELETE CASCADE;

-- 1
-- INSERT INTO faculties (title, created_at, updated_at)
-- VALUES ('Faculty of Engineering', NOW(), NOW()),
--        ('Faculty of Science', NOW(), NOW()),
--        ('Faculty of Arts', NOW(), NOW());


-- 2
-- INSERT INTO years (level, created_at, updated_at)
-- VALUES (1, NOW(), NOW()),
--        (2, NOW(), NOW()),
--        (3, NOW(), NOW()),
--        (4, NOW(), NOW());


-- 3
-- INSERT INTO students (name, last_name, created_at, updated_at)
-- VALUES ('John', 'Doe', NOW(), NOW()),
--        ('Alice', 'Smith', NOW(), NOW()),
--        ('Michael', 'Johnson', NOW(), NOW()),
--        ('Emma', 'Williams', NOW(), NOW()),
--        ('Daniel', 'Brown', NOW(), NOW()),
-- 	      ('Sophia', 'Miller', NOW(), NOW()),
--        ('Oliver', 'Taylor', NOW(), NOW()),
--        ('Isabella', 'Anderson', NOW(), NOW()),
--        ('Ethan', 'Martinez', NOW(), NOW()),
--        ('Ava', 'Garcia', NOW(), NOW());


-- 4
-- INSERT INTO deans (name, last_name, faculty_id, created_at, updated_at)
-- VALUES ('Dean1', 'Doe', 1, NOW(), NOW()),
--        ('Dean2', 'Smith', 2, NOW(), NOW()),
--        ('Dean3', 'Johnson', 3, NOW(), NOW());

-- 5
-- INSERT INTO lecturers (name, last_name, created_at, updated_at)
-- VALUES ('Lecturer1', 'Miller', NOW(), NOW()),
--        ('Lecturer2', 'Taylor', NOW(), NOW()),
--        ('Lecturer3', 'Anderson', NOW(), NOW());

-- 6
-- INSERT INTO subjects (title, price_per_hour, created_at, updated_at)
-- VALUES ('Mathematics', 15.99, NOW(), NOW()),
--        ('Physics', 12.50, NOW(), NOW()),
--        ('Literature', 10.25, NOW(), NOW());

-- 7
-- INSERT INTO student_faculty_year (year_id, student_id, faculty_id)
-- VALUES (1, 1, 1),
--        (1, 2, 1),
--        (3, 3, 1),
--        (3, 4, 1),
--        (2, 5, 2),
--        (2, 6, 2),
--        (4, 7, 2),
--        (4, 8, 2),
--        (1, 9, 3),
--        (3, 10, 3);


-- 8
-- INSERT INTO study_plan (hours, subject_id, lecturer_id, year_id, faculty_id)
-- VALUES (60, 1, 1, 1, 1),
--        (50, 2, 2, 1, 1),
--        (40, 3, 3, 3, 1),
--        (70, 1, 1, 3, 1),
--        (55, 2, 2, 2, 2),
--        (45, 3, 3, 2, 2),
-- 	   (50, 2, 2, 4, 2),
--        (40, 3, 3, 4, 2),
--        (70, 1, 1, 1, 3),
--        (55, 2, 2, 1, 3),
--        (45, 3, 3, 3, 3);

-- 9
-- INSERT INTO special_courses (title, cost, duration_of_semesters, created_at, updated_at)
-- VALUES ('Advanced Mathematics', 500.00, 2, NOW(), NOW()),
--        ('Computer Programming', 400.00, 1, NOW(), NOW()),
--        ('Creative Writing', 300.00, 2, NOW(), NOW());

-- 10
-- INSERT INTO student_special_courses (special_course_id, student_id)
-- VALUES (1, 1),
--        (1, 2),
--        (1, 3),
--        (2, 1),
--        (2, 4),
--        (3, 5);

-- 11
-- INSERT INTO exams (student_id, subject_id, grade, created_at)
-- VALUES (1, 1, 85, '2023-08-03 09:00:00'),
--        (1, 2, 76, '2023-08-04 10:30:00'),
--        (2, 1, 92, '2023-08-03 09:00:00'),
--        (2, 3, 88, '2023-08-04 10:30:00'),
--        (3, 1, 78, '2023-08-03 09:00:00'),
--        (3, 2, 85, '2023-08-04 10:30:00'),
--        (4, 1, 95, '2023-08-03 09:00:00'),
--        (4, 3, 92, '2023-08-04 10:30:00'),
--        (5, 2, 80, '2023-08-03 09:00:00'),
--        (5, 3, 72, '2023-08-04 10:30:00'), 
-- 	      (6, 1, 88, '2023-08-03 09:00:00'),
--        (6, 2, 75, '2023-08-04 10:30:00'),
--        (7, 1, 90, '2023-08-03 09:00:00'),
--        (7, 3, 84, '2023-08-04 10:30:00'),
--        (8, 1, 72, '2023-08-03 09:00:00'),
--        (8, 2, 89, '2023-08-04 10:30:00'),
--        (9, 1, 85, '2023-08-03 09:00:00'),
--        (9, 3, 78, '2023-08-04 10:30:00'),
--        (10, 2, 95, '2023-08-03 09:00:00'),
--        (10, 3, 88, '2023-08-04 10:30:00');

-- 1) Դուրս բերել յուրաքանչուր ֆակուլտետի յուրաքանչուր կուրսի 1 տարվա վարձավճարը:

-- SELECT study_plan.year_id, study_plan.faculty_id, SUM(study_plan.hours * subjects.price_per_hour) AS year_fee
-- FROM study_plan
-- LEFT JOIN subjects ON subjects.id = study_plan.subject_id
-- LEFT JOIN years ON years.id = study_plan.year_id
-- LEFT JOIN faculties ON faculties.id = study_plan.faculty_id
-- GROUP BY (study_plan.year_id, study_plan.faculty_id)
-- ORDER BY faculty_id;


-- 2) Դուրս բերել 2020-2021 ուս. տարում համալսարանի ստացած եկամուտը(ներառյալ ծրագրերից ստացված եկամուտները)

-- WITH cost_per_course as (
-- 	SELECT study_plan.year_id, study_plan.faculty_id, SUM(study_plan.hours * subjects.price_per_hour) AS year_fee
-- 	FROM study_plan
-- 	LEFT JOIN subjects ON subjects.id = study_plan.subject_id
-- 	LEFT JOIN years ON years.id = study_plan.year_id
-- 	LEFT JOIN faculties ON faculties.id = study_plan.faculty_id
-- 	GROUP BY (study_plan.year_id, study_plan.faculty_id)
-- ), 
-- count_per_course as (
-- 	SELECT COUNT(*), year_id, faculty_id
-- 	FROM student_faculty_year
-- 	GROUP BY (year_id, faculty_id)
-- ), 
-- all_sums as (
-- 	SELECT SUM(year_fee * count)
-- 	FROM cost_per_course as cost
-- 	JOIN count_per_course as count ON cost.year_id = count.year_id and cost.faculty_id = count.faculty_id
-- 	GROUP BY (cost.year_id, cost.faculty_id)
-- ), 
-- special_all_sums as (
-- 	SELECT COUNT(*) * cost as sum
-- 	FROM special_courses
-- 	JOIN student_special_courses ON student_special_courses.special_course_id = special_courses.id
-- 	GROUP BY special_courses.id
-- )

-- SELECT (SELECT SUM(sum) FROM all_sums) + (SELECT SUM(sum) FROM special_all_sums);

-- 3) Դուրս բերել քննության արդյունքների ամփոփ հաշվետվություն(ուսանող, կուրս, ֆակուլտետ, առարկա, գնահատական, 
--    մեկնաբանություն՝ 8-ից բարձր ստացողների համար «բավարար» 8-ից ցածր ստացողների համար «լիկվիդ»):

-- SELECT st.id, st.name, st.last_name, sfy.year_id, sfy.faculty_id, sp.subject_id, exams.grade,
-- CASE
-- 	WHEN exams.grade > 80 THEN 'Pass'
-- 	ELSE 'Not Pass'
-- END as comment
-- FROM student_faculty_year as sfy
-- JOIN study_plan as sp ON sp.year_id = sfy.year_id and sp.faculty_id = sfy.faculty_id
-- JOIN exams ON exams.student_id = sfy.student_id and exams.subject_id = sp.subject_id
-- JOIN students as st ON sfy.student_id = st.id
-- ORDER BY sfy.student_id;

-- 4) Դուրս բերել քննությունները հաջող հանձնած ուսանողների ամփոփ հաշվետվություն 
--    (ուսանող, կուրս, ֆակուլտետ, միջին գնահատական, մեկնաբանություն՝  ավարտելու կամ հաջորդ կուրս փոխադրվելու մասին):

-- WITH students_with_grades as (
-- 	SELECT st.id, st.name, st.last_name, sfy.year_id, sfy.faculty_id, sp.subject_id, exams.grade,
-- 	CASE
-- 		WHEN exams.grade > 80 THEN 'Pass'
-- 		ELSE 'Not Pass'
-- 	END as comment
-- 	FROM student_faculty_year as sfy
-- 	JOIN study_plan as sp ON sp.year_id = sfy.year_id and sp.faculty_id = sfy.faculty_id
-- 	JOIN exams ON exams.student_id = sfy.student_id and exams.subject_id = sp.subject_id
-- 	JOIN students as st ON sfy.student_id = st.id
-- ), 
-- average_grades as (
-- 	SELECT id, ROUND(AVG(grade), 2) as average_grade
-- 	FROM students_with_grades
-- 	GROUP BY id
-- )

-- SELECT st.id, st.name, st.last_name, sfy.year_id, sfy.faculty_id, average_grade, 
-- CASE
-- 	WHEN sfy.year_id < 4 THEN 'Next Level'
-- 	ELSE 'Graduate'
-- END as comment
-- FROM average_grades as ag
-- JOIN students as st ON st.id = ag.id
-- JOIN student_faculty_year as sfy ON sfy.student_id = ag.id
-- WHERE average_grade > 80;


-- 5) Մեկ աղյուսակում դուրս բերել յուրաքանչուր կուրսի լավագույն և վատագույն ուսանողներին (ուսանող, ֆակուլտետ, միջին գնահատական)


-- WITH students_with_grades as (
-- 	SELECT st.id, st.name, st.last_name, sfy.year_id, sfy.faculty_id, sp.subject_id, exams.grade,
-- 	CASE
-- 		WHEN exams.grade > 80 THEN 'Pass'
-- 		ELSE 'Not Pass'
-- 	END as comment
-- 	FROM student_faculty_year as sfy
-- 	JOIN study_plan as sp ON sp.year_id = sfy.year_id and sp.faculty_id = sfy.faculty_id
-- 	JOIN exams ON exams.student_id = sfy.student_id and exams.subject_id = sp.subject_id
-- 	JOIN students as st ON sfy.student_id = st.id
-- ), 
-- average_grades as (
-- 	SELECT id, ROUND(AVG(grade), 2) as average_grade
-- 	FROM students_with_grades
-- 	GROUP BY id
-- ), 
-- min_max as (
-- 	SELECT st.id, st.name, st.last_name, sfy.year_id, sfy.faculty_id, average_grade, 
-- CASE
-- 	WHEN sfy.year_id < 4 THEN 'Next Level'
-- 		ELSE 'Graduate'
-- 	END as comment
-- 	FROM average_grades as ag
-- 	JOIN students as st ON st.id = ag.id
-- 	JOIN student_faculty_year as sfy ON sfy.student_id = ag.id
-- 	WHERE average_grade > 80
-- ), 
-- final_min_max as (
-- 	SELECT year_id, faculty_id, MIN(average_grade) as min_grade, MAX(average_grade) as max_grade
-- 	FROM min_max
-- 	GROUP BY (year_id, faculty_id)
-- )

-- SELECT st.id, st.name, st.last_name, sfy.faculty_id, ag.average_grade
-- FROM average_grades as ag
-- JOIN students as st ON ag.id = st.id
-- JOIN student_faculty_year as sfy ON ag.id = sfy.id
-- JOIN final_min_max as fmm on fmm.year_id = sfy.year_id and fmm.faculty_id = sfy.faculty_id 
-- and (fmm.min_grade = ag.average_grade or fmm.max_grade = ag.average_grade)
 

-- 6) Դուրս բերել ուսանողներին և իրենց կատարած վճարները(ուսանող, ուսման մեկ տարվա վճար, ծրագրերի համար վճար, ընդհանուր վճար)

-- WITH cost_per_course as (
-- 	SELECT study_plan.year_id, study_plan.faculty_id, SUM(study_plan.hours * subjects.price_per_hour) AS year_fee
-- 	FROM study_plan
-- 	LEFT JOIN subjects ON subjects.id = study_plan.subject_id
-- 	LEFT JOIN years ON years.id = study_plan.year_id
-- 	LEFT JOIN faculties ON faculties.id = study_plan.faculty_id
-- 	GROUP BY (study_plan.year_id, study_plan.faculty_id)
-- 	ORDER BY faculty_id
-- ), 
-- special_course_fee as (
-- 	SELECT SUM(cost) as total_cost, student_id
-- 	FROM student_special_courses as ssc
-- 	LEFT JOIN special_courses ON ssc.special_course_id = special_courses.id
-- 	GROUP BY student_id
-- )

-- SELECT st.id, st.name, st.last_name, year_fee, total_cost as special_course_cost, 
-- CASE 
-- 	WHEN total_cost is NULL THEN year_fee 
-- 	ELSE year_fee + total_cost 
-- END as total_fee
-- FROM cost_per_course as cpc
-- LEFT JOIN student_faculty_year as sfy ON cpc.year_id = sfy.year_id and cpc.faculty_id = sfy.faculty_id
-- LEFT JOIN special_course_fee as scf ON scf.student_id = sfy.student_id
-- LEFT JOIN students as st ON st.id = sfy.id;





