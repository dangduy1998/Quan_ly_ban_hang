create database Quan_ly_hoa_don_ban_hang
use Quan_ly_hoa_don_ban_hang
create table KhachHang
(
      MaKH    nvarchar(20)    not null,
	  TenKH   nvarchar(50)    null,
	  DiaChi  nvarchar(100)   null,
	  SDT     nvarchar(20)    null,
	  constraint pk_makh_khachhang  primary key(MaKH)
)
create table Ca
(
      MaCa        nvarchar(20)   not null,
	  ChuThich    nvarchar(100)  null,
	  constraint pk_maca primary key(MaCa)
)
create table NhanVien
(
      MaNV      nvarchar(20)     not null,
	  TenNV     nvarchar(100)    null,
	  GioiTinh  bit              null,
	  NgaySinh  date             null,
	  DiaChi    nvarchar(100)    null,
	  SDT       nvarchar(20)     null,
	  constraint pk_manv_nhanvien  primary key(MaNV),
	  
)

create table ChamCong
(
     MaNV      nvarchar(20)     not null,
	 MaCa      nvarchar(20)     not null,
	 Ngay      date             null,
	 ChuThich  nvarchar(100)    null,
	 constraint fk_manv_chamcong foreign key(MaNV)  references NhanVien(MaNV),
	 foreign key(MaCa)  references Ca(MaCa)
)

create table HoaDonBan
(
     MaHDB    nvarchar(20)     not null,
	 MaNV     nvarchar(20)     not null,
	 MaKH     nvarchar(20)     not null,
	 NgayBan  date             null,
	 TongTien nvarchar(100)    null,
	 constraint pk_mahdb_hoadonban primary key(MaHDB),
	 constraint fk_manv_hoadonban  foreign key(MaNV) references NhanVien(MaNV),
	 foreign key(MaKH)  references KhachHang(MaKH)
)
create table HoaDonNhap
(
     MaHDN     nvarchar(20)      not null,
	 MaNV      nvarchar(20)      not null,
	 NgayNhap  date              null,
	 TongTien  nvarchar(100)     null,
	 constraint pk_mahdn_hoadonnhap primary key(MaHDN),
	 constraint fk_manv_hoadonnhap foreign key(MaNV) references NhanVien(MaNV)
)
create table SanPham
(
     MaSP       nvarchar(20)      not null,
	 TenSP      nvarchar(100)     null,
	 Donvitinh  nvarchar(10)      null,
	 Soluong    int               null,
	 GiaNhap    int               null,
	 GiaBan     int               null,
	 constraint pk_masp_sanpham  primary key(MaSP)
)

create table ChiTietHDBan
(
     MaHDB        nvarchar(20)       not null,
	 MaSP         nvarchar(20)       not null,
	 SoLuongBan   int                null,
	 Dongia       int                null,
	 ThanhTien    nvarchar(100)      null,
	 constraint fk_mahdb_chitiethdb   foreign key(MaHDB)  references  HoaDonBan(MaHDB),
	 foreign key(MaSP) references SanPham(MaSP)
)


create table NhaCC
(
      MaNCC  nvarchar(20)  not null,
	  TenNCC nvarchar(100) null,
	  Diachi nvarchar(100) null,
	  Dienthoai  nvarchar(11) null,
	  constraint pk_mancc_nhacc primary key(MaNCC)
)
create table ChiTietNhap
(
     MaHDN        nvarchar(20)       not null,
	 MaSP         nvarchar(20)       not null,
	 MaNCC        nvarchar(20)       not null,
	 SoLuong   int                null,
	 GiaNhap       int                null,
	 ThanhTien     nvarchar(100)      null,
	 constraint fk_mahdn_chitiethdb   foreign key(MaHDN)  references  HoaDonNhap(MaHDN),
	 constraint fk_manhacc_chitiethdb   foreign key(MaNCC)  references  NhaCC(MaNCC),
	 foreign key(MaSP) references SanPham(MaSP)
)

