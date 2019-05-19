create database autorent;
use autorent;

create table Clients (
	C_ID numeric(6) not null primary key,
	C_FNAME varchar(25) not null,
	C_LNAME varchar(30) not null,
	C_BORN date not null,
	C_GENDER varchar(10) not null check(C_GENDER in ('ж','м')),
	C_NPASP varchar(6) not null,
	C_SPASP varchar(4) not null,
	C_LICENSE numeric(10) not null,
	C_PHONE varchar(20),
	C_ADDR varchar(100) not null,
	C_GOT_LICENSE date not null
);

create table Employees (
	E_ID numeric(6) not null primary key,
	E_FNAME varchar(25) not null,
	E_LNAME varchar(30) not null,
	E_BORN date not null,
	E_GENDER varchar(10) not null check(E_GENDER in ('ж','м')),
	E_NPASP varchar(6) not null,
	E_SPASP varchar(4) not null,
	E_INN numeric(12) not null,
	E_POST varchar(30) not null references Posts(P_POST),
	E_ADDR varchar(100),
	E_LOGIN varchar(15) not null
);


create table Posts (
	P_POST varchar(30) not null references Employees(E_POST) ,
	P_SAL numeric(8,2) not null,
	check (P_POST in ('менеджер', 'бухгалтер', 'сотрудник отд. кадров', 'руководитель')));


create table TeleNums (
	T_ID numeric(4) not null references Employees(E_ID),
	T_PHONE varchar(11) not null
);

create table Services (
	S_VIN numeric(17) not null references automobiles(A_VIN),
	S_DATE date not null
);

create table Contracts (
	CT_ID numeric(6) not null primary key,
	CT_EMPLOYEE numeric(6) not null references Employees(E_ID),
	CT_CLIENT numeric(6) not null references client(C_ID),
	CT_BEGIN date not null,
	CT_END date not null,
	CT_VIN numeric(17) not null references automobiles(A_VIN),
	CT_PRICE numeric(6) not null,
	check (CT_END>CT_BEGIN)
);


insert into Contracts (CT_ID, CT_EMPLOYEE, CT_CLIENT, CT_BEGIN, CT_END, CT_VIN, CT_PRICE)
values ('600001', '', '20002', '500002', '70000');

create table Automobiles (
	A_VIN numeric(17) not null primary key,
	A_MARK varchar(10) not null,
	A_MODEL_ID numeric(6) not null references models(M_ID),
	A_COLOR varchar(15) not null,
	A_EMISSION_YEAR date not null,
	A_EMERGENCY numeric(2),
	A_MILEAGE numeric(6,0) not null
);


create table Models (
	M_ID numeric(6) not null primary key,
	M_NAME varchar(40) not null,
	M_SEATS numeric(1) not null,
	M_FUEL numeric(2,1) not null,
	M_TYPE varchar(3) not null
);


create table Wrecks (
	W_ID numeric(6) not null primary key,
	W_DATE date not null,
	W_VIN numeric(17) not null references automobiles(A_VIN),
	W_CT_ID numeric(6) not null references Contracts(CT_ID),
	W_DAMAGE numeric(6) not null
);

insert into Wrecks (W_ID, W_DATE, W_VIN, W_CT_ID, W_DAMAGE)
values ('400001', '2017-9-14', '20002', '500002', '70000');
insert into Wrecks (W_ID, W_DATE, W_VIN, W_CT_ID, W_DAMAGE)
values ('400002', '2017-6-13', '20004', '500004', '110000');
insert into Wrecks (W_ID, W_DATE, W_VIN, W_CT_ID, W_DAMAGE)
values ('400003', '2017-1-4', '20007', '500007', '90000');
insert into Wrecks (W_ID, W_DATE, W_VIN, W_CT_ID, W_DAMAGE)
values ('400004', '2017-8-11', '20006', '500006', '60000');

Заполнние Clients

