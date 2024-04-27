/*
TH2 Bai 2 (10 -> 18)
*/

-- 10) Hiển thị tên của mỗi nhân viên, ngày tuyển dụng và ngày xem xét tăng 
-- lương. Ngày xét tăng lương theo qui định là vào ngày thứ hai sau 6 tháng 
-- làm việc. Định dạng ngày xem xét theo kiểu “Eighth of May 1992”. 
SELECT FIRST_NAME || ' ' || LAST_NAME
       START_DATE, 
       TO_CHAR(NEXT_DAY(ADD_MONTHS(s_emp.START_DATE, 6) - 1, 'MONDAY'), 'DDth "of" Month YYYY') AS REVIEW_DATE
FROM s_emp;


-- 11) Hiển thị tên sản phẩm của tất cả các sản phẩm có chữ “ski”. 
SELECT NAME 
FROM s_product
WHERE lower(NAME) LIKE '%ski%';


-- 12) Với mỗi nhân viên, hãy tính số tháng thâm niên của nhân viên. Sắp xếp kết 
-- quả tăng dần theo tháng thâm niên và số tháng được làm tròn. 
SELECT ID, FIRST_NAME || ' ' || LAST_NAME AS NAME, ROUND(MONTHS_BETWEEN(CURRENT_DATE, START_DATE)) AS THAM_NIEN
FROM S_EMP
ORDER BY MONTHS_BETWEEN(CURRENT_DATE, START_DATE);


-- 13) Cho biết có bao nhiêu người quản lý. 
SELECT COUNT(DISTINCT MANAGER_ID) AS SO_QUAN_LY
FROM s_emp
WHERE MANAGER_ID IS NOT NULL;


-- 14) Hiển thị mức cao nhất và mức thấp nhất của đơn hàng trong bảng S_ORD. 
-- Đặt tên các cột tương ứng là Hightest và Lowest. 
SELECT MAX(TOTAL) AS Highest,
       MIN(TOTAL) AS Lowest
FROM s_ord;


-- 15) Hiển thị tên sản phẩm, mã sản phẩm và số lượng từng sản phẩm trong đơn 
-- đặt hàng có mã số 101. Cột số lượng được đặt tên là ORDERED. 
SELECT p.NAME, p.ID, QUANTITY AS ORDERED
FROM s_item i
    JOIN s_product p ON p.id = i.product_id


-- 16) Hiển thị mã khách hàng và mã đơn đặt hàng của tất cả khách hàng, kể cả 
-- những khách hàng chưa đặt hàng. Sắp xếp danh sách theo mã khách hàng. 
SELECT C.ID AS CUSTOMER_ID, O.ID AS ORDER_ID
FROM S_CUSTOMER C
    LEFT JOIN S_ORD O ON O.CUSTOMER_ID = C.ID;


-- 17) Hiển thị mã khách hàng, mã sản phẩm và số lượng đặt hàng của các đơn 
-- đặt hàng có trị giá trên 100.000. 
SELECT * FROM S_ORD;
SELECT * FROM S_ITEM;

SELECT O.CUSTOMER_ID, I.PRODUCT_ID, QUANTITY, TOTAL
FROM S_ORD O
    JOIN S_ITEM I ON O.ID = I.ORD_ID
WHERE TOTAL > 100000;


-- 18) Hiển thị họ tên của tất cả các nhân viên không phải là người quản lý. 
SELECT FIRST_NAME || ' ' || LAST_NAME AS EMPLOYEE
FROM S_EMP
EXCEPT
SELECT E1.FIRST_NAME || ' ' || E1.LAST_NAME
FROM S_EMP E1
    JOIN S_EMP E2 ON E1.ID = E2.MANAGER_ID;




-------------------------------------------------------------------------------------------------------------
/*
TH3 Bài 1 (1, 4)
*/

-- 1) Viết đoạn chương trình nhập n, kiểm tra n có phải là số nguyên tố hay không? 
SET SERVEROUTPUT ON;

DECLARE
    n NUMBER;
    is_prime BOOLEAN := TRUE;
BEGIN
    n := &n;
    IF n <= 1 THEN
        is_prime := FALSE;
    ELSE
        FOR i IN 2..SQRT(n) LOOP
            IF MOD(n, i) = 0 THEN
                is_prime := FALSE;
                EXIT;
            END IF;
        END LOOP;
    END IF;

    IF is_prime THEN
        DBMS_OUTPUT.PUT_LINE(n || ' là số nguyên tố');
    ELSE
        DBMS_OUTPUT.PUT_LINE(n || ' không phải là số nguyên tố');
    END IF;