go
insert [dbo].[Ca] ([MaCa], [ChuThich]) values (N'CA01', N'Từ 7h-14h')
insert [dbo].[Ca] ([MaCa], [ChuThich]) values (N'CA02', N'Từ 14h-22h')
go
insert [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [SDT]) values (N'1', N'Nguyễn Ngọc Nha', 1, CAST(N'3/29/1991' as date), N'19 Hùng Vương', N'8356153')
insert [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [SDT]) values (N'2', N'Hà Vĩnh Phát', 0, CAST(N'7/12/1991' as date), N'189 Đồng Khởi Q1', N'8352074')
insert [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [SDT]) values (N'3', N'Trần Tuyết Oanh', 1, CAST(N'2/27/1991' as date), N'26 Lê Quý Đôn P6 Q3', N'8557798')
insert [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [SDT]) values (N'4', N'Nguyễn kim Ngọc', 1, CAST(N'3/30/1992' as date), N'178 Hậu Giang P6 Q6', N'8940295')
insert [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [SDT]) values (N'5', N'Trương Duy Hùng', 0, CAST(N'9/13/1992' as date), N'77 Trương Định P6 Q3', N'8940295')
insert [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [SDT]) values (N'6', N'Lương Bá Thắng', 0, CAST(N'9/13/1992' as date), N'92 Lê Thánh Tôn Q1', N'8940549')
insert [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [SDT]) values (N'7', N'Lâm Sơn Hoàng', 0, CAST(N'11/29/1992' as date), N'74 Ký Con Q1', N'8740374')
insert [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [SDT]) values (N'8', N'Nguyễn Minh Hoàng', 0, CAST(N'1/30/1993' as date), N'224 Lạc Long Quân', N'8352578')
insert [dbo].[NhanVien] ([MaNV], [TenNV], [GioiTinh], [NgaySinh], [DiaChi], [SDT]) values (N'9', N'Vương Ngọc Lan', 1, CAST(N'10/12/1993' as date), N'227 Hai Bà Trưng P6 Q3', N'8651636')
go
insert [dbo].[ChamCong] ([MaNV], [MaCa], [Ngay], [ChuThich]) values (N'1', N'CA01',CAST(N'10/7/2018' as date), NULL)
insert [dbo].[ChamCong] ([MaNV], [MaCa], [Ngay], [ChuThich]) values (N'1', N'CA02',CAST(N'10/7/2018' as date), NULL)
insert [dbo].[ChamCong] ([MaNV], [MaCa], [Ngay], [ChuThich]) values (N'1', N'CA01',CAST(N'10/5/2018' as date), NULL)
insert [dbo].[ChamCong] ([MaNV], [MaCa], [Ngay], [ChuThich]) values (N'2', N'CA01',CAST(N'10/5/2018' as date), NULL)
insert [dbo].[ChamCong] ([MaNV], [MaCa], [Ngay], [ChuThich]) values (N'3', N'CA01',CAST(N'10/5/2018' as date), NULL)
insert [dbo].[ChamCong] ([MaNV], [MaCa], [Ngay], [ChuThich]) values (N'4', N'CA02',CAST(N'10/1/2018' as date), NULL)
insert [dbo].[ChamCong] ([MaNV], [MaCa], [Ngay], [ChuThich]) values (N'5', N'CA01',CAST(N'10/1/2018' as date), NULL)
insert [dbo].[ChamCong] ([MaNV], [MaCa], [Ngay], [ChuThich]) values (N'6', N'CA02',CAST(N'9/10/2018' as date), NULL)
insert [dbo].[ChamCong] ([MaNV], [MaCa], [Ngay], [ChuThich]) values (N'7', N'CA01',CAST(N'9/20/2018' as date), NULL)
go
insert [dbo].[KhachHang] ([MaKH],[TenKH],[DiaChi], [SDT]) values (N'KH01', N'Nguyễn Khoa Đức', N'Thanh Hóa', N'968686868')
insert [dbo].[KhachHang] ([MaKH],[TenKH],[DiaChi], [SDT]) values (N'KH02', N'Nguyễn Nhật Tân', N'Nam Định', N'918273645')
insert [dbo].[KhachHang] ([MaKH],[TenKH],[DiaChi], [SDT]) values (N'KH03', N'Bùi Văn Việt', N'Hưng Yên', N'918688685')
insert [dbo].[KhachHang] ([MaKH],[TenKH],[DiaChi], [SDT]) values (N'KH04', N'Nguyễn Tài Tú', N'Thanh Hóa', N'978656790')
insert [dbo].[KhachHang] ([MaKH],[TenKH],[DiaChi], [SDT]) values (N'KH05', N'Đặng Thị Hằng', N'Hưng Yên', N'959486848')
go
insert [dbo].[NhaCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) values (N'NCC01', N'NPP Dương Nội', N'74 Dương Nội,Hà Đông',N'968317784') 
insert [dbo].[NhaCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) values (N'NCC02', N'NPP Thực phẩm bánh kẹo Minh khôi', N'78 Đại An,Văn Quán',N'462516356')
insert [dbo].[NhaCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) values (N'NCC03', N'Thủy hải sản Tâm đức', N'phố Thắng lợi,hai bà trưng',N'36341953')
insert [dbo].[NhaCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) values (N'NCC04', N'Cty PP Tiên Tiến', N'35B Lê Văn Thiêm',N'35572036')
insert [dbo].[NhaCC] ([MaNCC], [TenNCC], [Diachi], [Dienthoai]) values (N'NCC05', N'NCC Minh Duẩn', N'98 đường thụy đông ngạc',N'37526102')
go
insert [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Soluong], [GiaNhap], [GiaBan]) values (N'1', N'Rượu', N'Chai', 1000, 2305000, 4000000)
insert [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Soluong], [GiaNhap], [GiaBan]) values (N'2', N'Bánh Mỳ', N'Chiếc', 100, 4000, 10000)
insert [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Soluong], [GiaNhap], [GiaBan]) values (N'3', N'Táo', N'kg', 50, 20000, 40000)
insert [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Soluong], [GiaNhap], [GiaBan]) values (N'4', N'Sữa fami', N'bịch', 1000, 2000, 5000)
insert [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Soluong], [GiaNhap], [GiaBan]) values (N'5', N'Sữa tắm', N'chai', 100, 30000, 50000)
insert [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Soluong], [GiaNhap], [GiaBan]) values (N'6', N'Bánh Cosy', N'túi', 500, 10000, 30000)
insert [dbo].[SanPham] ([MaSP], [TenSP], [Donvitinh], [Soluong], [GiaNhap], [GiaBan]) values (N'7', N'Kẹo dừa', N'túi', 100, 2000, 4000)
go
insert [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan], [TongTien]) values (N'HD01', N'3', N'KH03', CAST(N'10/7/2018' as date), N'4000000')
insert [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan], [TongTien]) values (N'HD02', N'2', N'KH02', CAST(N'10/5/2018' as date), N'400000')
insert [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan], [TongTien]) values (N'HD03', N'1', N'KH01', CAST(N'10/5/2018' as date), N'300000')
insert [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan], [TongTien]) values (N'HD04', N'4', N'KH02', CAST(N'9/10/2018' as date), N'200000')
insert [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan], [TongTien]) values (N'HD05', N'6', N'KH01', CAST(N'9/20/2018' as date), N'50000')
insert [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan], [TongTien]) values (N'HD06', N'5', N'KH04', CAST(N'10/5/2018' as date), N'800000')
insert [dbo].[HoaDonBan] ([MaHDB], [MaNV], [MaKH], [NgayBan], [TongTien]) values (N'HD07', N'2', N'KH03', CAST(N'10/15/2018' as date), N'40000')
go
insert [dbo].[ChiTietHDBan] ([MaHDB], [MaSP], [SoLuongBan], [Dongia], [ThanhTien]) values ( N'HD01', N'1', 1, 4000000, N'4000000')
insert [dbo].[ChiTietHDBan] ([MaHDB], [MaSP], [SoLuongBan], [Dongia], [ThanhTien]) values ( N'HD02', N'5', 1, 400000, N'400000')
insert [dbo].[ChiTietHDBan] ([MaHDB], [MaSP], [SoLuongBan], [Dongia], [ThanhTien]) values ( N'HD03', N'6', 10, 30000, N'300000')
insert [dbo].[ChiTietHDBan] ([MaHDB], [MaSP], [SoLuongBan], [Dongia], [ThanhTien]) values ( N'HD04', N'3', 5, 40000, N'200000')
insert [dbo].[ChiTietHDBan] ([MaHDB], [MaSP], [SoLuongBan], [Dongia], [ThanhTien]) values ( N'HD05', N'3', 10, 5000, N'50000')
insert [dbo].[ChiTietHDBan] ([MaHDB], [MaSP], [SoLuongBan], [Dongia], [ThanhTien]) values ( N'HD06', N'1', 2, 400000,N'800000')
insert [dbo].[ChiTietHDBan] ([MaHDB], [MaSP], [SoLuongBan], [Dongia], [ThanhTien]) values ( N'HD07', N'7', 10, 4000,N'40000')
go
insert [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [NgayNhap], [TongTien]) values (N'HDN01', N'7', CAST(N'9/20/2018' as date), N'1000000')
insert [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [NgayNhap], [TongTien]) values (N'HDN02', N'5', CAST(N'10/1/2018' as date), N'2000000')
insert [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [NgayNhap], [TongTien]) values (N'HDN03', N'7', CAST(N'9/20/2018' as date), N'5000000')
insert [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [NgayNhap], [TongTien]) values (N'HDN04', N'5', CAST(N'10/1/2018' as date), N'400000')
insert [dbo].[HoaDonNhap] ([MaHDN], [MaNV], [NgayNhap], [TongTien]) values (N'HDN05', N'7', CAST(N'9/20/2018' as date), N'23050000')
go
insert [dbo].[ChiTietNhap] ([MaHDN], [MaSP], [MaNCC], [SoLuong], [GiaNhap], [ThanhTien]) values (N'HDN01', N'3', N'NCC04', 50, 20000,N'1000000')
insert [dbo].[ChiTietNhap] ([MaHDN], [MaSP], [MaNCC], [SoLuong], [GiaNhap], [ThanhTien]) values (N'HDN02', N'4', N'NCC05', 1000, 2000,N'2000000')
insert [dbo].[ChiTietNhap] ([MaHDN], [MaSP], [MaNCC], [SoLuong], [GiaNhap], [ThanhTien]) values (N'HDN03', N'6', N'NCC01', 500, 10000,N'5000000')
insert [dbo].[ChiTietNhap] ([MaHDN], [MaSP], [MaNCC], [SoLuong], [GiaNhap], [ThanhTien]) values (N'HDN04', N'2', N'NCC02', 100, 4000,N'400000')
insert [dbo].[ChiTietNhap] ([MaHDN], [MaSP], [MaNCC], [SoLuong], [GiaNhap], [ThanhTien]) values (N'HDN05', N'1', N'NCC05', 10, 2305000,N'23050000')
go
--truy van sql
use Quan_ly_hoa_don_ban_hang
go
--viết trigger tính thành tiền trên bảng chi tiết hd bán
create trigger ThanhTien on ChiTietHDBan
for insert,update
as
begin
   declare @mahdb nvarchar(20),@masp nvarchar(20),@soluong int,@dongia int,@thanhtien nvarchar(100)
   select @mahdb=MaHDB,@masp=MaSP,@soluong=SoLuongBan,@dongia=Dongia from inserted
   set @thanhtien=CAST(@soluong*@dongia as nvarchar(100))
   update ChiTietHDBan set ThanhTien=@thanhtien where MaHDB=@mahdb and MaSP=@masp
