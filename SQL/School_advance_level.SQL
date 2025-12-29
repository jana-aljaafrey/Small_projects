/* THis is end-of-course project for the SQL fundamentals course at Satr Academy, 
As a continuation of the previous project, I added relationships between the
tables using foreign keys, and I also created and worked with views, indexes,
references, and joins.

1. Create a relationship between the teachers and students tables (a teacher teaches more than one student, and a student is taught by more than one teacher).
2. Create a relationship between the subjects and teachers tables (each teacher teaches only one subject, and each subject is taught by more than one teacher).
3. Create a relationship between the subjects and students tables (a student studies more than one subject, and a subject is studied by more than one student).
4. Create and call a procedure named student_info that displays students’ names and subjects and includes all shared data between the subjects and students tables.
5. Create, display, and delete a view named teacher_info that contains the teacher’s name, office number, and the subject name being taught.
6. Create, display, and delete an index to support searching/sorting students’ names alphabetically.
Note: A many-to-many relationship results in creating a new junction table. */

use school;


-- 1) -----------------------------------------  Create a relationship between the teachers and students tables  ------------------------------------ 


create table teaching (
student_id int not null,
teacher_id int not null,
foreign key (student_id) references students(student_id),
foreign key (teacher_id) references teachers(teacher_id)
);

insert into teaching (student_id, teacher_id) values
(1,2), (2,3), (3,4), (4,5),(5,6), (6,7), (7,8), (8,9), (9,10), (10,1),
(1,2), (2,3), (3,4), (4,5),(5,6), (6,7), (7,8), (8,9), (9,10), (10,1),
(1,2), (2,3), (3,4), (4,5),(5,6), (6,7), (7,8), (8,9), (9,10), (10,1);

select * from teaching;



-- 2) ----------------------------------------- Create a relationship between the subjects and teachers tables  ------------------------------------------------------------

alter table teachers
add column subject_id int,
add foreign key (subject_id) references subjects(subject_id);

update teachers
set subject_id = case
     when teacher_id = 1 or  teacher_id = 7 then 1
     when teacher_id = 2 or  teacher_id = 8 then 2
     when teacher_id = 3 or  teacher_id = 9 then 3
     when teacher_id = 4 or  teacher_id = 10 then 4
     when teacher_id = 5  then 5
	 when teacher_id = 6  then 6
     else null
    End;
     


-- 3) ----------------------------------------- Create a relationship between the subjects and students tables -----------------------------------


create table studying (
student_id int,
subject_id int,
foreign key (student_id) references students(student_id),
foreign key (subject_id) references subjects(subject_id)
);

insert into studying (student_id, subject_id) values
(1,2), (2,3), (3,4), (4,5), (5,6), (6,1), (7,2), (8,3), (9,4), (10,5), (11,6), (12,1), 
(13,2), (14,3), (15,4), (16,5), (17,6), (18,1),(19,2), (20,3), (21,4), (22,5), (23,6), (24,1),
(25,2), (26,3), (27,4), (28,5), (29,6), (30,1), (1,4), (2,5), (3,6), (4,1), (5,2), (6,3), (7,4), (8,5), (9,6), (10,1), (11,2), (12,3), 
(13,4), (14,5), (15,6), (16,1), (17,2), (18,3),(19,4), (20,5), (21,6), (22,1), (23,2), (24,3),
(25,4), (26,5), (27,6), (28,1), (29,2), (30,3);


select * from studying;

-- 4) ----------------------------------------- Create and call a procedure named student_info ---------------------------------

DROP PROCEDURE IF EXISTS student_info;

delimiter //
create procedure student_info()
begin
  select 
       st.student_id,
	   Fname, study_level, 
       cumulative_score, 
       sj.subject_id, 
       subject_name
from students sd
 join studying st on st.student_id = sd.student_id
 join subjects sj on st.subject_id = sj.subject_id
 order by st.student_id;
end //

delimiter ;

call student_info();

select * from studying;


-- 5) ----------------------------------------- Create, display, and delete a view named teacher_info -----------------------------------------

create view teacher_info
as 
select Fname, office_num, subject_name
from teachers t join subjects s using(subject_id)
order by Fname;

select * from teacher_info;

drop view teacher_info;



-- 6) ----------------------------------------- Create, display, and delete an index -----------------------


create index Student_inx
on students (Fname);

show index from students;

drop index student_inx on students;
