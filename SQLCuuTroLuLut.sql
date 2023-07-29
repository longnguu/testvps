create database CuuTroLuLut
go
use  CuuTroLuLut
go
create table LoaiHoGD(
	idLoaiHoGD int identity(1,1) primary key,
	LoaiHoGD nvarchar(100)
)
go
create table Xa(
	idXa int identity(1,1) primary key,
	tenXa nvarchar(100)
)
go
create table HoGiaDinh(
	idHoGiaDinh varchar(40) primary key,
	idLoaiHoGD int foreign key references LoaiHoGD(idLoaiHoGD) on update cascade on delete cascade,
	idXa int foreign key references Xa(idXa) on update cascade on delete cascade,
	soLuongThanhVien int,
	diaChi nvarchar(max)
)
go
create table DotLuLut(
	idDotLuLut int identity(1,1) primary key,
	tenDotLuLut nvarchar(200),
	ungHo int default 1,
	khaiBao int default 1,
	phanBo int default 1,
	thoiGian date,
)
go
create table MucDoThietHai(
	idMucDoThietHai int identity(1,1) primary key,
	idDotLuLut int foreign key references DotLuLut(idDotLuLut) on update cascade on delete cascade,
	tenMucDo nvarchar(200),
	ghiChu nvarchar(max),
	moTa nvarchar(max)
)
go
create table ThietHai(
	idThietHai int identity(1,1) primary key,
	idHoGiaDinh varchar(40) foreign key references HoGiaDinh(idHoGiaDinh) on update cascade on delete cascade,
	idMucDoThietHai int foreign key references MucDoThietHai(idMucDoThietHai) on update cascade on delete cascade,
	idDotLuLut int foreign key references DotLuLut(idDotLuLut) on update no action on delete no action,
	MucNuocNgap int,
	thoiGianNgapNuoc int,
	thietHaiVeNguoi int,
	thietHaiVeTaiSan nvarchar(max),
	uocTinhTongThietHai money,
	trangThaiPheDuyet nvarchar(100)
)
go
create table Quyen(
	idQuyen int identity(1,1) primary key,
	tenQuyen nvarchar(max)
)
go
create table NguoiDung(
	idNguoiDung int identity(1,1) primary key,
	idQuyen int foreign key references Quyen(idQuyen) on update cascade on delete cascade,
	hoTen nvarchar(200),
	gioiTinh nvarchar(20),
	taiKhoan varchar(200) unique,
	matKhau varchar(200),
	ngaySinh date,
	Email varchar(200) unique,
	diaChi nvarchar(max),
	soDT varchar(20)
)
go
create table DanhMucHangCuuTro(
	idDanhMuc int identity(1,1) primary key,
	tenDanhMuc nvarchar(200),
	moTa nvarchar(max)
)
go
create table HangCuuTro(
	idHangCuuTro int identity(1,1) primary key,
	idDanhMuc int foreign key references DanhMucHangCuuTro(idDanhMuc) on update cascade on delete cascade,
	tenHangCuuTro nvarchar(200),
	donViTinh nvarchar(100),
	soLuongCon int,
	moTa nvarchar(max)
)
go
create table UngHo(
	idUngHo int identity(1,1) primary key,
	idDotLuLut int foreign key references DotLuLut(idDotLuLut) on update cascade on delete cascade,
	idNguoiDung int foreign key references NguoiDung(idNguoiDung) on update cascade on delete cascade,
	thoiGianUngHo date,
	trangThaiPheDuyet nvarchar(200)
)
go
create table ChiTietUngHoHang(
	idUngHo int foreign key references UngHo(idUngHo) on update cascade on delete cascade,
	idHangCuuTro int foreign key references HangCuuTro(idHangCuuTro) on update cascade on delete cascade,
	soLuong int,
	soLuongThucNhan int default 0,
	minhChung nvarchar(max),
	ghiChu nvarchar(max),
	trangThaiPheDuyet nvarchar(200)
)
go
create table chiTietUngHoTien(
	idCTUngHoTien int identity(1,1) primary key,
	idUngHo int foreign key references UngHo(idUngHo) on update cascade on delete cascade,
	tienUngHo int,
	tienThucNhan int,
	thoiGianUngHo date,
	minhChung nvarchar(max),
	ghiChu nvarchar(max),
	hinhThucUngHo nvarchar(100),
	trangThaiPheDuyet int default 1
)
go
create table dotPhanBo(
	idPhanBo int identity(1,1) primary key,
	idDotLuLut int foreign key references dotLuLut(idDotLuLut) on update cascade on delete cascade,
	idHoGiaDinh varchar(40) foreign key references hoGiaDinh(idHoGiaDinh) on update cascade on delete cascade,
	ngayBatDau date,
	ngayKetThuc date,
	hinhAnh nvarchar(max),
	noiDung nvarchar(max)
)
go
create table DuKienPhanBo(
	idDotLuLut int foreign key references dotLuLut(idDotLuLut) on update cascade on delete cascade,
	idMucDoThietHai int foreign key references MucDoThietHai(idMucDoThietHai) on update no action on delete no action,
	idHangCuuTro int foreign key references HangCuuTro(idHangCuuTro) on update cascade on delete cascade,
	soLuongDuKien int,
)
go
create table DuKienPhanBoTien(
	idDotLuLut int foreign key references dotLuLut(idDotLuLut) on update cascade on delete cascade,
	idMucDoThietHai int foreign key references MucDoThietHai(idMucDoThietHai) on update no action on delete no action,
	tienDuKien money
)
go
create table ChiTietPhanBoTien(
	idCTPB int identity(1,1) primary key,
	idPhanBo int foreign key references dotPhanBo(idPhanBo) on update cascade on delete cascade,
	soTien int
)
go
create table chiTietPhanBoHang(
	idChiTietPhanBo int identity(1,1) primary key,
	idHangCuuTro int foreign key references hangCuuTro(idHangCuuTro) on update cascade on delete cascade,
	idPhanBo int foreign key references dotPhanBo(idPhanBo) on update cascade on delete cascade,
	soLuong int
)
go
create table BaiDang(
	idBaiDang int identity(1,1) primary key,
	idDotLuLut int foreign key references DotLuLut(idDotLuLut) on update cascade on delete cascade,
	tenDotCuuTro nvarchar(200),
	ngayBatDau date,
	ngayKetThuc date,
	hinhAnh nvarchar(max),
	soTien money,
	noiDung nvarchar(max),
)
go
--Trigger
GO
CREATE OR ALTER TRIGGER tg_CapNhatSLC_UH
ON ChiTietUngHoHang
AFTER UPDATE
AS
BEGIN
	BEGIN
		UPDATE HangCuuTro
		SET soLuongCon = soLuongCon + inserted.soLuongThucNhan - deleted.soLuongThucNhan
		from inserted,deleted
		where	inserted.idHangCuuTro=HangCuuTro.idHangCuuTro and inserted.idHangCuuTro=deleted.idHangCuuTro and inserted.trangThaiPheDuyet=2;
		if not exists(select *  from ChiTietUngHoHang where trangThaiPheDuyet=1)
			BEGIN
				update UngHo
				set trangThaiPheDuyet=N'Đã phê duyệt'
			END
		ELSE IF exists(select *  from ChiTietUngHoHang where trangThaiPheDuyet=2)
			BEGIN
				update UngHo
				set trangThaiPheDuyet=N'Phê duyệt chưa hoàn tất';
			END
		IF not exists(select *  from ChiTietUngHoHang where trangThaiPheDuyet=2)
			BEGIN
				update UngHo
				set trangThaiPheDuyet=N'Chờ phê duyệt';
			END
	END
