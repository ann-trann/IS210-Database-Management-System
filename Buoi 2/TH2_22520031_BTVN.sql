------------------------------------------------------ TH2 Bai 3 & 4 ------------------------------------------------------
/*
    Bai 3: tao CSDL
*/

CREATE TABLE course (
  CourseNo NUMBER(8, 0) NOT NULL,
  Description VARCHAR2(50) NULL,
  Cost NUMBER(9, 2) NULL,
  Prerequisite NUMBER(8, 0) NULL,
  CreatedBy VARCHAR2(30) NOT NULL,
  CreatedDate DATE NOT NULL,
  ModifiedBy VARCHAR2(30) NOT NULL,
  ModifiedDate DATE NOT NULL
);

CREATE TABLE STUDENT (
  STUDENTID NUMBER(8,0) NOT NULL,
  SALUTATION VARCHAR2(5) NULL,
  FIRSTNAME VARCHAR2(25) NULL,
  LASTNAME VARCHAR2(25) NOT NULL,
  ADDRESS VARCHAR2(50) NULL,
  PHONE VARCHAR2(15) NULL,
  EMPLOYER VARCHAR2(50) NULL,
  REGISTRATIONDATE DATE NOT NULL,
  CREATEDBY VARCHAR2(30) NOT NULL,
  CREATEDDATE DATE NOT NULL,
  MODIFIEDBY VARCHAR2(30) NOT NULL,
  MODIFIEDDATE DATE NOT NULL
);

CREATE TABLE COURSE (
  CLASSID NUMBER(8,0) NOT NULL,
  COURSENO NUMBER(8,0) NOT NULL,
  CLASSNO NUMBER(3) NOT NULL,
  STARTDATETIME DATE NULL,
  LOCATION VARCHAR2(50) NULL,
  INSTRUCTORID NUMBER(8,0) NOT NULL,
  CAPACITY NUMBER(3,0) NULL,
  CREATEDBY VARCHAR2(30) NOT NULL,
  CREATEDDATE DATE NOT NULL,
  MODIFIEDBY VARCHAR2(30) NOT NULL,
  MODIFIEDDATE DATE NOT NULL
);

CREATE TABLE ENROLLMENT (
  STUDENTID NUMBER(8,0) NOT NULL,
  CLASSID NUMBER(8,0) NOT NULL,
  ENROLLDATE DATE NOT NULL,
  FINALGRADE NUMBER(3,0) NULL,
  REGISTRATIONDATE DATE NOT NULL,
  CREATEDBY VARCHAR2(30) NOT NULL,
  CREATEDDATE DATE NOT NULL,
  MODIFIEDBY VARCHAR2(30) NOT NULL,
  MODIFIEDDATE DATE NOT NULL
);

CREATE TABLE INSTRUCTOR (
  INSTRUCTORID NUMBER(8,0) NOT NULL,
  SALUTATION VARCHAR2(5) NULL,
  FIRSTNAME VARCHAR2(25) NULL,
  LASTNAME VARCHAR2(25) NULL,
  ADDRESS VARCHAR2(50) NULL,
  PHONE VARCHAR2(15) NULL,
  CREATEDBY VARCHAR2(30) NOT NULL,
  CREATEDDATE DATE NOT NULL,
  MODIFIEDBY VARCHAR2(30) NOT NULL,
  MODIFIEDDATE DATE NOT NULL
);

CREATE TABLE GRADE (
  STUDENTID NUMBER(8,0) NOT NULL,
  CLASSID NUMBER(8,0) NOT NULL,
  GRADE NUMBER(3,0) NOT NULL,
  COMMENTS VARCHAR2(2000) NULL,
  MODIFIEDDATE DATE NOT NULL,
  CREATEDBY VARCHAR2(30) NOT NULL,
  CREATEDDATE DATE NOT NULL,
  MODIFIEDBY VARCHAR2(30) NOT NULL
);



/*
    Bai 4
*/