end
go
--viết trigger tính thành tiền trên bảng chi tiết hd nhập
create trigger ThanhTiennhap on [dbo].[ChiTietNhap]
for insert,update
as
begin
   declare @mahdn nvarchar(20),@masp nvarchar(20),@mancc nvarchar(20),@soluong int,@dongia int,@thanhtien nvarchar(100)
   select @mahdn=[MaHDN],@masp=MaSP,@mancc=MaNCC,@soluong=[SoLuong],@dongia=[GiaNhap] from inserted
   set @thanhtien=CAST(@soluong*@dongia as nvarchar(100))
   update [dbo].[ChiTietNhap] set ThanhTien=@thanhtien where MaHDN=@mahdn and MaSP=@masp and MaNCC=@mancc
end
go
use Quan_ly_hoa_don_ban_hang
--tạo view hóa đơn bán
create view ds_hoa_donban(MaHDB,MaNV,MaSP,TenSP,NgayBan,SoLuong,Dongia,ThanhTien)
as
select [dbo].[HoaDonBan].MaHDB,MaNV,[dbo].[SanPham].MaSP,TenSP,NgayBan,SoLuongBan,Dongia,ThanhTien
from ([dbo].[HoaDonBan] join [dbo].[SanPham] on [dbo].[HoaDonBan].MaNV =[dbo].[SanPham].MaSP) join [dbo].[ChiTietHDBan] on [dbo].[HoaDonBan].MaHDB=[dbo].[ChiTietHDBan].MaHDB
select *from ds_hoa_donban
go
use Quan_ly_hoa_don_ban_hang
go
--tạo view hóa đơn nhập
create view ds_hoadonnhap(MaHDN,MaNCC,MaNV,MaSP,NgayNhap,Soluong,GiaNhap,ThanhTien)
as
select [dbo].[HoaDonNhap].MaHDN,MaNCC,MaNV,MaSP,NgayNhap,[dbo].[ChiTietNhap].SoLuong,[dbo].[ChiTietNhap].GiaNhap,ThanhTien
from [dbo].[HoaDonNhap] join [dbo].[ChiTietNhap] on [dbo].[HoaDonNhap].MaHDN=[dbo].[ChiTietNhap].MaHDN

