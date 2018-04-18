/*---------------------------------------------------------------------------
1.Створити схему даних з назвою – прізвище студента, у якій користувач може: 
створювати таблиці
4 бали
---------------------------------------------------------------------------*/
--Код відповідь:
CREATE user student
IDENTIFIED by Artem
Default Tablespace "Users"
Temporary Tablespace "TEMP";
Alter User student QUOTA 100M on Users;
/*---------------------------------------------------------------------------
2. Створити таблиці, у яких визначити поля та типи. Головні та зовнішні ключі 
створювати окремо від таблиць використовуючи команди ALTER TABLE. 
Студент має мобільний номер іноземного оператора.
4 бали
---------------------------------------------------------------------------*/
--Код відповідь:
CREATE TABlE student(
  student_name varchar(10) not null
 );
 
 CREATE TABLE telephon_number (
   number varchar (10) not null
 );
 AlTER TABLE student
 add constraint 
/* --------------------------------------------------------------------------- 
3. Надати додаткові права користувачеві (створеному у пункті № 1) для створення таблиць, 
внесення даних у таблиці та виконання вибірок використовуючи команду ALTER/GRANT. 
Згенерувати базу даних використовуючи код з теки OracleScript та виконати запити: 

---------------------------------------------------------------------------*/
--Код відповідь:
alter user Artem
grant insert any to Artem;
grant select any to Artem;
/*---------------------------------------------------------------------------
3.a. 
Як звуть покупця, що купив найдешевший товар.
Виконати завдання в Алгебрі Кодда. 
4 бали
---------------------------------------------------------------------------*/
--Код відповідь:
PROJECT CUSTOMERS TIMES ORDERS TIMES ORDERITEMS {CUSTOMERS.CUST_NAME} 
    WHERE CUSTOMERS.CUST_ID = ORDERS.CUST_ID AND 
                    ORDERS.ORDER_NUM = ORDERITEMS.ORDER_NUM AND
                        ORDERITEMS.ITEM_PRICE IN (PROJECT ORDERITEMS {MIN(ITEM_PRICE)});
/*---------------------------------------------------------------------------
3.b. 
Вивести імена покупців, що не мають поштової адреси та замовлення, у дужках - назвавши це поле client_name.
Виконати завдання в SQL. 
4 бали
---------------------------------------------------------------------------*/
--Код відповідь:
select cust_name as client_name
from custumer
where cust_address = null;
/*---------------------------------------------------------------------------
c. 
Вивести імена постачальників у верхньому регістрі,назвавши це поле vendor_name, що не мають жодного товару.
Виконати завдання в SQL. 
4 бали
---------------------------------------------------------------------------*/
--Код відповідь:
select vend_name as vendor_name