-- 1. Sinh viên tạo ra 20 tài khoản (user01 -> user20) cho phép kết nối đến CSDL Oracle. 
CREATE USER user01 IDENTIFIED BY password01;
CREATE USER user02 IDENTIFIED BY password02;
CREATE USER user03 IDENTIFIED BY password03;
CREATE USER user04 IDENTIFIED BY password20;
CREATE USER user05 IDENTIFIED BY password01;
CREATE USER user06 IDENTIFIED BY password02;
CREATE USER user07 IDENTIFIED BY password03;
CREATE USER user08 IDENTIFIED BY password20;
CREATE USER user09 IDENTIFIED BY password01;
CREATE USER user10 IDENTIFIED BY password02;
CREATE USER user11 IDENTIFIED BY password03;
CREATE USER user12 IDENTIFIED BY password20;
CREATE USER user13 IDENTIFIED BY password01;
CREATE USER user14 IDENTIFIED BY password02;
CREATE USER user15 IDENTIFIED BY password03;
CREATE USER user16 IDENTIFIED BY password20;
CREATE USER user17 IDENTIFIED BY password01;
CREATE USER user18 IDENTIFIED BY password02;
CREATE USER user19 IDENTIFIED BY password03;
CREATE USER user20 IDENTIFIED BY password20;

/*
-- 2
Sinh viên lần lượt tạo các role sau: 
- Role_QUANTRI: sao cho các tài khoản toàn quyền thao tác đối với 
CSDL ở bài tập 3. 
- Role_NGUOIDUNG: sao cho các tài khoản chỉ được phép truy vấn 
dữ liệu đối với CSDL ở bài tập 3. 
*/
CREATE ROLE Role_QUANTRI;
GRANT ALL PRIVILEGES TO Role_QUANTRI;

CREATE ROLE Role_NGUOIDUNG;
GRANT SELECT ANY TABLE TO Role_NGUOIDUNG;

-- 3. Gán Role_QUANTRI cho các tài khoản (user01 -> user10). 
GRANT Role_QUANTRI 
TO user01, user02, user03, user04, user05, user06, user07, user08, user09, user10;


-- 4. Gán Role_NGUOIDUNG cho các tài khoản còn lại. 
GRANT Role_NGUOIDUNG 
TO user11, user12, user13, user14, user15, user16, user17, user18, user19, user20;


-- 5. Thu hồi quyền quản trị đối với các tài khoản: user01, user03, user05. 
REVOKE Role_QUANTRI FROM user01, user03, user05;




------------------------------------------------------ TH3 Bai 4 , 5 & 6 ------------------------------------------------------

ALTER SESSION SET CURRENT_SCHEMA = SINHVIEN02;

/*
    Bai 4
*/


SELECT * FROM class;
SELECT * FROM course;
SELECT * FROM enrollment;
SELECT * FROM grade;
SELECT * FROM instructor;
SELECT * FROM student;

DECLARE
    -- Cursor lấy thông tin môn học và số lượng sinh viên đăng ký
    CURSOR course_cursor IS
        SELECT c.CourseNo, c.Description, cl.ClassID, COUNT(e.StudentID) AS num_students
        FROM COURSE c
          JOIN CLASS cl ON c.CourseNo = cl.CourseNo
          LEFT JOIN ENROLLMENT e ON cl.ClassID = e.ClassID
        GROUP BY c.CourseNo, c.Description, cl.ClassID;

    -- Biến lưu trữ thông tin môn học và số lượng sinh viên đăng ký
    v_course_number COURSE.CourseNo%TYPE;
    v_description COURSE.Description%TYPE;
    v_class_id CLASS.ClassID%TYPE;
    v_num_students NUMBER;
BEGIN
    -- Mở cursor và lặp qua từng hàng để in thông tin
    OPEN course_cursor;
    LOOP
        FETCH course_cursor INTO v_course_number, v_description, v_class_id, v_num_students;
        EXIT WHEN course_cursor%NOTFOUND;

        -- In thông tin môn học và số lượng sinh viên đăng ký
        DBMS_OUTPUT.PUT_LINE(v_course_number || ' ' || v_description);
        DBMS_OUTPUT.PUT_LINE('    Lop: ' || v_class_id || ' co so luong sinh vien dang ky: ' || v_num_students);
    END LOOP;
    CLOSE course_cursor;
END;
/

-------------------------------

DECLARE
	CURSOR course_cursor IS
		SELECT CourseNo, description FROM course;

	v_course_no COURSE.CourseNo%TYPE;
	v_description COURSE.Description%TYPE;
	v_classid CLASS.ClassID%TYPE;
	v_num_students NUMBER;

	CURSOR class_cursor (p_course_no COURSE.CourseNo%TYPE) IS
		SELECT cl.classID, count (*) AS num_students
		FROM course c
			JOIN class cl ON c.CourseNo = cl.CourseNo
			LEFT JOIN enrollment e ON c.CourseNo = cl.CourseNo
		WHERE c.CourseNo = p_course_no
		GROUP BY cl.ClassID;

