/* Создание схемы "InfoSchool" */
create schema InfoSchool;
/*
Школы
*/
create table InfoSchool.School
(
  SchoolID uuid not null,
  RecordDateCreate timestamp not null,
  RecordUserNameCreate varchar(100) not null,
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100) not null,
  primary key(SchoolID)
) ;


/*
Классы
*/
create table InfoSchool.Class
(
  ClassID uuid not null,
  RecordDateCreate timestamp not null,
  RecordUserNameCreate varchar(100) not null,
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100) not null,
  SchoolID uuid not null,
  primary key(ClassID)
) ;


/*
Ученики
*/
create table InfoSchool.Student
(
  StudentID uuid not null,
  RecordDateCreate timestamp not null,
  RecordUserNameCreate varchar(100) not null,
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  SurName varchar(100) not null,
  Name varchar(100) not null,
  MiddleName varchar(100) not null,
  ClassID uuid not null,
  primary key(StudentID)
) ;


/*
Журнал успеваемости
*/
create table InfoSchool.JournalMark
(
  JournalMarkID uuid not null,
  RecordDateCreate timestamp not null,
  RecordUserNameCreate varchar(100) not null,
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  StudentID uuid not null,
  SchoolSubjectID uuid not null,
  Comment varchar(1024),
  Mark integer not null,
  primary key(JournalMarkID)
) ;


/*
Школьные предметы
*/
create table InfoSchool.SchoolSubject
(
  SchoolSubjectID uuid not null,
  RecordDateCreate timestamp not null,
  RecordUserNameCreate varchar(100) not null,
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100) not null,
  primary key(SchoolSubjectID)
) ;








/* Создание индексов для таблицы "Школы"*/
create unique index SchoolIndxName on InfoSchool.School
(
  Name
) ;




/* Создание индексов для таблицы "Классы"*/
create unique index ClassIndxNameSchool on InfoSchool.Class
(
  Name,
  SchoolID
) ;


alter table InfoSchool.Class add constraint ClassSchoolID foreign key (SchoolID) references InfoSchool.School(SchoolID) on delete cascade ;




alter table InfoSchool.Student add constraint StudentClassID foreign key (ClassID) references InfoSchool.Class(ClassID) on delete cascade ;




alter table InfoSchool.JournalMark add constraint JournalMarkStudentID foreign key (StudentID) references InfoSchool.Student(StudentID) on delete cascade ;


alter table InfoSchool.JournalMark add constraint JournalMarkSchoolSubjectID foreign key (SchoolSubjectID) references InfoSchool.SchoolSubject(SchoolSubjectID) on delete cascade ;




/* Создание индексов для таблицы "Школьные предметы"*/
create unique index SchoolSubjectIndxName on InfoSchool.SchoolSubject
(
  Name
) ;



create or replace function InfoSchool.SchoolGetAll
(

)
returns
table
(
  SchoolID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100)
)