select *from ds_hoadonnhap
go
--viet function dua ra thong tin nhung hoa don bán trong mot ngay
create function thongtinhoadonbantheongay(@date nvarchar(50))
returns table as return(
      select [dbo].[HoaDonBan].MaHDB,MaNV,[dbo].[SanPham].MaSP,TenSP,NgayBan,SoLuong,Dongia,ThanhTien
      from ([dbo].[HoaDonBan] join [dbo].[SanPham] on [dbo].[HoaDonBan].MaNV =[dbo].[SanPham].MaSP) join [dbo].[ChiTietHDBan] on [dbo].[HoaDonBan].MaHDB=[dbo].[ChiTietHDBan].MaHDB
	  where NgayBan=CAST(@date as date)
)
select *from thongtinhoadonbantheongay(N'2018-10-07')
go
--viet function đưa ra thong tin hoa don mua trong mot ngay
create function thongtinhdnhaptheongay(@date nvarchar(50))
returns table return(
       select [dbo].[HoaDonNhap].MaHDN,MaNCC,MaNV,MaSP,NgayNhap,[dbo].[ChiTietNhap].SoLuong,[dbo].[ChiTietNhap].GiaNhap,ThanhTien
       from [dbo].[HoaDonNhap] join [dbo].[ChiTietNhap] on [dbo].[HoaDonNhap].MaHDN=[dbo].[ChiTietNhap].MaHDN
       where NgayNhap=CAST(@date as date)
) 
select *from thongtinhdnhaptheongay(N'9/20/2018')
go
-- viet procedure dua ra tong tien theo ngay
create procedure tongtienbanngay @date nvarchar(20)			
as
begin
    select  [dbo].[HoaDonBan].MaHDB,SUM([dbo].[ChiTietHDBan].SoLuongBan*[dbo].[ChiTietHDBan].Dongia) as TongTien
	from [dbo].[HoaDonBan] join [dbo].[ChiTietHDBan] on [dbo].[HoaDonBan].MaHDB=[dbo].[ChiTietHDBan].MaHDB
	where 	NgayBan=CAST(@date as date)
	group by [dbo].[HoaDonBan].MaHDB
