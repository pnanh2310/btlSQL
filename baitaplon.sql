--TAO BANG TABLE
--Cua hang
CREATE TABLE CuaHang (
    MaCH INT PRIMARY KEY IDENTITY(1,1), 
    TenCH NVARCHAR(100) NOT NULL,       
    DiaChi NVARCHAR(200) NOT NULL,
    SoDienThoai NVARCHAR(15),
	DoanhThu DECIMAL(15, 2) DEFAULT 0
);
--Nhan vien
CREATE TABLE NhanVien (
    MaNV INT PRIMARY KEY IDENTITY(1,1),
    TenNV NVARCHAR(100) NOT NULL,
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),              
    SoDienThoai NVARCHAR(15),
    MaCH INT,
	GioLam INT DEFAULT 0,
	LuongGioLam DECIMAL(10, 2) DEFAULT 0,

    FOREIGN KEY (MaCH) REFERENCES CuaHang(MaCH)
);
--san pham
CREATE TABLE SanPham (
    MaSP INT PRIMARY KEY IDENTITY(1,1),
    TenSP NVARCHAR(100) NOT NULL,
    MoTa NVARCHAR(MAX),               
    Gia DECIMAL(10, 2) NOT NULL,
    SoLuongTon INT NOT NULL,
	LuongDaBan INT DEFAULT 0 NOT NULL
);
--khach hang
CREATE TABLE KhachHang (
    MaKH INT PRIMARY KEY IDENTITY(1,1),
    TenKH NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200),
    SoDienThoai NVARCHAR(15),
    Email NVARCHAR(100),
	SoTienDaMua DECIMAL(15, 2) DEFAULT 0,
);