insert into Clients (C_ID, C_FNAME, C_LNAME, C_BORN, C_GENDER, C_NPASP, C_SPASP, C_LICENSE, C_PHONE, C_ADDR, C_GOT_LICENSE)
 values ('162361', 'Веселков', 'Иларион Владимирович', '1955-8-19', '9927', '254176', 'м', '3617374111', '8 (945) 612-33-64', '652175, г. Гай, ул. Рождественка, дом 57, квартира 237' , '1978-11-23');
insert into Clients (C_ID, C_FNAME, C_LNAME, C_BORN, C_GENDER, C_NPASP, C_SPASP, C_LICENSE, C_PHONE, C_ADDR, C_GOT_LICENSE)
 values ('217732', 'Никифоров', 'Илья Ильич', '1947-9-13', '9662', '833141', 'м', '8595932186', '8 (945) 612-33-64', '393760, г. Александровка, ул. Метростроевская, дом 86, квартира 209' , '1995-9-16');
insert into Clients (C_ID, C_FNAME, C_LNAME, C_BORN, C_GENDER, C_NPASP, C_SPASP, C_LICENSE, C_PHONE, C_ADDR, C_GOT_LICENSE)
 values ('915413', 'Фомов', 'Иларион Владимирович', '1950-3-6', '4641', '652622', 'м', '3493281874', '8 (925) 158-94-89', '671178, г. Шилка, ул. Вилюйская, дом 8, квартира 287' , '1969-10-19');
insert into Clients (C_ID, C_FNAME, C_LNAME, C_BORN, C_GENDER, C_NPASP, C_SPASP, C_LICENSE, C_PHONE, C_ADDR, C_GOT_LICENSE)
 values ('865426', 'Фомов', 'Вениамин Ярославович', '1978-1-11', '5358', '144693', 'м', '6543793796', '8 (912) 420-79-24', '431280, г. Ярки, ул. Складочный Тупик, дом 4, квартира 75' , '2007-12-19');
insert into Clients (C_ID, C_FNAME, C_LNAME, C_BORN, C_GENDER, C_NPASP, C_SPASP, C_LICENSE, C_PHONE, C_ADDR, C_GOT_LICENSE)
 values ('329553', 'Шмидт', 'Адис Егорович', '1953-3-2', '3548', '144223', 'м', '1287362631', '8 (923) 955-48-19', '652175, г. Гай, ул. Рождественка, дом 57, квартира 237' , '2006-4-12');
insert into Clients (C_ID, C_FNAME, C_LNAME, C_BORN, C_GENDER, C_NPASP, C_SPASP, C_LICENSE, C_PHONE, C_ADDR, C_GOT_LICENSE)
 values ('391818', 'Тимофеев', 'Серафим Викторович', '1962-5-14', '6934', '814911', 'м', '9845344118', '8 (945) 612-33-64', '101705, г. Козловка, ул. Звенигородская, дом 18, квартира 175' , '1971-7-23');
insert into Clients (C_ID, C_FNAME, C_LNAME, C_BORN, C_GENDER, C_NPASP, C_SPASP, C_LICENSE, C_PHONE, C_ADDR, C_GOT_LICENSE)
 values ('773524', 'Новиков', 'Адис Егорович', '1964-10-16', '4971', '531623', 'м', '6257777833', '8 (944) 886-42-72', '671178, г. Шилка, ул. Вилюйская, дом 8, квартира 287' , '2005-12-23');
insert into Clients (C_ID, C_FNAME, C_LNAME, C_BORN, C_GENDER, C_NPASP, C_SPASP, C_LICENSE, C_PHONE, C_ADDR, C_GOT_LICENSE)
 values ('657355', 'Фомов', 'Илья Александрович', '1977-8-4', '6996', '942837', 'м', '8148138586', '8 (978) 997-33-72', '652175, г. Гай, ул. Рождественка, дом 57, квартира 237' , '2009-12-7');
insert into Clients (C_ID, C_FNAME, C_LNAME, C_BORN, C_GENDER, C_NPASP, C_SPASP, C_LICENSE, C_PHONE, C_ADDR, C_GOT_LICENSE)
 values ('319735', 'Миронов', 'Владимир Леонидович', '1987-5-12', '4377', '799586', 'м', '8912696215', '8 (922) 752-26-35', '652175, г. Гай, ул. Рождественка, дом 57, квартира 237' , '2014-6-16');
