use Faculty

create table Student (
	ID int primary key identity(1,1),
	FirstName varchar(50),
	LastName varchar(50),
	DateOfBirth datetime,
	EnrolledDate date,
	Gender varchar(6),
	NationalIDNumber int,
	StudentCardNumber int
)

create table Teacher (
	ID int primary key identity(1,1),
	FirstName varchar(50),
	LastName varchar(50),
	DateOfBirth datetime,
	AcademicRank int,
	HireDate datetime
)

create table Grade(
	ID int primary key identity(1,1),
	StudentID int,
	CourseID int,
	TeacherID int,
	Grade smallint,
	Comment varchar(50),
	CreatedDate datetime
)

create table Course (
	ID int primary key identity(1,1),
	CourseName varchar(50),
	Credit int,
	AcademicYear datetime,
	Semester smallint,
)

create table AchivementType(
	ID int primary key identity(1,1),
	AchivementTypeName varchar(50),
	Descritpion varchar(50),
	ParticipationRate float
)

create table GradeDetails (
	ID int primary key identity(1,1),
	GradeID int,
	AchivementTypeID int,
	AchivementPoints smallint,
	AchivementMaxPoints smallint,
	AchivementDate datetime
)