END;
/


-- 4) Viết đoạn chương trình nhập 3 cạnh tam giác, kiểm tra tam giác có hợp lệ 
-- hay không? Nếu có cho biết loại tam giác: đều, cân, vuông, vuông cân? 
DECLARE
    a NUMBER;
    b NUMBER;
    c NUMBER;
    is_valid BOOLEAN := TRUE;
    triangle_type VARCHAR2(20);
BEGIN
    -- Nhập độ dài ba cạnh từ bàn phím
    a := &a;
    b := &b;
    c := &c;
    
    -- Kiểm tra tính hợp lệ của tam giác
    IF a <= 0 OR b <= 0 OR c <= 0 THEN
        is_valid := FALSE;
    ELSIF (a + b) <= c OR (a + c) <= b OR (b + c) <= a THEN
        is_valid := FALSE;
    END IF;
    
    -- Xác định loại tam giác nếu hợp lệ
    IF is_valid THEN
        IF a = b AND b = c THEN
            triangle_type := 'Tam giác đều';
        ELSIF a = b OR b = c OR a = c THEN
            IF a*a + b*b = c*c OR a*a + c*c = b*b OR b*b + c*c = a*a THEN
                triangle_type := 'Tam giác vuông cân';
            ELSE
                triangle_type := 'Tam giác cân';
            END IF;
        ELSIF a*a + b*b = c*c OR a*a + c*c = b*b OR b*b + c*c = a*a THEN
            triangle_type := 'Tam giác vuông';
        ELSE
            triangle_type := 'Tam giác thường';
        END IF;
        DBMS_OUTPUT.PUT_LINE('Tam giác này là ' || triangle_type);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ba cạnh không tạo thành tam giác hợp lệ');
    END IF;
END;
/


-------------------------------------------------------------------------------------------------------------

-- Bài 2 (2)

DECLARE
    v_student_id NUMBER;
    v_first_name VARCHAR2(25);
    v_last_name VARCHAR2(25);
    v_class_number NUMBER;
BEGIN
    v_student_id := &student_id;

    SELECT FirstName, LastName, COUNT(*)
    INTO v_first_name, v_last_name, v_class_number
    FROM STUDENT
    WHERE StudentID = v_student_id
    GROUP BY FirstName, LastName;

    IF v_class_number > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Họ và tên sinh viên: ' || v_first_name || ' ' || v_last_name);
        DBMS_OUTPUT.PUT_LINE('Số lớp sinh viên đang học: ' || v_class_number);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Sinh viên không tồn tại.');
        v_first_name := '&first_name';
        v_last_name := '&last_name';
        INSERT INTO STUDENT (StudentID, FirstName, LastName)
        VALUES (v_student_id, v_first_name, v_last_name);
        DBMS_OUTPUT.PUT_LINE('Đã thêm sinh viên mới thành công.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Lỗi: Không tìm thấy sinh viên có mã ' || v_student_id);
END;
/



-- Bài 3 (2)

DECLARE
    v_student_id NUMBER;
    v_class_id NUMBER;
    v_grade NUMBER;
    v_grade_letter VARCHAR2(1);
BEGIN
    v_student_id := &student_id;
    v_class_id := &class_id;

    SELECT Grade INTO v_grade
    FROM GRADE
    WHERE StudentID = v_student_id AND ClassID = v_class_id;

    CASE
        WHEN v_grade BETWEEN 90 AND 100 THEN
            v_grade_letter := 'A';
        WHEN v_grade BETWEEN 80 AND 89 THEN
            v_grade_letter := 'B';
        WHEN v_grade BETWEEN 70 AND 79 THEN
            v_grade_letter := 'C';
        WHEN v_grade BETWEEN 50 AND 69 THEN
            v_grade_letter := 'D';
        WHEN v_grade BETWEEN 0 AND 49 THEN
            v_grade_letter := 'F';
    END CASE;

    IF v_grade_letter IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Điểm chữ của sinh viên: ' || v_grade_letter);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Lỗi: Không tìm thấy thông tin sinh viên hoặc lớp học.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Lỗi: Không tìm thấy thông tin sinh viên hoặc lớp học.');
END;
/
