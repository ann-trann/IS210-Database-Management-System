ALTER SESSION SET CURRENT_SCHEMA = QL_THUVIEN;


----------------------------------------------------------------------------------------------------------------------------------------------------------------

/*
    4.Bài tập Stored Procedure 
*/

-- 4.1. Xem thông tin độc giả

CREATE OR REPLACE PROCEDURE sp_ThongtinDocgia(
    v_MaDocGia NUMBER
) IS
    v_count NUMBER;
    v_docgia Docgia%ROWTYPE;
    v_nguoilon Nguoilon%ROWTYPE;
    v_treem Treem%ROWTYPE;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM nguoilon
    WHERE Ma_DocGia = v_MaDocGia;

    SELECT * INTO v_docgia
        FROM docgia
        WHERE MA_DOCGIA = v_MaDocGia;
        DBMS_OUTPUT.PUT_LINE('Ten: ' || v_docgia.HO || ' ' || v_docgia.TENLOT || ' ' || v_docgia.TEN ||'    Ngay sinh: ' || v_docgia.NGAYSINH);
        
    IF v_count = 1 THEN
        SELECT * INTO v_nguoilon
        FROM nguoilon
        WHERE MA_DOCGIA = v_MaDocGia;
        DBMS_OUTPUT.PUT_LINE('Dia chi: ' || v_nguoilon.SONHA|| ', ' || v_nguoilon.DUONG || ', quan ' || v_nguoilon.QUAN || '   SDT: ' || v_nguoilon.DIENTHOAI || '    HanSD: ' || v_nguoilon.HAN_SD);
    
    ELSE
        SELECT * INTO v_treem
        FROM treem
        WHERE MA_DOCGIA = v_MaDocGia;
        DBMS_OUTPUT.PUT_LINE('Ma doc gia nguoi lon: ' || v_treem.MA_DOCGIA_NGUOILON);
     END IF;
END;
/

DECLARE
    v_madocgia NUMBER := 1;
BEGIN
    DBMS_OUTPUT.PUT_LINE('THONG TIN DOC GIA MA: ' || V_MADOCGIA);
    sp_ThongtinDocgia(v_madocgia);
END;
/



----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.2. Thông tin đầu sách 

CREATE OR REPLACE PROCEDURE sp_ThongtinDausach(
    v_isbn NUMBER
) IS
    count_sachchuamuon NUMBER;
    v_dausach Dausach%ROWTYPE;
    v_tuasach Tuasach%ROWTYPE;
BEGIN
    SELECT COUNT(*) INTO COUNT_SACHCHUAMUON
    FROM CUONSACH
    WHERE ISBN = V_ISBN AND TINHTRANG = 'Y';

    SELECT * INTO V_DAUSACH
    FROM DAUSACH
    WHERE ISBN = V_ISBN;

    SELECT t.* INTO V_TUASACH
    FROM TUASACH t
        JOIN DAUSACH d ON T.MA_TUASACH = D.MA_TUASACH
    WHERE d.ISBN = V_ISBN;

    DBMS_OUTPUT.PUT_LINE('Ngon ngu: ' || v_dausach.NGONNGU || '   Bia: ' || v_dausach.BIA || '  So luong sach chua duoc muon: ' || COUNT_SACHCHUAMUON);
    DBMS_OUTPUT.PUT_LINE('Ma tua sach: ' || v_tuasach.MA_TUASACH || '   Ten:' || v_tuasach.TUASACH || '   Tac gia: ' || v_tuasach.TACGIA);
END;
/

DECLARE
    v_isbn NUMBER := 410;
BEGIN
    DBMS_OUTPUT.PUT_LINE('THONG TIN DAU SACH MA: ' || V_ISBN);
    sp_ThongtinDausach(v_isbn);
END;
/


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.3. Liệt kê những độc giả người lớn đang mượn sách 