insert into Clients (C_ID, C_FNAME, C_LNAME, C_BORN, C_GENDER, C_NPASP, C_SPASP, C_LICENSE, C_PHONE, C_ADDR, C_GOT_LICENSE)
 values ('616984', 'Шмидт', 'Селиверст Михайлович', '1946-6-22', '3735', '264845', 'м', '2891975224', '8 (922) 752-26-35', '140235, г. Няндома, ул. 8 Марта 1-я, дом 86, квартира 140' , '2013-9-24');

Заполнение Employees

insert into Employees (E_ID, E_FNAME, E_LNAME, E_BORN, E_GENDER, E_NPASP, E_SPASP, E_INN, E_POST, E_ADDR, E_LOGIN)
 values ('781458', 'Никифоров', 'Виталий Максимович', '1981-8-10', '8599', '831833', 'м', '112819677518', 'сотрудник отд. кадров', '671178, г. Шилка, ул. Вилюйская, дом 8, квартира 287' , '');
insert into Employees (E_ID, E_FNAME, E_LNAME, E_BORN, E_GENDER, E_NPASP, E_SPASP, E_INN, E_POST, E_ADDR, E_LOGIN)
 values ('791544', 'Тимофеев', 'Адис Егорович', '1979-12-26', '5666', '278325', 'м', '964559544248', 'менеджер', '309771, г. Санкт-Петербург, ул. Никольско-Архангельский Проезд, дом 84, квартира 249' , '');
insert into Employees (E_ID, E_FNAME, E_LNAME, E_BORN, E_GENDER, E_NPASP, E_SPASP, E_INN, E_POST, E_ADDR, E_LOGIN)
 values ('371645', 'Кондратьев', 'Илья Александрович', '1945-5-6', '1946', '218386', 'м', '422523136566', 'бухгалтер', '652175, г. Гай, ул. Рождественка, дом 57, квартира 237' , '');
insert into Employees (E_ID, E_FNAME, E_LNAME, E_BORN, E_GENDER, E_NPASP, E_SPASP, E_INN, E_POST, E_ADDR, E_LOGIN)
 values ('547182', 'Остимчук', 'Владимир Леонидович', '1977-11-6', '6992', '419128', 'м', '914262694447', 'руководитель', '678665, г. Хомутивка, ул. Николая Старостина, дом 90, квартира 281' , '');
insert into Employees (E_ID, E_FNAME, E_LNAME, E_BORN, E_GENDER, E_NPASP, E_SPASP, E_INN, E_POST, E_ADDR, E_LOGIN)
 values ('353831', 'Мартынов', 'Будимир Федорович', '1988-7-6', '1466', '858668', 'м', '474266851415', 'бухгалтер', '301684, г. Аксай, ул. Сивцев Вражек Переулок, дом 57, квартира 263' , '');
insert into Employees (E_ID, E_FNAME, E_LNAME, E_BORN, E_GENDER, E_NPASP, E_SPASP, E_INN, E_POST, E_ADDR, E_LOGIN)
 values ('732219', 'Сидоров', 'Серафим Викторович', '1972-9-25', '4176', '218718', 'м', '394576937284', 'менеджер', '165263, г. Тужа, ул. Хуторской 3-й Переулок, дом 83, квартира 69' , '');
insert into Employees (E_ID, E_FNAME, E_LNAME, E_BORN, E_GENDER, E_NPASP, E_SPASP, E_INN, E_POST, E_ADDR, E_LOGIN)
 values ('484895', 'Миронов', 'Олег Станиславович', '1997-11-9', '8514', '673137', 'м', '518567927989', 'руководитель', '422724, г. Чишмы, ул. Челябинская, дом 72, квартира 285' , '');
insert into Employees (E_ID, E_FNAME, E_LNAME, E_BORN, E_GENDER, E_NPASP, E_SPASP, E_INN, E_POST, E_ADDR, E_LOGIN)
 values ('613559', 'Кравченко', 'Илья Ильич', '1960-9-14', '6261', '396111', 'м', '962694465895', 'менеджер', '692162, г. Магадан, ул. Тарный Проезд, дом 31, квартира 172' , '');