END
GO
CREATE OR ALTER TRIGGER tg_CapNhatSLC_PB
ON ChiTietPhanBoHang
AFTER INSERT,update,delete
AS
BEGIN
	IF NOT EXISTS (SELECT * FROM inserted) -- Kiểm tra INSERT hoặc UPDATE
    BEGIN
        UPDATE HangCuuTro
		SET soLuongCon = soLuongCon + deleted.soLuong
		from deleted
		where deleted.idHangCuuTro=HangCuuTro.idHangCuuTro
    END
    ELSE
    BEGIN
        IF EXISTS (SELECT * FROM inserted) AND NOT EXISTS (SELECT * FROM deleted)
			BEGIN
				UPDATE HangCuuTro
				SET soLuongCon = soLuongCon - inserted.soLuong 
				from inserted
				where inserted.idHangCuuTro=HangCuuTro.idHangCuuTro
			END
		IF EXISTS (SELECT * FROM inserted) AND EXISTS (SELECT * FROM deleted)
			BEGIN
				UPDATE HangCuuTro
				SET soLuongCon = soLuongCon - inserted.soLuong + deleted.soLuong
				from inserted,deleted
				where inserted.idHangCuuTro=HangCuuTro.idHangCuuTro and deleted.idHangCuuTro=inserted.idHangCuuTro
			END
    END