CREATE OR REPLACE PROCEDURE sp_ThongtinNguoilonDangmuon IS
BEGIN 
    FOR v_nguoilon IN (
        SELECT DISTINCT d.*
        FROM docgia d 
            JOIN nguoilon n ON N.MA_DOCGIA = d.MA_DOCGIA
            JOIN muon m ON N.MA_DOCGIA = m.MA_DOCGIA
    )
    LOOP 
        DBMS_OUTPUT.PUT_LINE('Ma: ' || v_nguoilon.MA_DOCGIA || '    Ten: ' || v_nguoilon.HO || ' ' || v_nguoilon.TENLOT || ' ' || v_nguoilon.TEN ||'    Ngay sinh: ' || v_nguoilon.NGAYSINH);
    END LOOP;    
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('THONG TIN DOC GIA NGUOI LON DANG MUON SACH ');
    sp_ThongtinNguoilonDangmuon;
END;
/


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.4. Liệt kê những độc giả người lớn đang mượn sách quá hạn

CREATE OR REPLACE PROCEDURE sp_ThongtinNguoilonQuahan IS
BEGIN 
    FOR v_nguoilon IN (
        SELECT DISTINCT d.*
        FROM docgia d 
            JOIN nguoilon n ON N.MA_DOCGIA = d.MA_DOCGIA
            JOIN muon m ON N.MA_DOCGIA = m.MA_DOCGIA
            LEFT JOIN QUATRINHMUON q ON D.MA_DOCGIA = Q.MA_DOCGIA
                                AND M.MA_CUONSACH = q.MA_CUONSACH
                                AND q.ISBN = M.ISBN 
                                AND M.NGAY_MUON = Q.NGAY_MUON
        WHERE q.NGAY_TRA IS NULL
        ORDER BY D.MA_DOCGIA
    )
    LOOP 
        DBMS_OUTPUT.PUT_LINE('Ma: ' || v_nguoilon.MA_DOCGIA || '    Ten: ' || v_nguoilon.HO || ' ' || v_nguoilon.TENLOT || ' ' || v_nguoilon.TEN ||'    Ngay sinh: ' || v_nguoilon.NGAYSINH);
    END LOOP;    
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE('THONG TIN DOC GIA NGUOI LON DANG MUON SACH QUA HAN');
    sp_ThongtinNguoilonQuahan;
END;
/


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.5. Liệt kê những độc giả người lớn đang mượn sách có trẻ em cũng đang mượn sách 

CREATE OR REPLACE PROCEDURE sp_DocGiaCoTreEmMuon IS
BEGIN
    FOR v_nguoilon IN (
        SELECT DISTINCT d.*
        FROM docgia d 
            JOIN nguoilon n ON N.MA_DOCGIA = d.MA_DOCGIA
            JOIN TREEM t ON N.MA_DOCGIA = T.MA_DOCGIA_NGUOILON
            JOIN muon m ON N.MA_DOCGIA = m.MA_DOCGIA
            LEFT JOIN QUATRINHMUON q ON D.MA_DOCGIA = Q.MA_DOCGIA
                                AND M.MA_CUONSACH = q.MA_CUONSACH
                                AND q.ISBN = M.ISBN 
                                AND M.NGAY_MUON = Q.NGAY_MUON
        WHERE q.NGAY_TRA IS NULL
        ORDER BY D.MA_DOCGIA
    )
    LOOP 
        DBMS_OUTPUT.PUT_LINE('Ma: ' || v_nguoilon.MA_DOCGIA || '    Ten: ' || v_nguoilon.HO || ' ' || v_nguoilon.TENLOT || ' ' || v_nguoilon.TEN ||'    Ngay sinh: ' || v_nguoilon.NGAYSINH);
    END LOOP; 
END;
/


BEGIN
    DBMS_OUTPUT.PUT_LINE('THONG TIN DOC GIA NGUOI LON DANG MUON SACH CO TRE EM CUNG DANG MUON SACH');
    sp_DocGiaCoTreEmMuon;
END;
/



----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.6. Cập nhật trạng thái của đầu sách 

CREATE OR REPLACE PROCEDURE sp_CapnhatTrangthaiDausach(
    v_isbn NUMBER
) AS
    v_count NUMBER := 0;
