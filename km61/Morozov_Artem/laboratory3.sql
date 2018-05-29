-- LABORATORY WORK 3
-- BY Morozov_Artem
SET SERVEROUTPUT ON;
/*1. Написати PL/SQL код, що додає продукт з ціною 10 постачальнику з ключем BRS01, щоб сумарна кількість його продуктів була менша = 10. 
Ключі нових продуктів   - prod1…prodn. Решта обов’язкових полів береться на вібір студента.
10 балів*/
declare
product_price product.product_price%type
vendor_id vendors.vend_id%type


/*2. Написати PL/SQL код, що по вказаному ключу замовника виводить у консоль його ім'я та визначає  його статус.
Якщо він купив два різних продукти - статус  = "yes"
Якщо він купив більше двох різних продуктів- статус  = "no"
Якщо він немає замовлення - статус  = "unknown*/

declare
vendor_name vendors.vend_name%type;
vendors_name vendors.vend_name%type;
--min_price products.prod_price%type;
count_product orderitems.prod_id%type
vendor_id vendors.vend_id%type; 
vendor_type char(10) := '';

begin
vendor_id := 'BRS01';
product_price := 0;
--select vendors.vend_name, min(orderitems.item_price) into vendor_name, min_price
--from orderitems join products on orderitems.prod_id = products.prod_id
--right join vendors on products.vend_id = vendors.vend_id
--where vendors.vend_id = vendor_id
--group by vendors.vend_name;

select vendors.vendors_name, count(product.prod_id) into vendor_name, count_product
from 

vendors left join product on vendors.vend_id = product.vend_id



if product_price > 0 then vendor_type := 'yes';
elsif product_price = 0 then vendor_type := 'unknown';
else vendor_type := 'no';
end if;

dbms_output.put_line(vendor_name || vendor_type);

end;


/*3. Створити представлення та використати його у двох запитах:
3.1. Скільки товарів було куплено покупцями з Англії.
3.2. На яку загальну суму купили покупці товари з Англії.
6 балів.*/
create view