end
exec dbo.tongtienbanngay N'2018-10-07'
go
--viet procedure dua ra tong tien nhap hang theo ngay
create procedure tongtiennhapngay @date nvarchar(20)
as
begin
  select [dbo].[HoaDonNhap].MaHDN,SUM(SoLuong*GiaNhap) as TongTien
  from [dbo].[HoaDonNhap] join [dbo].[ChiTietNhap] on [dbo].[HoaDonNhap].MaHDN=[dbo].[ChiTietNhap].MaHDN
  where NgayNhap=CAST(@date as date)
  group by [dbo].[HoaDonNhap].MaHDN
end
exec dbo.tongtiennhapngay N'9/20/2018'
go
--dua ra thong tin hoa don bán theo ma hoa don
create function thongtin_maHD(@mahd nvarchar(20))
returns table as return
(
    select [dbo].[HoaDonBan].MaHDB,[dbo].[NhanVien].MaNV,TenNV,TenKH,NgayBan,[dbo].[ChiTietHDBan].SoLuongBan,Dongia,ThanhTien
	from  (([dbo].[HoaDonBan] join [dbo].[ChiTietHDBan] on [dbo].[HoaDonBan].MaHDB=[dbo].[ChiTietHDBan].MaHDB) join [dbo].[NhanVien] on [dbo].[HoaDonBan].MaNV=[dbo].[NhanVien].MaNV) join [dbo].[KhachHang] on [dbo].[HoaDonBan].MaKH=[dbo].[KhachHang].MaKH
	where [dbo].[HoaDonBan].MaHDB=@mahd
)
go
--ds nhan vien
create view ds_nhanvien
as
select *from [dbo].[NhanVien]