as $$
/*
InfoSchool.SchoolGetAll - Получить набор данных левого объединения для таблицы "Школы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.SchoolGetOne
(
  ASchoolID uuid
)
returns
table
(
  SchoolID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100)
)

as $$
/*
InfoSchool.SchoolGetOne - Получить одну запись для таблицы "Школы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.SchoolInsert
(
  AName varchar(100)
)
returns
  uuid
as $$
/*
InfoSchool.SchoolInsert - Вставить запись для таблицы "Школы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.SchoolUpdate
(
  AName varchar(100),
  AWSchoolID uuid
)
returns
  integer
as $$
/*
InfoSchool.SchoolUpdate - Изменить запись для таблицы "Школы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.SchoolDelete
(
  ASchoolID uuid
)
returns
  integer
as $$
/*
InfoSchool.SchoolDelete - Удалить запись для таблицы "Школы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;




create or replace function InfoSchool.ClassGetAllBySchool
(
  ASchoolID uuid
)
returns
table
(
  ClassID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100),
  SchoolID uuid
)

as $$
/*
InfoSchool.ClassGetAllBySchool - Получить набор данных левого объединения для таблицы "Классы" по Школе
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.ClassGetAll
(

)
returns
table
(
  ClassID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100),
  SchoolID uuid,
  SchoolName varchar(100)
)

as $$
/*
InfoSchool.ClassGetAll - Получить набор данных левого объединения для таблицы "Классы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.ClassGetOne
(
  AClassID uuid
)
returns
table
(
  ClassID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100),
  SchoolID uuid
)

as $$
/*
InfoSchool.ClassGetOne - Получить одну запись для таблицы "Классы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.ClassInsert
(
  AName varchar(100),
  ASchoolID uuid
)
returns
  uuid
as $$
/*
InfoSchool.ClassInsert - Вставить запись для таблицы "Классы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.ClassUpdate
(
  AName varchar(100),
  ASchoolID uuid,
  AWClassID uuid
)
returns
  integer
as $$
/*
InfoSchool.ClassUpdate - Изменить запись для таблицы "Классы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.ClassDelete
(
  AClassID uuid
)
returns
  integer
as $$
/*
InfoSchool.ClassDelete - Удалить запись для таблицы "Классы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;




create or replace function InfoSchool.StudentGetAll
(

)
returns
table
(
  StudentID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  SurName varchar(100),
  Name varchar(100),
  MiddleName varchar(100),
  ClassID uuid,
  ClassName varchar(100),
  SchoolID uuid,
  SchoolName varchar(100)
)

as $$
/*
InfoSchool.StudentGetAll - Получить набор данных левого объединения для таблицы "Ученики"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.StudentGetAllByClass
(
  AClassID uuid
)
returns
table
(
  StudentID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  SurName varchar(100),
  Name varchar(100),
  MiddleName varchar(100),
  ClassID uuid
)

as $$
/*
InfoSchool.StudentGetAllByClass - Получить набор данных левого объединения для таблицы "Ученики" по Классу
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.StudentInsert
(
  ASurName varchar(100),
  AName varchar(100),
  AMiddleName varchar(100),
  AClassID uuid
)
returns
  uuid
as $$
/*
InfoSchool.StudentInsert - Вставить запись для таблицы "Ученики"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.StudentUpdate
(
  ASurName varchar(100),
  AName varchar(100),
  AMiddleName varchar(100),
  AClassID uuid,
  AWStudentID uuid
)
returns
  integer
as $$
/*
InfoSchool.StudentUpdate - Изменить запись для таблицы "Ученики"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.StudentDelete
(
  AStudentID uuid
)
returns
  integer
as $$
/*
InfoSchool.StudentDelete - Удалить запись для таблицы "Ученики"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;




create or replace function InfoSchool.JournalMarkGetAllByStudent
(
  AStudentID uuid
)
returns
table
(
  JournalMarkID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  StudentID uuid,
  SchoolSubjectID uuid,
  SchoolSubjectName varchar(100),
  Comment varchar(1024),
  Mark integer
)

as $$
/*
InfoSchool.JournalMarkGetAllByStudent - Получить набор данных левого объединения для таблицы "Журнал успеваемости" по Студенту
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.JournalMarkGetAllBySchoolSubject
(
  ASchoolSubjectID uuid
)
returns
table
(
  JournalMarkID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  StudentID uuid,
  StudentSurName varchar(100),
  StudentName varchar(100),
  StudentMiddleName varchar(100),
  ClassID uuid,
  ClassNama varchar(100),
  SchoolID uuid,
  SchoolName varchar(100),
  SchoolSubjectID uuid,
  Comment varchar(1024),
  Mark integer
)

as $$
/*
InfoSchool.JournalMarkGetAllBySchoolSubject - Получить набор данных левого объединения для таблицы "Журнал успеваемости" по Школьному предмету
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.JournalMarkGetOne
(
  AJournalMarkID uuid
)
returns
table
(
  JournalMarkID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  StudentID uuid,
  SchoolSubjectID uuid,
  Comment varchar(1024),
  Mark integer
)

as $$
/*
InfoSchool.JournalMarkGetOne - Получить одну запись для таблицы "Журнал успеваемости"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.JournalMarkInsert
(
  AStudentID uuid,
  ASchoolSubjectID uuid,
  AComment varchar(1024),
  AMark integer
)
returns
  uuid
as $$
/*
InfoSchool.JournalMarkInsert - Вставить запись для таблицы "Журнал успеваемости"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.JournalMarkUpdate
(
  ASchoolSubjectID uuid,
  AComment varchar(1024),
  AMark integer,
  AWJournalMarkID uuid
)
returns
  integer
as $$
/*
InfoSchool.JournalMarkUpdate - Изменить запись для таблицы "Журнал успеваемости"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.JournalMarkDelete
(
  AJournalMarkID uuid
)
returns
  integer
as $$
/*
InfoSchool.JournalMarkDelete - Удалить запись для таблицы "Журнал успеваемости"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;




create or replace function InfoSchool.SchoolSubjectGetAll
(

)
returns
table
(
  SchoolSubjectID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100)
)

as $$
/*
InfoSchool.SchoolSubjectGetAll - Получить набор данных левого объединения для таблицы "Школьные предметы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.SchoolSubjectGetOne
(
  ASchoolSubjectID uuid
)
returns
table
(
  SchoolSubjectID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100)
)

as $$
/*
InfoSchool.SchoolSubjectGetOne - Получить одну запись для таблицы "Школьные предметы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.SchoolSubjectInsert
(
  AName varchar(100)
)
returns
  uuid
as $$
/*
InfoSchool.SchoolSubjectInsert - Вставить запись для таблицы "Школьные предметы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.SchoolSubjectUpdate
(
  AName varchar(100),
  AWSchoolSubjectID uuid
)
returns
  integer
as $$
/*
InfoSchool.SchoolSubjectUpdate - Изменить запись для таблицы "Школьные предметы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;


create or replace function InfoSchool.SchoolSubjectDelete
(
  ASchoolSubjectID uuid
)
returns
  integer
as $$
/*
InfoSchool.SchoolSubjectDelete - Удалить запись для таблицы "Школьные предметы"
*/
#variable_conflict use_variable
begin
  
end ;
$$ language plpgsql;














create or replace function InfoSchool.SchoolGetAll
(

)
returns
table
(
  SchoolID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100)
)