END
GO
CREATE OR ALTER FUNCTION fn_TinhTongTien()
returns varchar(15)
as
Begin
		declare @tongTien money;
		(
		select  @tongTien=sum(tienUngHo)- sum(soTien)
		from chiTietUngHoTien as ctuht,ChiTietPhanBoTien as ctpbt
		)
		return @tongTien
end
GO
CREATE OR ALTER PROCEDURE GetDuKienPhanBoInfo
  @idDotLuLut INT
AS
BEGIN
  -- Tạo bảng tạm để lưu kết quả
  CREATE TABLE #TempResult (
    idHangCuuTro INT,
    soLuong INT,
	tenHangCuuTro nvarchar(max),
    soLuongCon INT
  )

  -- Thực hiện câu truy vấn và lưu kết quả vào bảng tạm
  INSERT INTO #TempResult (idHangCuuTro,tenHangCuuTro ,soLuong, soLuongCon)
  SELECT
    DUK.idHangCuuTro,HC.tenHangCuuTro,
    SUM(DUK.soLuongDuKien * HG.soLuongThanhVien) AS soLuong,
    HC.soLuongCon
  FROM
    DuKienPhanBo DUK
    JOIN ThietHai as TH ON DUK.idMucDoThietHai = TH.idMucDoThietHai
    JOIN HoGiaDinh as HG ON TH.idHoGiaDinh = HG.idHoGiaDinh
    JOIN HangCuuTro as HC ON DUK.idHangCuuTro = HC.idHangCuuTro
  WHERE
    DUK.idDotLuLut = 3 AND
	TH.trangThaiPheDuyet like N'Đã phê duyệt'
  GROUP BY
    DUK.idHangCuuTro,
    HC.soLuongCon,
	HC.tenHangCuuTro

  -- In kết quả từ bảng tạm
  SELECT * FROM #TempResult

  -- Xóa bảng tạm
  DROP TABLE #TempResult
END
GO
CREATE OR ALTER FUNCTION [dbo].[non_unicode_convert](@inputVar NVARCHAR(MAX) )
RETURNS NVARCHAR(MAX)
AS
BEGIN    
    IF (@inputVar IS NULL OR @inputVar = '')  RETURN ''
   
    DECLARE @RT NVARCHAR(MAX)
    DECLARE @SIGN_CHARS NCHAR(256)
    DECLARE @UNSIGN_CHARS NCHAR (256)
 
    SET @SIGN_CHARS = N'ăâđêôơưàảãạáằẳẵặắầẩẫậấèẻẽẹéềểễệếìỉĩịíòỏõọóồổỗộốờởỡợớùủũụúừửữựứỳỷỹỵýĂÂĐÊÔƠƯÀẢÃẠÁẰẲẴẶẮẦẨẪẬẤÈẺẼẸÉỀỂỄỆẾÌỈĨỊÍÒỎÕỌÓỒỔỖỘỐỜỞỠỢỚÙỦŨỤÚỪỬỮỰỨỲỶỸỴÝ' + NCHAR(272) + NCHAR(208)
    SET @UNSIGN_CHARS = N'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyyAADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOUUUUUUUUUUYYYYYDD'
 
    DECLARE @COUNTER int
    DECLARE @COUNTER1 int
   
    SET @COUNTER = 1
    WHILE (@COUNTER <= LEN(@inputVar))
    BEGIN  
        SET @COUNTER1 = 1
        WHILE (@COUNTER1 <= LEN(@SIGN_CHARS) + 1)
        BEGIN
            IF UNICODE(SUBSTRING(@SIGN_CHARS, @COUNTER1,1)) = UNICODE(SUBSTRING(@inputVar,@COUNTER ,1))
            BEGIN          
                IF @COUNTER = 1
                    SET @inputVar = SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@inputVar, @COUNTER+1,LEN(@inputVar)-1)      
                ELSE
                    SET @inputVar = SUBSTRING(@inputVar, 1, @COUNTER-1) +SUBSTRING(@UNSIGN_CHARS, @COUNTER1,1) + SUBSTRING(@inputVar, @COUNTER+1,LEN(@inputVar)- @COUNTER)
                BREAK
            END
            SET @COUNTER1 = @COUNTER1 +1
        END
        SET @COUNTER = @COUNTER +1
    END
    -- SET @inputVar = replace(@inputVar,' ','-')
    RETURN @inputVar