BEGIN
    SELECT count(*) INTO V_COUNT
    FROM CUONSACH
    WHERE ISBN = V_ISBN;

    IF V_COUNT > 0 THEN
        UPDATE DAUSACH
        SET TRANGTHAI = 'Y'
        WHERE ISBN = V_ISBN;
    ELSE  
        UPDATE DAUSACH
        SET TRANGTHAI = 'N'
        WHERE ISBN = V_ISBN;
    END IF;
END;
/

DECLARE
    v_isbn NUMBER := 109;
BEGIN
    sp_CapnhatTrangthaiDausach(v_isbn);
    DBMS_OUTPUT.PUT_LINE('DA CAP NHAT TRANG THAI DAU SACH CO ISBN ' || v_isbn);
END;
/


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.7. Thêm tựa sách mới 

CREATE OR REPLACE PROCEDURE sp_ThemTuaSach (
    v_tuasach tuasach.tuasach%TYPE,
    v_tacgia tuasach.tacgia%TYPE,
    v_tomtat tuasach.tomtat%type
) AS
    v_ma_tuasach tuasach.ma_tuasach%TYPE;
    v_count NUMBER;
BEGIN
    -- Xac dinh ma tua sach
    SELECT nvl(MAX(ma_tuasach), 0) + 1 INTO V_MA_TUASACH FROM TUASACH;
    FOR i IN 1..V_MA_TUASACH LOOP
        BEGIN
            SELECT MA_TUASACH INTO V_MA_TUASACH FROM TUASACH WHERE MA_TUASACH = i;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_ma_tuasach := i;
                EXIT;
        END;
    END LOOP;
    
    -- Kiem tra thuoc tinh
    SELECT COUNT(*) INTO v_count
    FROM TUASACH
    WHERE TUASACH = v_tuasach 
          AND TACGIA = v_tacgia
          AND TOMTAT = v_tomtat;

    IF V_COUNT > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Thêm tựa sách lỗi');

    ELSE 
        INSERT INTO TUASACH (MA_TUASACH, TUASACH, TACGIA, TOMTAT)
        VALUES (v_ma_tuasach, v_tuasach, v_tacgia, v_tomtat);

        DBMS_OUTPUT.PUT_LINE('Thêm tựa sách mới thành công với mã tựa sách: ' || v_ma_tuasach);
    END IF;
END;
/


DECLARE
    v_tuasach tuasach.tuasach%TYPE := 'Gone with the wind';
    v_tacgia tuasach.tacgia%TYPE := 'Margaret Mitchell';
    v_tomtat tuasach.tomtat%TYPE;
BEGIN
    sp_ThemTuaSach(V_TUASACH, V_TACGIA, V_TOMTAT);
END;
/


----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.8. Thêm cuốn sách mới 
CREATE OR REPLACE PROCEDURE sp_ThemCuonSach(
    v_isbn CUONSACH.ISBN%TYPE
) AS
    v_exist NUMBER;
    v_ma_cuonsach CUONSACH.MA_CUONSACH%TYPE;
BEGIN
    -- Kiem tra ma isbn
    SELECT COUNT(*) INTO V_EXIST
    FROM DAUSACH
    WHERE ISBN = V_ISBN;

    IF V_EXIST = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Mã ISBN không tồn tại.');
        RETURN;
    END IF;

    -- Xac dinh ma cuon sach
    SELECT nvl(MAX(ma_cuonsach), 0) + 1 INTO V_MA_CUONSACH
    FROM CUONSACH
    WHERE ISBN = V_ISBN;

    FOR i IN 1..V_MA_CUONSACH LOOP
        BEGIN
            SELECT MA_CUONSACH INTO V_MA_CUONSACH FROM CUONSACH WHERE MA_CUONSACH = i AND ISBN = V_ISBN;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                v_ma_cuonsach := i;
                EXIT;
        END;
    END LOOP;

    -- Them cuon sach
    INSERT INTO CUONSACH (ISBN, MA_CUONSACH, TINHTRANG) VALUES (V_ISBN, V_MA_CUONSACH, 'Y');
    DBMS_OUTPUT.PUT_LINE('Thêm cuốn sách mới thành công');
    DBMS_OUTPUT.PUT_LINE('ISBN: ' || V_ISBN || '  Ma: ' || V_MA_CUONSACH || '  Tinh trang: Y');

    -- Thay doi trang thai dau sach
    UPDATE DAUSACH
    SET TRANGTHAI = 'Y'
    WHERE ISBN = V_ISBN;