as $$
/*
InfoSchool.SchoolGetAll - Получить набор данных левого объединения для таблицы "Школы"
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      T.SchoolID,
      T.RecordDateCreate,
      T.RecordUserNameCreate,
      T.RecordDateUpdate,
      T.RecordUserNameUpdate,
      T.Name
  from InfoSchool.School T
  loop
    SchoolID = R.SchoolID;
    RecordDateCreate = R.RecordDateCreate;
    RecordUserNameCreate = R.RecordUserNameCreate;
    RecordDateUpdate = R.RecordDateUpdate;
    RecordUserNameUpdate = R.RecordUserNameUpdate;
    Name = R.Name;
    return next;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.SchoolGetOne
(
  ASchoolID uuid
)
returns
table
(
  SchoolID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100)
)

as $$
/*
InfoSchool.SchoolGetOne - Получить одну запись для таблицы "Школы"
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      InfoSchool.School.SchoolID,
      InfoSchool.School.RecordDateCreate,
      InfoSchool.School.RecordUserNameCreate,
      InfoSchool.School.RecordDateUpdate,
      InfoSchool.School.RecordUserNameUpdate,
      InfoSchool.School.Name
    from InfoSchool.School
    where InfoSchool.School.SchoolID = ASchoolID
    limit 1 offset 0
  loop
      SchoolID = R.SchoolID;
      RecordDateCreate = R.RecordDateCreate;
      RecordUserNameCreate = R.RecordUserNameCreate;
      RecordDateUpdate = R.RecordDateUpdate;
      RecordUserNameUpdate = R.RecordUserNameUpdate;
      Name = R.Name;
    return next;
    exit;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.SchoolInsert
(
  AName varchar(100)
)
returns
  uuid
as $$
/*
InfoSchool.SchoolInsert - Вставить запись для таблицы "Школы"
*/
#variable_conflict use_variable
declare
  Result uuid;
begin

  Result = gen_random_uuid();
  insert into InfoSchool.School (
      SchoolID,
      Name,
      RecordDateCreate,
      RecordUserNameCreate)
    values (
      Result,
      AName,
      current_timestamp,
      current_user);
  return Result;
end ;

$$ language plpgsql;


create or replace function InfoSchool.SchoolUpdate
(
  AName varchar(100),
  AWSchoolID uuid
)
returns
  integer
as $$
/*
InfoSchool.SchoolUpdate - Изменить запись для таблицы "Школы"
*/
#variable_conflict use_variable
declare
  R record;
  Result integer;

  Cnt Integer;
begin

  Result = 0;
  update InfoSchool.School set
      Name = AName,
      RecordDateUpdate = current_timestamp,
      RecordUserNameUpdate = current_user
    where SchoolID = AWSchoolID;
  get diagnostics Result = row_count;
  return Result;
end ;

$$ language plpgsql;


create or replace function InfoSchool.SchoolDelete
(
  ASchoolID uuid
)
returns
  integer
as $$
/*
InfoSchool.SchoolDelete - Удалить запись для таблицы "Школы"
*/
#variable_conflict use_variable
declare
  Result integer;
begin

  delete from InfoSchool.School
    where SchoolID = ASchoolID;
  get diagnostics Result = row_count;
  return Result;
end ;

$$ language plpgsql;




create or replace function InfoSchool.ClassGetAllBySchool
(
  ASchoolID uuid
)
returns
table
(
  ClassID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100),
  SchoolID uuid
)

as $$
/*
InfoSchool.ClassGetAllBySchool - Получить набор данных левого объединения для таблицы "Классы" по Школе
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      T.ClassID,
      T.RecordDateCreate,
      T.RecordUserNameCreate,
      T.RecordDateUpdate,
      T.RecordUserNameUpdate,
      T.Name,
      T.SchoolID
  from InfoSchool.Class T
    where T.SchoolID = ASchoolID
  loop
    ClassID = R.ClassID;
    RecordDateCreate = R.RecordDateCreate;
    RecordUserNameCreate = R.RecordUserNameCreate;
    RecordDateUpdate = R.RecordDateUpdate;
    RecordUserNameUpdate = R.RecordUserNameUpdate;
    Name = R.Name;
    SchoolID = R.SchoolID;
    return next;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.ClassGetAll
(

)
returns
table
(
  ClassID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100),
  SchoolID uuid,
  SchoolName varchar(100)
)

as $$
/*
InfoSchool.ClassGetAll - Получить набор данных левого объединения для таблицы "Классы"
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      T.ClassID,
      T.RecordDateCreate,
      T.RecordUserNameCreate,
      T.RecordDateUpdate,
      T.RecordUserNameUpdate,
      T.Name,
      T.SchoolID,
      T7.Name as SchoolName
  from InfoSchool.Class T
  left join InfoSchool.School T7 on T7.SchoolID = T.SchoolID
  loop
    ClassID = R.ClassID;
    RecordDateCreate = R.RecordDateCreate;
    RecordUserNameCreate = R.RecordUserNameCreate;
    RecordDateUpdate = R.RecordDateUpdate;
    RecordUserNameUpdate = R.RecordUserNameUpdate;
    Name = R.Name;
    SchoolID = R.SchoolID;
    SchoolName = R.SchoolName;
    return next;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.ClassGetOne
(
  AClassID uuid
)
returns
table
(
  ClassID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100),
  SchoolID uuid
)

as $$
/*
InfoSchool.ClassGetOne - Получить одну запись для таблицы "Классы"
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      InfoSchool.Class.ClassID,
      InfoSchool.Class.RecordDateCreate,
      InfoSchool.Class.RecordUserNameCreate,
      InfoSchool.Class.RecordDateUpdate,
      InfoSchool.Class.RecordUserNameUpdate,
      InfoSchool.Class.Name,
      InfoSchool.Class.SchoolID
    from InfoSchool.Class
    where InfoSchool.Class.ClassID = AClassID
    limit 1 offset 0
  loop
      ClassID = R.ClassID;
      RecordDateCreate = R.RecordDateCreate;
      RecordUserNameCreate = R.RecordUserNameCreate;
      RecordDateUpdate = R.RecordDateUpdate;
      RecordUserNameUpdate = R.RecordUserNameUpdate;
      Name = R.Name;
      SchoolID = R.SchoolID;
    return next;
    exit;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.ClassInsert
(
  AName varchar(100),
  ASchoolID uuid
)
returns
  uuid
as $$
/*
InfoSchool.ClassInsert - Вставить запись для таблицы "Классы"
*/
#variable_conflict use_variable
declare
  Result uuid;