BEGIN
	OPEN course_cursor;
	LOOP
		FETCH course_cursor INTO v_course_no, v_description;
		EXIT WHEN course_cursor%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(v_course_no || ' ' || v_description);

		OPEN class_cursor (v_course_no);
		LOOP
			FETCH class_cursor INTO v_classid, v_num_students;
			EXIT WHEN class_cursor%NOTFOUND;
			DBMS_OUTPUT.PUT_LINE('    Lop: ' || v_classid || ' co so luong sinh vien dang ky: ' || v_num_students);
		END LOOP;
		CLOSE class_cursor;
	
		END LOOP;
	
	CLOSE course_cursor;
END;

	----------------------------------------------




/*
    Bai 5
*/


/*
-------------------------- 1.a --------------------------
a. Thủ tục find_sname có 1 thông số truyền vào (i_student_id), và 2 thông 
số trả về (o_first_name ,o_last_name) là họ và tên tương ứng của sinh 
viên với mã số truyền vào.
*/
CREATE OR REPLACE PROCEDURE find_sname (
    i_student_id IN STUDENT.StudentID%TYPE,
    o_first_name OUT STUDENT.FirstName%TYPE,
    o_last_name OUT STUDENT.LastName%TYPE
)
IS
BEGIN
    SELECT FirstName, LastName
    INTO o_first_name, o_last_name
    FROM STUDENT
    WHERE StudentID = i_student_id;
END find_sname;
/

DECLARE
    v_student_id STUDENT.StudentID%TYPE := 112; -- Đặt mã số sinh viên bạn muốn tìm ở đây
    v_first_name STUDENT.FirstName%TYPE;
    v_last_name STUDENT.LastName%TYPE;
BEGIN
    -- Gọi thủ tục để lấy họ và tên của sinh viên
    find_sname(v_student_id, v_first_name, v_last_name);
    
    -- In kết quả
    IF v_first_name IS NULL AND v_last_name IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Không tìm thấy sinh viên có mã số ' || v_student_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Họ và tên của sinh viên có mã số ' || v_student_id || ' là: ' || v_first_name || ' ' || v_last_name);
    END IF;
END;
/



/*
-------------------------- 1.b --------------------------
b. Thủ tục print_student_name in ra tên của sinh viên với mã số là đối số 
truyền vào của thủ tục. 
*/
CREATE OR REPLACE PROCEDURE print_student_name (
    i_student_id IN STUDENT.StudentID%TYPE
)
IS
    v_first_name STUDENT.FirstName%TYPE;
    v_last_name STUDENT.LastName%TYPE;
BEGIN
    -- Gọi thủ tục để lấy họ và tên của sinh viên
    find_sname(i_student_id, v_first_name, v_last_name);
    
    -- In kết quả
    IF v_first_name IS NULL AND v_last_name IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Không tìm thấy sinh viên có mã số ' || i_student_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Họ và tên của sinh viên có mã số ' || i_student_id || ' là: ' || v_first_name || ' ' || v_last_name);
    END IF;
END print_student_name;
/


BEGIN
    print_student_name(102); -- Thay 102 bằng mã số sinh viên bạn muốn tìm
END;
/

/*
-------------------------- 2. --------------------------
Viết thủ tục Discount giảm giá 5% cho tất cả các môn học có số sinh viên 
đăng kí nhiều hơn 15 sinh viên. Ứng với mỗi môn học được giảm giá in ra 
tên môn học đó. 
*/
CREATE OR REPLACE PROCEDURE Discount AS
    v_course_name course.description%TYPE;
    v_count NUMBER;
BEGIN
    FOR course_rec IN (
        SELECT c.description, COUNT(e.studentid) AS cnt
        FROM course c
            JOIN class cl ON c.courseno = cl.courseno
            JOIN enrollment e ON E.CLASSID = cl.CLASSID
        GROUP BY c.description
        HAVING COUNT(e.studentid) > 15
    ) LOOP
        v_course_name := course_rec.description;
        v_count := course_rec.cnt;
        
        -- Áp dụng giảm giá 5% cho môn học
        DBMS_OUTPUT.PUT_LINE(v_count ||  ' Áp dụng giảm giá 5% cho môn học: ' || v_course_name);
        
        UPDATE course
        SET cost = cost * 0.95
        WHERE description = v_course_name;
    END LOOP;
