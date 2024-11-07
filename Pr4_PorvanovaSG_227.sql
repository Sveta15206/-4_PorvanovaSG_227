-- DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION pg_database_owner;

COMMENT ON SCHEMA public IS 'standard public schema';
-- public.patients определение

-- Drop table

-- DROP TABLE patients;

CREATE TABLE patients (
	id_patient int4 NOT NULL,
	name_patient varchar NOT NULL,
	lastname varchar NOT NULL,
	patronymic varchar NULL,
	birthday date NOT NULL,
	address varchar NOT NULL,
	CONSTRAINT patients_pk PRIMARY KEY (id_patient)
);

-- Permissions

ALTER TABLE patients OWNER TO postgres;
GRANT ALL ON TABLE patients TO postgres;


-- public.specialty определение

-- Drop table

-- DROP TABLE specialty;

CREATE TABLE specialty (
	id_specialty int4 NOT NULL,
	name_specialty varchar NOT NULL,
	CONSTRAINT specialty_pk PRIMARY KEY (id_specialty)
);

-- Permissions

ALTER TABLE specialty OWNER TO postgres;
GRANT ALL ON TABLE specialty TO postgres;


-- public.patient_visits определение

-- Drop table

-- DROP TABLE patient_visits;

CREATE TABLE patient_visits (
	id int4 NOT NULL,
	date_visit date NOT NULL,
	id_patient int4 NOT NULL,
	id_specialty int4 NOT NULL,
	"cost" money NOT NULL,
	CONSTRAINT patient_visits_pk PRIMARY KEY (id),
	CONSTRAINT patient_visits_patients_fk FOREIGN KEY (id_patient) REFERENCES patients(id_patient) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT patient_visits_specialty_fk FOREIGN KEY (id_specialty) REFERENCES specialty(id_specialty) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE patient_visits OWNER TO postgres;
GRANT ALL ON TABLE patient_visits TO postgres;


-- public.doctors определение

-- Drop table

-- DROP TABLE doctors;

CREATE TABLE doctors (
	id_doctor int4 NOT NULL,
	name_doctor varchar NOT NULL,
	lastname_doctors varchar NOT NULL,
	patronymic_doctor varchar NULL,
	id_specialty int4 NOT NULL,
	CONSTRAINT doctors_pk PRIMARY KEY (id_doctor),
	CONSTRAINT doctors_patient_visits_fk FOREIGN KEY (id_doctor) REFERENCES patient_visits(id) ON DELETE CASCADE ON UPDATE CASCADE,
	CONSTRAINT doctors_specialty_fk FOREIGN KEY (id_specialty) REFERENCES specialty(id_specialty) ON DELETE CASCADE ON UPDATE CASCADE
);

-- Permissions

ALTER TABLE doctors OWNER TO postgres;
GRANT ALL ON TABLE doctors TO postgres;




-- Permissions

GRANT ALL ON SCHEMA public TO pg_database_owner;
GRANT USAGE ON SCHEMA public TO public;

INSERT INTO public.doctors (id_doctor,name_doctor,lastname_doctors,patronymic_doctor,id_specialty) VALUES
	 (1,' Рубен ','Наумов ','Юльевич',1),
	 (2,' Кира ','Ковалева ','Максимовна',2),
	 (3,' Остромир ','Ефимов ',' Гертрудович',3),
	 (4,'Митофан ','Крылов ','Измаилович',4),
	 (5,'Анжела ','Назарова ',' Робертовна',5),
	 (6,'Вероника','Юдина','Харитоновна',6),
	 (7,' Амвросий ','Логинов ','Ильич',7),
	 (8,' Акулина ','Филиппова',' Вениаминовна',8),
	 (9,'София','Ефимова ','Анатольевна',9),
	 (10,' Ладимир ','Моисеев ','Гордеевич',10);
INSERT INTO public.patient_visits (id,date_visit,id_patient,id_specialty,"cost") VALUES
	 (1,'2024-05-21',1,1,2 100,00 ?),
	 (2,'2024-05-29',2,2,2 500,00 ?),
	 (3,'2024-06-04',3,3,3 100,00 ?),
	 (4,'2024-06-07',4,4,3 600,00 ?),
	 (5,'2024-07-19',5,5,3 000,00 ?),
	 (6,'2024-08-06',6,6,4 300,00 ?),
	 (7,'2024-09-09',7,7,2 000,00 ?),
	 (8,'2024-09-23',8,8,5 900,00 ?),
	 (9,'2024-10-15',9,9,4 000,00 ?),
	 (10,'2024-10-29',10,10,2 500,00 ?);
INSERT INTO public.patients (id_patient,name_patient,lastname,patronymic,birthday,address) VALUES
	 (1,'Лидия ','Бурова ','Александровна','1991-03-30','Дачная ул., д. 12 кв.28'),
	 (2,' Милан ','Зиновьев ','Иларионович','1988-01-04','Победы ул., д. 5 кв.182'),
	 (3,'Ульяна ','Маслова ','Тарасовна','1982-06-18','Озерная ул., д. 19 кв.102'),
	 (4,' Наина ','Белоусова ','Матвеевна','2000-08-25','Социалистическая ул., д. 10 кв.78'),
	 (5,' Егор ','Киселев ',' Эдгардович','1999-09-09','Белорусская ул., д. 3 кв.160'),
	 (6,'Харитон ','Силин ',' Вячеславович','2001-11-13','Светлая ул., д. 21 кв.203'),
	 (7,' Дарья ','Савина ','Матвеевна','2000-06-07','Октябрьский пер., д. 23 кв.122'),
	 (8,'Анна','Савина ','Матвеевна','2000-06-07','Октябрьский пер., д. 23 кв.122'),
	 (9,' Регина ','Сафонова ','Михайловна','2000-08-06','Трудовая ул., д. 3 кв.130'),
	 (10,'Селиверст','Фомичев ','Артемьевич','1990-02-16','Березовая ул., д. 23 кв.52');
INSERT INTO public.specialty (id_specialty,name_specialty) VALUES
	 (1,'терапевт'),
	 (2,'терапевт'),
	 (3,'кардиолог'),
	 (4,'офтальмолог'),
	 (5,'кардиолог'),
	 (6,'терапевт'),
	 (7,'хирург'),
	 (8,'хирург'),
	 (9,'кардиолог'),
	 (10,'терапевт');