begin

  Result = gen_random_uuid();
  insert into InfoSchool.Class (
      ClassID,
      Name,
      SchoolID,
      RecordDateCreate,
      RecordUserNameCreate)
    values (
      Result,
      AName,
      ASchoolID,
      current_timestamp,
      current_user);
  return Result;
end ;

$$ language plpgsql;


create or replace function InfoSchool.ClassUpdate
(
  AName varchar(100),
  ASchoolID uuid,
  AWClassID uuid
)
returns
  integer
as $$
/*
InfoSchool.ClassUpdate - Изменить запись для таблицы "Классы"
*/
#variable_conflict use_variable
declare
  R record;
  Result integer;

  Cnt Integer;
begin

  Result = 0;
  update InfoSchool.Class set
      Name = AName,
      SchoolID = ASchoolID,
      RecordDateUpdate = current_timestamp,
      RecordUserNameUpdate = current_user
    where ClassID = AWClassID;
  get diagnostics Result = row_count;
  return Result;
end ;

$$ language plpgsql;


create or replace function InfoSchool.ClassDelete
(
  AClassID uuid
)
returns
  integer
as $$
/*
InfoSchool.ClassDelete - Удалить запись для таблицы "Классы"
*/
#variable_conflict use_variable
declare
  Result integer;
begin

  delete from InfoSchool.Class
    where ClassID = AClassID;
  get diagnostics Result = row_count;
  return Result;
end ;

$$ language plpgsql;




create or replace function InfoSchool.StudentGetAll
(

)
returns
table
(
  StudentID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  SurName varchar(100),
  Name varchar(100),
  MiddleName varchar(100),
  ClassID uuid,
  ClassName varchar(100),
  SchoolID uuid,
  SchoolName varchar(100)
)

as $$
/*
InfoSchool.StudentGetAll - Получить набор данных левого объединения для таблицы "Ученики"
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      T.StudentID,
      T.RecordDateCreate,
      T.RecordUserNameCreate,
      T.RecordDateUpdate,
      T.RecordUserNameUpdate,
      T.SurName,
      T.Name,
      T.MiddleName,
      T.ClassID,
      T9.Name as ClassName,
      T9.SchoolID,
      T92.Name as SchoolName
  from InfoSchool.Student T
  left join InfoSchool.Class T9 on T9.ClassID = T.ClassID
  left join InfoSchool.School T92 on T92.SchoolID = T9.SchoolID
  loop
    StudentID = R.StudentID;
    RecordDateCreate = R.RecordDateCreate;
    RecordUserNameCreate = R.RecordUserNameCreate;
    RecordDateUpdate = R.RecordDateUpdate;
    RecordUserNameUpdate = R.RecordUserNameUpdate;
    SurName = R.SurName;
    Name = R.Name;
    MiddleName = R.MiddleName;
    ClassID = R.ClassID;
    ClassName = R.ClassName;
    SchoolID = R.SchoolID;
    SchoolName = R.SchoolName;
    return next;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.StudentGetAllByClass
(
  AClassID uuid
)
returns
table
(
  StudentID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  SurName varchar(100),
  Name varchar(100),
  MiddleName varchar(100),
  ClassID uuid
)

as $$
/*
InfoSchool.StudentGetAllByClass - Получить набор данных левого объединения для таблицы "Ученики" по Классу
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      T.StudentID,
      T.RecordDateCreate,
      T.RecordUserNameCreate,
      T.RecordDateUpdate,
      T.RecordUserNameUpdate,
      T.SurName,
      T.Name,
      T.MiddleName,
      T.ClassID
  from InfoSchool.Student T
    where T.ClassID = AClassID
  loop
    StudentID = R.StudentID;
    RecordDateCreate = R.RecordDateCreate;
    RecordUserNameCreate = R.RecordUserNameCreate;
    RecordDateUpdate = R.RecordDateUpdate;
    RecordUserNameUpdate = R.RecordUserNameUpdate;
    SurName = R.SurName;
    Name = R.Name;
    MiddleName = R.MiddleName;
    ClassID = R.ClassID;
    return next;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.StudentInsert
(
  ASurName varchar(100),
  AName varchar(100),
  AMiddleName varchar(100),
  AClassID uuid
)
returns
  uuid
as $$
/*
InfoSchool.StudentInsert - Вставить запись для таблицы "Ученики"
*/
#variable_conflict use_variable
declare
  Result uuid;
begin

  Result = gen_random_uuid();
  insert into InfoSchool.Student (
      StudentID,
      SurName,
      Name,
      MiddleName,
      ClassID,
      RecordDateCreate,
      RecordUserNameCreate)
    values (
      Result,
      ASurName,
      AName,
      AMiddleName,
      AClassID,
      current_timestamp,
      current_user);
  return Result;
end ;

$$ language plpgsql;


create or replace function InfoSchool.StudentUpdate
(
  ASurName varchar(100),
  AName varchar(100),
  AMiddleName varchar(100),
  AClassID uuid,
  AWStudentID uuid
)
returns
  integer