insert into Employees (E_ID, E_FNAME, E_LNAME, E_BORN, E_GENDER, E_NPASP, E_SPASP, E_INN, E_POST, E_ADDR, E_LOGIN)
 values ('728574', 'Сидоров', 'Виталий Максимович', '1991-8-22', '4536', '557473', 'м', '879251383974', 'бухгалтер', '431280, г. Ярки, ул. Складочный Тупик, дом 4, квартира 75' , '');
insert into Employees (E_ID, E_FNAME, E_LNAME, E_BORN, E_GENDER, E_NPASP, E_SPASP, E_INN, E_POST, E_ADDR, E_LOGIN)
 values ('274186', 'Веселков', 'Вениамин Ярославович', '1955-6-14', '7791', '913274', 'м', '962314854845', 'бухгалтер', '652175, г. Гай, ул. Рождественка, дом 57, квартира 237' , '');

Заполнение Models

insert into Models (M_ID, M_NAME, M_SEATS, M_FUEL, M_TYPE)
values ('300001', 'rio', '5', '6.2', 'B');
insert into Models (M_ID, M_NAME, M_SEATS, M_FUEL, M_TYPE)
values ('300002', 'solaris', '5', '6.2', 'B');
insert into Models (M_ID, M_NAME, M_SEATS, M_FUEL, M_TYPE)
values ('300003', '320i', '5', '6.6', 'B');
insert into Models (M_ID, M_NAME, M_SEATS, M_FUEL, M_TYPE)
values ('300004', '530i', '5', '8.7', 'B');
insert into Models (M_ID, M_NAME, M_SEATS, M_FUEL, M_TYPE)
values ('300005', 'c class', '5', '6.6', 'B');
insert into Models (M_ID, M_NAME, M_SEATS, M_FUEL, M_TYPE)
values ('300006', 'e class', '5', '8.7', 'B');
insert into Models (M_ID, M_NAME, M_SEATS, M_FUEL, M_TYPE)
values ('300007', 'ducato', '2', '9.2', 'C');

Заполнение Posts

insert into Posts (P_POST, P_SAL)
values ('руководитель', 150000);
insert into Posts (P_POST, P_SAL)
values ('сотрудник отд. кадров', 70000);
insert into Posts (P_POST, P_SAL)
values ('бухгалтер', 90000);
insert into Posts (P_POST, P_SAL)
values ('менеджер', 50000);
 
Заполнение Wrecks
insert into Wrecks (W_ID, W_DATE, W_VIN, W_CT_ID, W_DAMAGE)
values ('10001', '2017-2-23', 2, 13.2, 'C');

Заполнение Automobiles

insert into Automobiles (A_VIN, A_MARK, A_MODEL_ID, A_COLOR, A_EMISSION_YEAR, A_EMERGENCY, A_MILEAGE)
values ('20001', 'kia', '300001', 'white', '2010-10-13', '0', '70105');
insert into Automobiles (A_VIN, A_MARK, A_MODEL_ID, A_COLOR, A_EMISSION_YEAR, A_EMERGENCY, A_MILEAGE)
values ('20002', 'hendai', '300002', 'blue', '2012-11-10', '0', '80203');
insert into Automobiles (A_VIN, A_MARK, A_MODEL_ID, A_COLOR, A_EMISSION_YEAR, A_EMERGENCY, A_MILEAGE)
values ('20003', 'BMW', '300003', 'black', '2015-10-10', '0', '40506');
insert into Automobiles (A_VIN, A_MARK, A_MODEL_ID, A_COLOR, A_EMISSION_YEAR, A_EMERGENCY, A_MILEAGE)
values ('20004', 'BMW', '300004', 'grey', '2011-9-17', '1', '60208');
insert into Automobiles (A_VIN, A_MARK, A_MODEL_ID, A_COLOR, A_EMISSION_YEAR, A_EMERGENCY, A_MILEAGE)
values ('20005', 'Mercedes', '300005', 'black', '2010-12-11', '1', '90211');
insert into Automobiles (A_VIN, A_MARK, A_MODEL_ID, A_COLOR, A_EMISSION_YEAR, A_EMERGENCY, A_MILEAGE)
values ('20006', 'Mercedes', '300006', 'white', '2016-11-11', '0', '30215');
insert into Automobiles (A_VIN, A_MARK, A_MODEL_ID, A_COLOR, A_EMISSION_YEAR, A_EMERGENCY, A_MILEAGE)
values ('20007', 'Fiat', '300007', 'blue', '2015-7-16', '0', '57219');
insert into Automobiles (A_VIN, A_MARK, A_MODEL_ID, A_COLOR, A_EMISSION_YEAR, A_EMERGENCY, A_MILEAGE)
values ('20008', 'BMW', '300003', 'white', '2017-11-12', '0', '30708');
insert into Automobiles (A_VIN, A_MARK, A_MODEL_ID, A_COLOR, A_EMISSION_YEAR, A_EMERGENCY, A_MILEAGE)
values ('20009', 'Mercedes', '300006', 'pink', '2007-4-15', '1', '180709');
insert into Automobiles (A_VIN, A_MARK, A_MODEL_ID, A_COLOR, A_EMISSION_YEAR, A_EMERGENCY, A_MILEAGE)
values ('20010', 'kia', '300001', 'gray', '2013-7-17', '1', '110713');