END;
/


DECLARE
    v_isbn CUONSACH.ISBN%TYPE := 129;
BEGIN
    sp_ThemCuonSach(V_ISBN);
END;
/



----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



 -- 4.9. Thêm độc giả người lớn 

CREATE OR REPLACE PROCEDURE sp_ThemNguoilon (
    v_ho DOCGIA.HO%TYPE,
    v_tenlot DOCGIA.TENLOT%TYPE,
    v_ten DOCGIA.TEN%TYPE,
    v_ngaysinh DOCGIA.NGAYSINH%TYPE,
    v_sonha NGUOILON.SONHA%TYPE,
    v_duong NGUOILON.DUONG%TYPE,
    v_quan NGUOILON.QUAN%TYPE,
    v_dienthoai NGUOILON.DIENTHOAI%TYPE,
    v_hansd NGUOILON.HAN_SD%TYPE
) AS
    v_madocgia DOCGIA.MA_DOCGIA%TYPE;
BEGIN
    -- Xac dinh ma doc gia
    SELECT nvl(MAX(ma_docgia), 0) + 1 INTO V_MADOCGIA
    FROM DOCGIA;

    FOR i IN 1..v_madocgia LOOP
        BEGIN
            SELECT ma_docgia INTO V_MADOCGIA FROM docgia WHERE MA_docgia = i;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                V_MADOCGIA := i;
                EXIT;
        END;
    END LOOP;

    -- Them du lieu vao bang doc gia
    INSERT INTO docgia (MA_docgia, ho, tenlot, ten, ngaysinh) VALUES (v_madocgia, v_ho, v_tenlot, v_ten, v_ngaysinh);
    DBMS_OUTPUT.PUT_LINE('Thêm độc giả thành công, MA_DOCGIA: ' || V_MADOCGIA);

    -- Kiem tra doc gia du 18 tuoi
    IF MONTHS_BETWEEN(SYSDATE, v_ngaysinh) / 12 >= 18 THEN
        INSERT INTO nguoilon (ma_docgia, sonha, duong, quan, dienthoai, han_sd) VALUES (v_madocgia, v_sonha, v_duong, v_quan, v_dienthoai, v_hansd);
        DBMS_OUTPUT.PUT_LINE('Thêm độc giả người lớn thành công, MA_DOCGIA: ' || V_MADOCGIA);
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Error: Tuổi độc giả chưa đủ 18');
    END IF;
END;
/


DECLARE
    v_ho DOCGIA.HO%TYPE := 'Tran';
    v_tenlot DOCGIA.TENLOT%TYPE := 'T';
    v_ten DOCGIA.TEN%TYPE := 'An';
    v_ngaysinh DOCGIA.NGAYSINH%TYPE := '21-JUN-04';
    v_sonha NGUOILON.SONHA%TYPE := '1';
    v_duong NGUOILON.DUONG%TYPE := 'Tan Chau';
    v_quan NGUOILON.QUAN%TYPE := '1';
    v_dienthoai NGUOILON.DIENTHOAI%TYPE;
    v_hansd NGUOILON.HAN_SD%TYPE;
BEGIN
    sp_ThemNguoilon(v_ho, v_tenlot, v_ten, v_ngaysinh,
                    v_sonha, v_duong, v_quan, v_dienthoai, v_hansd);
END;
/



----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.10. Thêm độc giả trẻ em 

CREATE OR REPLACE PROCEDURE sp_ThemTreEm (
    v_ho DOCGIA.HO%TYPE,
    v_tenlot DOCGIA.TENLOT%TYPE,
    v_ten DOCGIA.TEN%TYPE,
    v_ngaysinh DOCGIA.NGAYSINH%TYPE,
    v_nguoilon DOCGIA.MA_DOCGIA%TYPE
) AS
    v_madocgia DOCGIA.MA_DOCGIA%TYPE;
    v_count NUMBER;