as $$
/*
InfoSchool.StudentUpdate - Изменить запись для таблицы "Ученики"
*/
#variable_conflict use_variable
declare
  R record;
  Result integer;

  Cnt Integer;
begin

  Result = 0;
  update InfoSchool.Student set
      SurName = ASurName,
      Name = AName,
      MiddleName = AMiddleName,
      ClassID = AClassID,
      RecordDateUpdate = current_timestamp,
      RecordUserNameUpdate = current_user
    where StudentID = AWStudentID;
  get diagnostics Result = row_count;
  return Result;
end ;

$$ language plpgsql;


create or replace function InfoSchool.StudentDelete
(
  AStudentID uuid
)
returns
  integer
as $$
/*
InfoSchool.StudentDelete - Удалить запись для таблицы "Ученики"
*/
#variable_conflict use_variable
declare
  Result integer;
begin

  delete from InfoSchool.Student
    where StudentID = AStudentID;
  get diagnostics Result = row_count;
  return Result;
end ;

$$ language plpgsql;




create or replace function InfoSchool.JournalMarkGetAllByStudent
(
  AStudentID uuid
)
returns
table
(
  JournalMarkID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  StudentID uuid,
  SchoolSubjectID uuid,
  SchoolSubjectName varchar(100),
  Comment varchar(1024),
  Mark integer
)

as $$
/*
InfoSchool.JournalMarkGetAllByStudent - Получить набор данных левого объединения для таблицы "Журнал успеваемости" по Студенту
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      T.JournalMarkID,
      T.RecordDateCreate,
      T.RecordUserNameCreate,
      T.RecordDateUpdate,
      T.RecordUserNameUpdate,
      T.StudentID,
      T.SchoolSubjectID,
      T7.Name as SchoolSubjectName,
      T.Comment,
      T.Mark
  from InfoSchool.JournalMark T
  left join InfoSchool.SchoolSubject T7 on T7.SchoolSubjectID = T.SchoolSubjectID
    where T.StudentID = AStudentID
  loop
    JournalMarkID = R.JournalMarkID;
    RecordDateCreate = R.RecordDateCreate;
    RecordUserNameCreate = R.RecordUserNameCreate;
    RecordDateUpdate = R.RecordDateUpdate;
    RecordUserNameUpdate = R.RecordUserNameUpdate;
    StudentID = R.StudentID;
    SchoolSubjectID = R.SchoolSubjectID;
    SchoolSubjectName = R.SchoolSubjectName;
    Comment = R.Comment;
    Mark = R.Mark;
    return next;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.JournalMarkGetAllBySchoolSubject
(
  ASchoolSubjectID uuid
)
returns
table
(
  JournalMarkID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  StudentID uuid,
  StudentSurName varchar(100),
  StudentName varchar(100),
  StudentMiddleName varchar(100),
  ClassID uuid,
  ClassNama varchar(100),
  SchoolID uuid,
  SchoolName varchar(100),
  SchoolSubjectID uuid,
  Comment varchar(1024),
  Mark integer
)

as $$
/*
InfoSchool.JournalMarkGetAllBySchoolSubject - Получить набор данных левого объединения для таблицы "Журнал успеваемости" по Школьному предмету
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      T.JournalMarkID,
      T.RecordDateCreate,
      T.RecordUserNameCreate,
      T.RecordDateUpdate,
      T.RecordUserNameUpdate,
      T.StudentID,
      T6.SurName as StudentSurName,
      T6.Name as StudentName,
      T6.MiddleName as StudentMiddleName,
      T6.ClassID,
      T64.Name as ClassNama,
      T64.SchoolID,
      T642.Name as SchoolName,
      T.SchoolSubjectID,
      T.Comment,
      T.Mark
  from InfoSchool.JournalMark T
  left join InfoSchool.Student T6 on T6.StudentID = T.StudentID
  left join InfoSchool.Class T64 on T64.ClassID = T6.ClassID
  left join InfoSchool.School T642 on T642.SchoolID = T64.SchoolID
    where T.SchoolSubjectID = ASchoolSubjectID
  loop
    JournalMarkID = R.JournalMarkID;
    RecordDateCreate = R.RecordDateCreate;
    RecordUserNameCreate = R.RecordUserNameCreate;
    RecordDateUpdate = R.RecordDateUpdate;
    RecordUserNameUpdate = R.RecordUserNameUpdate;
    StudentID = R.StudentID;
    StudentSurName = R.StudentSurName;
    StudentName = R.StudentName;
    StudentMiddleName = R.StudentMiddleName;
    ClassID = R.ClassID;
    ClassNama = R.ClassNama;
    SchoolID = R.SchoolID;
    SchoolName = R.SchoolName;
    SchoolSubjectID = R.SchoolSubjectID;
    Comment = R.Comment;
    Mark = R.Mark;
    return next;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.JournalMarkGetOne
(
  AJournalMarkID uuid
)
returns
table
(
  JournalMarkID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  StudentID uuid,
  SchoolSubjectID uuid,
  Comment varchar(1024),
  Mark integer
)

as $$
/*
InfoSchool.JournalMarkGetOne - Получить одну запись для таблицы "Журнал успеваемости"
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      InfoSchool.JournalMark.JournalMarkID,
      InfoSchool.JournalMark.RecordDateCreate,
      InfoSchool.JournalMark.RecordUserNameCreate,
      InfoSchool.JournalMark.RecordDateUpdate,
      InfoSchool.JournalMark.RecordUserNameUpdate,
      InfoSchool.JournalMark.StudentID,
      InfoSchool.JournalMark.SchoolSubjectID,
      InfoSchool.JournalMark.Comment,
      InfoSchool.JournalMark.Mark
    from InfoSchool.JournalMark
    where InfoSchool.JournalMark.JournalMarkID = AJournalMarkID
    limit 1 offset 0
  loop
      JournalMarkID = R.JournalMarkID;
      RecordDateCreate = R.RecordDateCreate;
      RecordUserNameCreate = R.RecordUserNameCreate;
      RecordDateUpdate = R.RecordDateUpdate;
      RecordUserNameUpdate = R.RecordUserNameUpdate;
      StudentID = R.StudentID;
      SchoolSubjectID = R.SchoolSubjectID;
      Comment = R.Comment;
      Mark = R.Mark;
    return next;
    exit;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.JournalMarkInsert
(
  AStudentID uuid,
  ASchoolSubjectID uuid,
  AComment varchar(1024),
  AMark integer
)
returns
  uuid
as $$
/*
InfoSchool.JournalMarkInsert - Вставить запись для таблицы "Журнал успеваемости"
*/
#variable_conflict use_variable
declare
  Result uuid;