--don hang
CREATE TABLE DonHang (
    MaDH INT PRIMARY KEY IDENTITY(1,1),
    MaKH INT,
    MaNV INT,
    NgayDatHang DATE,
    TongTien DECIMAL(10, 2),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    FOREIGN KEY (MaNV) REFERENCES NhanVien(MaNV)
);
--chi tiet don hang
CREATE TABLE ChiTietDonHang (
    MaCTDH INT PRIMARY KEY IDENTITY(1,1),
    MaDH INT,
    MaSP INT,
    SoLuong INT,
    DonGia DECIMAL(10, 2),
    FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
--nha cung cap
CREATE TABLE NhaCungCap (
    MaNCC INT PRIMARY KEY IDENTITY(1,1),
    TenNCC NVARCHAR(100) NOT NULL,
    DiaChi NVARCHAR(200),
    SoDienThoai NVARCHAR(15),
    Email NVARCHAR(100)
);
--phieu nhap
CREATE TABLE PhieuNhap (
    MaPhieuNhap INT PRIMARY KEY IDENTITY(1,1),
    MaNCC INT,
    NgayNhap DATE,
    TongTien DECIMAL(10, 2),
    FOREIGN KEY (MaNCC) REFERENCES NhaCungCap(MaNCC)
);
--chi tiet phieu nhap
CREATE TABLE ChiTietPhieuNhap (
    MaCTPN INT PRIMARY KEY IDENTITY(1,1),
    MaPhieuNhap INT,
    MaSP INT,
    SoLuong INT,
    DonGia DECIMAL(10, 2),
    FOREIGN KEY (MaPhieuNhap) REFERENCES PhieuNhap(MaPhieuNhap),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
--kho
CREATE TABLE Kho (
    MaKho INT PRIMARY KEY IDENTITY(1,1),
    MaCH INT,
    MaSP INT,
    SoLuong INT,
    FOREIGN KEY (MaCH) REFERENCES CuaHang(MaCH),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
--khuyen mai
CREATE TABLE KhuyenMai (
    MaKM INT PRIMARY KEY IDENTITY(1,1),
    TenKM NVARCHAR(100) NOT NULL,
    MoTa NVARCHAR(MAX),
    NgayBatDau DATE,
    NgayKetThuc DATE,
    PhanTramGiamGia DECIMAL(5, 2)
);
--don hang khuyen mai
CREATE TABLE DonHang_KhuyenMai (
    MaDH INT,
    MaKM INT,
    PRIMARY KEY (MaDH, MaKM),
    FOREIGN KEY (MaDH) REFERENCES DonHang(MaDH),
    FOREIGN KEY (MaKM) REFERENCES KhuyenMai(MaKM)
);
--danh gia
CREATE TABLE DanhGia (
    MaDanhGia INT PRIMARY KEY IDENTITY(1,1),
    MaKH INT,
    MaSP INT,
    DiemDanhGia INT CHECK (DiemDanhGia BETWEEN 1 AND 5),
    NoiDung NVARCHAR(MAX),
    FOREIGN KEY (MaKH) REFERENCES KhachHang(MaKH),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);

INSERT INTO CuaHang (TenCH, DiaChi, SoDienThoai, DoanhThu)
VALUES 
('Cua Hang 1', '123 Duong ABC', '0123456789', 1000000),
('Cua Hang 2', '456 Duong XYZ', '0987654321', 2000000),
('Cua Hang 3', '789 Duong DEF', '0123456789', 1500000),
('Cua Hang 4', '321 Duong GHI', '0987654321', 2500000),
('Cua Hang 5', '654 Duong JKL', '0123456789', 3000000),
('Cua Hang 6', '987 Duong MNO', '0987654321', 3500000),
('Cua Hang 7', '111 Duong PQR', '0123456789', 4000000),
('Cua Hang 8', '222 Duong STU', '0987654321', 4500000),
('Cua Hang 9', '333 Duong VWX', '0123456789', 5000000),
('Cua Hang 10', '444 Duong YZA', '0987654321', 5500000),
('Cua Hang 11', '555 Duong BCD', '0123456789', 6000000),
('Cua Hang 12', '666 Duong EFG', '0987654321', 6500000),
('Cua Hang 13', '777 Duong HIJ', '0123456789', 7000000),
('Cua Hang 14', '888 Duong KLM', '0987654321', 7500000),
('Cua Hang 15', '999 Duong NOP', '0123456789', 8000000);

INSERT INTO NhanVien (TenNV, NgaySinh, GioiTinh, SoDienThoai, MaCH, GioLam, LuongGioLam)
VALUES 
('Nguyen Van A', '1990-01-01', 'Nam', '0123456789', 1, 160, 50000),
('Tran Thi B', '1991-02-02', 'Nu', '0987654321', 2, 170, 55000),
('Le Van C', '1992-03-03', 'Nam', '0123456789', 3, 180, 60000),
('Pham Thi D', '1993-04-04', 'Nu', '0987654321', 4, 190, 65000),
('Hoang Van E', '1994-05-05', 'Nam', '0123456789', 5, 200, 70000),
('Vu Thi F', '1995-06-06', 'Nu', '0987654321', 6, 210, 75000),
('Do Van G', '1996-07-07', 'Nam', '0123456789', 7, 220, 80000),
('Dang Thi H', '1997-08-08', 'Nu', '0987654321', 8, 230, 85000),
('Bui Van I', '1998-09-09', 'Nam', '0123456789', 9, 240, 90000),
('Nguyen Thi K', '1999-10-10', 'Nu', '0987654321', 10, 250, 95000),
('Tran Van L', '2000-11-11', 'Nam', '0123456789', 11, 260, 100000),
('Le Thi M', '2001-12-12', 'Nu', '0987654321', 12, 270, 105000),
('Pham Van N', '2002-01-13', 'Nam', '0123456789', 13, 280, 110000),
('Hoang Thi O', '2003-02-14', 'Nu', '0987654321', 14, 290, 115000),
('Vu Van P', '2004-03-15', 'Nam', '0123456789', 15, 300, 120000);

INSERT INTO SanPham (TenSP, MoTa, Gia, SoLuongTon, LuongDaBan)
VALUES 
('San pham 1', 'Mo ta san pham 1', 100000, 50, 10),
('San pham 2', 'Mo ta san pham 2', 200000, 60, 20),
('San pham 3', 'Mo ta san pham 3', 300000, 70, 30),
('San pham 4', 'Mo ta san pham 4', 400000, 80, 40),
('San pham 5', 'Mo ta san pham 5', 500000, 90, 50),
('San pham 6', 'Mo ta san pham 6', 600000, 100, 60),
('San pham 7', 'Mo ta san pham 7', 700000, 110, 70),
('San pham 8', 'Mo ta san pham 8', 800000, 120, 80),
('San pham 9', 'Mo ta san pham 9', 900000, 130, 90),
('San pham 10', 'Mo ta san pham 10', 1000000, 140, 100),
('San pham 11', 'Mo ta san pham 11', 1100000, 150, 110),
('San pham 12', 'Mo ta san pham 12', 1200000, 160, 120),
('San pham 13', 'Mo ta san pham 13', 1300000, 170, 130),
('San pham 14', 'Mo ta san pham 14', 1400000, 180, 140),
('San pham 15', 'Mo ta san pham 15', 1500000, 190, 150);

INSERT INTO KhachHang (TenKH, DiaChi, SoDienThoai, Email, SoTienDaMua)
VALUES 
('Khach hang 1', '123 Duong ABC', '0123456789', 'kh1@example.com', 1000000),
('Khach hang 2', '456 Duong XYZ', '0987654321', 'kh2@example.com', 2000000),
('Khach hang 3', '789 Duong DEF', '0123456789', 'kh3@example.com', 3000000),
('Khach hang 4', '321 Duong GHI', '0987654321', 'kh4@example.com', 4000000),
('Khach hang 5', '654 Duong JKL', '0123456789', 'kh5@example.com', 5000000),
('Khach hang 6', '987 Duong MNO', '0987654321', 'kh6@example.com', 6000000),
('Khach hang 7', '111 Duong PQR', '0123456789', 'kh7@example.com', 7000000),
('Khach hang 8', '222 Duong STU', '0987654321', 'kh8@example.com', 8000000),
('Khach hang 9', '333 Duong VWX', '0123456789', 'kh9@example.com', 9000000),
('Khach hang 10', '444 Duong YZA', '0987654321', 'kh10@example.com', 10000000),
('Khach hang 11', '555 Duong BCD', '0123456789', 'kh11@example.com', 11000000),
('Khach hang 12', '666 Duong EFG', '0987654321', 'kh12@example.com', 12000000),
('Khach hang 13', '777 Duong HIJ', '0123456789', 'kh13@example.com', 13000000),
('Khach hang 14', '888 Duong KLM', '0987654321', 'kh14@example.com', 14000000),
('Khach hang 15', '999 Duong NOP', '0123456789', 'kh15@example.com', 15000000);

INSERT INTO DonHang (MaKH, MaNV, NgayDatHang, TongTien)
VALUES 
(1, 1, '2023-01-01', 1000000),
(2, 2, '2023-02-02', 2000000),
(3, 3, '2023-03-03', 3000000),
(4, 4, '2023-04-04', 4000000),
(5, 5, '2023-05-05', 5000000),
(6, 6, '2023-06-06', 6000000),
(7, 7, '2023-07-07', 7000000),
(8, 8, '2023-08-08', 8000000),
(9, 9, '2023-09-09', 9000000),
(10, 10, '2023-10-10', 10000000),
(11, 11, '2023-11-11', 11000000),
(12, 12, '2023-12-12', 12000000),
(13, 13, '2024-01-01', 13000000),
(14, 14, '2024-02-02', 14000000),
(15, 15, '2024-03-03', 15000000);

INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia)
VALUES 
(1, 1, 1, 100000),
(2, 2, 2, 200000),
(3, 3, 3, 300000),
(4, 4, 4, 400000),
(5, 5, 5, 500000),
(6, 6, 6, 600000),
(7, 7, 7, 700000),
(8, 8, 8, 800000),
(9, 9, 9, 900000),
(10, 10, 10, 1000000),
(11, 11, 11, 1100000),
(12, 12, 12, 1200000),
(13, 13, 13, 1300000),
(14, 14, 14, 1400000),
(15, 15, 15, 1500000);

INSERT INTO NhaCungCap (TenNCC, DiaChi, SoDienThoai, Email)
VALUES 
('Nha cung cap 1', '123 Duong ABC', '0123456789', 'ncc1@example.com'),
('Nha cung cap 2', '456 Duong XYZ', '0987654321', 'ncc2@example.com'),
('Nha cung cap 3', '789 Duong DEF', '0123456789', 'ncc3@example.com'),
('Nha cung cap 4', '321 Duong GHI', '0987654321', 'ncc4@example.com'),
('Nha cung cap 5', '654 Duong JKL', '0123456789', 'ncc5@example.com'),
('Nha cung cap 6', '987 Duong MNO', '0987654321', 'ncc6@example.com'),
('Nha cung cap 7', '111 Duong PQR', '0123456789', 'ncc7@example.com'),
('Nha cung cap 8', '222 Duong STU', '0987654321', 'ncc8@example.com'),
('Nha cung cap 9', '333 Duong VWX', '0123456789', 'ncc9@example.com'),
('Nha cung cap 10', '444 Duong YZA', '0987654321', 'ncc10@example.com'),
('Nha cung cap 11', '555 Duong BCD', '0123456789', 'ncc11@example.com'),
('Nha cung cap 12', '666 Duong EFG', '0987654321', 'ncc12@example.com'),
('Nha cung cap 13', '777 Duong HIJ', '0123456789', 'ncc13@example.com'),
('Nha cung cap 14', '888 Duong KLM', '0987654321', 'ncc14@example.com'),
('Nha cung cap 15', '999 Duong NOP', '0123456789', 'ncc15@example.com');

INSERT INTO PhieuNhap (MaNCC, NgayNhap, TongTien)
VALUES 
(1, '2023-01-01', 1000000),
(2, '2023-02-02', 2000000),
(3, '2023-03-03', 3000000),
(4, '2023-04-04', 4000000),
(5, '2023-05-05', 5000000),
(6, '2023-06-06', 6000000),
(7, '2023-07-07', 7000000),
(8, '2023-08-08', 8000000),
(9, '2023-09-09', 9000000),
(10, '2023-10-10', 10000000),
(11, '2023-11-11', 11000000),
(12, '2023-12-12', 12000000),
(13, '2024-01-01', 13000000),
(14, '2024-02-02', 14000000),
(15, '2024-03-03', 15000000);

INSERT INTO ChiTietPhieuNhap (MaPhieuNhap, MaSP, SoLuong, DonGia)
VALUES 
(1, 1, 10, 100000),
(2, 2, 20, 200000),
(3, 3, 30, 300000),
(4, 4, 40, 400000),
(5, 5, 50, 500000),
(6, 6, 60, 600000),
(7, 7, 70, 700000),
(8, 8, 80, 800000),
(9, 9, 90, 900000),
(10, 10, 100, 1000000),
(11, 11, 110, 1100000),
(12, 12, 120, 1200000),
(13, 13, 130, 1300000),
(14, 14, 140, 1400000),
(15, 15, 150, 1500000);

INSERT INTO Kho (MaCH, MaSP, SoLuong)
VALUES 
(1, 1, 100),
(2, 2, 200),
(3, 3, 300),
(4, 4, 400),
(5, 5, 500),
(6, 6, 600),
(7, 7, 700),
(8, 8, 800),
(9, 9, 900),
(10, 10, 1000),
(11, 11, 1100),
(12, 12, 1200),
(13, 13, 1300),
(14, 14, 1400),
(15, 15, 1500);

INSERT INTO KhuyenMai (TenKM, MoTa, NgayBatDau, NgayKetThuc, PhanTramGiamGia)
VALUES 
('Khuyen mai 1', 'Mo ta khuyen mai 1', '2023-01-01', '2023-01-31', 10.00),
('Khuyen mai 2', 'Mo ta khuyen mai 2', '2023-02-01', '2023-02-28', 15.00),
('Khuyen mai 3', 'Mo ta khuyen mai 3', '2023-03-01', '2023-03-31', 20.00),
('Khuyen mai 4', 'Mo ta khuyen mai 4', '2023-04-01', '2023-04-30', 25.00),
('Khuyen mai 5', 'Mo ta khuyen mai 5', '2023-05-01', '2023-05-31', 30.00),
('Khuyen mai 6', 'Mo ta khuyen mai 6', '2023-06-01', '2023-06-30', 35.00),
('Khuyen mai 7', 'Mo ta khuyen mai 7', '2023-07-01', '2023-07-31', 40.00),
('Khuyen mai 8', 'Mo ta khuyen mai 8', '2023-08-01', '2023-08-31', 45.00),
('Khuyen mai 9', 'Mo ta khuyen mai 9', '2023-09-01', '2023-09-30', 50.00),
('Khuyen mai 10', 'Mo ta khuyen mai 10', '2023-10-01', '2023-10-31', 55.00),
('Khuyen mai 11', 'Mo ta khuyen mai 11', '2023-11-01', '2023-11-30', 60.00),
('Khuyen mai 12', 'Mo ta khuyen mai 12', '2023-12-01', '2023-12-31', 65.00),
('Khuyen mai 13', 'Mo ta khuyen mai 13', '2024-01-01', '2024-01-31', 70.00),
('Khuyen mai 14', 'Mo ta khuyen mai 14', '2024-02-01', '2024-02-29', 75.00),
('Khuyen mai 15', 'Mo ta khuyen mai 15', '2024-03-01', '2024-03-31', 80.00);

INSERT INTO DonHang_KhuyenMai (MaDH, MaKM)
VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15);

INSERT INTO DanhGia (MaKH, MaSP, DiemDanhGia, NoiDung)
VALUES 
(1, 1, 5, 'San pham tot'),
(2, 2, 4, 'San pham kha tot'),
(3, 3, 3, 'San pham binh thuong'),
(4, 4, 2, 'San pham khong tot lam'),
(5, 5, 1, 'San pham te'),
(6, 6, 5, 'San pham rat tot'),
(7, 7, 4, 'San pham kha tot'),
(8, 8, 3, 'San pham binh thuong'),
(9, 9, 2, 'San pham khong tot lam'),
(10, 10, 1, 'San pham te'),
(11, 11, 5, 'San pham tot'),
(12, 12, 4, 'San pham kha tot'),
(13, 13, 3, 'San pham binh thuong'),
(14, 14, 2, 'San pham khong tot lam'),
(15, 15, 1, 'San pham te');

SELECT * FROM CuaHang;
SELECT * FROM SanPham;
SELECT * FROM KhachHang;
SELECT * FROM DonHang;
SELECT * FROM ChiTietDonHang;
SELECT * FROM NhaCungCap;
SELECT * FROM PhieuNhap;
SELECT * FROM ChiTietPhieuNhap;
SELECT * FROM Kho;
SELECT * FROM KhuyenMai;
SELECT * FROM DonHang_KhuyenMai;
SELECT * FROM DanhGia;







          

--VIEW
--1. view hiên thị lương của 1 nhân viên
CREATE VIEW V_LuongNhanVien AS
SELECT 
    MaNV,
    TenNV,
    GioLam,
    LuongGioLam,
    (GioLam * LuongGioLam) AS Luong
FROM NhanVien;
--tra cứu
SELECT * FROM V_LuongNhanVien;
--Tìm nhân viên nào ấy xem lương là bao nhiêu
SELECT * FROM V_LuongNhanVien WHERE MaNV = 1;
--nhan vien luong cao nhat
SELECT * FROM V_LuongNhanVien
WHERE Luong = (SELECT MAX(Luong) FROM V_LuongNhanVien);
--nhan vien cham chi nhat
SELECT * FROM V_LuongNhanVien
WHERE GioLam = (SELECT MAX(GioLam) FROM V_LuongNhanVien);
--2.tổng giờ làm và lương cần trả
CREATE VIEW V_TongGioLamVaLuong AS
SELECT 
    SUM(GioLam) AS TongGioLam,
    SUM(GioLam * LuongGioLam) AS TongLuongPhaiTra
FROM NhanVien;
--tra cuu
SELECT * FROM V_TongGioLamVaLuong;

--3. tạo view hiển thị cửa hàng có số doanh thu từ lớn đến bé
CREATE VIEW V_DoanhThuCuaHang AS
SELECT 
    MaCH,
    TenCH,
    SUM(DoanhThu) AS TongDoanhThu
FROM CuaHang
GROUP BY MaCH, TenCH;
--tra cứu
SELECT * FROM V_DoanhThuCuaHang
ORDER BY TongDoanhThu DESC;

--4. tạo view hiển thị số lượng tồn kho có tổng giá trị cao nhất
CREATE VIEW V_SanPhamTonKho AS
SELECT 
    MaSP,
    TenSP,
    SoLuongTon,
    Gia,
    SoLuongTon * Gia AS TongGiaTriTonKho
FROM SanPham;
--tra cứu
SELECT * FROM V_SanPhamTonKho
ORDER BY TongGiaTriTonKho ASC;
--5 tao view tim nam, nu. 
CREATE VIEW V_GioiTinhNhanVien AS
SELECT 
    TenNV,
    GioiTinh
FROM NhanVien
WHERE GioiTinh IN (N'Nam', N'Nu');
--tim nv Nam
SELECT * FROM V_GioiTinhNhanVien WHERE GioiTinh = N'Nam';
--tim nv Nu
SELECT * FROM V_GioiTinhNhanVien WHERE GioiTinh = N'Nu';
--6. hiện top 5 sản phẩm bán chạy nhất
CREATE VIEW V_SanPhamBanChay AS
SELECT TOP 5 SP.MaSP, SP.TenSP, SUM(CTDH.SoLuong) AS TongSoLuongBan
FROM ChiTietDonHang CTDH
JOIN SanPham SP ON CTDH.MaSP = SP.MaSP
GROUP BY SP.MaSP, SP.TenSP
ORDER BY TongSoLuongBan DESC;
--
SELECT * FROM V_SanPhamBanChay;
--7.hiển thị tất cả nhân viên làm trên 200 giờ
CREATE VIEW V_NhanVienChamChi AS
SELECT MaNV, TenNV, GioLam, LuongGioLam, (GioLam * LuongGioLam) AS TongLuong
FROM NhanVien
WHERE GioLam > 200;
--
SELECT * FROM V_NhanVienChamChi;
--8.hiển thị khách hàng chưa mua hàng lần nào
CREATE VIEW V_KhachHangChuaMuaHang AS
SELECT KH.MaKH, KH.TenKH, KH.SoDienThoai, KH.DiaChi
FROM KhachHang KH
LEFT JOIN DonHang DH ON KH.MaKH = DH.MaKH
WHERE DH.MaKH IS NULL;
--tạo 1 khách hàng chưa mua hàng lần nào
INSERT INTO KhachHang (TenKH, SoDienThoai, DiaChi)  
VALUES (N'Nguyễn Văádn A', '0987654321', N'Hà Nội');
 --
SELECT * FROM V_KhachHangChuaMuaHang;
--9. hiển thị nhân viên chưa đc sắp xếp làm cửa hàng nào
CREATE VIEW V_NhanVienChuaCoCuaHang AS
SELECT MaNV, TenNV, GioiTinh, SoDienThoai
FROM NhanVien
WHERE MaCH IS NULL;
--tạo 1 nv chưa đc phân công cửa hàng 
INSERT INTO NhanVien (TenNV, NgaySinh, GioiTinh, SoDienThoai, MaCH, GioLam, LuongGioLam)  
VALUES (N'Trần Văn B', '1995-06-15', N'Nam', '0912345678', NULL, 40, 50.00);
--
SELECT * FROM V_NhanVienChuaCoCuaHang;
--10. hiển thị khách hàng VIP đã mua số tiền trên 10 triệu
CREATE VIEW V_KhachHangVIP AS
SELECT 
    KH.MaKH, 
    KH.TenKH, 
    SUM(DH.TongTien) AS TongChiTieu
FROM KhachHang KH
JOIN DonHang DH ON KH.MaKH = DH.MaKH
GROUP BY KH.MaKH, KH.TenKH
HAVING SUM(DH.TongTien) > 10000000;
--
SELECT * FROM V_KhachHangVIP;




-- procedure
-- 1. Thêm nhân viên mới
CREATE PROCEDURE sp_ThemNhanVien
    @TenNV NVARCHAR(100),
    @NgaySinh DATE,
    @GioiTinh NVARCHAR(10),
    @SoDienThoai NVARCHAR(15),
    @MaCH INT,
    @GioLam INT,
    @LuongGioLam DECIMAL(10,2)
AS
BEGIN
    INSERT INTO NhanVien (TenNV, NgaySinh, GioiTinh, SoDienThoai, MaCH, GioLam, LuongGioLam)
    VALUES (@TenNV, @NgaySinh, @GioiTinh, @SoDienThoai, @MaCH, @GioLam, @LuongGioLam);
END;
--thêm nhân viên mới
EXEC sp_ThemNhanVien 
    @TenNV = N'Ngo Văn Abc', 
    @NgaySinh = '1995-08-20', 
    @GioiTinh = N'Nam', 
    @SoDienThoai = '0987654321', 
    @MaCH = 1, 
    @GioLam = 40, 
    @LuongGioLam = 50000;
--
SELECT * FROM NhanVien WHERE TenNV = N'Ngo Văn Abc';
--2. Tính tổng doanh thu theo tháng
CREATE PROCEDURE TinhTongDoanhThuTheoThang
    @Nam INT,
    @Thang INT
AS
BEGIN
    SELECT 
        @Nam AS Nam, 
        @Thang AS Thang, 
        SUM(TongTien) AS TongDoanhThu
    FROM DonHang
    WHERE YEAR(NgayDatHang) = @Nam AND MONTH(NgayDatHang) = @Thang;
END;
--
EXEC TinhTongDoanhThuTheoThang @Nam = 2025, @Thang = 3;
--3. Lấy danh sách khách hàng theo khu vực
CREATE PROCEDURE LayDanhSachKhachHangTheoKhuVuc
    @KhuVuc NVARCHAR(100)
AS
BEGIN
    SELECT MaKH, TenKH, SoDienThoai, DiaChi
    FROM KhachHang
    WHERE DiaChi LIKE '%' + @KhuVuc + '%';
END;
--
EXEC LayDanhSachKhachHangTheoKhuVuc @KhuVuc = N'Hà Nội';
--4.Lọc danh sách sản phẩm theo giá
CREATE PROCEDURE LocSanPhamTheoGia
    @GiaMin DECIMAL(10,2),
    @GiaMax DECIMAL(10,2)
AS
BEGIN
    SELECT MaSP, TenSP, Gia, SoLuongTon
    FROM SanPham
    WHERE Gia BETWEEN @GiaMin AND @GiaMax
    ORDER BY Gia;
END;
--
EXEC LocSanPhamTheoGia @GiaMin = 50000, @GiaMax = 200000;
--5. Kiểm tra hàng tồn kho 
CREATE PROCEDURE KiemTraHangTonKho
    @MaSP INT
AS
BEGIN
    SELECT MaSP, TenSP, SoLuongTon, Gia
    FROM SanPham
    WHERE MaSP = @MaSP;
END;
--tìm bằng mã sản phẩm
EXEC KiemTraHangTonKho @MaSP = 10;
--6. Thống kê số đơn hàng của khách hàng
CREATE PROCEDURE ThongKeSoDonHangKhachHang
AS
BEGIN
    SELECT 
        KhachHang.MaKH,
        KhachHang.TenKH,
        COUNT(DonHang.MaDH) AS SoLuongDonHang
    FROM KhachHang
    LEFT JOIN DonHang ON KhachHang.MaKH = DonHang.MaKH
    GROUP BY KhachHang.MaKH, KhachHang.TenKH
    ORDER BY SoLuongDonHang DESC;
END;
--
EXEC ThongKeSoDonHangKhachHang;
--7. Tìm sản phẩm có nhiều đánh giá nhất.
CREATE PROCEDURE SP_TimSanPhamNhieuDanhGiaNhat
AS
BEGIN
    SELECT TOP 1 
        d.MaSP, 
        sp.TenSP, 
        COUNT(d.MaDanhGia) AS SoLuongDanhGia
    FROM DanhGia d
    JOIN SanPham sp ON d.MaSP = sp.MaSP
    GROUP BY d.MaSP, sp.TenSP
    ORDER BY SoLuongDanhGia DESC;
END;
--
EXEC SP_TimSanPhamNhieuDanhGiaNhat;
--8. Lọc danh sách phần trăm khuyến mãi
CREATE PROCEDURE SP_LocKhuyenMaiTheoMucGiamGia
    @MucGiamTu FLOAT,  -- Giá trị giảm từ %
    @MucGiamDen FLOAT   -- Giá trị giảm đến %
AS
BEGIN
    SELECT * 
    FROM KhuyenMai 
    WHERE PhanTramGiamGia BETWEEN @MucGiamTu AND @MucGiamDen;
END;
-- Lọc khuyến mãi giảm từ 10% đến 30%
EXEC SP_LocKhuyenMaiTheoMucGiamGia 10, 30;
-- Lọc khuyến mãi trên 50%
EXEC SP_LocKhuyenMaiTheoMucGiamGia 50, 100;
--9. Xóa các đánh giá có điểm số thấp (ví dụ: dưới 1 sao).
CREATE PROCEDURE SP_XoaDanhGiaThap
    @DiemToiThieu INT = 2  -- Giá trị mặc định là 2 sao
AS
BEGIN
    DELETE FROM DanhGia
    WHERE DiemDanhGia < @DiemToiThieu;
END;
-- Xóa tất cả đánh giá dưới 1 sao
EXEC SP_XoaDanhGiaThap;
select * from DanhGia;
--10. Kiểm tra số lượng tồn kho trước khi cho phép đặt hàng
CREATE PROCEDURE SP_KiemTraTonKho
    @MaSP INT,
    @SoLuongDat INT
AS
BEGIN
    DECLARE @SoLuongTon INT;
    
    -- Lấy số lượng tồn kho của sản phẩm
    SELECT @SoLuongTon = SoLuongTon FROM SanPham WHERE MaSP = @MaSP;

    -- Kiểm tra nếu không đủ hàng
    IF @SoLuongTon IS NULL
    BEGIN
        PRINT N'Sản phẩm không tồn tại!';
        RETURN;
    END
    
    IF @SoLuongTon < @SoLuongDat
    BEGIN
        PRINT N'Số lượng tồn kho không đủ để đặt hàng!';
    END
    ELSE
    BEGIN
        PRINT N'Có đủ hàng, có thể đặt!';
    END
END;
-- Kiểm tra nếu đặt 5 sản phẩm có mã 101
EXEC SP_KiemTraTonKho 10, 5;
--trigger
--1. chặn xóa nhân viên có số giờ làm trên 100
CREATE TRIGGER trg_ChanXoaNhanVien
ON NhanVien
INSTEAD OF DELETE
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM deleted
        WHERE GioLam > 100
    )
    BEGIN
        PRINT 'Không thể xóa nhân viên có trên 100 giờ làm.';
        ROLLBACK TRANSACTION;
    END
    ELSE
    BEGIN
        DELETE FROM NhanVien
        WHERE MaNV IN (SELECT MaNV FROM deleted);
    END