BEGIN
    -- Xac dinh ma doc gia
    SELECT nvl(MAX(ma_docgia), 0) + 1 INTO V_MADOCGIA
    FROM DOCGIA;

    FOR i IN 1..v_madocgia LOOP
        BEGIN
            SELECT ma_docgia INTO V_MADOCGIA FROM docgia WHERE MA_docgia = i;
        EXCEPTION
            WHEN NO_DATA_FOUND THEN
                V_MADOCGIA := i;
                EXIT;
        END;
    END LOOP;

    -- Them du lieu vao bang doc gia
    INSERT INTO docgia (MA_docgia, ho, tenlot, ten, ngaysinh) VALUES (v_madocgia, v_ho, v_tenlot, v_ten, v_ngaysinh);
    DBMS_OUTPUT.PUT_LINE('Thêm độc giả thành công, MA_DOCGIA: ' || V_MADOCGIA);

    -- Dem so tre em cua nguoi bao lanh
    SELECT COUNT(*) INTO V_COUNT
    FROM TREEM
    WHERE MA_DOCGIA_NGUOILON = V_NGUOILON;
    
    -- Kiem tra thoa quy dinh
    IF V_COUNT < 2 THEN
        INSERT INTO treem (ma_docgia, ma_docgia_nguoilon) VALUES (v_madocgia, V_NGUOILON);
        DBMS_OUTPUT.PUT_LINE('Thêm độc giả trẻ em thành công, MA_DOCGIA: ' || V_MADOCGIA);
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Error: Độc giả người lớn chỉ có thể bảo lãnh tối đa cho 2 trẻ em');
    END IF;
END;
/


DECLARE
    v_ho DOCGIA.HO%TYPE := 'Tran';
    v_tenlot DOCGIA.TENLOT%TYPE := 'T';
    v_ten DOCGIA.TEN%TYPE := 'An';
    v_ngaysinh DOCGIA.NGAYSINH%TYPE := '21-JUN-09';
    v_nguoilon DOCGIA.MA_DOCGIA%TYPE := 102;
BEGIN
    sp_ThemTreEm(v_ho, v_tenlot, v_ten, v_ngaysinh, v_nguoilon);
END;
/



----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.11. Xóa độc giả 

CREATE OR REPLACE PROCEDURE sp_XoaDocGia(
    v_madocgia DOCGIA.MA_DOCGIA%TYPE
) AS
    v_exist NUMBER;
    v_muon NUMBER;
    v_nguoilon NUMBER;
    v_count NUMBER;
BEGIN
-- Kiem tra doc gia co ton tai
    SELECT COUNT(*) INTO V_EXIST
    FROM DOCGIA
    WHERE MA_DOCGIA = V_MADOCGIA;

    IF V_EXIST = 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Độc giả không tồn tại.');
        RETURN;
    END IF;

-- Kiem tra doc gia co dang muon sach
    SELECT COUNT(*) INTO V_MUON
    FROM MUON m
        FULL OUTER JOIN QUATRINHMUON q ON M.ISBN = Q.ISBN
                            AND M.MA_CUONSACH = Q.MA_CUONSACH
                            AND M.MA_DOCGIA = Q.MA_DOCGIA
                            AND M.NGAY_MUON = Q.NGAY_MUON
    WHERE M.MA_DOCGIA = V_MADOCGIA
          AND Q.NGAY_TRA IS NULL;

    IF V_MUON > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Độc giả đang mượn sách, không thể xóa độc giả.');
        RETURN;
    END IF;