begin
  if (AMark < 0 or AMark > 4) then
    raise exception 'wrong mark';
  end if;
  Result = gen_random_uuid();
  insert into InfoSchool.StudentMark (
      StudentMarkID,
      StudentID,
      SchoolSubjectID,
      Comment,
      Mark,
      RecordDateCreate,
      RecordUserNameCreate)
    values (
      Result,
      AStudentID,
      ASchoolSubjectID,
      AComment,
      AMark,
      current_timestamp,
      current_user);
  return Result;
end;
$$ language plpgsql;


create or replace function InfoSchool.JournalMarkUpdate
(
  ASchoolSubjectID uuid,
  AComment varchar(1024),
  AMark integer,
  AWJournalMarkID uuid
)
returns
  integer
as $$
/*
InfoSchool.JournalMarkUpdate - Изменить запись для таблицы "Журнал успеваемости"
*/
#variable_conflict use_variable
declare
  R record;
  Result integer;

  Cnt Integer;
begin
  if (AMark < 0 or AMark > 4) then
    raise exception 'wrong mark';
  end if;
  Result = 0;
  update InfoSchool.StudentMark set
      SchoolSubjectID = ASchoolSubjectID,
      Comment = AComment,
      Mark = AMark,
      RecordDateUpdate = current_timestamp,
      RecordUserNameUpdate = current_user
    where StudentMarkID = AWStudentMarkID;
  get diagnostics Result = row_count;
  return Result;
end ;
$$ language plpgsql;


create or replace function InfoSchool.JournalMarkDelete
(
  AJournalMarkID uuid
)
returns
  integer
as $$
/*
InfoSchool.JournalMarkDelete - Удалить запись для таблицы "Журнал успеваемости"
*/
#variable_conflict use_variable
declare
  Result integer;
begin

  delete from InfoSchool.JournalMark
    where JournalMarkID = AJournalMarkID;
  get diagnostics Result = row_count;
  return Result;
end ;

$$ language plpgsql;




create or replace function InfoSchool.SchoolSubjectGetAll
(

)
returns
table
(
  SchoolSubjectID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100)
)

as $$
/*
InfoSchool.SchoolSubjectGetAll - Получить набор данных левого объединения для таблицы "Школьные предметы"
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      T.SchoolSubjectID,
      T.RecordDateCreate,
      T.RecordUserNameCreate,
      T.RecordDateUpdate,
      T.RecordUserNameUpdate,
      T.Name
  from InfoSchool.SchoolSubject T
  loop
    SchoolSubjectID = R.SchoolSubjectID;
    RecordDateCreate = R.RecordDateCreate;
    RecordUserNameCreate = R.RecordUserNameCreate;
    RecordDateUpdate = R.RecordDateUpdate;
    RecordUserNameUpdate = R.RecordUserNameUpdate;
    Name = R.Name;
    return next;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.SchoolSubjectGetOne
(
  ASchoolSubjectID uuid
)
returns
table
(
  SchoolSubjectID uuid,
  RecordDateCreate timestamp,
  RecordUserNameCreate varchar(100),
  RecordDateUpdate timestamp,
  RecordUserNameUpdate varchar(100),
  Name varchar(100)
)

as $$
/*
InfoSchool.SchoolSubjectGetOne - Получить одну запись для таблицы "Школьные предметы"
*/
#variable_conflict use_variable
declare
  R record;

begin

  for R in select
      InfoSchool.SchoolSubject.SchoolSubjectID,
      InfoSchool.SchoolSubject.RecordDateCreate,
      InfoSchool.SchoolSubject.RecordUserNameCreate,
      InfoSchool.SchoolSubject.RecordDateUpdate,
      InfoSchool.SchoolSubject.RecordUserNameUpdate,
      InfoSchool.SchoolSubject.Name
    from InfoSchool.SchoolSubject
    where InfoSchool.SchoolSubject.SchoolSubjectID = ASchoolSubjectID
    limit 1 offset 0
  loop
      SchoolSubjectID = R.SchoolSubjectID;
      RecordDateCreate = R.RecordDateCreate;
      RecordUserNameCreate = R.RecordUserNameCreate;
      RecordDateUpdate = R.RecordDateUpdate;
      RecordUserNameUpdate = R.RecordUserNameUpdate;
      Name = R.Name;
    return next;
    exit;
  end loop;
end ;

$$ language plpgsql;