Индексы

create index E_POST on Employees(E_POST);
create index P_POST on Posts(P_POST);
create index T_ID on TeleNums(T_ID);
create index A_MODEL_ID on Automobiles(A_MODEL_ID);
create index W_VIN on Wrecks(W_VIN);
create index W_CT_ID on Wrecks(W_CT_ID);


Представления

-Текущие контракты:

create view currContracts
AS SELECT	*
FROM	Contracts
WHERE	CT_BEGIN <= now() AND now() <= CT_END;

-Список клиентов c номерами их контрактов

CREATE VIEW clientsContacts
AS SELECT c.C_ID,ct.CT_ID, c.C_FNAME, c.C_PHONE, c.C_BORN
FROM Clients c, Contracts ct
WHERE c.C_ID = ct.CT_CLIENT;

-Cписок сотрудников с телефонами

CREATE VIEW employeesTel
AS SELECT e.E_ID,e.E_FNAME, t.T_PHONE
FROM Employees e, TeleNums t
WHERE e.E_ID = t.T_ID;

-Список сотрудников и их зарплаты

CREATE VIEW employeesSalary
AS SELECT e.E_ID,e.E_FNAME, e.E_LNAME, p.P_SAL
FROM Employees e, Posts p
WHERE e.E_ID = p.P_POST;


-Количество оформленных контрактов

CREATE VIEW purchaseQuantity
AS SELECT  C_ID, C_FNAME, C_LNAME, COUNT(SELECT C.C_ID FROM CLIENTS C, Contracts CT WHERE C.C_ID=CT.CT_CLIENT)
FROM Clients;

-Клиенты со стажем вождения более 10 лет

CREATE VIEW matureClients
AS SELECT * FROM Clients
WHERE (YEAR(NOW()) - YEAR(C_GOT_LICENSE))-(DATE_FORMAT(NOW(), '%m%d') < DATE_FORMAT(C_GOT_LICENSE, '%m%d'))>10;

-Сотрудники и количество контрактов, которые они заключили

CREATE VIEW EmployeesContracts
AS SELECT E_ID, E_FNAME, E_LNAME, COUNT(SELECT E.E_ID FROM Employees E, Contracts CT WHERE E.E_ID=CT.CT_CLIENT)
FROM Employees

-Автомобили не старше 3-х лет

CREATE VIEW NewCars
AS SELECT A.A_MARK, M.M_NAME, A.A_EMISSION_YEAR
FROM Automobiles A, Models M
WHERE ((YEAR(NOW()) - YEAR(A_EMISSION_YEAR))-(DATE_FORMAT(NOW(), '%m%d') < DATE_FORMAT(A_EMISSION_YEAR, '%m%d'))<=3)
AND
(A.A_MODEL_ID = M.M_ID);