END;
--ví dụ
DELETE FROM NhanVien WHERE MaNV = 1;
--2. ghi nhân viên mới vào 1 bảng khác
CREATE TABLE NhanVien_Log (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    MaNV INT,
    TenNV NVARCHAR(100),
    NgayThem DATETIME DEFAULT GETDATE(),
    HanhDong NVARCHAR(50)
);

--tạo bảng log
CREATE TRIGGER trg_LogThemNhanVien
ON NhanVien
AFTER INSERT
AS
BEGIN
    INSERT INTO NhanVien_Log (MaNV, TenNV, HanhDong)
    SELECT MaNV, TenNV, 'Thêm mới'
    FROM inserted;
END;
--
-- Thêm nhân viên mới
INSERT INTO NhanVien (TenNV, NgaySinh, GioiTinh, SoDienThoai, MaCH, GioLam, LuongGioLam)
VALUES ('Nguyen Van A', '1990-01-01', 'Nam', '0123456789', 1, 120, 50.00);

-- Kiểm tra log
SELECT * FROM NhanVien_Log;
--3. Cập nhật số lượng tồn kho sau khi đặt hàng
CREATE TRIGGER trg_CapNhatTonKho
ON ChiTietDonHang
AFTER INSERT
AS
BEGIN
    -- Cập nhật số lượng tồn kho sau khi có đơn hàng mới
    UPDATE SanPham
    SET SoLuongTon = SoLuongTon - i.SoLuong
    FROM SanPham sp
    INNER JOIN inserted i ON sp.MaSP = i.MaSP;