create or replace function InfoSchool.SchoolSubjectInsert
(
  AName varchar(100)
)
returns
  uuid
as $$
/*
InfoSchool.SchoolSubjectInsert - Вставить запись для таблицы "Школьные предметы"
*/
#variable_conflict use_variable
declare
  Result uuid;
begin

  Result = gen_random_uuid();
  insert into InfoSchool.SchoolSubject (
      SchoolSubjectID,
      Name,
      RecordDateCreate,
      RecordUserNameCreate)
    values (
      Result,
      AName,
      current_timestamp,
      current_user);
  return Result;
end ;

$$ language plpgsql;


create or replace function InfoSchool.SchoolSubjectUpdate
(
  AName varchar(100),
  AWSchoolSubjectID uuid
)
returns
  integer
as $$
/*
InfoSchool.SchoolSubjectUpdate - Изменить запись для таблицы "Школьные предметы"
*/
#variable_conflict use_variable
declare
  R record;
  Result integer;

  Cnt Integer;
begin

  Result = 0;
  update InfoSchool.SchoolSubject set
      Name = AName,
      RecordDateUpdate = current_timestamp,
      RecordUserNameUpdate = current_user
    where SchoolSubjectID = AWSchoolSubjectID;
  get diagnostics Result = row_count;
  return Result;
end ;

$$ language plpgsql;


create or replace function InfoSchool.SchoolSubjectDelete
(
  ASchoolSubjectID uuid
)
returns
  integer
as $$
/*
InfoSchool.SchoolSubjectDelete - Удалить запись для таблицы "Школьные предметы"
*/
#variable_conflict use_variable
declare
  Result integer;
begin

  delete from InfoSchool.SchoolSubject
    where SchoolSubjectID = ASchoolSubjectID;
  get diagnostics Result = row_count;
  return Result;
end ;

$$ language plpgsql;


