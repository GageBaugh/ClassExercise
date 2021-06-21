create table Student(
	snum int not null primary key,
	sname varchar(20),
	major varchar(20),
	level varchar(20),
	age int);

create table Enrolled(
	snum int,
	cname varchar(20) primary key,
	foreign key(snum) REFERENCES Student(snum));

create table Faculty(
	fid int primary key,
	fname varchar(20),
	deptid int,
	classes_taught int);
	
	create table Class(
	name varchar(20) primary key,
	meets_at time,
	room varchar(20),
	fid int,
	foreign key(fid) REFERENCES Faculty(fid));