END;
--đặt hàng
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia)
VALUES (1, 10, 5, 100000);
--kiểm tra
SELECT * FROM SanPham WHERE MaSP = 10;
--4. cập nhập tổng tiền đơn hàng khi có thêm đơn đặt hàng
CREATE TRIGGER trg_CapNhatTongTienDonHang
ON ChiTietDonHang
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
    SET NOCOUNT ON;

    -- Cập nhật tổng tiền đơn hàng
    UPDATE DonHang
    SET TongTien = (
        SELECT SUM(SoLuong * DonGia)
        FROM ChiTietDonHang
        WHERE ChiTietDonHang.MaDH = DonHang.MaDH
    )
    WHERE MaDH IN (
        SELECT DISTINCT MaDH FROM inserted
        UNION
        SELECT DISTINCT MaDH FROM deleted
    );
END;
--đặt hàng
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia)  
VALUES (1, 1, 2, 50000);
--kiểm tra
SELECT * FROM DonHang WHERE MaDH = 1;
--5. Chặn đặt hàng khi sản phẩm hết hàng 
CREATE TRIGGER TRG_KiemTraSoLuongTon  
ON ChiTietDonHang  
AFTER INSERT  
AS  
BEGIN  
    IF EXISTS (  
        SELECT 1  
        FROM inserted i  
        JOIN SanPham sp ON i.MaSP = sp.MaSP  
        WHERE i.SoLuong > sp.SoLuongTon  
    )  
    BEGIN  
        RAISERROR ('Không thể đặt hàng vì sản phẩm không đủ hàng trong kho.', 16, 1);  
        ROLLBACK TRANSACTION;  
    END  