select *from ds_nhanvien
go
--ds khach hang
create view ds_khachhang
as
select *from [dbo].[KhachHang]
select *from ds_khachhang
go
--ds san pham
create view ds_sanpham
as
select *from [dbo].[SanPham]
select *from ds_sanpham
go
--ds nha cung cap
create view ds_nhacc
as
select *from [dbo].[NhaCC]
select *from ds_nhacc
go
-- dua ra ten nv theo ma nhan vien
create procedure tennv @manv nvarchar(20)
as 
begin
    select TenNV
	from [dbo].[NhanVien]
	where MaNV=@manv
end
exec tennv N'2'
go
--dua ra thong tin khach hang theo ma hoa don
create function thong_tin_khachhang(@mahd nvarchar(20))
returns table as return
(
     select [dbo].[KhachHang].MaKH,TenKH,DiaChi,SDT
	 from [dbo].[HoaDonBan] join [dbo].[KhachHang] on [dbo].[HoaDonBan].MaKH=[dbo].[KhachHang].MaKH
	 where MaHDB=@mahd
)
select *from thong_tin_khachhang(N'HD02')
go
-- viet thu tuc nhap thong tin khach hang
create procedure nhapkhachhang @makh nvarchar(20),@tenkh nvarchar(100),@diachi nvarchar(100),@sdt nvarchar(20)
as begin
begin tran;
  begin try
   insert [dbo].[KhachHang]([MaKH], [TenKH], [DiaChi], [SDT]) values(@makh,@tenkh,@diachi,@sdt)
   commit tran;
  end try
  begin catch
  rollback tran;
  end catch
end
exec nhapkhachhang N'KH06',N'Nguyễn Thị Duyên',N'Hưng Yên','0938374734'
go
-- viet thu tuc nhap thong tin hoa don 
create procedure nhaphoadonbanhang @mahdb nvarchar(20), @manv nvarchar(20),@makh nvarchar(20) ,@ngayban date,@tongtien nvarchar(100)
as begin
 begin tran;
  begin try
    insert [dbo].[HoaDonBan]([MaHDB],[MaNV],[MaKH],[NgayBan],[TongTien]) values(@mahdb,@manv,@makh,@ngayban,@tongtien)
	commit tran;
  end try
  begin catch
  rollback tran;
  end catch
end

exec nhaphoadonbanhang N'HD08',N'2',N'KH01', CAST( '18/10/2018' as date),null
go
--viet thu tuc nhap chi tiet hoa don
create procedure nhapchitiethdban @mahdb nvarchar(20),@mahang nvarchar(20),@soluongban int,@dongia int,@thanhtien nvarchar(100)
as begin
   begin tran;
    begin try
	 insert [dbo].[ChiTietHDBan]([MaHDB],[MaSP],[SoLuongBan],[Dongia],[ThanhTien]) values(@mahdb,@mahang,@soluongban,@dongia,@thanhtien)
	 commit tran;
	 end try
	 begin catch
	 rollback tran;
	 end catch
end

go
--xóa hóa đơn bán theo trigger
create trigger xoa_hoa_donban on [dbo].[HoaDonBan]
instead of delete
as
begin
  declare @sohdb nvarchar(255)
  select @sohdb=[MaHDB] from inserted
  delete from [dbo].[ChiTietHDBan] where [MaHDB]=@sohdb
  delete from [dbo].[HoaDonBan] where [MaHDB]=@sohdb
end
go
--xóa hóa đơn nhập theo trigger
create trigger xoa_hoa_donnhap on [dbo].[HoaDonNhap]
instead of delete
as
begin
  declare @sohdn nvarchar(255)
  select @sohdn=[MaHDN] from inserted
  delete from [dbo].[ChiTietNhap] where [MaHDN]=@sohdn
  delete from [dbo].[HoaDonNhap] where [MaHDN]=@sohdn
end
go
--xóa hóa đơn nhập theo mã hd
create procedure xoahdnhaptheomahd @mahd nvarchar(20)
as begin
   begin tran;
     begin try
	  delete from [dbo].[ChiTietNhap] where [MaHDN]=@mahd
      delete from [dbo].[HoaDonNhap] where [MaHDN]=@mahd
	  commit tran;
	  end try
	  begin catch
	  rollback tran;
	  end catch
