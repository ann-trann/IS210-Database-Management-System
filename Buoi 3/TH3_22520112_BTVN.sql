--------------------------------------------------------
--  File created - Th? ba-tháng nãm-09-2023   
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

SELECT * FROM hoadon
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

-- Cau 1

--            | Them  | Xoa | Sua |
-- HoaDon     |   +   | -   | +   |
-- KhachHang  |   -   | -   | +   |
CREATE OR REPLACE TRIGGER TG_NGAYMUAHANG
BEFORE INSERT OR UPDATE OF NGHD ON hoadon
FOR EACH ROW 
DECLARE 
  n_makh hoadon.makh%TYPE := :new.NGHD;
  d_ngaydk khachhang.ngdk%TYPE;
BEGIN
  SELECT K."NGDK" INTO D_NGAYDK
  FROM KHACHHANG k
  WHERE makh = N_MAKH;

  IF (d_ngaydk > :new.NGHD) THEN
    RAISE_APPLICATION_ERROR(-20000, 'Loi');
  END IF;
END;

CREATE OR REPLACE TRIGGER TG_NGAYDK_KH
BEFORE UPDATE OF "NGDK" ON "KHACHHANG"
FOR EACH ROW
DECLARE 
  d_ngayhd hoadon."NGHD"%TYPE;
BEGIN 
  SELECT H."NGHD" INTO D_NGAYHD
  FROM "HOADON" h
  WHERE H."MAKH" = :NEW.MAKH;

  IF (D_NGAYHD < :new.NGDK) THEN
    RAISE_APPLICATION_ERROR(20000, 'Loi');
  END IF;
END;

-- Cau 2

--          | Them  |   Xoa |   Sua |
-- HoaDon   | +     |   -   |   +   |
-- NhanVien | -     |   -   |   +   |

CREATE OR REPLACE TRIGGER TG_NGAYBANHANG
FOR INSERT OR UPDATE ON "HOADON"
COMPOUND TRIGGER
  n_manv hoadon."MANV"%TYPE := :new.MANV;
  d_ngvl "NHANVIEN"."NGVL"%TYPE;
  d_nghd "HOADON"."NGHD"%TYPE;
  AFTER EACH ROW IS 
  BEGIN
    SELECT "NGVL" INTO d_ngvl
    FROM "NHANVIEN"
    WHERE manv = n_manv;
  END AFTER EACH ROW;

  AFTER STATEMENT IS 
  BEGIN
    SELECT MIN(nghd) INTO D_NGHD
    FROM "HOADON" h
    WHERE manv = N_MANV;
    
    IF D_NGHD < D_NGVL THEN
      RAISE_APPLICATION_ERROR(20001, 'Loi');
    END IF;
  END AFTER STATEMENT;
END;

CREATE OR REPLACE TRIGGER TG_NGVL_NV
BEFORE UPDATE ON "NHANVIEN"
FOR EACH ROW
DECLARE
  d_nghd "HOADON"."NGHD"%TYPE;
BEGIN
  SELECT MIN(H."NGHD") INTO D_NGHD
  FROM "HOADON" h
  WHERE H."MANV" = :NEW.MANV;
  
  IF (D_NGHD < :NEW.NGVL) THEN
    RAISE_APPLICATION_ERROR(20000, 'Loi');
  END IF;
END;

-- Bai 3

--          | Them  | Xoa | Sua |
-- HoaDon   | -     | -   | -   |
-- CTHD     | -     | +   | +   |

CREATE OR REPLACE TRIGGER TG_CTHD
FOR UPDATE OR DELETE ON "CTHD"
COMPOUND TRIGGER
  soluong NUMBER;
  n_mahd "HOADON"."SOHD"%TYPE;
  BEFORE EACH ROW IS BEGIN
    N_MAHD := :OLD.SOHD;
  END BEFORE EACH ROW;

  AFTER STATEMENT IS BEGIN
    SELECT COUNT(*) INTO SOLUONG
    FROM "CTHD" c
    WHERE C."SOHD" = N_MAHD;

    IF SOLUONG = 1 THEN
      RAISE_APPLICATION_ERROR(20000, 'Loi');
    END IF;
  END AFTER STATEMENT;
END;
                   
                   
                     
-- Bai 4

--          | Them  | Xoa | Sua |
-- HoaDon   | -     | -   | +   |
-- CTHD     | +     | +   | +   |
-- SanPham  | -     | -   | +   |

CREATE OR REPLACE TRIGGER TG_TONGCONG_HOADON
BEFORE UPDATE OF "TRIGIA" ON "HOADON"
FOR EACH ROW
DECLARE 
  CURSOR c IS   SELECT S."GIA", C."SL"
                FROM "CTHD" c
                JOIN "SANPHAM" s ON s."MASP" = C."MASP";
  gia "SANPHAM".gia%TYPE;
  sl "CTHD"."SL"%TYPE;
  tongcong NUMBER := 0;
BEGIN
  OPEN c;
  LOOP
    FETCH c INTO gia, SL;
    tongcong := tongcong + gia * sl;
    EXIT WHEN c%NOTFOUND;
  END LOOP;

  IF (TONGCONG <> :new.TRIGIA) THEN
    RAISE_APPLICATION_ERROR(20000, 'Loi');
  END IF;
