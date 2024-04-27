-- Tao Schema
alter session set "_ORACLE_SCRIPT"=true;
CREATE USER TH3_QLBH IDENTIFIED BY password;
GRANT CONNECT, RESOURCE, DBA TO TH3_QLBH;

-- Su dung Schema
ALTER SESSION SET CURRENT_SCHEMA = TH3_QLBH;

--------------------------------------------------------
--  File created - Thu ba-thang nam-09-2023   
--------------------------------------------------------
  DROP TABLE "CTHD" cascade constraints;
  DROP TABLE "HOADON" cascade constraints;
  DROP TABLE "KHACHHANG" cascade constraints;
  DROP TABLE "NHANVIEN" cascade constraints;
  DROP TABLE "SANPHAM" cascade constraints;
--------------------------------------------------------
--  DDL for Table CTHD
--------------------------------------------------------

  CREATE TABLE "CTHD" 
   (	"SOHD" NUMBER(*,0), 
	"MASP" CHAR(4), 
	"SL" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table HOADON
--------------------------------------------------------

  CREATE TABLE "HOADON" 
   (	"SOHD" NUMBER(*,0), 
	"NGHD" DATE, 
	"MAKH" CHAR(4), 
	"MANV" CHAR(4), 
	"TRIGIA" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table KHACHHANG
--------------------------------------------------------

  CREATE TABLE "KHACHHANG" 
   (	"MAKH" CHAR(4), 
	"HOTEN" VARCHAR2(40), 
	"DCHI" VARCHAR2(50), 
	"SODT" VARCHAR2(20), 
	"NGSINH" DATE, 
	"DOANHSO" NUMBER(*,0), 
	"NGDK" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table NHANVIEN
--------------------------------------------------------

  CREATE TABLE "NHANVIEN" 
   (	"MANV" CHAR(4), 
	"HOTEN" VARCHAR2(40), 
	"SODT" VARCHAR2(20), 
	"NGVL" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table SANPHAM
--------------------------------------------------------

  CREATE TABLE "SANPHAM" 
   (	"MASP" CHAR(4), 
	"TENSP" VARCHAR2(40), 
	"DVT" VARCHAR2(20), 
	"NUOCSX" VARCHAR2(40), 
	"GIA" NUMBER(*,0)
   ) ;

---------------------------------------------------
--   DATA FOR TABLE CTHD
--   FILTER = none used
---------------------------------------------------
REM INSERTING into CTHD
Insert into CTHD (SOHD,MASP,SL) values (1001,'TV02',10);
Insert into CTHD (SOHD,MASP,SL) values (1001,'ST01',5);
Insert into CTHD (SOHD,MASP,SL) values (1001,'BC01',5);
Insert into CTHD (SOHD,MASP,SL) values (1001,'BC02',10);
Insert into CTHD (SOHD,MASP,SL) values (1001,'ST08',10);
Insert into CTHD (SOHD,MASP,SL) values (1002,'BC04',20);
Insert into CTHD (SOHD,MASP,SL) values (1002,'BB01',20);
Insert into CTHD (SOHD,MASP,SL) values (1002,'BB02',20);
Insert into CTHD (SOHD,MASP,SL) values (1003,'BB03',10);
Insert into CTHD (SOHD,MASP,SL) values (1004,'TV01',20);
Insert into CTHD (SOHD,MASP,SL) values (1004,'TV02',10);
Insert into CTHD (SOHD,MASP,SL) values (1004,'TV03',10);
Insert into CTHD (SOHD,MASP,SL) values (1004,'TV04',10);
Insert into CTHD (SOHD,MASP,SL) values (1005,'TV05',50);
Insert into CTHD (SOHD,MASP,SL) values (1005,'TV06',50);
Insert into CTHD (SOHD,MASP,SL) values (1006,'TV07',20);
Insert into CTHD (SOHD,MASP,SL) values (1006,'ST01',30);
Insert into CTHD (SOHD,MASP,SL) values (1006,'ST02',10);
Insert into CTHD (SOHD,MASP,SL) values (1007,'ST03',10);
Insert into CTHD (SOHD,MASP,SL) values (1008,'ST04',8);
Insert into CTHD (SOHD,MASP,SL) values (1009,'ST05',10);
Insert into CTHD (SOHD,MASP,SL) values (1010,'TV07',50);
Insert into CTHD (SOHD,MASP,SL) values (1010,'ST07',50);
Insert into CTHD (SOHD,MASP,SL) values (1010,'ST08',100);
Insert into CTHD (SOHD,MASP,SL) values (1010,'ST04',50);
Insert into CTHD (SOHD,MASP,SL) values (1010,'TV03',100);
Insert into CTHD (SOHD,MASP,SL) values (1011,'ST06',50);
Insert into CTHD (SOHD,MASP,SL) values (1012,'ST07',3);
Insert into CTHD (SOHD,MASP,SL) values (1013,'ST08',5);
Insert into CTHD (SOHD,MASP,SL) values (1014,'BC02',80);
Insert into CTHD (SOHD,MASP,SL) values (1014,'BB02',100);
Insert into CTHD (SOHD,MASP,SL) values (1014,'BC04',60);
Insert into CTHD (SOHD,MASP,SL) values (1014,'BB01',50);
Insert into CTHD (SOHD,MASP,SL) values (1015,'BB02',30);
Insert into CTHD (SOHD,MASP,SL) values (1015,'BB03',7);
Insert into CTHD (SOHD,MASP,SL) values (1016,'TV01',5);
Insert into CTHD (SOHD,MASP,SL) values (1017,'TV02',1);
Insert into CTHD (SOHD,MASP,SL) values (1017,'TV03',1);
Insert into CTHD (SOHD,MASP,SL) values (1017,'TV04',5);
Insert into CTHD (SOHD,MASP,SL) values (1018,'ST04',6);
Insert into CTHD (SOHD,MASP,SL) values (1019,'ST05',1);
Insert into CTHD (SOHD,MASP,SL) values (1019,'ST06',2);
Insert into CTHD (SOHD,MASP,SL) values (1020,'ST07',10);
Insert into CTHD (SOHD,MASP,SL) values (1021,'ST08',5);
Insert into CTHD (SOHD,MASP,SL) values (1021,'TV01',7);
Insert into CTHD (SOHD,MASP,SL) values (1021,'TV02',10);
Insert into CTHD (SOHD,MASP,SL) values (1022,'ST07',1);
Insert into CTHD (SOHD,MASP,SL) values (1023,'ST04',6);

---------------------------------------------------
--   END DATA FOR TABLE CTHD
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE HOADON
--   FILTER = none used
---------------------------------------------------
REM INSERTING into HOADON
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1001,to_timestamp('23-07-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH01','NV01',320000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1002,to_timestamp('12-08-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH01','NV02',840000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1003,to_timestamp('23-08-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH02','NV01',100000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1004,to_timestamp('01-09-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH02','NV01',180000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1005,to_timestamp('20-10-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH01','NV02',3800000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1006,to_timestamp('16-10-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH01','NV03',2430000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1007,to_timestamp('28-10-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH03','NV03',510000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1008,to_timestamp('28-10-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH01','NV03',440000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1009,to_timestamp('28-10-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH03','NV04',200000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1010,to_timestamp('01-11-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH01','NV01',5200000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1011,to_timestamp('04-11-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH04','NV03',250000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1012,to_timestamp('30-11-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH05','NV03',21000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1013,to_timestamp('12-12-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH06','NV01',5000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1014,to_timestamp('31-12-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH03','NV02',3150000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1015,to_timestamp('01-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH06','NV01',910000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1016,to_timestamp('01-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH07','NV02',12500);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1017,to_timestamp('02-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH08','NV03',35000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1018,to_timestamp('13-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH08','NV03',330000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1019,to_timestamp('13-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH01','NV03',30000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1020,to_timestamp('14-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH09','NV04',70000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1021,to_timestamp('16-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),'KH10','NV03',67500);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1022,to_timestamp('16-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),null,'NV03',7000);
Insert into HOADON (SOHD,NGHD,MAKH,MANV,TRIGIA) values (1023,to_timestamp('17-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),null,'NV01',330000);

---------------------------------------------------
--   END DATA FOR TABLE HOADON
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE KHACHHANG
--   FILTER = none used
---------------------------------------------------
REM INSERTING into KHACHHANG
Insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','08823451',to_timestamp('22-10-1960 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),13060000,to_timestamp('22-07-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','0908256478',to_timestamp('03-04-1974 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),280000,to_timestamp('30-07-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','0938776266',to_timestamp('12-06-1980 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),3860000,to_timestamp('05-08-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','0917325476',to_timestamp('09-03-1965 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),250000,to_timestamp('02-10-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','08246108',to_timestamp('10-03-1950 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),21000,to_timestamp('28-10-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','08631738',to_timestamp('31-12-1981 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),915000,to_timestamp('24-11-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH07','Nguyen Manh Tam','32/3 Tran Binh Trong, Q5, TpHCM','0916783565',to_timestamp('06-04-1971 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),12500,to_timestamp('01-12-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH08','Phan Thi Thanh Tam','45/2 An Duong Vuong, Q5, TpHCM','0938435756',to_timestamp('10-01-1971 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),365000,to_timestamp('13-12-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH09','Le Ha Vinh','873 Cach Mang Thang Tam, QTB, TpHCM','08654763',to_timestamp('03-09-1979 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),70000,to_timestamp('14-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into KHACHHANG (MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) values ('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','08768904',to_timestamp('02-05-1983 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'),67500,to_timestamp('16-01-2007 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));

---------------------------------------------------
--   END DATA FOR TABLE KHACHHANG
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE NHANVIEN
--   FILTER = none used
---------------------------------------------------
REM INSERTING into NHANVIEN
Insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) values ('NV01','Nguyen Nhu Nhut','0927345678',to_timestamp('13-04-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) values ('NV02','Le Thi Phi Yen','0987567390',to_timestamp('21-04-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) values ('NV03','Nguyen Van B','0997047382',to_timestamp('27-04-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) values ('NV04','Ngo Thanh Tuan','0913758498',to_timestamp('24-06-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));
Insert into NHANVIEN (MANV,HOTEN,SODT,NGVL) values ('NV05','Nguyen Thi Truc Thanh','0918590387',to_timestamp('20-07-2006 00:00:00,000000000','DD-MM-RRRR HH24:MI:SS,FF'));

---------------------------------------------------
--   END DATA FOR TABLE NHANVIEN
---------------------------------------------------


---------------------------------------------------
--   DATA FOR TABLE SANPHAM
--   FILTER = none used
---------------------------------------------------
REM INSERTING into SANPHAM
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('BC01','But chi','cay','Singapore',3000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('BC02','But chi','cay','Singapore',5000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('BC03','But chi','cay','Viet Nam',3500);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('BC04','But chi','hop','Viet Nam',30000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('BB01','But bi','cay','Viet Nam',5000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('BB02','But bi','cay','Trung Quoc',7000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('BB03','But bi','hop','Thai Lan',100000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('TV01','Tap 100 trang giay mong','quyen','Trung Quoc',2500);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('TV02','Tap 200 trang giay mong','quyen','Trung Quoc',4500);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('TV03','Tap 100 trang giay tot','quyen','Viet Nam',3000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('TV04','Tap 200 trang giay tot','quyen','Viet Nam',5500);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('TV05','Tap 100 trang','chuc','Viet Nam',23000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('TV06','Tap 200 trang','chuc','Viet Nam',53000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('TV07','Tap 100 trang','chuc','Trung Quoc',34000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('ST01','So tay 500 trang','quyen','Trung Quoc',40000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('ST02','So tay loai 1','quyen','Viet Nam',55000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('ST03','So tay loai 2','quyen','Viet Nam',51000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('ST04','So tay','quyen','Thai Lan',55000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('ST05','So tay mong','quyen','Thai Lan',20000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('ST06','Phan viet bang','hop','Viet Nam',5000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('ST07','Phan viet bang khong bui','hop','Viet Nam',7000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('ST08','Bong bang','cai','Viet Nam',1000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('ST09','But long','cay','Viet Nam',5000);
Insert into SANPHAM (MASP,TENSP,DVT,NUOCSX,GIA) values ('ST10','But long mau','cay','Trung Quoc',7000);

---------------------------------------------------
--   END DATA FOR TABLE SANPHAM
---------------------------------------------------

--------------------------------------------------------
--  Constraints for Table KHACHHANG
--------------------------------------------------------

  ALTER TABLE "KHACHHANG" ADD PRIMARY KEY ("MAKH") ENABLE;
--------------------------------------------------------
--  Constraints for Table CTHD
--------------------------------------------------------

  ALTER TABLE "CTHD" ADD CONSTRAINT "PK_CTHD" PRIMARY KEY ("SOHD", "MASP") ENABLE;
--------------------------------------------------------
--  Constraints for Table NHANVIEN
--------------------------------------------------------

  ALTER TABLE "NHANVIEN" ADD PRIMARY KEY ("MANV") ENABLE;
--------------------------------------------------------
--  Constraints for Table HOADON
--------------------------------------------------------

  ALTER TABLE "HOADON" ADD PRIMARY KEY ("SOHD") ENABLE;
--------------------------------------------------------
--  Constraints for Table SANPHAM
--------------------------------------------------------

  ALTER TABLE "SANPHAM" ADD PRIMARY KEY ("MASP") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CTHD
--------------------------------------------------------

  ALTER TABLE "CTHD" ADD CONSTRAINT "FK_CTHD_MASP" FOREIGN KEY ("MASP")
	  REFERENCES "SANPHAM" ("MASP") ENABLE;
 
  ALTER TABLE "CTHD" ADD CONSTRAINT "FK_CTHD_SOHD" FOREIGN KEY ("SOHD")
	  REFERENCES "HOADON" ("SOHD") ENABLE;


----------------------------------------------------------


-- 1) Ngày mua hàng (NGHD) cua mot khách hàng thành viên se lon hon hoac 
-- bang ngày khách hàng dó dang ký thành viên (NGDK). 

--             THEM    XOA   SUA
-- HOADON        +      -     + 
-- KHACHHANG     -      -     + 

-- trigger them, sua hoadon
CREATE OR REPLACE TRIGGER c1_trg_insert_update_hd
BEFORE INSERT OR UPDATE ON hoadon
FOR EACH ROW
DECLARE
    v_ngdk HOADON.NGHD%TYPE;
BEGIN
    SELECT NGDK INTO v_ngdk
    FROM KHACHHANG WHERE MAKH = :NEW.MAKH;

    IF :NEW.NGHD > v_ngdk THEN
        DBMS_OUTPUT.PUT_LINE('Thanh cong');
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Ngay mua hang phai lon hon hoac bang ngay dang ky thanh vien');
    END IF;
END;

-- trigger sua khachhang
CREATE OR REPLACE TRIGGER c1_trg_update_kh
BEFORE UPDATE ON KHACHHANG
FOR EACH ROW
DECLARE
    v_nghd DATE;
BEGIN
    SELECT NGHD INTO v_nghd
    FROM HOADON WHERE MAKH = :NEW.MAKH;

    IF :NEW.NGDK > v_nghd THEN
        DBMS_OUTPUT.PUT_LINE('Thanh cong');
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Ngay mua hang phai lon hon hoac bang ngay dang ky thanh vien');
    END IF;
END;



-- 2) Ngày bán hàng (NGHD) cua mot nhân viên phai lon hon hoac bang ngày 
-- nhân viên dó vào làm. 

--            THEM    XOA   SUA
-- HOADON      +       -     + 
-- NHANVIEN    -       -     + 

-- trigger them, sua hoadon
CREATE OR REPLACE TRIGGER c2_trg_insert_update_hd
BEFORE INSERT OR UPDATE ON hoadon
FOR EACH ROW
DECLARE
    v_ngvl DATE;
    v_nghd DATE;
BEGIN
    SELECT NGVL INTO V_NGVL
    FROM NHANVIEN
    WHERE manv = :NEW.MANV;

    SELECT MIN(NGHD) INTO v_nghd
    FROM hoadon WHERE MANV = :NEW.MANV;

    IF v_nghd > v_ngvl THEN
        DBMS_OUTPUT.PUT_LINE('Thanh cong');
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Ngay ban hang phai lon hon hoac bang ngay nhan vien vao lam');
    END IF;
END;


-- trigger sua nhanvien
CREATE OR REPLACE TRIGGER c2_trg_update_nv
BEFORE UPDATE ON nhanvien
FOR EACH ROW
DECLARE
    v_nghd DATE;
BEGIN
    SELECT MIN(NGHD) INTO v_nghd
    FROM hoadon WHERE MANV = :NEW.MANV;
    
    IF :NEW.NGVL < v_nghd THEN
        DBMS_OUTPUT.PUT_LINE('Thanh cong');
    ELSE
        RAISE_APPLICATION_ERROR(-20001, 'Ngay mua hang phai lon hon hoac bang ngay dang ky thanh vien');
    END IF;
END;


-- 3) Moi mot hoa don phai co it nhat mot chi tiet hoa don. 

--          THEM    XOA   SUA
-- HOADON    +       -     -
-- CTHD      -       +     +  

-- trigger xoa hoadon
CREATE OR REPLACE TRIGGER c3_insert_hoadon
BEFORE INSERT ON hoadon
FOR EACH ROW
DECLARE
    v_count NUMBER := 0;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM cthd
    WHERE sohd = :NEW.SOHD;

    IF v_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Moi hoa don phai co it nhat mot chi tiet hoa don');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Them hoa don thanh cong');
    END IF;
END;


-- trigger xoa, sua cthd
CREATE OR REPLACE TRIGGER c3_trg_update_delete_hd
FOR UPDATE OR DELETE ON cthd
COMPOUND TRIGGER
    v_count NUMBER := 0;
    v_sohd hoadon.sohd%TYPE;
    
    BEFORE EACH ROW IS
    BEGIN
        v_sohd := :OLD.SOHD;
    END BEFORE EACH ROW;

    AFTER STATEMENT IS
    BEGIN
        SELECT COUNT(*) INTO v_count
        FROM cthd
        WHERE sohd = V_SOHD;

        IF v_count = 0 THEN
            RAISE_APPLICATION_ERROR(-20001, 'Moi hoa don phai co it nhat mot chi tiet hoa don');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Them hoa don thanh cong');
        END IF;
    END AFTER STATEMENT;
END;


-- 4) Tri gia cua mot hoa don la tung thanh tien (so luong*don gia) cua cac chi 
-- tiet thuoc hoa don do. 

--          THEM    XOA   SUA
-- HOADON    -       -     +
-- CTHD      +       +     +
-- SANPHAM   -       -     +

CREATE OR REPLACE TRIGGER c4_update_hd
BEFORE INSERT ON HOADON
FOR EACH ROW
DECLARE
    v_sl NUMBER;
    v_gia SANPHAM.GIA%TYPE;
    tongcong NUMBER := 0;
    CURSOR cursorHD IS
        SELECT sl, s.gia
        FROM CTHD C
            JOIN SANPHAM s ON S."MASP" = C."MASP";
BEGIN
    OPEN cursorHD;
    FETCH cursorHD INTO v_sl, v_gia;
    WHILE cursorHD%FOUND LOOP
        tongcong := tongcong + v_gia * v_sl;

        FETCH cursorHD INTO v_sl, v_gia;
    END LOOP;
    CLOSE cursorHD;

    IF (TONGCONG <> :new.TRIGIA) THEN
        RAISE_APPLICATION_ERROR(20000, 'Loi');
    END IF;
END;

-- trigger them, xoa, sua cthd
CREATE OR REPLACE TRIGGER c4_insert_update_delete_cthd
AFTER INSERT OR UPDATE OR DELETE OF sohd ON cthd
FOR EACH ROW
DECLARE
    v_gia SANPHAM.GIA%TYPE;
    v_sl NUMBER;
BEGIN
    IF (inserting OR updating) THEN
        SELECT gia INTO v_gia
        FROM SANPHAM
        WHERE masp = :new.masp;

        SELECT sl INTO V_SL
        FROM cthd
        WHERE masp = :new.masp;

        UPDATE hoadon
        SET trigia = trigia + V_GIA * v_sl
        WHERE sohd = :new.sohd;
    END IF;

    IF (deleting OR updating) THEN
        SELECT gia INTO v_gia
        FROM SANPHAM
        WHERE masp = :old.masp;

        SELECT sl INTO V_SL
        FROM cthd
        WHERE masp = :old.masp;

        UPDATE hoadon
        SET trigia = trigia - V_GIA * v_sl
        WHERE sohd = :old.sohd;
    END IF;
END;


-- trigger sua sanpham
CREATE OR REPLACE TRIGGER c4_update_sp
AFTER UPDATE ON sanpham
FOR EACH ROW
DECLARE
    v_sl NUMBER;
    v_sohd HOADON.SOHD%TYPE;
    CURSOR cursorHD IS
        SELECT c.sohd, sl
        FROM HOADON h
            JOIN CTHD c ON C.sohd = h.sohd
        WHERE masp = :NEW.MASP;
BEGIN
    OPEN cursorHD;
    FETCH cursorHD INTO V_SOHD, v_sl;
    WHILE cursorHD%FOUND LOOP
        UPDATE HOADON
        SET trigia = trigia + v_sl * (:NEW.GIA - :OLD.GIA)
        WHERE sohd = v_sohd;

        FETCH cursorHD INTO V_SOHD, v_sl;
    END LOOP;
    CLOSE cursorHD;
END;


SELECT * FROM CTHD;
SELECT * FROM NHANVIEN;
SELECT * FROM SANPHAM;

SELECT * FROM HOADON;
SELECT * FROM KHACHHANG;

-- 5) Doanh so cua mot khách hàng là tong tri giá các hóa don mà khách hàng 
-- thành viên dó dã mua. 

--            THEM    XOA   SUA
-- HOADON      +       +     +
-- KHACHHANG   -       -     +

CREATE OR REPLACE TRIGGER c5_insert_update_delete_hd
AFTER INSERT OR UPDATE OR DELETE ON HOADON
FOR EACH ROW
BEGIN
    IF inserting OR updating THEN
        UPDATE KHACHHANG
        SET DOANHSO = DOANHSO + :NEW.TRIGIA
        WHERE MAKH = :NEW.MAKH;
    ELSIF updating OR deleting THEN
        UPDATE KHACHHANG
        SET DOANHSO = DOANHSO - :OLD.TRIGIA
        WHERE MAKH = :NEW.MAKH;
    END IF;
END;


-- trigger sua khachhang
CREATE OR REPLACE TRIGGER c5_update_kh
BEFORE UPDATE ON KHACHHANG
FOR EACH ROW
DECLARE
    v_tong "KHACHHANG"."DOANHSO"%TYPE := 0;
BEGIN
    SELECT SUM(TRIGIA) INTO v_tong
    FROM HOADON
    WHERE MAKH = :NEW.MAKH;
  
    IF v_tong <> :new.DOANHSO THEN
        RAISE_APPLICATION_ERROR(20000, 'LOI');
    END IF;
END;