-- Kiem tra doc gia là nguoi lon hay tre em
    SELECT COUNT(*) INTO V_NGUOILON
    FROM NGUOILON
    WHERE MA_DOCGIA = V_MADOCGIA;

    -- Neu la nguoi lon
    IF V_NGUOILON = 1 THEN
        -- Kiem tra co dang bao lanh
        SELECT COUNT(*) INTO V_COUNT
        FROM TREEM
        WHERE MA_DOCGIA_NGUOILON = V_MADOCGIA;

        -- Khong bao lanh
        IF V_COUNT = 0 THEN
            DELETE FROM NGUOILON WHERE MA_DOCGIA = V_MADOCGIA;
            DELETE FROM QUATRINHMUON WHERE MA_DOCGIA = V_MADOCGIA;
            DELETE FROM DANGKY WHERE MA_DOCGIA = V_MADOCGIA;
            DELETE FROM DOCGIA WHERE MA_DOCGIA = V_MADOCGIA;
        -- Dang bao lanh
        ELSE
            DELETE FROM TREEM WHERE MA_DOCGIA_NGUOILON = V_MADOCGIA;
            DELETE FROM QUATRINHMUON WHERE MA_DOCGIA IN ( SELECT ma_docgia
                                                          FROM TREEM WHERE MA_DOCGIA_NGUOILON = V_MADOCGIA );
            DELETE FROM DANGKY WHERE MA_DOCGIA IN ( SELECT ma_docgia
                                                    FROM TREEM WHERE MA_DOCGIA_NGUOILON = V_MADOCGIA );

            DELETE FROM NGUOILON WHERE MA_DOCGIA = V_MADOCGIA;
            DELETE FROM QUATRINHMUON WHERE MA_DOCGIA = V_MADOCGIA;
            DELETE FROM DANGKY WHERE MA_DOCGIA = V_MADOCGIA;
            DELETE FROM DOCGIA WHERE MA_DOCGIA = V_MADOCGIA;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Xóa thành công độc giả người lớn');
     
     -- Neu la tre em
     ELSE  
        DELETE FROM TREEM WHERE MA_DOCGIA = V_MADOCGIA;
        DELETE FROM QUATRINHMUON WHERE MA_DOCGIA = V_MADOCGIA;
        DELETE FROM DANGKY WHERE MA_DOCGIA = V_MADOCGIA;
        DELETE FROM DOCGIA WHERE MA_DOCGIA = V_MADOCGIA;

        DBMS_OUTPUT.PUT_LINE('Xóa thành công độc giả trẻ em');
     END IF;
END;
/


DECLARE
    v_madocgia DOCGIA.MA_DOCGIA%TYPE := 102;
BEGIN
    sp_XoaDocGia(V_MADOCGIA);
END;
/



----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.12. Mượn sách

CREATE OR REPLACE PROCEDURE sp_MuonSach(
    v_isbn MUON.ISBN%TYPE,
    v_madocgia MUON.MA_DOCGIA%TYPE
) AS
    count_cungloai NUMBER;
    v_nguoilon NUMBER;
    count_nguoilon_muon NUMBER;
    count_treem_muon NUMBER;
    v_consach NUMBER;
    v_macuonsach MUON.MA_CUONSACH%TYPE;
    v_ktra NUMBER;
BEGIN
-- 1. Kiem tra co muon sach cung loai
    SELECT COUNT(*) INTO COUNT_CUNGLOAI
    FROM MUON m
        FULL OUTER JOIN QUATRINHMUON q ON M.ISBN = Q.ISBN
                            AND M.MA_CUONSACH = Q.MA_CUONSACH
                            AND M.MA_DOCGIA = Q.MA_DOCGIA
                            AND M.NGAY_MUON = Q.NGAY_MUON
    WHERE M.ISBN = V_ISBN AND M.MA_DOCGIA = V_MADOCGIA
          AND NGAY_TRA IS NULL;

    -- Cung loai
    IF COUNT_CUNGLOAI > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Error: Độc giả đang mượn cuốn sách cùng loại.');
        RETURN;
    END IF;
  
  