END;

-------------------

CREATE OR REPLACE TRIGGER TG_TONGCONG_CTHD
AFTER INSERT ON "CTHD"
FOR EACH ROW
DECLARE 
  gia "SANPHAM"."GIA"%TYPE;
BEGIN
  SELECT s."GIA" INTO GIA
  FROM "SANPHAM" s
  WHERE S."MASP" = :NEW.masp;

  UPDATE "HOADON"
  SET "TRIGIA" = "TRIGIA" + GIA * :NEW.sl
  WHERE "SOHD" = :new.sohd;
END;

-------------------

CREATE OR REPLACE TRIGGER TG_TONGCONG_CTHD_SUA
AFTER UPDATE OF "SOHD", "MASP" , "SL" ON "CTHD"
FOR EACH ROW 
DECLARE
  giacu "SANPHAM"."GIA"%TYPE;
  giamoi "SANPHAM"."GIA"%TYPE;
BEGIN
  SELECT s."GIA" INTO GIAMOI
  FROM "SANPHAM" s
  WHERE S."MASP" = :NEW.masp;

  SELECT S."GIA" INTO GIACU
  FROM "SANPHAM" s
  WHERE S."MASP" = :OLD.MASP;

  UPDATE "HOADON"
  SET "TRIGIA" = "TRIGIA" - :OLD.SL * GIACU
  WHERE "SOHD" = :OLD.SOHD;

  UPDATE "HOADON"
  SET "TRIGIA" = "TRIGIA" + :NEW.SL * GIAMOI
  WHERE "SOHD" = :NEW.SOHD;
END;

-------------------

CREATE OR REPLACE TRIGGER TG_TONGCONG_CTHD_XOA
AFTER DELETE ON "CTHD"
FOR EACH ROW
DECLARE
  gia "SANPHAM"."GIA"%TYPE;
BEGIN
  SELECT s."GIA" INTO GIA
  FROM "SANPHAM" s
  WHERE S."MASP" = :OLD.MASP;

  UPDATE hoadon 
  SET "TRIGIA" = "TRIGIA" - :old.SL * GIA
  WHERE "SOHD" = :OLD.SOHD;
END;

-------------------

CREATE OR REPLACE TRIGGER TG_TONGCONG_SANPHAM
AFTER UPDATE OF gia ON "SANPHAM"
FOR EACH ROW
DECLARE 
  CURSOR c1 IS 
    SELECT C."SOHD", C."SL"
    FROM "HOADON" h
    JOIN "CTHD" c ON C."SOHD" = h."SOHD"
    WHERE C."MASP" = :NEW.MASP;
BEGIN
  FOR rec_c1 IN C1 LOOP
    UPDATE "HOADON"
    SET "TRIGIA" = "TRIGIA" - REC_C1."SL" * (:OLD.GIA - :NEW.GIA)
    WHERE "SOHD" = REC_C1."SOHD";
  END LOOP;
END;


-- Bai 5

--            | Them  | Xoa | Sua | 
-- KhachHang  | -     | -   | +   |
-- HoaDon     | +     | +   | +   |

CREATE OR REPLACE TRIGGER TG_DOANHSO_KH
BEFORE UPDATE OF "DOANHSO" ON "KHACHHANG"
FOR EACH ROW
DECLARE
  TONG "KHACHHANG"."DOANHSO"%TYPE := 0;
BEGIN
  SELECT SUM(H."TRIGIA") INTO TONG
  FROM "HOADON" h
  WHERE H."MAKH" = :NEW.MAKH;

  IF tong <> :new.DOANHSO THEN
    RAISE_APPLICATION_ERROR(20000, 'LOI');
  END IF;
END;

-------------------

CREATE OR REPLACE TRIGGER TG_DOANHSO_HOADON
AFTER INSERT ON "HOADON"
FOR EACH ROW
BEGIN
  UPDATE "KHACHHANG"
  SET "DOANHSO" = "DOANHSO" + :new.TRIGIA
  WHERE "MAKH" = :new.MAKH;
END;

-------------------

CREATE OR REPLACE TRIGGER TG_DOANHSO_HOADON_SUA
AFTER UPDATE OF "MAKH", "TRIGIA" ON "HOADON"
FOR EACH ROW
BEGIN
  UPDATE "KHACHHANG"
  SET "DOANHSO" = "DOANHSO" - :OLD.TRIGIA
  WHERE makh = :old.MAKH;

  UPDATE "KHACHHANG"
  SET "DOANHSO" = "DOANHSO" + :NEW.TRIGIA
  WHERE makh = :new.MAKH;
END;

-------------------

CREATE OR REPLACE TRIGGER TG_DOANHSO_HOADON_SUA
AFTER DELETE ON "HOADON"
FOR EACH ROW
BEGIN
  UPDATE "KHACHHANG"
  SET "DOANHSO" = "DOANHSO" - :OLD.TRIGIA
  WHERE "MAKH" = :OLD.MAKH;
END;