END
GO
-- Tạo trigger để tự động chèn idHoGiaDinh khi có insert vào bảng HoGiaDinh
CREATE OR ALTER TRIGGER Insert_HoGiaDinh
ON HoGiaDinh
AFTER INSERT,update
AS
BEGIN
    SET NOCOUNT ON;

    -- Lấy tên xã từ bảng Xa dựa trên idXa
    DECLARE @tenXa nvarchar(100)
    SELECT @tenXa = tenXa FROM Xa WHERE idXa = (SELECT idXa FROM inserted)

	-- Loại bỏ dấu
	SET @tenXa = [dbo].[non_unicode_convert](@tenXa)

	-- Chuyển thành chữ hoa
	SET @tenXa = UPPER(@tenXa)

	-- Loại bỏ khoảng trắng
	SET @tenXa = REPLACE(@tenXa, ' ', '')

    -- Lấy số lượng thành viên từ bảng HoGiaDinh dựa trên idXa
	DECLARE @soLuongThanhVien int
		SELECT @soLuongThanhVien=right(MAX(HoGiaDinh.idHoGiaDinh),9)+1 FROM HoGiaDinh,inserted WHERE HoGiaDinh.idXa = inserted.idXa
    

    -- Tạo idHoGiaDinh dựa trên tên xã và số thứ tự
    DECLARE @idHoGiaDinh nvarchar(20)
    SET @idHoGiaDinh = REPLACE(@tenXa, ' ', '') + RIGHT('000000000' + CAST(@soLuongThanhVien AS nvarchar(10)), 9)

    -- Cập nhật giá trị idHoGiaDinh cho các bản ghi mới chèn vào bảng HoGiaDinh
	if not exists (select * from deleted)
	BEGIN
		UPDATE HoGiaDinh
		SET idHoGiaDinh = @idHoGiaDinh
		FROM HoGiaDinh,inserted
		WHERE HoGiaDinh.idHoGiaDinh = inserted.idHoGiaDinh;
		INSERT INTO NguoiDung (idQuyen, taiKhoan,email,matKhau, hoTen)
		SELECT 3, @idHoGiaDinh,@idHoGiaDinh,'$2y$10$Xokc7Wxz94tiAYjCFnbm.OepxVJkLRJTIcMri.h7HEJJbVypMPtby', @idHoGiaDinh
		FROM inserted;
	END
	if exists (Select * from deleted)
	BEGIN
		UPDATE HoGiaDinh
		SET idHoGiaDinh = @idHoGiaDinh
		FROM HoGiaDinh,deleted
		WHERE HoGiaDinh.idHoGiaDinh = deleted.idHoGiaDinh;
		UPDATE NguoiDung
		SET taiKhoan=@idHoGiaDinh,hoTen=@idHoGiaDinh,email=@idHoGiaDinh
		FROM NguoiDung,deleted
		where NguoiDung.taiKhoan=deleted.idHoGiaDinh;
		
	END
END;

GO

GO
GO
--Chèn dữ liệu mẫu
insert into Quyen(tenQuyen)
values	(N'Admin'),
		(N'Hỗ trợ admin'),
		(N'Hộ gia đình'),
		(N'Người dùng bình thường')