END;
--
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia)  
VALUES (1, 1, 3, 100000); 
INSERT INTO ChiTietDonHang (MaDH, MaSP, SoLuong, DonGia)  
VALUES (1, 1, 1000, 100000); 
--6. Ghi log khi nhân viên bị xóa
CREATE TABLE Log_XoaNhanVien (
    LogID INT PRIMARY KEY IDENTITY(1,1),
    MaNV INT,
    TenNV NVARCHAR(100),
    NgaySinh DATE,
    GioiTinh NVARCHAR(10),
    SoDienThoai NVARCHAR(15),
    NgayXoa DATETIME DEFAULT GETDATE()
);
--
CREATE TRIGGER TRG_LogXoaNhanVien  
ON NhanVien  
AFTER DELETE  
AS  
BEGIN  
    INSERT INTO Log_XoaNhanVien (MaNV, TenNV, NgaySinh, GioiTinh, SoDienThoai)  
    SELECT MaNV, TenNV, NgaySinh, GioiTinh, SoDienThoai  
    FROM deleted;
END;
--thêm nhân viên
INSERT INTO NhanVien (TenNV, NgaySinh, GioiTinh, SoDienThoai, MaCH)  
VALUES (N'Nguyễn Văn pnadz', '1990-01-01', N'Nam', '0123456789', NULL);
--xóa nhân viên
DELETE FROM NhanVien WHERE MaNV = 20;
--hiển thị những nhân viên bị xóa
SELECT * FROM Log_XoaNhanVien;
--7. Chặn giảm giá quá mức
CREATE TRIGGER TRG_ChanGiamGiaQuaMuc
ON KhuyenMai
AFTER INSERT, UPDATE
AS
BEGIN
    IF EXISTS (
        SELECT 1 
        FROM inserted 
        WHERE PhanTramGiamGia > 50
    )
    BEGIN
        RAISERROR ('Phần trăm giảm giá không được vượt quá 50%%.', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
--ví dụ tạo giảm giá trên 50%
INSERT INTO KhuyenMai (TenKM, PhanTramGiamGia)
VALUES ('Khuyến mãi sốc', 60);
--8. Lưu lịch sử thay đổi giá sản phẩm
CREATE TABLE LichSuGia (
    MaLSG INT PRIMARY KEY IDENTITY(1,1),
    MaSP INT,
    GiaCu DECIMAL(10,2),
    GiaMoi DECIMAL(10,2),
    NgayThayDoi DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
--
CREATE TRIGGER TRG_LichSuGia
ON SanPham
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    INSERT INTO LichSuGia (MaSP, GiaCu, GiaMoi, NgayThayDoi)
    SELECT i.MaSP, d.Gia, i.Gia, GETDATE()
    FROM inserted i
    JOIN deleted d ON i.MaSP = d.MaSP
    WHERE i.Gia <> d.Gia;  -- Chỉ lưu khi giá thay đổi
END;
--tạo 1 sản phẩm mới
INSERT INTO SanPham (TenSP, Gia, SoLuongTon)
VALUES (N'Laptop Dell', 20000000, 10);
--sửa lại giá sản phẩm vừa tạo
UPDATE SanPham
SET Gia = 18000000
WHERE TenSP = N'Laptop Dell';
--kiểm tra
SELECT * FROM LichSuGia;
--9. Kiểm tra ngày hết hạn khuyến mãi
CREATE TRIGGER TRG_KiemTraNgayHetHan
ON KhuyenMai
AFTER INSERT, UPDATE
AS
BEGIN
    SET NOCOUNT ON;

    IF EXISTS (
        SELECT 1 FROM inserted WHERE NgayKetThuc < GETDATE()
    )
    BEGIN
        RAISERROR(N'Ngày hết hạn khuyến mãi không được nhỏ hơn ngày hiện tại!', 16, 1);
        ROLLBACK TRANSACTION;
    END
END;
--
INSERT INTO KhuyenMai (TenKM, PhanTramGiamGia, NgayKetThuc)
VALUES (N'Giảm 20%', 20, '2025-03-01'); 
--10. Cảnh báo khi kho hàng dưới mức tối thiểu
CREATE TABLE CanhBaoKhoHang (
    ID INT PRIMARY KEY IDENTITY(1,1),
    MaSP INT,
    TenSP NVARCHAR(100),
    SoLuongTon INT,
    NgayCanhBao DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (MaSP) REFERENCES SanPham(MaSP)
);
--
CREATE TRIGGER TRG_CanhBaoKhoHang
ON SanPham
AFTER UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    INSERT INTO CanhBaoKhoHang (MaSP, TenSP, SoLuongTon)
    SELECT i.MaSP, i.TenSP, i.SoLuongTon
    FROM inserted i
    WHERE i.SoLuongTon < 10;
END;
--cập nhập lại 1 sản phẩm nào đó để kiểm tra trigger
UPDATE SanPham 
SET SoLuongTon = 5 
WHERE MaSP = 1;
--kiểm tra
SELECT * FROM CanhBaoKhoHang;
--
--
--
--
--
--
--
--
--
--tạo login
CREATE LOGIN UserQuanLy WITH PASSWORD = '123456';
CREATE LOGIN UserBanHang WITH PASSWORD = '123456';
CREATE LOGIN UserKho WITH PASSWORD = '123456';
CREATE LOGIN UserKeToan WITH PASSWORD = '123456';
--Tạo User Cho Database
USE nopbai;
CREATE USER UserQuanLy FOR LOGIN UserQuanLy;
CREATE USER UserBanHang FOR LOGIN UserBanHang;
CREATE USER UserKho FOR LOGIN UserKho;
CREATE USER UserKeToan FOR LOGIN UserKeToan;
-- Tạo Role
CREATE ROLE QuanLy;
CREATE ROLE NhanVienBanHang;
CREATE ROLE QuanLyKho;
CREATE ROLE NhanVienKeToan;
-- Cấp quyền cho các bảng
GRANT SELECT, INSERT, UPDATE, DELETE ON CuaHang TO QuanLy;
GRANT SELECT, INSERT, UPDATE, DELETE ON NhanVien TO QuanLy;
GRANT SELECT, INSERT ON DonHang TO NhanVienBanHang;
GRANT SELECT, UPDATE ON SanPham TO QuanLyKho;
GRANT SELECT ON DonHang TO NhanVienKeToan;
-- Thêm người dùng vào Role
EXEC sp_addrolemember 'QuanLy', 'UserQuanLy';
EXEC sp_addrolemember 'NhanVienBanHang', 'UserBanHang';
EXEC sp_addrolemember 'QuanLyKho', 'UserKho';
EXEC sp_addrolemember 'NhanVienKeToan', 'UserKeToan';
--Kiểm tra user đã thuộc role
SELECT DP1.name AS DatabaseRoleName, DP2.name AS DatabaseUserName  
FROM sys.database_role_members AS DRM  
JOIN sys.database_principals AS DP1 ON DRM.role_principal_id = DP1.principal_id  
JOIN sys.database_principals AS DP2 ON DRM.member_principal_id = DP2.principal_id;


--Sao lưu toàn bộ Database
BACKUP DATABASE nopbai TO DISK = 'D:\tera\nopbai.bak';
-- Khôi phục dữ liệu khi cần
RESTORE DATABASE nopbai FROM DISK = 'D:\tera\nopbai.bak';
































