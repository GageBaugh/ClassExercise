--A
alter table Enrolled
add constraint check_enrolled check(count(snum) >= 5 and count(snum) <= 30);

--B
/* we don't have a table with all of the rooms so b is currently impossible*/

--C
alter table Faculty
add constraint check_taught check(classes_taught>=2 and deptid!=33 and classes_taught<=3);

--D
alter table Faculty
add constraint ckeck_deptid33_taught check(classes_taught>=2 and deptid=33);

--E
alter table Enrolled
add constraint check_Math101 check(count(distinct snum)=(select count(e.cname) from Enrolled e where e.cname='Math101'));

--F
alter table Class
add constraint max_min_time check((select c.room from Class c where c.meets_at=min(c.meets_at))!=(select c.room from Class c where c.meets_at=max(c.meets_at)));

--G
alter table Class
add constraint check_meeting_time check(room!=room and meets_at!=meets_at);

--H
alter table Faculty
add constraint max_min_check check(max(count(deptid))<=min(count(deptid))*2);

--I
alter table Faculty
add constraint check_dept_max check((select f.deptid, count(*) from Faculty f group by deptid, deptid_count)<=10);

--J
/*
I think that this constraint would have to be done while the update is happening
*/

--K
alter table Student
add constraint cs_greaterthan_math check((select count(s.major) from Student s where s.major='CS')>(select count(s.major) from Student s where s.major='Math'));

--L
alter table Enrolled
add constraint csCourses_greaterthan_mathCourses check((select count(distinct cname) from Enrolled e, Student s where (select s2.sname from Student s2 where s2.major='CS')=e.sname)>
													   (select count(distinct cname) from Enrolled e, Student s where (select s2.sname from Student s2 where s2.major='Math')=e.sname));
--M 
alter table Enrolled
add constraint math_majors_to_deptis33 check((select count(e.fid) from Enrolled e where e.fid=(select f.fid from Faculty f where f.deptid=33))>
											 (select count(s.major) from Student s where s.major='Math'));
--N
alter table Student
add constraint one_cs_check check(count(snum)=0 or (select count(s.major) from Student s where s.major='CS')>=1);
 
--O
alter table Class
add constraint check_dept_room check(room!=room or (select f.deptid from Faculty f, Class c where f.fid = c.fid)=(select f.deptid from Faculty f, Class c where f.fid = c.fid));