/* SQL скрипт создание после накатывания "Начальные данные" */
/* Добавление школ */
insert into InfoSchool.School (SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{13D02795-F08C-4DCA-94E8-D37A8261E1DD}', 'Средняя школа 65', current_timestamp, current_user);
insert into InfoSchool.School (SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{23D02795-F08C-4DCA-94E8-D37A8261E1DD}', 'Средняя школа 45', current_timestamp, current_user);
insert into InfoSchool.School (SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{33D02795-F08C-4DCA-94E8-D37A8261E1DD}', 'Средняя школа 15', current_timestamp, current_user);

/* Добавление классов в школы */
insert into InfoSchool.Class (ClassID, SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{08C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', '{13D02795-F08C-4DCA-94E8-D37A8261E1DD}', '5а', current_timestamp, current_user);
insert into InfoSchool.Class (ClassID, SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{18C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', '{13D02795-F08C-4DCA-94E8-D37A8261E1DD}', '4г', current_timestamp, current_user);
insert into InfoSchool.Class (ClassID, SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{28C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', '{13D02795-F08C-4DCA-94E8-D37A8261E1DD}', '3б', current_timestamp, current_user);
insert into InfoSchool.Class (ClassID, SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{38C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', '{13D02795-F08C-4DCA-94E8-D37A8261E1DD}', '4а', current_timestamp, current_user);
insert into InfoSchool.Class (ClassID, SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{48C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', '{13D02795-F08C-4DCA-94E8-D37A8261E1DD}', '2а', current_timestamp, current_user);

insert into InfoSchool.Class (ClassID, SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{05C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', '{23D02795-F08C-4DCA-94E8-D37A8261E1DD}', '1а', current_timestamp, current_user);
insert into InfoSchool.Class (ClassID, SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{15C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', '{23D02795-F08C-4DCA-94E8-D37A8261E1DD}', '2г', current_timestamp, current_user);
insert into InfoSchool.Class (ClassID, SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{25C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', '{23D02795-F08C-4DCA-94E8-D37A8261E1DD}', '6б', current_timestamp, current_user);
insert into InfoSchool.Class (ClassID, SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{35C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', '{23D02795-F08C-4DCA-94E8-D37A8261E1DD}', '9а', current_timestamp, current_user);
insert into InfoSchool.Class (ClassID, SchoolID, Name, RecordDateCreate, RecordUserNameCreate) values ('{45C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', '{23D02795-F08C-4DCA-94E8-D37A8261E1DD}', '3а', current_timestamp, current_user);

/* Добавление учеников в классы */
insert into InfoSchool.Student (StudentID, ClassID, SurName, Name, MiddleName, RecordDateCreate, RecordUserNameCreate) values ('{171201A6-E7AB-4DE8-85CE-195532CA4AF6}', '{08C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', 'Петров', 'Максим', 'Витальевич', current_timestamp, current_user);
insert into InfoSchool.Student (StudentID, ClassID, SurName, Name, MiddleName, RecordDateCreate, RecordUserNameCreate) values ('{271201A6-E7AB-4DE8-85CE-195532CA4AF6}', '{18C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', 'Волкова', 'Марина', 'Витальевна', current_timestamp, current_user);
insert into InfoSchool.Student (StudentID, ClassID, SurName, Name, MiddleName, RecordDateCreate, RecordUserNameCreate) values ('{371201A6-E7AB-4DE8-85CE-195532CA4AF6}', '{28C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', 'Сидоров', 'Павел', 'Сергеевич', current_timestamp, current_user);
insert into InfoSchool.Student (StudentID, ClassID, SurName, Name, MiddleName, RecordDateCreate, RecordUserNameCreate) values ('{471201A6-E7AB-4DE8-85CE-195532CA4AF6}', '{38C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', 'Анисимова', 'Рита', 'Витальевич', current_timestamp, current_user);
insert into InfoSchool.Student (StudentID, ClassID, SurName, Name, MiddleName, RecordDateCreate, RecordUserNameCreate) values ('{571201A6-E7AB-4DE8-85CE-195532CA4AF6}', '{48C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', 'Ратус', 'Наталья', 'Витальевич', current_timestamp, current_user);

insert into InfoSchool.Student (StudentID, ClassID, SurName, Name, MiddleName, RecordDateCreate, RecordUserNameCreate) values ('{671201A6-E7AB-4DE8-85CE-195532CA4AF6}', '{05C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', 'Шкедов', 'Максим', 'Сергеевич', current_timestamp, current_user);
insert into InfoSchool.Student (StudentID, ClassID, SurName, Name, MiddleName, RecordDateCreate, RecordUserNameCreate) values ('{771201A6-E7AB-4DE8-85CE-195532CA4AF6}', '{15C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', 'Кевалов', 'Денис', 'Павлович', current_timestamp, current_user);
insert into InfoSchool.Student (StudentID, ClassID, SurName, Name, MiddleName, RecordDateCreate, RecordUserNameCreate) values ('{871201A6-E7AB-4DE8-85CE-195532CA4AF6}', '{25C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', 'Мутавин', 'Руслан', 'Витальевич', current_timestamp, current_user);
insert into InfoSchool.Student (StudentID, ClassID, SurName, Name, MiddleName, RecordDateCreate, RecordUserNameCreate) values ('{971201A6-E7AB-4DE8-85CE-195532CA4AF6}', '{35C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', 'Румата', 'Павел', 'Витальевич', current_timestamp, current_user);
insert into InfoSchool.Student (StudentID, ClassID, SurName, Name, MiddleName, RecordDateCreate, RecordUserNameCreate) values ('{E71201A6-E7AB-4DE8-85CE-195532CA4AF6}', '{45C10426-DE6C-4969-9B1E-F9AF1A15AFF5}', 'Бобров', 'Дмитрий', 'Павлович', current_timestamp, current_user);

/* Добавление школьных предметов */
insert into InfoSchool.SchoolSubject (SchoolSubjectID, Name, RecordDateCreate, RecordUserNameCreate) values ('{087C9DE5-3498-4B7B-87AC-2345634DEC80}', 'Математика',  current_timestamp, current_user);
insert into InfoSchool.SchoolSubject (SchoolSubjectID, Name, RecordDateCreate, RecordUserNameCreate) values ('{187C9DE5-3498-4B7B-87AC-2345634DEC80}', 'История',     current_timestamp, current_user);
insert into InfoSchool.SchoolSubject (SchoolSubjectID, Name, RecordDateCreate, RecordUserNameCreate) values ('{287C9DE5-3498-4B7B-87AC-2345634DEC80}', 'География',   current_timestamp, current_user);
insert into InfoSchool.SchoolSubject (SchoolSubjectID, Name, RecordDateCreate, RecordUserNameCreate) values ('{387C9DE5-3498-4B7B-87AC-2345634DEC80}', 'Информатика', current_timestamp, current_user);
insert into InfoSchool.SchoolSubject (SchoolSubjectID, Name, RecordDateCreate, RecordUserNameCreate) values ('{487C9DE5-3498-4B7B-87AC-2345634DEC80}', 'Теология',    current_timestamp, current_user);

/* Добавление журнал успеваемости */
insert into InfoSchool.JournalMark (JournalMarkID, SchoolSubjectID, StudentID, Mark, Comment, RecordDateCreate, RecordUserNameCreate) values (gen_random_uuid(), '{087C9DE5-3498-4B7B-87AC-2345634DEC80}', '{171201A6-E7AB-4DE8-85CE-195532CA4AF6}', 0, null, current_timestamp, current_user);
insert into InfoSchool.JournalMark (JournalMarkID, SchoolSubjectID, StudentID, Mark, Comment, RecordDateCreate, RecordUserNameCreate) values (gen_random_uuid(), '{187C9DE5-3498-4B7B-87AC-2345634DEC80}', '{271201A6-E7AB-4DE8-85CE-195532CA4AF6}', 4, null, current_timestamp, current_user);
insert into InfoSchool.JournalMark (JournalMarkID, SchoolSubjectID, StudentID, Mark, Comment, RecordDateCreate, RecordUserNameCreate) values (gen_random_uuid(), '{287C9DE5-3498-4B7B-87AC-2345634DEC80}', '{271201A6-E7AB-4DE8-85CE-195532CA4AF6}', 3, null, current_timestamp, current_user);
insert into InfoSchool.JournalMark (JournalMarkID, SchoolSubjectID, StudentID, Mark, Comment, RecordDateCreate, RecordUserNameCreate) values (gen_random_uuid(), '{387C9DE5-3498-4B7B-87AC-2345634DEC80}', '{371201A6-E7AB-4DE8-85CE-195532CA4AF6}', 2, null, current_timestamp, current_user);
insert into InfoSchool.JournalMark (JournalMarkID, SchoolSubjectID, StudentID, Mark, Comment, RecordDateCreate, RecordUserNameCreate) values (gen_random_uuid(), '{487C9DE5-3498-4B7B-87AC-2345634DEC80}', '{871201A6-E7AB-4DE8-85CE-195532CA4AF6}', 2, null, current_timestamp, current_user);