-- 2. Kiem tra so luong sach doc gia dang muon
    -- Kiem tra doc gia là nguoi lon hay tre em
    SELECT COUNT(*) INTO V_NGUOILON
    FROM NGUOILON
    WHERE MA_DOCGIA = V_MADOCGIA;
    
    -- La nguoi lon
    IF V_NGUOILON = 1 THEN
        -- so sach nguoi lon muon
        SELECT COUNT(*) INTO COUNT_NGUOILON_MUON
        FROM MUON
        WHERE MA_DOCGIA = V_MADOCGIA;
  
        -- so sach tre em muon
        SELECT COUNT(*) INTO COUNT_TREEM_MUON
        FROM MUON m
            JOIN TREEM t ON M.MA_DOCGIA = T.MA_DOCGIA
        WHERE T.MA_DOCGIA_NGUOILON = V_MADOCGIA;

        -- Neu so sach = 5 -> bao loi
        IF (COUNT_NGUOILON_MUON + COUNT_TREEM_MUON) >= 5 THEN
            DBMS_OUTPUT.PUT_LINE('Error: Độc giả chỉ được mượn tối đa 5 cuốn.');
            RETURN;
        END IF;
    
    -- La tre em
    ELSE
        -- Tinh so sach tre em muon
        SELECT COUNT(*) INTO COUNT_TREEM_MUON
        FROM MUON
        WHERE MA_DOCGIA = V_MADOCGIA;

        -- Neu < 1
        IF COUNT_TREEM_MUON >= 1 THEN
            DBMS_OUTPUT.PUT_LINE('Error: Độc giả trẻ em được mượn tối đa 1 cuốn.');
            RETURN;
        ELSE
            SELECT COUNT(*) INTO COUNT_NGUOILON_MUON
            FROM MUON m
                JOIN TREEM t ON M.MA_DOCGIA = T.MA_DOCGIA_NGUOILON
            WHERE T.MA_DOCGIA = 8;
            IF COUNT_NGUOILON_MUON >= 4 THEN
                DBMS_OUTPUT.PUT_LINE('Error: Độc giả người lớn chỉ được mượn tối đa 5 cuốn.');
                RETURN;
            END IF;
        END IF;
    END IF;

    
-- 3. Kiem tra con sach
    SELECT COUNT(*) INTO V_CONSACH
    FROM CUONSACH
    WHERE ISBN = V_ISBN AND TINHTRANG = 'Y';

     -- Con sach
    IF V_CONSACH > 0 THEN
        SELECT ma_cuonsach INTO V_MACUONSACH
        FROM CUONSACH
            WHERE ISBN = V_ISBN AND TINHTRANG = 'Y'
        ORDER BY ma_cuonsach
        FETCH FIRST ROW ONLY;

        -- Cập nhật
        INSERT INTO MUON(ISBN, MA_CUONSACH, MA_DOCGIA, NGAY_MUON, NGAY_HETHAN) VALUES (V_ISBN, V_MACUONSACH, V_MADOCGIA, SYSDATE, SYSDATE + 14);
        UPDATE CUONSACH SET TINHTRANG = 'Y' WHERE ISBN = V_ISBN AND MA_CUONSACH = V_MACUONSACH;
        
        -- Kiem tra so sach con lai
        SELECT COUNT(*) INTO V_KTRA
        FROM CUONSACH
        WHERE ISBN = V_ISBN AND TINHTRANG = 'Y';
        
        -- Khong con
        IF V_KTRA = 0 THEN
            UPDATE DAUSACH SET TRANGTHAI = 'N' WHERE ISBN = V_ISBN;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Mượn sách thành công.');

    -- Khong con sach
    ELSE 
        DBMS_OUTPUT.PUT_LINE('Sách không còn trong thư viện. Độc giả thêm vào chờ mượn sách.');
        INSERT INTO DANGKY(ISBN, MA_DOCGIA, NGAYGIO_DK, GHICHU) VALUES (V_ISBN, V_MADOCGIA, SYSDATE, null);        
    END IF;
END;
/

DECLARE
    v_isbn MUON.ISBN%TYPE := 42;
    v_madocgia MUON.MA_DOCGIA%TYPE := 71;
BEGIN
    sp_MuonSach(v_isbn, v_madocgia);
END;
/



----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 4.13. Trả sách 

CREATE OR REPLACE PROCEDURE sp_TraSach(
    v_isbn MUON.ISBN%TYPE,
    v_macuonsach MUON.MA_CUONSACH%TYPE,
    v_madocgia MUON.MA_DOCGIA%TYPE
)
AS
    v_ngaymuon muon.NGAY_MUON%TYPE;
    count_ngay NUMBER;
    v_tienphat NUMBER;
