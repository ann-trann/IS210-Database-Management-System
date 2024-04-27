/* 10
Hiển thị tên của mỗi nhân viên, ngày tuyển dụng và ngày xem xét tăng 
lương. Ngày xét tăng lương theo qui định là vào ngày thứ hai sau 6 tháng 
làm việc. Định dạng ngày xem xét theo kiểu “Eighth of May 1992”
*/

SELECT * FROM s_emp;

SELECT FIRST_NAME || ' ' || LAST_NAME, start_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(start_date, 6), 'MONDAY'), 'DDTH "of" Month YYYY') AS NGAY_TANG_LUONG
FROM s_emp;

/* 11
 Hiển thị tên sản phẩm của tất cả các sản phẩm có chữ “ski”.
 */

SELECT * FROM S_PRODUCT

SELECT * FROM S_PRODUCT
WHERE SHORT_DESC LIKE '%ski%';

/* 12
Với mỗi nhân viên, hãy tính số tháng thâm niên của nhân viên. Sắp xếp kết 
quả tăng dần theo tháng thâm niên và số tháng được làm tròn. 
*/

SELECT * FROM S_EMP;

SELECT ID, FIRST_NAME || ' ' || LAST_NAME AS NAME, ROUND(MONTHS_BETWEEN(CURRENT_DATE, START_DATE)) AS THAM_NIEN
FROM S_EMP
ORDER BY MONTHS_BETWEEN(CURRENT_DATE, START_DATE);

/* 13
 Cho biết có bao nhiêu người quản lý. 
 */

SELECT * FROM S_EMP;

SELECT COUNT(*) AS SO_QUAN_LY FROM (
  SELECT MANAGER_ID FROM S_EMP
  GROUP BY MANAGER_ID
 );

/* 14
Hiển thị mức cao nhất và mức thấp nhất của đơn hàng trong bảng S_ORD. 
Đặt tên các cột tương ứng là Hightest và Lowest. 
*/

SELECT * FROM S_ORD;

SELECT MAX(TOTAL) AS Hightest, MIN(TOTAL) AS Lowest
FROM S_ORD;

/* 15
Hiển thị tên sản phẩm, mã sản phẩm và số lượng từng sản phẩm trong đơn 
đặt hàng có mã số 101. Cột số lượng được đặt tên là ORDERED. 
*/

SELECT * FROM S_ITEM;
SELECT * FROM S_PRODUCT;

SELECT NAME, SP.ID, SI.QUANTITY AS ORDERED
FROM S_ITEM SI
  JOIN S_PRODUCT SP ON SI.PRODUCT_ID = SP.ID
WHERE ORD_ID = 101;

/* 16
 Hiển thị mã khách hàng và mã đơn đặt hàng của tất cả khách hàng, kể cả 
những khách hàng chưa đặt hàng. Sắp xếp danh sách theo mã khách hàng. 
*/

SELECT * FROM S_CUSTOMER;
SELECT * FROM S_ORD;

SELECT SC.ID, SO.ID
FROM S_CUSTOMER SC
  LEFT JOIN S_ORD SO ON SC.ID = SO.CUSTOMER_ID
ORDER BY SC.ID, SO.ID;

/* 17
 Hiển thị mã khách hàng, mã sản phẩm và số lượng đặt hàng của các đơn 
đặt hàng có trị giá trên 100.000. 
*/

SELECT * FROM S_PRODUCT;
SELECT * FROM S_ITEM;
SELECT * FROM S_ORD;

SELECT SO.CUSTOMER_ID, SP.ID, SI.QUANTITY
FROM S_ORD SO
  JOIN S_ITEM SI ON SO.ID = SI.ORD_ID
  JOIN S_PRODUCT SP ON SI.PRODUCT_ID = SP.ID
WHERE SO.TOTAL > 100000;

/* 18 
Hiển thị họ tên của tất cả các nhân viên không phải là người quản lý. 
*/

SELECT * FROM S_EMP;

SELECT ID, FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM S_EMP
MINUS
SELECT SE.ID, FIRST_NAME || ' ' || LAST_NAME AS NAME
FROM S_EMP SE 
  JOIN (SELECT MANAGER_ID AS ID FROM S_EMP GROUP BY MANAGER_ID) SUB
  ON SE.ID = SUB.ID;