go
insert into NguoiDung(idQuyen,taiKhoan,matKhau,hoTen,gioiTinh,ngaySinh,Email)
values	(1,'admin@gmail.com','$2y$12$SDydLe5bix3rXUeO7SfKx.Vxk2Ss2h.T/W9l/.YO.aFJL3f22MFx6',N'Admin',N'Nam',null,'admin@gmail.com'),
		(2,'levanlong@gmail.com','$2y$10$Xokc7Wxz94tiAYjCFnbm.OepxVJkLRJTIcMri.h7HEJJbVypMPtby',N'Người dùng 1',N'Nam',null,'levanlong@gmail.com'),
		(2,'nguoidung2@gmail.com','$2y$10$Xokc7Wxz94tiAYjCFnbm.OepxVJkLRJTIcMri.h7HEJJbVypMPtby',N'Người dùng 2',N'Nam',null,'nguoidung2@gmail.com')
go
INSERT INTO Xa (tenXa)
VALUES (N'Hòa Liên'),
       (N'Hòa Sơn'),
       (N'Hòa Ninh'),
       (N'Hòa Sương'),
       (N'Hòa Nhơn'),
       (N'Hòa Khương'),
       (N'Hòa Phong'),
       (N'Hòa Châu'),
       (N'Hòa Tiến'),
       (N'Hòa Phước'),
       (N'Hòa Phú'),
       (N'Hòa Hải');
GO
insert into DanhMucHangCuuTro(tenDanhMuc,moTa)
values	(N'Đồ ăn',null),
		(N'Nước uống',null),
		(N'Áo quần',null),
		(N'Vật dụng',null),
		(N'Thuốc men',null)
go
insert into HangCuuTro(idDanhMuc,tenHangCuuTro,donViTinh,soLuongCon)
values	(1,N'Mì ăn liền',N'Gói',0),
		(1,N'Mì ăn liền',N'Thùng',0),
		(1,N'Gạo',N'Kg',0),
		(2,N'Nước sạch',N'Bình',0),
		(3,N'Áo khoác',N'Cái',0),
		(3,N'Quần',N'Cái',0),
		(4,N'Áo Phao',N'Cái',0),
		(4,N'Phao cứu sinh',N'Cái',0)
go
insert into LoaiHoGD(LoaiHoGD)
values	(N'Hộ nghèo'),
		(N'Hộ cận nghèo'),
		(N'Bình thường')
go
INSERT INTO HoGiaDinh(idHoGiaDinh, idLoaiHoGD, idXa, soLuongThanhVien, diaChi)
VALUES ('0000000000', 1, 1, 3, 'null');
INSERT INTO HoGiaDinh(idHoGiaDinh, idLoaiHoGD, idXa, soLuongThanhVien, diaChi)
VALUES ('0000000000', 2, 1, 4, 'null');
INSERT INTO HoGiaDinh(idHoGiaDinh, idLoaiHoGD, idXa, soLuongThanhVien, diaChi)
VALUES ('0000000000', 1, 2, 4, 'null');
GO
insert into DotLuLut(tenDotLuLut,thoiGian)
values	(N'Đợt lũ lụt tháng 7/2020','2020/07/03'),
		(N'Đợt lũ lụt tháng 5/2021','2021/05/15'),
		(N'Đợt lũ lụt tháng 8/2021','2021/08/06')
go
insert into MucDoThietHai(tenMucDo,idDotLuLut,ghiChu,moTa)
Values	(N'Mức độ 1',1,null,N'Có thiệt hại và thiệt hại về tài sản dưới 500.000VNĐ'),
		(N'Mức độ 2',1,null,N'Thiệt hại về tài sản dưới 1.000.000VNĐ'),
		(N'Mức độ 3',1,null,N'Có thiệt hại về người hoặc thiệt hại về tài sản trên 1.000.000VNĐ'),
		(N'Mức độ 1',2,null,N'Có thiệt hại và thiệt hại về tài sản dưới 500.000VNĐ'),
		(N'Mức độ 2',2,null,N'Có thiệt hại về người hoặc thiệt hại về tài sản trên 500.000VNĐ'),
		(N'Mức độ 1',3,null,N'Có thiệt hại và thiệt hại về tài sản dưới 500.000VNĐ'),
		(N'Mức độ 2',3,null,N'Thiệt hại về tài sản dưới 1.500.000VNĐ'),
		(N'Mức độ 3',3,null,N'Có thiệt hại về người hoặc thiệt hại về tài sản trên 1.500.000VNĐ')
GO