end
go
--xóa hóa đơn bán theo mã hd
create procedure xoahdbantheomahd @mahd nvarchar(20)
as begin
   begin tran;
     begin try
	  delete from [dbo].[ChiTietHDBan] where [MaHDB]=@mahd
      delete from [dbo].[HoaDonBan] where [MaHDB]=@mahd
	  commit tran;
	  end try
	  begin catch
	  rollback tran;
	  end catch
end
go
--viet tra ve ten sp theo ma sp
create procedure trasp @masp nvarchar(20)
as begin
  select [TenSP]
  from [dbo].[SanPham]
  where [MaSP]=@masp
end
go
--viet tra ve nha cung cap
create procedure tranhacc @mancc nvarchar(20)
as begin
  select [TenNCC],[Diachi],[Dienthoai]
  from [dbo].[NhaCC]
  where [MaNCC]=@mancc
end
exec tranhacc N'NCC01'
go
--viết trigger cập nhật số lượng khi thêm 
create trigger capnhatsoluong on [dbo].[ChiTietNhap]
for insert,update
as begin
 declare @masp nvarchar(20),@soluong int
 select @masp=[MaSP],@soluong=SoLuong from inserted
 update [dbo].[SanPham] set [Soluong]=[Soluong]+@soluong where [MaSP]=@masp
end
go
--viết trigger cập nhật số lượng khi bán
create trigger capnhatsoluongkhiban on [dbo].[ChiTietHDBan]
for insert,update
as begin
   declare @masp nvarchar(20),@soluongban int
   select @masp=[MaSP],@soluongban=[SoLuongBan] from inserted
   update [dbo].[SanPham] set [Soluong]=[Soluong] - @soluongban where [MaSP]=@masp
end
go
--viết trigger cập nhật tổng tiền trên hd bán
create trigger capnhattongtien on [dbo].[ChiTietHDBan]
for insert,update
as begin
  declare @mahd nvarchar(20),@tongtien decimal(20,1)
  select @mahd=MaHDB from inserted
  select @tongtien=SUM(CAST(ThanhTien as decimal(20,1))) from [dbo].[ChiTietHDBan] where MaHDB=@mahd group by MaHDB
  update [dbo].[HoaDonBan] set TongTien=CAST(@tongtien as nvarchar) where MaHDB=@mahd
end
go
--viết trigger cập nhật tổng tiền trên hd nhập
create trigger capnhattongtienhdnhap on [dbo].[ChiTietNhap]
for insert,update
as begin
  declare @mahdn nvarchar(20),@tongtien decimal(20,1)
  select @mahdn=MaHDN from inserted
  select @tongtien=SUM(CAST(ThanhTien as decimal(20,1))) from ChiTietNhap where MaHDN=@mahdn group by MaHDN
  update [dbo].[HoaDonNhap] set TongTien=CAST(@tongtien as nvarchar) where MaHDN=@mahdn
end
go
--viết thủ tục nhập thông tin nhà cung cấp
create procedure nhapnhacungcap @manhacc nvarchar(20),@tennhacc nvarchar(100),@diachi nvarchar(100),@sdt nvarchar(20)
as begin
begin tran;
  begin try
   insert [dbo].[NhaCC]([MaNCC], [TenNCC], [Diachi], [Dienthoai]) values(@manhacc,@tennhacc,@diachi,@sdt)
   commit tran;
  end try
  begin catch
  rollback tran;
  end catch
end
go
--viết thủ tục nhập hóa đơn và chi tiết hd
alter procedure nhaphoadonvachitiet @mahd nvarchar(20),@manv nvarchar(20),@ngaynhap date,@tongtien nvarchar(100),@masp nvarchar(20),@mancc nvarchar(20),@soluong int,@gianhap int,@thanhtien nvarchar(100)
as begin
begin tran;
  begin try
   insert [dbo].[HoaDonNhap]([MaHDN], [MaNV], [NgayNhap], [TongTien]) values(@mahd,@manv,@ngaynhap,@tongtien);
   insert [dbo].[ChiTietNhap]([MaHDN], [MaSP], [MaNCC], [SoLuong], [GiaNhap],[ThanhTien]) values(@mahd,@masp,@mancc,@soluong,@gianhap,@thanhtien)
   commit tran;
  end try
  begin catch
  rollback tran;
  end catch
end
