ALTER SESSION SET CURRENT_SCHEMA = SINHVIEN02;

/*
    Bai 4
*/

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





/*
    Bai 5
*/

-------------------------- 1.a --------------------------

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




-------------------------- 1.b --------------------------

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


-------------------------- 2. --------------------------
CREATE OR REPLACE PROCEDURE Discount AS
    v_course_name course.description%TYPE;
BEGIN
    FOR course_rec IN (
        SELECT c.description
        FROM course c
        JOIN class cl ON c.courseno = cl.courseno
        GROUP BY c.description
        HAVING COUNT(cl.studentid) > 15
    ) LOOP
        v_course_name := course_rec.description;
        
        -- Áp dụng giảm giá 5% cho môn học
        DBMS_OUTPUT.PUT_LINE('Áp dụng giảm giá 5% cho môn học: ' || v_course_name);
        
        UPDATE course
        SET price = price * 0.95
        WHERE description = v_course_name;
    END LOOP;
END Discount;
/


BEGIN
    Discount;
END;
/

-------------------------- 3. --------------------------

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