END Discount;
/

SELECT * FROM course


BEGIN
    Discount;
END;
/


/*
-------------------------- 3. --------------------------
Viết hàm Total_cost_for_student nhận vào mã số của sinh viên tra về tổng 
chi phí mà sinh viên đó phải trả. Trả về NULL nếu không tồn tại sinh viên 
tương ứng.
*/

CREATE OR REPLACE FUNCTION Total_cost_for_student (
    i_student_id IN STUDENT.StudentID%TYPE
) RETURN NUMBER
IS
    v_total_cost NUMBER := 0;
BEGIN
    SELECT SUM(c.Cost)
    INTO v_total_cost
    FROM ENROLLMENT e
    JOIN CLASS cl ON e.ClassID = cl.ClassID
    JOIN COURSE c ON cl.CourseNo = c.CourseNo
    WHERE e.StudentID = i_student_id;

    RETURN v_total_cost;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;
END Total_cost_for_student;
/


DECLARE
    v_student_id STUDENT.StudentID%TYPE := 102; -- Thay đổi mã số sinh viên cần kiểm tra
    v_total_cost NUMBER;
BEGIN
    v_total_cost := Total_cost_for_student(v_student_id);
    IF v_total_cost IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('Không tồn tại sinh viên có mã số ' || v_student_id);
    ELSE
        DBMS_OUTPUT.PUT_LINE('Tổng chi phí của sinh viên có mã số ' || v_student_id || ' là: ' || v_total_cost);
    END IF;
END;
/






/*
    Bai 6
*/

-------------------------- 1. --------------------------
-- trigger class
CREATE OR REPLACE TRIGGER class_trigger
BEFORE INSERT OR UPDATE ON class
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.CreatedBy := USER;
        :NEW.CreatedDate := SYSDATE;
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
    
    IF UPDATING THEN
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
END;
/

-- trigger course
CREATE OR REPLACE TRIGGER course_trigger
BEFORE INSERT OR UPDATE ON course
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.CreatedBy := USER;
        :NEW.CreatedDate := SYSDATE;
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
    
    IF UPDATING THEN
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
END;
/

INSERT INTO course VALUES (999,'Database management',NULL,350,'DSCHERER','29-MAR-99','ARISCHER','05-APR-99');                                                                                        


-- trigger enrollment
CREATE OR REPLACE TRIGGER enrollment_trigger
BEFORE INSERT OR UPDATE ON enrollment
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.CreatedBy := USER;
        :NEW.CreatedDate := SYSDATE;
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
    
    IF UPDATING THEN
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
END;
/

-- trigger grade
CREATE OR REPLACE TRIGGER grade_trigger
BEFORE INSERT OR UPDATE ON grade
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.CreatedBy := USER;
        :NEW.CreatedDate := SYSDATE;
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
    
    IF UPDATING THEN
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
END;
/

-- trigger instructor 
CREATE OR REPLACE TRIGGER instructor_trigger
BEFORE INSERT OR UPDATE ON instructor
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.CreatedBy := USER;
        :NEW.CreatedDate := SYSDATE;
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
    
    IF UPDATING THEN
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
END;
/


-- trigger student
CREATE OR REPLACE TRIGGER student_trigger
BEFORE INSERT OR UPDATE ON student
FOR EACH ROW
BEGIN
    IF INSERTING THEN
        :NEW.CreatedBy := USER;
        :NEW.CreatedDate := SYSDATE;
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
    
    IF UPDATING THEN
        :NEW.ModifiedBy := USER;
        :NEW.ModifiedDate := SYSDATE;
    END IF;
END;
/


-------------------------- 2. --------------------------
-- Viết trigger hiện thực yêu cầu sau: mỗi sinh viên không được đăng kí quá 4 môn học. 
CREATE OR REPLACE TRIGGER check_enrollment_limit
BEFORE INSERT OR UPDATE ON ENROLLMENT
FOR EACH ROW
DECLARE
    v_enrollment_count NUMBER;
BEGIN
    -- Đếm số lượng môn học mà sinh viên đã đăng ký
    SELECT COUNT(*) INTO v_enrollment_count
    FROM ENROLLMENT
    WHERE StudentID = :NEW.StudentID;

    -- Kiểm tra xem số lượng môn học đã đăng ký vượt quá giới hạn không
    IF v_enrollment_count >= 4 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Sinh viên không được đăng ký quá 4 môn học.');
    END IF;
END;
/