BEGIN 
    SELECT NGAY_MUON INTO V_NGAYMUON
    FROM MUON 
    WHERE ISBN = V_ISBN AND MA_CUONSACH = V_MACUONSACH AND MA_DOCGIA = V_MADOCGIA;

    count_ngay := ceil(SYSDATE - V_NGAYMUON);
    IF count_ngay > 14 THEN
        V_TIENPHAT := (COUNT_NGAY - 14) * 1000;
        DBMS_OUTPUT.PUT_LINE('Sách trả quá hạn. Tiền phạt: ' || V_TIENPHAT);
    END IF;

    INSERT INTO QUATRINHMUON(ISBN, ma_cuonsach, NGAY_MUON, MA_DOCGIA, NGAY_HETHAN, NGAY_TRA, TIEN_MUON, TIEN_DATRA, TIEN_DATCOC, GHICHU)
        VALUES(V_MADOCGIA, V_MACUONSACH, V_NGAYMUON, V_MADOCGIA, V_NGAYMUON + 14, SYSDATE, V_TIENPHAT, NULL, NULL, NULL);
    DELETE FROM MUON WHERE ISBN = V_ISBN AND MA_CUONSACH = V_MACUONSACH AND MA_DOCGIA = V_MADOCGIA;

    DBMS_OUTPUT.PUT_LINE('Đã trả sách');
END;
/

DECLARE
    v_isbn MUON.ISBN%TYPE := 764;
    v_macuonsach MUON.MA_CUONSACH%TYPE := 5;
    v_madocgia MUON.MA_DOCGIA%TYPE := 70;
BEGIN
    sp_TraSach(V_ISBN, V_MACUONSACH, V_MADOCGIA);
END;
/



----------------------------------------------------------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------------------------------------------------------



/*
      5. Bài tập Trigger 
*/

-- 5.1. tg_delMuon 
-- Nội dung: Cập nhật tình trạng của cuốn sách là yes. 

CREATE OR REPLACE TRIGGER tg_delMuon
AFTER DELETE ON MUON
FOR EACH ROW
BEGIN
    UPDATE cuonsach
    SET TINHTRANG = 'Y'
    WHERE ISBN = :OLD.ISBN AND MA_CUONSACH = :OLD.MA_CUONSACH;
    
    DBMS_OUTPUT.PUT_LINE('Cập nhật thành công tình trạng sách sau khi được trả.');
END;



----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 5.2. tg_insMuon 
-- Nội dung: Cập nhật tình trạng của cuốn sách là no. 

CREATE OR REPLACE TRIGGER tg_insMuon
AFTER INSERT ON MUON
FOR EACH ROW
BEGIN
    UPDATE cuonsach
    SET TINHTRANG = 'N'
    WHERE ISBN = :NEW.ISBN AND MA_CUONSACH = :NEW.MA_CUONSACH;
    
    DBMS_OUTPUT.PUT_LINE('Cập nhật thành công tình trạng sách sau khi được mượn.');
END;



----------------------------------------------------------------------------------------------------------------------------------------------------------------



-- 5.3. tg_updCuonSach 
-- Nội dung: Khi thuộc tính tình trạng trên bảng cuốn sách được cập nhật thì trạng thái của 
-- đầu sách cũng được cập nhật theo.


CREATE OR REPLACE TRIGGER tg_updCuonSach
AFTER UPDATE OF TINHTRANG ON CUONSACH
FOR EACH ROW
DECLARE
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO V_COUNT
    FROM dausach
    WHERE ISBN = :NEW.ISBN;

    IF V_COUNT > 0 THEN
        UPDATE DAUSACH
        SET TRANGTHAI = 'Y'
        WHERE ISBN = :NEW.ISBN;
    ELSE
        UPDATE DAUSACH
        SET TRANGTHAI = 'N'
        WHERE ISBN = :NEW.ISBN;
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('Cập nhật thành công trạng thái đầu sách sau khi cập nhật tình trạng sách.');
END;



---------------------------------------------------------------------------


SELECT * FROM TreEm;
SELECT * FROM DocGia;
SELECT * FROM NguoiLon;
SELECT * FROM TuaSach;
SELECT * FROM DauSach;
SELECT * FROM CuonSach;
SELECT * FROM Muon
SELECT * FROM QuaTrinhMuon;
SELECT * FROM DangKy;


---------------------------------------------------------------------------
